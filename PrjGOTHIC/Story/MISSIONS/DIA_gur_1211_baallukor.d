
instance INFO_BAALLUKOR_EXIT(C_INFO)
{
	npc = gur_1211_baallukor;
	nr = 999;
	condition = info_baallukor_exit_condition;
	information = info_baallukor_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_baallukor_exit_condition()
{
	return 1;
};

func void info_baallukor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_BAALLUKOR_MEET(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_meet_condition;
	information = info_baallukor_meet_info;
	permanent = 0;
	important = 1;
};


func int info_baallukor_meet_condition()
{
	return TRUE;
};

func void info_baallukor_meet_info()
{
	AI_Output(self,other,"Info_BaalLukor_MEET_13_01");	//��������� �� ������. ��� �������, � �� �� �������.
	b_givexp(XP_SAVEBAALLUKOR);
};


instance INFO_BAALLUKOR_DEAD(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_dead_condition;
	information = info_baallukor_dead_info;
	nr = 20;
	permanent = 0;
	important = 0;
	description = "� ����� ������ �������, ����� ��� ����. ��� ����� ���������?";
};


func int info_baallukor_dead_condition()
{
	return TRUE;
};

func void info_baallukor_dead_info()
{
	AI_Output(other,self,"Info_BaalLukor_DEAD_15_01");	//� ����� ������ �������, ����� ��� ����. ��� ����� ���������?
	AI_Output(self,other,"Info_BaalLukor_DEAD_13_02");	//������� ��� ����� ������� ��� ����, ����� ����������� ������.
	AI_Output(self,other,"Info_BaalLukor_DEAD_13_03");	//�� ������, ��� �� ������ ����� ������, ����� ����� � ������� �������.
	AI_Output(self,other,"Info_BaalLukor_DEAD_13_04");	//�� ���� ������ ��� �������� ����������� ���������, � ��� �������� ����! � �� ����, ��� �� ����� ���� � ���� ������, �� �� ���������� �� ������� �� ��� �������!
	AI_Output(other,self,"Info_BaalLukor_DEAD_15_05");	//� ��� ������, ������� ����� � �����?
	AI_Output(self,other,"Info_BaalLukor_DEAD_13_06");	//������! � ���� �������� �� ������, ����� ����� �� � ��� �������. �� ������� ���� �� ��� ������.
	b_logentry(CH3_ORCGRAVEYARD,"� ���� ���� ����� ������ �� ����� �� ��������. ��� ������, ������� ����� ������ � ���, ���� ����� ���.");
};


instance INFO_BAALLUKOR_SUMMONING(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_summoning_condition;
	information = info_baallukor_summoning_info;
	nr = 10;
	permanent = 0;
	important = 0;
	description = "���� ������� ��� �����!";
};


func int info_baallukor_summoning_condition()
{
	return TRUE;
};

func void info_baallukor_summoning_info()
{
	AI_Output(other,self,"Info_BaalLukor_SUMMONING_15_01");	//���� ������� ��� �����! �� ��� ����� ���-������, ��� ������� �� �������� �������?
	AI_Output(self,other,"Info_BaalLukor_SUMMONING_13_02");	//���, ���� ������ �� �����. �� ��� � ���������? �� ��� �������?
	AI_Output(other,self,"Info_BaalLukor_SUMMONING_15_03");	//���, �� ��� � �� ������ � ����.
	AI_Output(self,other,"Info_BaalLukor_SUMMONING_13_04");	//�� ������ ������ ����� ���� ������. �� ������� ������ ��������� �� ��, ����� ���������� ����. ���� ������ ����� ��������, ���� �� ����� ������ � ������� ������.
	AI_Output(self,other,"Info_BaalLukor_SUMMONING_13_05");	//�� � �� ������� ������ ��������� � �������, � ��� ���������� ��������� �� ����� �� ��� ������, ��� �� ����� ������� ������.
	AI_Output(self,other,"Info_BaalLukor_SUMMONING_13_06");	//���� �� ������� �������, ��, ����� ����, �� ������� ������ ��� ��������� ������ � ���� ������.
};


instance INFO_BAALLUKOR_HELP(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_help_condition;
	information = info_baallukor_help_info;
	permanent = 0;
	important = 0;
	description = "������, � ������ ����!";
};


func int info_baallukor_help_condition()
{
	return Npc_KnowsInfo(hero,info_baallukor_summoning);
};

func void info_baallukor_help_info()
{
	AI_Output(other,self,"Info_BaalLukor_HELP_15_01");	//������, � ������ ����!
	AI_Output(self,other,"Info_BaalLukor_HELP_13_02");	//�� ��������� ����. ����� ���� ��� �������. ��� ����� �� ���������.
	AI_Output(self,other,"Info_BaalLukor_HELP_13_03");	//�� ��� ������, � � ����� ������!
	b_logentry(CH3_ORCGRAVEYARD,"���� ����� ����� ����� �� ����, ����� ��������� ������� ����� �������� ���������� ����������.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
};


instance INFO_BAALLUKOR_FOUNDNONE(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_foundnone_condition;
	information = info_baallukor_foundnone_info;
	permanent = 1;
	important = 0;
	description = "� ������ �� ���� �����!";
};


func int info_baallukor_foundnone_condition()
{
	if(Npc_KnowsInfo(hero,info_baallukor_help) && (BAALLUKOR_BRINGPARCHMENT == 0) && !Npc_HasItems(hero,orkparchmentone) && !Npc_HasItems(hero,orkparchmenttwo))
	{
		return TRUE;
	};
};

func void info_baallukor_foundnone_info()
{
	AI_Output(other,self,"Info_BaalLukor_FOUNDNONE_15_01");	//� ������ �� ���� �����!
	AI_Output(self,other,"Info_BaalLukor_FOUNDNONE_13_02");	//��������, �� �������� �� ��� �������.
	Npc_ExchangeRoutine(self,"Follow");
};


instance INFO_BAALLUKOR_FOUNDONE(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_foundone_condition;
	information = info_baallukor_foundone_info;
	permanent = 1;
	important = 0;
	description = "��-�����, �� �� ������ ����� ������ ��������. �� ����� ���!";
};


func int info_baallukor_foundone_condition()
{
	if(Npc_KnowsInfo(hero,info_baallukor_help) && (((BAALLUKOR_BRINGPARCHMENT == 1) && !Npc_HasItems(hero,orkparchmenttwo)) || ((BAALLUKOR_BRINGPARCHMENT == 2) && !Npc_HasItems(hero,orkparchmentone))))
	{
		return TRUE;
	};
};

func void info_baallukor_foundone_info()
{
	AI_Output(other,self,"Info_BaalLukor_FOUNDONE_15_01");	//��-�����, �� �� ������ ����� ������ ��������. �� ����� ���!
	AI_Output(self,other,"Info_BaalLukor_FOUNDONE_13_02");	//���, ��� ������ ����. ������ ������������. ��� ��������� ���-�� �����.
	Npc_ExchangeRoutine(self,"Follow");
};


instance INFO_BAALLUKOR_FIRSTWAIT(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_firstwait_condition;
	information = info_baallukor_firstwait_info;
	permanent = 0;
	important = 1;
};


func int info_baallukor_firstwait_condition()
{
	if(Npc_KnowsInfo(hero,info_baallukor_help) && (Npc_GetDistToWP(self,"GRYD_040") < 500) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400) && !Npc_KnowsInfo(hero,info_baallukor_firstscroll))
	{
		return TRUE;
	};
};

func void info_baallukor_firstwait_info()
{
	b_fullstop(hero);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_BaalLukor_FIRSTWAIT_13_01");	//������ �� �� ������ ������! ����� ����, ��� ���� ������� ���.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WaitInSideTunnelOne");
};


instance INFO_BAALLUKOR_FIRSTSCROLL(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_firstscroll_condition;
	information = info_baallukor_firstscroll_info;
	permanent = 0;
	important = 0;
	description = "� ����� ������� ������!";
};


func int info_baallukor_firstscroll_condition()
{
	if(Npc_KnowsInfo(hero,info_baallukor_help) && Npc_HasItems(hero,orkparchmentone))
	{
		return TRUE;
	};
};

func void info_baallukor_firstscroll_info()
{
	AI_Output(other,self,"Info_BaalLukor_FIRSTSCROLL_15_01");	//� ����� ������� ������!
	b_giveinvitems(hero,self,orkparchmentone,1);
	if(BAALLUKOR_BRINGPARCHMENT == 2)
	{
		AI_Output(self,other,"Info_BaalLukor_FIRSTSCROLL_13_02");	//�������! ��� � ���� �������� ������ � ����������� �����.
		BAALLUKOR_BRINGPARCHMENT = 3;
	}
	else
	{
		AI_Output(self,other,"Info_BaalLukor_FIRSTSCROLL_13_03");	//��� ������ � ����������� �����. ���-�� �������� ��� �� ��� �����.
		AI_Output(self,other,"Info_BaalLukor_FIRSTSCROLL_13_04");	//� ��� ���� ������ ���� �� ���. ����� ����� ������.
		AI_StopProcessInfos(self);
		BAALLUKOR_BRINGPARCHMENT = 1;
	};
	Npc_ExchangeRoutine(self,"Follow");
};


instance INFO_BAALLUKOR_SECONDWAIT(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_secondwait_condition;
	information = info_baallukor_secondwait_info;
	permanent = 0;
	important = 1;
};


func int info_baallukor_secondwait_condition()
{
	if(Npc_KnowsInfo(hero,info_baallukor_help) && (Npc_GetDistToWP(self,"GRYD_047") < 500) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400) && !Npc_KnowsInfo(hero,info_baallukor_secondscroll))
	{
		return TRUE;
	};
};

func void info_baallukor_secondwait_info()
{
	b_fullstop(hero);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_BaalLukor_SECONDWAIT_13_01");	//��... ��� ������ �����! ����� ����, �� ������ ����� ���-��, ��� ������� ��� � ���������� �������.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WaitInSideTunnelTwo");
};


instance INFO_BAALLUKOR_SECONDSCROLL(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_secondscroll_condition;
	information = info_baallukor_secondscroll_info;
	permanent = 0;
	important = 1;
};


func int info_baallukor_secondscroll_condition()
{
	if(Npc_KnowsInfo(hero,info_baallukor_help) && Npc_HasItems(hero,orkparchmenttwo) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void info_baallukor_secondscroll_info()
{
	b_fullstop(hero);
	AI_GotoNpc(self,hero);
	AI_Output(other,self,"Info_BaalLukor_SECONDSCROLL_15_01");	//��� ������� ������!
	b_giveinvitems(hero,self,orkparchmenttwo,1);
	if(BAALLUKOR_BRINGPARCHMENT == 1)
	{
		AI_Output(self,other,"Info_BaalLukor_SECONDSCROLL_13_02");	//�������! ��� � ���� ������ �������� ������ � ����������� �����.
		BAALLUKOR_BRINGPARCHMENT = 3;
	}
	else
	{
		AI_Output(self,other,"Info_BaalLukor_SECONDSCROLL_13_03");	//��� ������ � ����������� �����. ���-�� �������� ��� �� ��� �����.
		AI_Output(self,other,"Info_BaalLukor_SECONDSCROLL_13_04");	//� ��� ���� ������ ���� �� ���. ����� ����� ������.
		AI_StopProcessInfos(self);
		BAALLUKOR_BRINGPARCHMENT = 2;
	};
	Npc_ExchangeRoutine(self,"Follow");
};


instance INFO_BAALLUKOR_BOTHSCROLLS(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_bothscrolls_condition;
	information = info_baallukor_bothscrolls_info;
	permanent = 0;
	important = 0;
	description = "��� �� ��� ������ ������ � ���� ����������� �������?";
};


func int info_baallukor_bothscrolls_condition()
{
	if(Npc_KnowsInfo(hero,info_baallukor_help) && (BAALLUKOR_BRINGPARCHMENT == 3))
	{
		return TRUE;
	};
};

func void info_baallukor_bothscrolls_info()
{
	AI_Output(other,self,"Info_BaalLukor_BOTHSCROLLS_15_01");	//��� �� ��� ������ ������ � ���� ����������� �������?
	AI_Output(self,other,"Info_BaalLukor_BOTHSCROLLS_13_02");	//���� ��������� ��� �����, �� ������� ����� ������. �� � �� ����� ��� ������������.
	b_logentry(CH3_ORCGRAVEYARD,"�� ����� ��� �������� �������� ����������. �� ���� ����� �� ����� �� ���������. ���� �� �����.");
	Npc_ExchangeRoutine(self,"Follow");
};


instance INFO_BAALLUKOR_RUNES(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_runes_condition;
	information = info_baallukor_runes_info;
	permanent = 0;
	important = 1;
};


func int info_baallukor_runes_condition()
{
	if(Npc_KnowsInfo(hero,info_baallukor_bothscrolls) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400) && ((Npc_GetDistToWP(hero,"GRYD_025") < 600) || (Npc_GetDistToWP(hero,"GRYD_048") < 600)))
	{
		return TRUE;
	};
};

func void info_baallukor_runes_info()
{
	b_fullstop(hero);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_BaalLukor_RUNES_13_01");	//�������! �������, � ���� ���-�� ����...
	AI_Output(other,self,"Info_BaalLukor_RUNES_15_02");	//��� ��� ����� ������ �� ������� ����������.
	AI_Output(self,other,"Info_BaalLukor_RUNES_13_03");	//����! ����� ����������� � ���� ����� �� ������ ������.
	AI_Output(self,other,"Info_BaalLukor_RUNES_13_04");	//� �� ������� � ����� ��������� ������.
	b_usefakescroll();
	AI_Output(self,other,"Info_BaalLukor_RUNES_13_06");	//��� � � �����! ��� �� ������ ������������. ��, ��-�����, ��� ����� ��������� ������ � ������������ �����.
	AI_Output(self,other,"Info_BaalLukor_RUNES_13_07");	//��� �������!
	Npc_RemoveInvItems(self,orkparchmentone,1);
	Npc_RemoveInvItems(self,orkparchmenttwo,1);
	b_logentry(CH3_ORCGRAVEYARD,"� ������� ��������� �������� � ������� ���� ���� ����� ���� ��������� ������. ��� �������� ������ ������������, ����������� ����-���� �� ����� �������� ���������.");
	Npc_ExchangeRoutine(self,"Follow");
};


instance INFO_BAALLUKOR_WHATNOW(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_whatnow_condition;
	information = info_baallukor_whatnow_info;
	permanent = 1;
	important = 0;
	description = "� ����� ��� '������������ �����'?";
};


func int info_baallukor_whatnow_condition()
{
	if(Npc_KnowsInfo(hero,info_baallukor_runes) && Npc_KnowsInfo(hero,info_baallukor_hallwithout) && !Npc_KnowsInfo(hero,info_baallukor_hallwith))
	{
		return TRUE;
	};
};

func void info_baallukor_whatnow_info()
{
	AI_Output(other,self,"Info_BaalLukor_WHATNOW_15_01");	//� ����� ��� '������������ �����'?
	AI_Output(self,other,"Info_BaalLukor_WHATNOW_13_02");	//��� ����������, ���... ��� ������� ���, � ������� �� ��� ����... ���-�� � ��� �� ���. �������� ����!
	Npc_ExchangeRoutine(self,"Follow");
};


instance INFO_BAALLUKOR_HALLWITHOUT(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_hallwithout_condition;
	information = info_baallukor_hallwithout_info;
	permanent = 0;
	important = 1;
};


func int info_baallukor_hallwithout_condition()
{
	if(!Npc_KnowsInfo(hero,info_baallukor_runes) && (Npc_GetDistToWP(hero,"GRYD_055") < 500) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void info_baallukor_hallwithout_info()
{
	b_fullstop(hero);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_BaalLukor_HALLWITHOUT_13_01");	//� ���� �����... � �� ���� ����� ���������, �� ���-�� � ���� �����...
	AI_Output(self,other,"Info_BaalLukor_HALLWITHOUT_13_02");	//�, ������ �� ����. ��������, �� ���� ������������� ������� ��������� ���� ������.
	b_logentry(CH3_ORCGRAVEYARD,"����� �� ����� � ������� ������������� ����, ���� ���-�� ������������. �� �� �� ��� �������, ��� ������.");
	Npc_ExchangeRoutine(self,"Follow");
};


instance INFO_BAALLUKOR_HALLWITH(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_hallwith_condition;
	information = info_baallukor_hallwith_info;
	permanent = 0;
	important = 1;
};


func int info_baallukor_hallwith_condition()
{
	if(Npc_KnowsInfo(hero,info_baallukor_runes) && (Npc_GetDistToWP(hero,"GRYD_055") < 500) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void info_baallukor_hallwith_info()
{
	b_fullstop(hero);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_BaalLukor_HALLWITH_13_01");	//� ���� ����� ������ ����... ���� ����-�� �������������.
	AI_Output(other,self,"Info_BaalLukor_HALLWITH_15_02");	//��� �����... ��� �� �� ������ �������! �� ������ ��� �� ����� ���������.
	AI_Output(self,other,"Info_BaalLukor_HALLWITH_13_03");	//�������... �� ����� ������ � ����� ����...
	b_logentry(CH3_ORCGRAVEYARD,"����� ������������ ������� ������� ����� ������ � ����� �� ���� ���� � ���������.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DOOR");
};


instance INFO_BAALLUKOR_DOOR(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_door_condition;
	information = info_baallukor_door_info;
	permanent = 0;
	important = 1;
};


func int info_baallukor_door_condition()
{
	if(Npc_KnowsInfo(hero,info_baallukor_hallwith) && (Npc_GetDistToWP(hero,"GRYD_060") < 500) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void info_baallukor_door_info()
{
	b_fullstop(hero);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_BaalLukor_DOOR_13_01");	//�� ���� ������... ������ ����, ��� �����!
	AI_Output(self,other,"Info_BaalLukor_DOOR_13_02");	//��� �� ������ ���� ��������� ����������.
	AI_Output(self,other,"Info_BaalLukor_DOOR_13_03");	//������ ��� ���. ������ ����� ���� ������.
	CreateInvItem(self,itarscrollteleport4);
	b_giveinvitems(self,hero,itarscrollteleport4,1);
	AI_StopProcessInfos(self);
};


instance INFO_BAALLUKOR_TELEPORT(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_teleport_condition;
	information = info_baallukor_teleport_info;
	permanent = 0;
	important = 1;
};


func int info_baallukor_teleport_condition()
{
	if(Npc_KnowsInfo(hero,info_baallukor_door) && Npc_GetDistToWP(hero,"GRYD_072") < 550 && Npc_CanSeeNpcFreeLOS(self,hero) && Npc_GetDistToNpc(self,hero) < 1400)
	{
		return TRUE;
	};
};

func void info_baallukor_teleport_info()
{
	b_fullstop(hero);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_BaalLukor_TELEPORT_13_01");	//��� ����� ���� �������. �� ����� ���. ��� �������� ���� �� �������.
	AI_Output(other,self,"Info_BaalLukor_TELEPORT_15_02");	//� ���, ����� ������������� ����� ����� ��, ��� ������� �������� �������?
	AI_Output(other,self,"Info_BaalLukor_TELEPORT_15_03");	//��� ����� ������ ������ �� �����-�� ��������.
	AI_Output(self,other,"Info_BaalLukor_TELEPORT_13_04");	//������ ������.
	AI_Output(self,other,"Info_BaalLukor_HELP_13_03");	//�� ��� ������, � � ����� ������!
	b_logentry(CH3_ORCGRAVEYARD,"� ������� ������ ������������ � ����� � ������ ������, ��������� �� ������� ���� � ���������.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TELEPORT");
};


instance INFO_BAALLUKOR_ALTAR(C_INFO)
{
	npc = gur_1211_baallukor;
	condition = info_baallukor_altar_condition;
	information = info_baallukor_altar_info;
	permanent = 0;
	important = 1;
};


func int info_baallukor_altar_condition()
{
	if(Npc_KnowsInfo(hero,info_baallukor_teleport) && (Npc_GetDistToWP(hero,"GRYD_082") < 400) && Npc_CanSeeNpcFreeLOS(self,hero))
	{
		return TRUE;
	};
};

func void info_baallukor_altar_info()
{
	b_fullstop(hero);
	AI_GotoWP(hero,"GRYD_081");
	AI_AlignToWP(hero);
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_01");	//���! ����� �� ����� ����! ����� �� ������ �����-�� �����... ������ ������� ����.
	AI_SetWalkMode(self,NPC_RUN);
	AI_GotoWP(self,"GRYD_082");
	AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_02");	//���!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_03");	//�������� ���, � ������ � ����!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_04");	//���������, ��� ���� ����! ���!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_05");	//���!
	AI_Output(hero,self,"Info_BaalLukor_ALTAR_15_06");	//��, ���. ������ �� ������������ ����� � ���!
	AI_Standup(self);
	b_whirlaround(self,hero);
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_07");	//��� �� �� ���� �������. �� ��������� ��� �����. �� ������ ���� �������, ������ ���������!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_08");	//������ � ������ ������������ �� ��� ������������!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_09");	//� ������� ������ ������ ����. ������������ ������!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_10");	//����� �� ��������� ����. � ���� ����� �� ��� ��������.
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_11");	//����, ��������!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_12");	//
	self.flags = 0;
	self.aivar[43] = TRUE;
	self.npctype = NPCTYPE_MAIN;
	BAALLUKOR_BRINGPARCHMENT = 4;
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	npc_setpermattitude(self,ATT_HOSTILE);
	b_logentry(CH3_ORCGRAVEYARD,"���� ����� ������� �����, ����� ����� ����, ��� �� ���������� ������ �� �����. �� ����� �� ����. ��� ������ �� ���������� �� �������, ������� � ������.");
	AI_StopProcessInfos(self);
	AI_StartState(self,zs_attack,1,"");
};

