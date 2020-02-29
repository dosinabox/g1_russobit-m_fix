
const string TPL_1441_CHECKPOINT = "PSI_TEMPLE_IN";

instance INFO_TPL_1441_FIRSTWARN(C_INFO)
{
	npc = tpl_1441_templer;
	nr = 1;
	condition = info_tpl_1441_firstwarn_condition;
	information = info_tpl_1441_firstwarn_info;
	permanent = 1;
	important = 1;
};


func int info_tpl_1441_firstwarn_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_tpl_1441_firstwarn_info()
{
	printglobals(PD_MISSION);
	AI_Output(self,hero,"Info_TPL_1441_FirstWarn_13_01");	//����! ������ � ���������� ������ �� ���� �� ������ ����� � ����.
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,TPL_1441_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	if(Npc_KnowsInfo(hero,pc_psionic_send))
	{
		Info_ClearChoices(info_tpl_1441_firstwarn);
		Info_AddChoice(info_tpl_1441_firstwarn,"��� ������� ��� ��� ���� ���������� ����������.",info_tpl_1441_firstwarn_condition_yberion);
		Info_AddChoice(info_tpl_1441_firstwarn,"������ ������� ����. � ���� ���������� �������� ���� ������.",info_tpl_1441_firstwarn_condition_lester);
	}
	else
	{
		AI_StopProcessInfos(self);
	};
};

func void info_tpl_1441_firstwarn_condition_yberion()
{
	AI_Output(hero,self,"Info_TPL_1441_FirstWarn_Condition_YBERION_15_01");	//��� ������� ��� ��� ���� ���������� ����������.
	AI_Output(self,hero,"Info_TPL_1441_FirstWarn_Condition_YBERION_13_02");	//�� ������, ��� �� ������ � ����, ��� ����? ���������� �������, ���� ���� ����� ���� ����.
};

func void info_tpl_1441_firstwarn_condition_lester()
{
	var C_NPC templer;
	AI_Output(hero,self,"Info_TPL_1441_FirstWarn_Condition_LESTER_15_01");	//��������� ������ ������� ����. � ���� ���������� �������� ���� ������.
	AI_Output(self,hero,"Info_TPL_1441_FirstWarn_Condition_LESTER_13_02");	//������. � ���� ���, ��� ����� ��������. �������.
	Info_ClearChoices(info_tpl_1441_firstwarn);
	templer = Hlp_GetNpc(tpl_1442_templer);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_BEGIN;
	self.aivar[AIV_PASSGATE] = TRUE;
	templer.aivar[AIV_PASSGATE] = TRUE;
};


instance INFO_TPL_1441_LASTWARN(C_INFO)
{
	npc = tpl_1441_templer;
	nr = 1;
	condition = info_tpl_1441_lastwarn_condition;
	information = info_tpl_1441_lastwarn_info;
	permanent = 1;
	important = 1;
};


func int info_tpl_1441_lastwarn_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && (Npc_GetDistToWP(hero,TPL_1441_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_tpl_1441_lastwarn_info()
{
	AI_Output(self,hero,"Info_TPL_1441_LastWarn_13_01");	//��� ���, � ����� �� ����!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,TPL_1441_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};


instance INFO_TPL_1441_ATTACK(C_INFO)
{
	npc = tpl_1441_templer;
	nr = 1;
	condition = info_tpl_1441_attack_condition;
	information = info_tpl_1441_attack_info;
	permanent = 1;
	important = 1;
};


func int info_tpl_1441_attack_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,TPL_1441_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_tpl_1441_attack_info()
{
	hero.aivar[AIV_LASTDISTTOWP] = 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_PUNISH;
	b_fullstop(self);
	AI_StopProcessInfos(self);
	b_intruderalert(self,other);
	b_setattackreason(self,AIV_AR_INTRUDER);
	Npc_SetTarget(self,hero);
	AI_StartState(self,zs_attack,1,"");
};

