
instance INFO_GORN_EXIT(C_INFO)
{
	npc = pc_fighter;
	nr = 999;
	condition = info_gorn_exit_condition;
	information = info_gorn_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_gorn_exit_condition()
{
	return 1;
};

func void info_gorn_exit_info()
{
	if(self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output(self,other,"Info_Gorn_EXIT_09_01");	//������ � ���!
	}
	else
	{
		AI_Output(self,other,"Info_Gorn_EXIT_09_02");	//��� ��������.
	};
	AI_StopProcessInfos(self);
};


instance DIA_GORN_FIRST(C_INFO)
{
	npc = pc_fighter;
	nr = 1;
	condition = dia_gorn_first_condition;
	information = dia_gorn_first_info;
	permanent = 0;
	important = 1;
};


func int dia_gorn_first_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void dia_gorn_first_info()
{
	AI_Output(self,other,"DIA_Gorn_First_09_00");	//��, ����� ����.
	AI_Output(other,self,"DIA_Gorn_First_15_01");	//��� ��?
	AI_Output(self,other,"DIA_Gorn_First_09_02");	//� ����. ������� �����.
};


instance DIA_GORN_LEBEN(C_INFO)
{
	npc = pc_fighter;
	nr = 2;
	condition = dia_gorn_leben_condition;
	information = dia_gorn_leben_info;
	permanent = 0;
	description = "� ��� ������ ������ ��������?";
};


func int dia_gorn_leben_condition()
{
	if(Npc_KnowsInfo(hero,dia_gorn_first))
	{
		return 1;
	};
};

func void dia_gorn_leben_info()
{
	AI_Output(other,self,"DIA_Gorn_Leben_15_00");	//� ��� ������ ������ ��������?
	AI_Output(self,other,"DIA_Gorn_Leben_09_01");	//�� �������� � ������ ������. �� ����� ���� ������ ������ �������, �� ���� ���.
	AI_Output(self,other,"DIA_Gorn_Leben_09_02");	//�� ������ �� ���, ����� ����� �� ����� ��������� �������� ���� � �������� �����.
	AI_Output(self,other,"DIA_Gorn_Leben_09_03");	//� ���� ������ ���, ����� �� ������ ������������ ������. �� ���� ������ ��� ������ ����� ������� ����.
};


var int gorn_shrikeshut;

instance DIA_GORN_HUT(C_INFO)
{
	npc = pc_fighter;
	nr = 3;
	condition = dia_gorn_hut_condition;
	information = dia_gorn_hut_info;
	permanent = 0;
	description = "���� � ���-������ ����� ������������?..";
};


func int dia_gorn_hut_condition()
{
	if(Npc_KnowsInfo(hero,dia_gorn_first))
	{
		return 1;
	};
};

func void dia_gorn_hut_info()
{
	AI_Output(other,self,"DIA_Gorn_Hut_15_00");	//���� � ���-������ ����� ������������, ��� ����� �� �������� ������ �������� �� ����?
	AI_Output(self,other,"DIA_Gorn_Hut_09_01");	//�� �����. �� ���� �� ��� �������, �������� �� �������.
	AI_Output(self,other,"DIA_Gorn_Hut_09_02");	//�� ����� ������ ���, ����� �������� ����� � ������. �� ��������, �� ������-�� �� ����������� ���.
	AI_Output(other,self,"DIA_Gorn_Hut_15_03");	//���?
	AI_Output(self,other,"DIA_Gorn_Hut_09_04");	//��, ��, ���������. �� ����� �������� �� �����. � ������ ����� �� ����� ����� �� ���������� �� ����� �������� ������.
	AI_Output(self,other,"DIA_Gorn_Hut_09_05");	//��� ��� ��� �� ��� �����, �� ����� ������ �� ���������. � ����� ������ ������ �������� � ���, ����� ��� �������!
	Log_CreateTopic(CH1_SHRIKESHUT,LOG_MISSION);
	Log_SetTopicStatus(CH1_SHRIKESHUT,LOG_RUNNING);
	b_logentry(CH1_SHRIKESHUT,"������� ���� ��������� ���, ��� ����� ��� ���������� �������� � ���� �� ����� ���������. ��� ��� � ������� ���������� � �����, ����� �� ��������� �� �������� ���, ���� � ������� ������ ����� ���� ���-�� ������.");
	GORN_SHRIKESHUT = LOG_RUNNING;
};


instance DIA_GORN_HUTFREE(C_INFO)
{
	npc = pc_fighter;
	nr = 3;
	condition = dia_gorn_hutfree_condition;
	information = dia_gorn_hutfree_info;
	permanent = 0;
	description = "����� ����� ���� ������ ���.";
};


func int dia_gorn_hutfree_condition()
{
	if(Npc_KnowsInfo(hero,dia_shrike_getlost))
	{
		return 1;
	};
};

func void dia_gorn_hutfree_info()
{
	AI_Output(other,self,"DIA_Gorn_HutFree_15_00");	//����� ����� ���� ������ ���.
	AI_Output(self,other,"DIA_Gorn_HutFree_09_01");	//������. ������ ��� �� ���� ������� ������. �� ����� ��� ������������ � ���� ������.
	GORN_SHRIKESHUT = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_SHRIKESHUT,LOG_SUCCESS);
	b_logentry(CH1_SHRIKESHUT,"����� �����������, ��� � ������� ������ �� ������� ����. �����, ��� ����� ��������. ���������� � ������� ��������� � ���� �������.");
	b_givexp(XP_REPORTEDKICKEDSHRIKE);
};


instance DIA_GORN_BECOMESLD(C_INFO)
{
	npc = pc_fighter;
	nr = 5;
	condition = dia_gorn_becomesld_condition;
	information = dia_gorn_becomesld_info;
	permanent = 0;
	description = "��� � ������ �������, ����� ���� ������� � ����� ������?";
};


func int dia_gorn_becomesld_condition()
{
	if(Npc_KnowsInfo(hero,dia_gorn_first) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void dia_gorn_becomesld_info()
{
	AI_Output(other,self,"DIA_Gorn_BecomeSLD_15_00");	//��� � ������ �������, ����� ���� ������� � ����� ������?
	AI_Output(self,other,"DIA_Gorn_BecomeSLD_09_01");	//�� ������ ��������� ������ ������� �������, ����� �� ���� ���� �� ������. �������, ����� ������ �� ������ ������������.
	AI_Output(self,other,"DIA_Gorn_BecomeSLD_09_02");	//��� �� ������ ����� ���� ������ � ����������� � ����� ������.
	AI_Output(self,other,"DIA_Gorn_BecomeSLD_09_03");	//���� �� �� ����������� �������������� � ������� ������, �������� � �����, � ������ ����� ������� � ���.
};


var int gorn_trade;

instance DIA_GORN_TRADE(C_INFO)
{
	npc = pc_fighter;
	nr = 800;
	condition = dia_gorn_trade_condition;
	information = dia_gorn_trade_info;
	permanent = 1;
	description = DIALOG_TRADE;
	trade = 1;
};


func int dia_gorn_trade_condition()
{
};

func void dia_gorn_trade_info()
{
	AI_Output(other,self,"DIA_Gorn_TRADE_15_00");	//� � ���� ��� ����� ����� �����?
	AI_Output(self,other,"DIA_Gorn_TRADE_09_01");	//�����. ������ ������?
};


instance DIA_GORN_DUHEHLER(C_INFO)
{
	npc = pc_fighter;
	nr = 1;
	condition = dia_gorn_duhehler_condition;
	information = dia_gorn_duhehler_info;
	permanent = 0;
	description = "������ �� ���������� � ������, ������� �������� ����� �����?";
};


func int dia_gorn_duhehler_condition()
{
	if(Npc_KnowsInfo(hero,org_801_lares_bringlistanteil))
	{
		return 1;
	};
};

func void dia_gorn_duhehler_info()
{
	AI_Output(other,self,"DIA_Gorn_DuHehler_15_00");	//������ �� ���������� � ������, ������� �������� ����� �����?
	AI_Output(self,other,"DIA_Gorn_DuHehler_09_01");	//� ��� ������, ��� � � ��� ����������?
	AI_Output(other,self,"DIA_Gorn_DuHehler_15_02");	//������ �� � ���� ��� ����� ������?
	AI_Output(self,other,"DIA_Gorn_DuHehler_09_03");	//��, ����� ����� ���� ������� ��� ��� �� ���� ���?
	AI_Output(other,self,"DIA_Gorn_DuHehler_15_04");	//��� �� ��������� ���������� � �������?
	AI_Output(self,other,"DIA_Gorn_DuHehler_09_05");	//� ���� � ���, � ��� ����� ������ �� ���� ���� ������������. �� �� ������ ��������� �����.
	AI_Output(other,self,"DIA_Gorn_DuHehler_15_06");	//�������.
	CreateInvItems(self,itfoapple,21);
	b_giveinvitems(self,other,itfoapple,21);
	Npc_RemoveInvItems(other,itfoapple,21);
	CreateInvItems(other,itmw_1h_lightguardssword_03,1);
	CreateInvItems(other,itfoapple,5);
	CreateInvItems(other,itfoloaf,5);
	CreateInvItems(other,itfocheese,5);
	CreateInvItems(other,itfobeer,5);
};


instance INFO_GORN_NCWAIT(C_INFO)
{
	npc = pc_fighter;
	nr = 1;
	condition = info_gorn_ncwait_condition;
	information = info_gorn_ncwait_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_ncwait_condition()
{
	if(Npc_GetDistToWP(self,"NC_PATH52") < 1000)
	{
		return TRUE;
	};
};

func void info_gorn_ncwait_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_NCWAIT_09_01");	//�, ��� ��! ������, ��� ���� �� ��������� ������, ����������� ��� � ���, ��� �� ��� ������.
	AI_Output(self,other,"Info_Gorn_NCWAIT_09_02");	//������� ��� ��������, ������� ������ ����� ��� ���� �������.
	AI_Output(other,self,"Info_Gorn_NCWAIT_15_03");	//��, ���� �� ��� �� ��� �����, � �� ��� ����� ���� ������ ��� ������.
};


instance INFO_GORN_MAGES(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_mages_condition;
	information = info_gorn_mages_info;
	important = 0;
	permanent = 0;
	description = "� ���� ������ �������� ��� ����� ����!";
};


func int info_gorn_mages_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_ncwait))
	{
		return TRUE;
	};
};

func void info_gorn_mages_info()
{
	AI_Output(other,self,"Info_Gorn_MAGES_15_01");	//� ���� ������ �������� ��� ����� ����!
	AI_Output(self,other,"Info_Gorn_MAGES_09_02");	//�������� �� ���� � ���������. �� ����� ��� �������. ������ ����� �� ������� �����-�� ������.
	AI_Output(self,other,"Info_Gorn_MAGES_09_03");	//��� ������ ��������, ������� �������� �����, �� ��������� ���� � ����.
	AI_Output(other,self,"Info_Gorn_MAGES_15_04");	//�� ������ ��������� �� ���� ��������?
	AI_Output(self,other,"Info_Gorn_MAGES_09_05");	//� - ���. �� ��� ������, ��������� ����, - �� ����� ���� ���� ����������.
};


instance INFO_GORN_CRONOS(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_cronos_condition;
	information = info_gorn_cronos_info;
	important = 0;
	permanent = 0;
	description = "� ��� � ����� ����� ����� '��������� ����'?";
};


func int info_gorn_cronos_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_mages))
	{
		return TRUE;
	};
};

func void info_gorn_cronos_info()
{
	var C_NPC cronos;
	AI_Output(other,self,"Info_Gorn_CRONOS_15_01");	//� ��� � ����� ����� ����� '��������� ����'?
	AI_Output(self,other,"Info_Gorn_CRONOS_09_01a");	//�������� ������ �� ������, � �� ������ ������� ������� ������.
	AI_Output(self,other,"Info_Gorn_CRONOS_09_02");	//� ������ ������ ����� ����. ��� �� � ������� ���.
	AI_Output(self,other,"Info_Gorn_CRONOS_09_03");	//���� �����: ������ ������� �����������. �� ������ ������ �������� ���, ��� ���� �������� ����� �����.
	cronos = Hlp_GetNpc(kdw_604_cronos);
	cronos.aivar[AIV_FINDABLE] = TRUE;
	b_logentry(CH3_ESCAPEPLANNC,"���� ����������� ��� ���������� � ���������� ���� ����� ����. ��� ����� �������. ������, ��������� ����, ����� ���� ��� ���������� �� ������ � �����. � ����� ����� ��� � ������ ������, ����� ������ ����.");
	Npc_ExchangeRoutine(self,"start");
};


instance INFO_GORN_RUINWAIT(C_INFO)
{
	npc = pc_fighter;
	nr = 2;
	condition = info_gorn_ruinwait_condition;
	information = info_gorn_ruinwait_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_ruinwait_condition()
{
	if(Npc_GetDistToWP(self,"OW_PATH_ABYSS_4") < 1000)
	{
		return 1;
	};
};

func void info_gorn_ruinwait_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINWAIT_09_01");	//������! ��� ������, ���� ������� �� ��� �� ������.
	AI_Output(self,other,"Info_Gorn_RUINWAIT_09_02");	//��� ����� ����������� �� ����� ��������.
};


instance INFO_GORN_RUINWHAT(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_ruinwhat_condition;
	information = info_gorn_ruinwhat_info;
	important = 0;
	permanent = 0;
	description = "��� ������� ���� ����?";
};


func int info_gorn_ruinwhat_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_ruinwait))
	{
		return 1;
	};
};

func void info_gorn_ruinwhat_info()
{
	AI_Output(other,self,"Info_Gorn_RUINWHAT_15_01");	//��� ������� ���� ����?
	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_02");	//�, � ���� ����� ����� ����� ����� �������.
	AI_Output(other,self,"Info_Gorn_RUINWHAT_15_03");	//�������?
	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_04");	//��. �������, ���� �� ���� ������ � ������ ������, ����������� ���, ��� �����-�� ����� ���� ������.
	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_05");	//�������, ��� ���� ��� �� ��������� �������.
	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_06");	//��� �������� ����, ������� ��������� ����� ������������ ����� ����������� � ��������.
	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_07");	//� �����, ����� ������ ���� ����������� ��������� �� �� ��������.
	if(!Npc_KnowsInfo(hero,info_gorn_ruinfocus))
	{
		AI_Output(self,other,"Info_Gorn_RUINWHAT_09_08");	//� ��� �� ����� �����?
	};
};


instance INFO_GORN_RUINFOCUS(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_ruinfocus_condition;
	information = info_gorn_ruinfocus_info;
	important = 0;
	permanent = 0;
	description = "� ��� ������.";
};


func int info_gorn_ruinfocus_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_ruinwait))
	{
		return 1;
	};
};

func void info_gorn_ruinfocus_info()
{
	AI_Output(other,self,"Info_Gorn_RUINFOCUS_15_01");	//� ��� ������.  
	AI_Output(other,self,"Info_Gorn_RUINFOCUS_15_02");	//�� ������ ���� ���-�� �����.
	AI_Output(self,other,"Info_Gorn_RUINFOCUS_09_03");	//��������, ��� ����� ��������� � ������ ������� ��������� �� �� ������� ������.
};


instance INFO_GORN_RUINJOIN(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_ruinjoin_condition;
	information = info_gorn_ruinjoin_info;
	important = 0;
	permanent = 0;
	description = "�� ����� ����� ���� ������.";
};


func int info_gorn_ruinjoin_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_ruinfocus) && Npc_KnowsInfo(hero,info_gorn_ruinwhat))
	{
		return 1;
	};
};

func void info_gorn_ruinjoin_info()
{
	AI_Output(other,self,"Info_Gorn_RUINJOIN_15_01");	//�� ����� ����� ���� ������.
	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_02");	//������� ����. ����� �� ��� ����� �������.
	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_03");	//������� ������� ��� ����� ��������� � ���� �� ��������, �� ������ ��� �������� ������.
	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_04");	//� ���� ����������� � ����� ������ � ��� �����.
	AI_Output(other,self,"Info_Gorn_RUINJOIN_15_05");	//�� ���� ������?
	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_06");	//��, �� ������� � ������� ������, � �� ����� ������� �� ������ �������. ����� ������ �����, ��� � ���� �� ������.
	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_07");	//����, � ����� ������.
	Log_CreateTopic(CH3_MONASTERYRUIN,LOG_MISSION);
	Log_SetTopicStatus(CH3_MONASTERYRUIN,LOG_RUNNING);
	b_logentry(CH3_MONASTERYRUIN,"�� ������ � ���������� ��������� � �������� �������� �����. ��� ������� ���� ������� ����� ������� ���������.");
	b_logentry(CH3_MONASTERYRUIN,"�� ������ ������ ���������� ���� ������. ���� ������ ���, ��� ������� ��� ���� ���� ������, ������� ������� ������� �������.");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RuinAbyss");
};


instance INFO_GORN_RUINABYSS(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_ruinabyss_condition;
	information = info_gorn_ruinabyss_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_ruinabyss_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_ruinjoin) && (Npc_GetDistToWP(self,"OW_ABYSS_TO_CAVE_MOVE6") < 1000))
	{
		return 1;
	};
};

func void info_gorn_ruinabyss_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINABYSS_09_01");	//��� ��� �����. �������, ��� ������ ������ ���� �������.
	AI_Output(self,other,"Info_Gorn_RUINABYSS_09_02");	//������ �� ��� ������. � � ���� ���������, ��� ��� ����� ����� ����������.
	b_logentry(CH3_MONASTERYRUIN,"�� ����� ������, � ������� ������ ���������� �����. ��� � ���� ���� � ��� ������.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RuinFollow");
};


instance INFO_GORN_RUINLEAVE(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_ruinleave_condition;
	information = info_gorn_ruinleave_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_ruinleave_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_ruinjoin) && (Npc_GetDistToWP(hero,"OW_PATH_175_MEATBUG") > 15000) && !Npc_KnowsInfo(hero,info_gorn_ruingate))
	{
		return 1;
	};
};

func void info_gorn_ruinleave_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINLEAVE_09_01");	//��� �������, ����� ���� ������ �����������.
	AI_Output(self,other,"Info_Gorn_RUINLEAVE_09_02");	//� ����� ����.
	AI_Output(self,other,"Info_Gorn_RUINLEAVE_09_03");	//������ �� ����, ���� �����������.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"RuinWall");
	AI_StopProcessInfos(self);
};


instance INFO_GORN_RUINWALL(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_ruinwall_condition;
	information = info_gorn_ruinwall_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_ruinwall_condition()
{
	if((Npc_KnowsInfo(hero,info_gorn_ruinjoin) || Npc_KnowsInfo(hero,info_gorn_ruinleave)) && (Npc_GetDistToWP(hero,"OW_PATH_175_GATE1") < 1000))
	{
		return 1;
	};
};

func void info_gorn_ruinwall_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINWALL_09_01");	//��� ������� ������! ��� ��������, ��� ��� �� ���� ������� �� ���� �� �������.
	AI_Output(self,other,"Info_Gorn_RUINWALL_09_02");	//������ ��� ������ ����� �������� �� ���������� ���� ���������.
	b_logentry(CH3_MONASTERYRUIN,"�� ����� ����� ��������� ��������. �������, �� �� ������ ������� �� �������.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RuinWall");
};


instance INFO_GORN_RUINWALLWHAT(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_ruinwallwhat_condition;
	information = info_gorn_ruinwallwhat_info;
	important = 0;
	permanent = 1;
	description = "��� ��� ������ ������?";
};


func int info_gorn_ruinwallwhat_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_ruinwall) && !Npc_KnowsInfo(hero,info_gorn_ruingate))
	{
		return TRUE;
	};
};

func void info_gorn_ruinwallwhat_info()
{
	AI_Output(other,self,"Info_Gorn_RUINWALLWHAT_15_01");	//��� ��� ������ ������?
	AI_Output(self,other,"Info_Gorn_RUINWALLWHAT_09_02");	//�� ������ ����� ������ ���������� ����� ��� ������.
};


instance INFO_GORN_RUINLEDGE(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_ruinledge_condition;
	information = info_gorn_ruinledge_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_ruinledge_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_ruinjoin) && !Npc_KnowsInfo(hero,info_gorn_ruinsuccess) && (Npc_GetDistToWP(hero,"OW_MONSTER_NAVIGATE_02") < 1000))
	{
		return 1;
	};
};

func void info_gorn_ruinledge_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINLEDGE_09_01");	//���, �������, ���� ��������� ��������. ��, �������, ��� ������� ������.
	AI_Output(self,other,"Info_Gorn_RUINLEDGE_09_02");	//�������� �������� ������ ����.
	AI_StopProcessInfos(self);
};


instance INFO_GORN_RUINPLATFORM(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_ruinplatform_condition;
	information = info_gorn_ruinplatform_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_ruinplatform_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_ruinjoin) && !Npc_KnowsInfo(hero,info_gorn_ruinsuccess) && (Npc_GetDistToWP(hero,"OW_PATH_176_TEMPELFOCUS4") < 300))
	{
		return 1;
	};
};

func void info_gorn_ruinplatform_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINPLATFORM_09_01");	//��� ������ �� �����-�� ���������.
	AI_Output(self,other,"Info_Gorn_RUINPLATFORM_09_02");	//��������, ��� ��� ����� ����� ��� �������, ������� �� �����.
	AI_StopProcessInfos(self);
};


instance INFO_GORN_RUINGATE(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_ruingate_condition;
	information = info_gorn_ruingate_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_ruingate_condition()
{
	if((Npc_KnowsInfo(hero,info_gorn_ruinjoin) || Npc_KnowsInfo(hero,info_gorn_ruinleave)) && MONASTERYRUIN_GATEOPEN)
	{
		return TRUE;
	};
};

func void info_gorn_ruingate_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINGATE_09_01");	//���� ������� ������� ������. ��� ������� �� ����������� ��� ����������!
	AI_Output(other,self,"Info_Gorn_RUINGATE_15_02");	//��� ����� ���� ������.
	b_logentry(CH3_MONASTERYRUIN,"� �������� ��������� �� ������ ������ � ����������� � ����. ������� ��, ��� ������� �������� � ����� ���� � ������� �� ���������� ����.");
	b_logentry(CH3_MONASTERYRUIN,"������ ������ ������.");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"RuinFollowInside");
	AI_StopProcessInfos(self);
};


instance INFO_GORN_RUINLEAVEINSIDE(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_ruinleaveinside_condition;
	information = info_gorn_ruinleaveinside_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_ruinleaveinside_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_ruingate) && (Npc_GetDistToWP(hero,"OW_PATH_ABYSS_CROSS_6") < 1000) && !Npc_HasItems(hero,focus_4))
	{
		return TRUE;
	};
};

func void info_gorn_ruinleaveinside_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINLEAVEINSIDE_09_01");	//��� �������, ����� ���� ������ �����������.
	AI_Output(self,other,"Info_Gorn_RUINLEAVEINSIDE_09_02");	//� ����� ����.
	AI_Output(self,other,"Info_Gorn_RUINLEAVEINSIDE_09_03");	//������ �� ����, ���� �����������.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"RuinStay");
	AI_StopProcessInfos(self);
};


instance INFO_GORN_RUINSUCCESS(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_ruinsuccess_condition;
	information = info_gorn_ruinsuccess_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_ruinsuccess_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_ruinjoin) && Npc_HasItems(hero,focus_4))
	{
		return TRUE;
	};
};

func void info_gorn_ruinsuccess_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINSUCCESS_09_01");	//��� �� ����� ���� ��������!
	AI_Output(other,self,"Info_Gorn_RUINSUCCESS_15_02");	//��. � ������ ������� ��� ����� ����.
	AI_Output(self,other,"Info_Gorn_RUINSUCCESS_09_03");	//� ��� ������� ������� ����.
	b_logentry(CH3_MONASTERYRUIN,"� ���������, ������� �� ������� �����, � ����� ���� �� ��������. ���� ����� ������������ ���� ��� �������.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RuinYard");
	Wld_InsertNpc(youngtroll,"OW_PATH_176");
};


instance INFO_GORN_RUINTROLL(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_ruintroll_condition;
	information = info_gorn_ruintroll_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_ruintroll_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_ruinsuccess) && (Npc_GetDistToWP(hero,"OW_PATH_SNAPPER04_SPAWN01") < 1000))
	{
		return TRUE;
	};
};

func void info_gorn_ruintroll_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINTROLL_09_01");	//�, ����! ��� ��� �� ������� �������?
	AI_Output(other,self,"Info_Gorn_RUINTROLL_15_02");	//������ ������� ��� ��������?
	AI_Output(self,other,"Info_Gorn_RUINTROLL_09_03");	//�� ����� �� ������ �� ���������� �������. ������ �� �� ����� �������.
	AI_Output(self,other,"Info_Gorn_RUINTROLL_09_04");	//��� ��� ������, ���� ������ ����-������ ������, �����-�� ����� ����������� ������.
	AI_StopProcessInfos(self);
	AI_DrawWeapon(self);
	AI_SetWalkMode(self,NPC_RUN);
};


instance INFO_GORN_RUINVICTORY(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_ruinvictory_condition;
	information = info_gorn_ruinvictory_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_ruinvictory_condition()
{
	var C_NPC ytroll;
	ytroll = Hlp_GetNpc(youngtroll);
	if(Npc_KnowsInfo(hero,info_gorn_ruintroll) && Npc_IsDead(ytroll))
	{
		return TRUE;
	};
};

func void info_gorn_ruinvictory_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINVICTORY_09_01");	//��� ���� �������.
	AI_Output(other,self,"Info_Gorn_RUINVICTORY_15_02");	//��� ��� ��! �� �������� ��� ��������. �� ��� ��� ��� ������� ������...
	AI_Output(self,other,"Info_Gorn_RUINVICTORY_09_03");	//... ����� ��� ����� ���� ������ ���������, ����� �� ������ ������� ��� ���������.
	AI_Output(other,self,"Info_Gorn_RUINVICTORY_15_04");	//�������, �� ����.
	AI_Output(self,other,"Info_Gorn_RUINVICTORY_09_05");	//����� ���� ���� ����������. � ���� ��� ������� ������� ��� �����.
	AI_Output(self,other,"Info_Gorn_RUINVICTORY_09_06");	//�� �� ��� ��������, � ������. �� �������, ����.
	b_logentry(CH3_MONASTERYRUIN,"����� �� ��������� �� ���� ���������, �� ����������� � ������� �������. ��� ������� �������� ���.");
	b_logentry(CH3_MONASTERYRUIN,"����� ���� � ������ ���� ���������. �� ��� �������, ��� � ��� ��� �����.");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"RuinStay");
	AI_StopProcessInfos(self);
};


instance INFO_GORN_DIEGOMILTEN(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_diegomilten_condition;
	information = info_gorn_diegomilten_info;
	important = 0;
	permanent = 0;
	description = "�������� �� ������� ������ � �������� ����� � ��������.";
};


func int info_gorn_diegomilten_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_ocfavor))
	{
		return TRUE;
	};
};

func void info_gorn_diegomilten_info()
{
	AI_Output(hero,self,"Info_Gorn_DIEGOMILTEN_15_01");	//�������� �� ������� ������ � �������� ����� � ��������.
	AI_Output(self,hero,"Info_Gorn_DIEGOMILTEN_09_02");	//��� ������� �������!
	AI_Output(hero,self,"Info_Gorn_DIEGOMILTEN_15_03");	//��� ����� ������ ���� � �������. �� ����� ������� �����.
	AI_Output(self,hero,"Info_Gorn_DIEGOMILTEN_09_04");	//�������. ������ - ����� ������, ��� � ��� ��������.
	AI_Output(self,hero,"Info_Gorn_DIEGOMILTEN_09_05");	//�� ��� ����� ���� �� ���. �� �������� ���� �������.
	b_givexp(XP_MESSAGEFORGORN);
	if(WARNED_GORN_OR_LESTER == FALSE)
	{
		WARNED_GORN_OR_LESTER = TRUE;
	}
	else
	{
		b_logentry(CH4_4FRIENDS,"� ��������� ������� � ����� � ���, ��� ������ ����� �� ������. ��� ���� �����, ��� ������ ��������� ��� �������.");
		Log_SetTopicStatus(CH4_4FRIENDS,LOG_SUCCESS);
	};
};


instance INFO_GORN_FREEMINE(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_freemine_condition;
	information = info_gorn_freemine_info;
	important = 0;
	permanent = 0;
	description = "��� �� ����� � ��������� �����?";
};


func int info_gorn_freemine_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_ambush) && !FINDXARDAS)
	{
		return TRUE;
	};
};

func void info_gorn_freemine_info()
{
	AI_Output(hero,self,"Info_Gorn_FREEMINE_15_01");	//��� �� ����� � ��������� �����?
	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_02");	//����� ������� ���� � �������� ���� � ������� ����� � �����, ������� ��������� �����.
	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_03");	//�� ��� � ������ ������ �����.
	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_04");	//��� � �������, ��� ��������� ������� ���������� � ����� � �����.
	AI_Output(hero,self,"Info_Gorn_FREEMINE_15_05");	//� ��� ��� ������ ���������� ���������� � ���������� ���������?
	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_06");	//��� ����������, ��� ��� ���� ��������� �� ������. ����� �� ������, ��� ��������� ������ �� ������� ���.
	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_07");	//� �����������, ��� ��������, �������� ����� ������� �������������.
};


instance INFO_GORN_GUARDNC(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_guardnc_condition;
	information = info_gorn_guardnc_info;
	important = 0;
	permanent = 0;
	description = "��� �� ����������� ������ ������?";
};


func int info_gorn_guardnc_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_ambush))
	{
		return TRUE;
	};
};

func void info_gorn_guardnc_info()
{
	AI_Output(hero,self,"Info_Gorn_GUARDNC_15_01");	//��� �� ����������� ������ ������?
	AI_Output(self,hero,"Info_Gorn_GUARDNC_09_02");	//����� ������ ������������ ������� ������������ ������. � ��� ������ ����� �������.
	AI_Output(self,hero,"Info_Gorn_GUARDNC_09_03");	//�� ���� ��� ������ �� �� ������ ������, � ������������ � ������ �����.
	AI_Output(hero,self,"Info_Gorn_GUARDNC_15_04");	//� �� ����������� ������� ������ �������� ����?
	AI_Output(self,hero,"Info_Gorn_GUARDNC_09_05");	//��� ���, �� ���� ���� �� �� ������.
	AI_Output(self,hero,"Info_Gorn_GUARDNC_09_06");	//���� �������� ���� �����, ��� � ������� �����. ��� � ����� ���������� ��� ����.
	b_story_cordspost();
	AI_StopProcessInfos(self);
};


instance INFO_GORN_GUARDNCRUNNING(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_guardncrunning_condition;
	information = info_gorn_guardncrunning_info;
	important = 0;
	permanent = 1;
	description = "��� ����?";
};


func int info_gorn_guardncrunning_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_guardnc) && !URSHAK_SPOKEOFULUMULU)
	{
		return TRUE;
	};
};

func void info_gorn_guardncrunning_info()
{
	AI_Output(hero,self,"Info_Gorn_GUARDNCRUNNING_15_01");	//��� ����?
	AI_Output(self,hero,"Info_Gorn_GUARDNCRUNNING_09_02");	//������ ����, ������ � ��������� ����� �� �������� �����.
	AI_Output(self,hero,"Info_Gorn_GUARDNCRUNNING_09_03");	//�� ��� ��� ����� ������������ �������.
};


instance INFO_GORN_POST(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_post_condition;
	information = info_gorn_post_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_post_condition()
{
	if(URSHAK_SPOKEOFULUMULU)
	{
		return TRUE;
	};
};

func void info_gorn_post_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_POST_09_01");	//�� ������ �������. �� ��������� ������� �������� ����.
	AI_Output(self,hero,"Info_Gorn_POST_09_02");	//������ �� ����� ��������� ��������� �����.
};


instance INFO_GORN_TAKEBACK(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_takeback_condition;
	information = info_gorn_takeback_info;
	important = 0;
	permanent = 0;
	description = "��������� ���������? � ��������� ��� ������ �����?";
};


func int info_gorn_takeback_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_post))
	{
		return TRUE;
	};
};

func void info_gorn_takeback_info()
{
	var int guild;
	AI_Output(hero,self,"Info_Gorn_TAKEBACK_15_01");	//��������� ���������? � ��������� ��� ������ �����?
	AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_02");	//������� ����� ������ ��� �� ����. ���� ������ ������� ������ ������������� � ���!
	AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_03");	//�� ����� �������� �� �� ������, ���������. �����, ��� ��� �������.
	AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_04");	//�� ������ ���� �������� ���� ���-���.
	guild = Npc_GetTrueGuild(hero);
	if(guild == GIL_SLD)
	{
		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_05");	//����������� �������� �� �������� ����, �� ���� ���� �� ������ ���������.
	}
	else if(guild == GIL_KDW)
	{
		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_06");	//���� ����� �������� �������� ��� ��������. �� �� ���� �� ���������� ����� ���� � � ���� ������� ���� ��������.
	}
	else if(guild == GIL_ORG)
	{
		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_07");	//�� �������� ���� �������� ��� ��������, ��� ��� �� ���� �� ������ ����� ������.
	}
	else
	{
		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_08");	//�� �� �� ������ ������, �� �� �������, ��� ������� ������ �������.
		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_09");	//�� ���������� ���� �������� ��� ��������.
	};
	AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_10");	//� ����� � �����. ������ �� ���������.
};


instance INFO_GORN_SECOND(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_second_condition;
	information = info_gorn_second_info;
	important = 0;
	permanent = 0;
	description = "������ �����, � ��� �����?";
};


func int info_gorn_second_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_post))
	{
		return TRUE;
	};
};

func void info_gorn_second_info()
{
	AI_Output(hero,self,"Info_Gorn_SECOND_15_01");	//������ �����, � ��� �����?
	AI_Output(self,hero,"Info_Gorn_SECOND_09_02");	//��� ������ �� �������� �����, �� ����� ������ ��� ������ � �����, ������� ��������������� ���� ������.
	AI_Output(self,hero,"Info_Gorn_SECOND_09_03");	//����� �� ��� ���������, �� ����� ������ �������������� ��������.
	AI_Output(hero,self,"Info_Gorn_SECOND_15_04");	//�������.  
};


instance INFO_GORN_WHYME(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_whyme_condition;
	information = info_gorn_whyme_info;
	important = 0;
	permanent = 0;
	description = "�� ������ ����� ����������� ������ �?";
};


func int info_gorn_whyme_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_takeback))
	{
		return TRUE;
	};
};

func void info_gorn_whyme_info()
{
	AI_Output(hero,self,"Info_Gorn_WHYME_15_01");	//�� ������ ����� ����������� ������ �?
	AI_Output(self,hero,"Info_Gorn_WHYME_09_02");	//�� ��� ����� ��� ��������� ��� ���� ��������� � ����������� �������.
	AI_Output(self,hero,"Info_Gorn_WHYME_09_03");	//����� ����, �� ����� ���� ������ ������ ������ � ��� ����������.
	AI_Output(self,hero,"Info_Gorn_WHYME_09_04");	//�����, ������ �� ������ ���������� � ���� ������������� ��������.
};


instance INFO_GORN_KICKBUTT(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_kickbutt_condition;
	information = info_gorn_kickbutt_info;
	important = 0;
	permanent = 0;
	description = "�����, ������, ������� ���� ����������� ������...";
};


func int info_gorn_kickbutt_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_whyme) && !Npc_KnowsInfo(hero,info_gorn_myway))
	{
		return TRUE;
	};
};

func void info_gorn_kickbutt_info()
{
	AI_Output(hero,self,"Info_Gorn_KICKBUTT_15_01");	//�����, ������, ������� ���� ����������� ������, ��� ������ �������� �� ����� �����!
	AI_Output(self,hero,"Info_Gorn_KICKBUTT_09_02");	//� ��� � �����, ��� �� �����������!
	AI_Output(self,hero,"Info_Gorn_KICKBUTT_09_03");	//���, ������ ���� ����. �� ��������� ����� � ���������� � ����� � �����.
	b_story_gornjoins();
};


instance INFO_GORN_MYWAY(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_myway_condition;
	information = info_gorn_myway_info;
	important = 0;
	permanent = 0;
	description = "������ �� � ���. ��� ��� ����� ����� ������� � �����!";
};


func int info_gorn_myway_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_whyme) && !Npc_KnowsInfo(hero,info_gorn_kickbutt))
	{
		return TRUE;
	};
};

func void info_gorn_myway_info()
{
	AI_Output(hero,self,"Info_Gorn_MYWAY_15_01");	//������ �� � ���. ��� ��� ����� ����� ������� � �����!
	AI_Output(self,hero,"Info_Gorn_MYWAY_09_02");	//� ��� � �����, ��� �� �����������!
	AI_Output(self,hero,"Info_Gorn_MYWAY_09_03");	//���, ������ ���� ����. �� ��������� ����� � ���������� � ����� � �����.
	b_story_gornjoins();
};


instance INFO_GORN_WOLF(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_wolf_condition;
	information = info_gorn_wolf_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_wolf_condition()
{
	if(GORN_JOINEDFORFM && (Npc_GetDistToWP(hero,"OW_PATH_076") < 500))
	{
		return TRUE;
	};
};

func void info_gorn_wolf_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_WOLF_09_01");	//��, ���� �� �����!
	AI_Output(self,hero,"Info_Gorn_WOLF_09_02");	//��� �� ����� ���� ����� ����������� � ����� ����� ���, ��� �� ������ � �����.
	Info_ClearChoices(info_gorn_wolf);
	Info_AddChoice(info_gorn_wolf,"�� ����� ���������. ��� ��������� ����� ������ ����.",info_gorn_wolf_fm);
	Info_AddChoice(info_gorn_wolf,"��� �, ����� �����, ��� �� �����.",info_gorn_wolf_wolf);
	b_logentry(CH4_ULUMULU,"����, ���� �� �����, ����� ���������� �� ����, ����� ��� ��� �� ��������� � �����. ��� ����� ��� �������.");
	GORN_GOTOWOLF = TRUE;
};

func void info_gorn_wolf_fm()
{
	AI_Output(hero,self,"Info_Gorn_WOLF_15_04");	//�� ����� ���������. ��� ��������� ����� ������ ����.
	AI_Output(self,hero,"Info_Gorn_WOLF_09_05");	//��� ������!
	AI_StopProcessInfos(self);
};

func void info_gorn_wolf_wolf()
{
	AI_Output(hero,self,"Info_Gorn_WOLF_15_06");	//��� �, ����� �����, ��� �� �����.
	AI_Output(self,hero,"Info_Gorn_WOLF_09_07");	//������. � ������� ���� �����.
	GORN_JOINEDFORFM = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"GuardNC");
	AI_StopProcessInfos(self);
};


instance INFO_GORN_LEAVEFORPOST(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_leaveforpost_condition;
	information = info_gorn_leaveforpost_info;
	important = 1;
	permanent = 1;
};


func int info_gorn_leaveforpost_condition()
{
	if(GORN_JOINEDFORFM && (Npc_GetDistToWP(hero,"OW_PATH_074") < 2000) && (FREEMINEORC_LOOKINGULUMULU != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void info_gorn_leaveforpost_info()
{
	AI_GotoNpc(self,hero);
	if(Npc_KnowsInfo(hero,info_gorn_wolf))
	{
		AI_Output(self,hero,"Info_Gorn_LEAVEFORPOST_09_01");	//��� �������, �� ������ ���������� � ������!
	}
	else
	{
		AI_Output(self,hero,"Info_Gorn_LEAVEFORPOST_09_02");	//���, ��� �� ����. ������ � �����.
	};
	AI_Output(self,hero,"Info_Gorn_LEAVEFORPOST_09_03");	//� ���� ����� ���� �����.
	GORN_JOINEDFORFM = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"GuardNC");
	AI_StopProcessInfos(self);
};


instance INFO_GORN_REJOINFORFM(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_rejoinforfm_condition;
	information = info_gorn_rejoinforfm_info;
	important = 0;
	permanent = 1;
	description = "������ � �����!";
};


func int info_gorn_rejoinforfm_condition()
{
	if((Npc_KnowsInfo(hero,info_gorn_myway) || Npc_KnowsInfo(hero,info_gorn_kickbutt)) && (Npc_GetDistToWP(hero,"OW_PATH_075_GUARD4") < 1000) && !GORN_JOINEDFORFM)
	{
		return TRUE;
	};
};

func void info_gorn_rejoinforfm_info()
{
	AI_Output(hero,self,"Info_Gorn_REJOINFORFM_15_01");	//������ � �����!
	AI_Output(self,hero,"Info_Gorn_REJOINFORFM_09_02");	//������ ����� ������������ � ����� �����������.
	AI_Output(self,hero,"Info_Gorn_REJOINFORFM_09_03");	//��� ������, � � ����� �� �����!
	GORN_JOINEDFORFM = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"FollowToFMC");
	AI_StopProcessInfos(self);
};


instance INFO_GORN_RAZOR(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_razor_condition;
	information = info_gorn_razor_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_razor_condition()
{
	if(GORN_JOINEDFORFM && (Npc_GetDistToWP(hero,"OW_PATH_3000") < 1000))
	{
		return TRUE;
	};
};

func void info_gorn_razor_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_RAZOR_09_01");	//���������.
	AI_Output(self,hero,"Info_Gorn_RAZOR_09_02");	//��� ���� �������� ������, ��� � ������, ������ ��� ������� �������.
	AI_Output(self,hero,"Info_Gorn_RAZOR_09_03");	//�� ������ ����� ��. �� �� ������, � �� �����, ����� �� ������ �������� �����.
	AI_StopProcessInfos(self);
};


instance INFO_GORN_FMCENTRANCE(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_fmcentrance_condition;
	information = info_gorn_fmcentrance_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_fmcentrance_condition()
{
	if(GORN_JOINEDFORFM && (Npc_GetDistToWP(hero,"FMC_ENTRANCE") < 1000))
	{
		return TRUE;
	};
};

func void info_gorn_fmcentrance_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_FMCENTRANCE_09_01");	//�������-��, ������ ��� ����?
	AI_Output(self,hero,"Info_Gorn_FMCENTRANCE_09_02");	//��� � ����� � �����, � � ���� ���� ����������. 
	AI_Output(self,hero,"Info_Gorn_FMCENTRANCE_09_03");	//����� �� ����������, � ����� �� �����.
	Npc_ExchangeRoutine(self,"WaitFMC");
	AI_StopProcessInfos(self);
};


instance INFO_GORN_FMGATE(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_fmgate_condition;
	information = info_gorn_fmgate_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_fmgate_condition()
{
	if(GORN_JOINEDFORFM && !FM_GATEOPEN && (Npc_GetDistToWP(hero,"FMC_FM_ENTRANCE") < 1000))
	{
		return TRUE;
	};
};

func void info_gorn_fmgate_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_FMGATE_09_01");	//� ������, ��� �� ���� ���-�� �����, � ������ �� ������.
	AI_Output(hero,self,"Info_Gorn_FMGATE_15_02");	//�, ��� ��� ���� ������ ��������... �� � ��� ��� �����������.
	AI_Output(self,hero,"Info_Gorn_FMGATE_09_03");	//������. �������� ������, � � �������� �� ���������.
	Npc_ExchangeRoutine(self,"WaitFM");
	AI_StopProcessInfos(self);
};


instance INFO_GORN_AFTERFM(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_afterfm_condition;
	information = info_gorn_afterfm_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_afterfm_condition()
{
	if(FREEMINEORC_LOOKINGULUMULU)
	{
		return TRUE;
	};
};

func void info_gorn_afterfm_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_AFTERFM_09_01");	//�, ������� ��� ������ ��� �����.
	AI_Output(self,hero,"Info_Gorn_AFTERFM_09_02");	//������� �� �� �������, ��� ���� ������ �������� ��� �����������.
	AI_Output(hero,self,"Info_Gorn_AFTERFM_15_03");	//�������, ��� �� ������ ���������� �� ��� ���� �����.
	AI_Output(self,hero,"Info_Gorn_AFTERFM_09_04");	//� �������� ����� � ���� ������� �� ���, ����� ����� ����� ���� �� ������.
	b_story_leftfm();
	LEE_FREEMINEREPORT = 1;
	AI_StopProcessInfos(self);
};


instance INFO_GORN_FMWATCH(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_fmwatch_condition;
	information = info_gorn_fmwatch_info;
	important = 0;
	permanent = 1;
	description = "��� ����?";
};


func int info_gorn_fmwatch_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_afterfm))
	{
		return TRUE;
	};
};

func void info_gorn_fmwatch_info()
{
	AI_Output(hero,self,"Info_Gorn_FMWATCH_15_01");	//��� ����?
	AI_Output(self,hero,"Info_Gorn_FMWATCH_09_02");	//������ ����, ������ � ��������� ����� �� �������� �����.
	AI_Output(self,hero,"Info_Gorn_FMWATCH_09_03");	//�� ���� �� �� ������� ������������, �� ��� ������ ��������� �������.
	AI_Output(self,hero,"Info_Gorn_FMWATCH_09_04");	//�� � � ���� ���������� ������������� ���������.
};


instance INFO_GORN_FOUNDULUMULU(C_INFO)
{
	npc = pc_fighter;
	condition = info_gorn_foundulumulu_condition;
	information = info_gorn_foundulumulu_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_foundulumulu_condition()
{
	if(FREEMINEORC_LOOKINGULUMULU == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void info_gorn_foundulumulu_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_FOUNDULUMULU_09_01");	//����� �������� � ���� ��������� �� ����. �������, �� ������� ����.
	AI_Output(self,hero,"Info_Gorn_FOUNDULUMULU_09_02");	//������� �� ���� �� � ��� �����, ��� ���� ������ �� ������ �����?
	AI_Output(hero,self,"Info_Gorn_FOUNDULUMULU_15_03");	//� ����� �� ��������� ������ ������. � ���� � ��� ����� � ����� �����.
	AI_Output(self,hero,"Info_Gorn_FOUNDULUMULU_09_04");	//����� �������, ��� ���� �� ������� ���, ��� ����� ����... �������!
	b_kapitelwechsel(5);
	AI_StopProcessInfos(self);
};

