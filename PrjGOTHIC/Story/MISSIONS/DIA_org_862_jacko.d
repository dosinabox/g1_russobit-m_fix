
instance INFO_JACKO_EXIT(C_INFO)
{
	npc = org_862_jacko;
	nr = 999;
	condition = info_jacko_exit_condition;
	information = info_jacko_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_jacko_exit_condition()
{
	return 1;
};

func void info_jacko_exit_info()
{
	AI_StopProcessInfos(self);
};


instance ORG_862_JACKO_GOAWAY(C_INFO)
{
	npc = org_862_jacko;
	nr = 1;
	condition = org_862_jacko_goaway_condition;
	information = org_862_jacko_goaway_info;
	permanent = 1;
	important = 1;
};


func int org_862_jacko_goaway_condition()
{
	if((Npc_GetDistToWP(hero,"LOCATION_23_CAVE_1_IN") < 500) && (KALOM_DRUGMONOPOL != LOG_RUNNING) && (KALOM_DRUGMONOPOL != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void org_862_jacko_goaway_info()
{
	AI_Output(self,other,"ORG_862_Jacko_GoAway_Info_06_00");	//��� ���� ����� �����?
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
};


instance ORG_862_JACKO_GUARD(C_INFO)
{
	npc = org_862_jacko;
	nr = 1;
	condition = org_862_jacko_guard_condition;
	information = org_862_jacko_guard_info;
	permanent = 0;
	important = 1;
};


func int org_862_jacko_guard_condition()
{
	if(KALOM_DRUGMONOPOL == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void org_862_jacko_guard_info()
{
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Info_06_00");	//�� ���, ����������?
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Info_15_01");	//��� ����� ��� �����, ��� � ��� ��� ��������.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Info_06_02");	//���? � ������ �� ��� ������?
	b_logentry(CH1_DRUGMONOPOL,"� ����� ����� ����������� ������������ ���������. ��� ���� �������� ����� � ��� ������ ����.");
	Info_ClearChoices(org_862_jacko_guard);
	Info_AddChoice(org_862_jacko_guard,"��� ����� ������ ���� ������� �������...",org_862_jacko_guard_templer);
	Info_AddChoice(org_862_jacko_guard,"���������, ��������� ������ ����� ���� ��, ��� � �����.",org_862_jacko_guard_infowert);
	Info_AddChoice(org_862_jacko_guard,"� ���� �������� ��� ����.",org_862_jacko_guard_angriff);
};

func void org_862_jacko_guard_templer()
{
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Templer_Info_15_00");	//��� ����� ������ ���� ������� �������. ��� �� �������� ��, ��� �� ����� �����������.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Templer_Info_06_01");	//���! ����� �� ����� ����!
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Templer_Info_15_02");	//��� ����� ����� ����� �����.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Templer_Info_06_03");	//����! ��� ����� ������� ������!
	Info_ClearChoices(org_862_jacko_guard);
	b_logentry(CH1_DRUGMONOPOL,"��������� ���� �������������� ������� �������� �������� ���� ������ � �������. �������� ����� ������� ��������.");
	b_givexp(XP_JACKORETIRED);
	Npc_ExchangeRoutine(self,"ARBEITSLOS");
	b_exchangeroutine(org_861_killian,"ARBEITSLOS");
	b_exchangeroutine(org_860_renyu,"ARBEITSLOS");
	STOOGES_FLED = TRUE;
	AI_StopProcessInfos(self);
};

func void org_862_jacko_guard_infowert()
{
	AI_Output(other,self,"ORG_862_Jacko_GUARD_InfoWert_Info_15_00");	//���������, ��������� ������ ����� ���� ��, ��� � �����.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_InfoWert_Info_06_01");	//��, ��� � ��� ����... �����. �� ����� ���. � ���� ���� ������� ����. ������� ��.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_InfoWert_Info_06_02");	//� ��� ���� �������. �����, ���� ���� �� ����� ����� �������������.
	b_giveinvitems(self,other,itminugget,95);
	Npc_ExchangeRoutine(self,"ARBEITSLOS");
	b_exchangeroutine(org_861_killian,"ARBEITSLOS");
	b_exchangeroutine(org_860_renyu,"ARBEITSLOS");
	STOOGES_FLED = TRUE;
	b_logentry(CH1_DRUGMONOPOL,"� ����� ������ ��������, ���������������� ����� ����� ���������. ����� ������ ���� ���� � ������.");
	b_givexp(XP_JACKORETIRED);
	Info_ClearChoices(org_862_jacko_guard);
	AI_StopProcessInfos(self);
};

func void org_862_jacko_guard_angriff()
{
	var C_NPC killian;
	var C_NPC renyu;
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Angriff_Info_15_00");	//� ���� �������� ��� ����. 
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Angriff_Info_06_01");	//��, �����! �����-�� ���� �� �������!
	Info_ClearChoices(org_862_jacko_guard);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,hero);
	AI_StartState(self,zs_attack,1,"");
	npc_setpermattitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	killian = Hlp_GetNpc(org_861_killian);
	Npc_SetTarget(killian,hero);
	AI_StartState(killian,zs_attack,0,"");
	npc_setpermattitude(killian,ATT_HOSTILE);
	Npc_SetTempAttitude(killian,ATT_HOSTILE);
	renyu = Hlp_GetNpc(org_860_renyu);
	Npc_SetTarget(renyu,hero);
	AI_StartState(renyu,zs_attack,0,"");
	npc_setpermattitude(renyu,ATT_HOSTILE);
	Npc_SetTempAttitude(renyu,ATT_HOSTILE);
};


instance ORG_862_JACKO_BANDITENCAMP(C_INFO)
{
	npc = org_862_jacko;
	nr = 1;
	condition = org_862_jacko_banditencamp_condition;
	information = org_862_jacko_banditencamp_info;
	permanent = 1;
	description = "�, ��� �� ��� ����������.";
};


func int org_862_jacko_banditencamp_condition()
{
	if((KALOM_DRUGMONOPOL == LOG_SUCCESS) && Hlp_StrCmp(Npc_GetNearestWP(self),"LOCATION_11_08"))
	{
		return TRUE;
	};
};

func void org_862_jacko_banditencamp_info()
{
	AI_Output(other,self,"ORG_862_Jacko_Banditencamp_15_00");	//�, ��� �� ��� ����������.
	AI_Output(self,other,"ORG_862_Jacko_Banditencamp_06_01");	//��, �� ���� �� ������� �� ������. ������ �� ����� �� ����� �� ����� �����������.
	AI_StopProcessInfos(self);
};

