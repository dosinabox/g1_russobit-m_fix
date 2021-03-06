
instance DIA_RAVEN_EXIT(C_INFO)
{
	npc = ebr_105_raven;
	nr = 999;
	condition = dia_raven_exit_condition;
	information = dia_raven_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_raven_exit_condition()
{
	return 1;
};

func void dia_raven_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RAVEN_FIRSTIN(C_INFO)
{
	npc = ebr_105_raven;
	nr = 1;
	condition = dia_raven_firstin_condition;
	information = dia_raven_firstin_info;
	permanent = 0;
	important = 1;
};


func int dia_raven_firstin_condition()
{
	var C_NPC wache218;
	wache218 = Hlp_GetNpc(grd_218_gardist);
	if(wache218.aivar[AIV_PASSGATE] == TRUE)
	{
		return 1;
	};
};

func void dia_raven_firstin_info()
{
	AI_Output(self,other,"DIA_Raven_FirstIn_10_00");	//� ���� ���-������ ������� ��� ����?
};


instance DIA_RAVEN_WHO(C_INFO)
{
	npc = ebr_105_raven;
	nr = 1;
	condition = dia_raven_who_condition;
	information = dia_raven_who_info;
	permanent = 0;
	description = "��� ��?";
};


func int dia_raven_who_condition()
{
	return 1;
};

func void dia_raven_who_info()
{
	AI_Output(other,self,"DIA_Raven_Who_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Raven_Who_10_01");	//� �����, ������ �������� ������. ���, ��� ����� ����������� � ���, ������� ������� �� ����.
};


instance DIA_RAVEN_KRAUTBOTE(C_INFO)
{
	npc = ebr_105_raven;
	nr = 1;
	condition = dia_raven_krautbote_condition;
	information = dia_raven_krautbote_info;
	permanent = 0;
	description = "� �� ��� ������. � ���� ���� ������� ��������� ��� ������.";
};


func int dia_raven_krautbote_condition()
{
	if(KALOM_KRAUTBOTE == LOG_RUNNING && KALOM_DELIVEREDWEED == FALSE)
	{
		return 1;
	};
};

func void dia_raven_krautbote_info()
{
	AI_Output(other,self,"DIA_Raven_Krautbote_15_00");	//� �� ��� ������. � ���� ���� ������� ��������� ��� ������.
	AI_Output(self,other,"DIA_Raven_Krautbote_10_01");	//�������� �� ���� � �������. ����� �� ������������� � ����������.
	AI_Output(self,other,"DIA_Raven_Krautbote_10_02");	//������� �� ������� � �������� ������ �� ����� ��� �� ����� � ������� �����.
	AI_Output(self,other,"DIA_Raven_Krautbote_10_03");	//����� ��, ������� ��, ����. � ����� ���� � ��� ����� ��� �� ����������.
	b_logentry(CH1_KRAUTBOTE,"�������� ��� ������ � ������ ������ �������. �� ��������� � ���� �������.");
};


instance DIA_RAVEN_AUFNAHME(C_INFO)
{
	npc = ebr_105_raven;
	nr = 1;
	condition = dia_raven_aufnahme_condition;
	information = dia_raven_aufnahme_info;
	permanent = 0;
	description = "� ���� ������ ������. ����� ������, ��� � ���� ����� ���������.";
};


func int dia_raven_aufnahme_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_readyforgomez) && (Npc_GetTrueGuild(other) == GIL_NONE))
	{
		return 1;
	};
};

func void dia_raven_aufnahme_info()
{
	AI_Output(other,self,"DIA_Raven_Aufnahme_15_00");	//� ���� ������ ������. ����� ������, ��� ���� ����� ����� � ��������.
	AI_Output(self,other,"DIA_Raven_Aufnahme_10_01");	//�������� ���� ��� ������ �����. � �� ���� ����� ����������, ��� ���� ������� �����. �����, �� ��� ���������.
	AI_Output(self,other,"DIA_Raven_Aufnahme_10_02");	//� ������ ���� � ������. ��� �� ����. ������ ������ �� ������!
	Npc_ExchangeRoutine(self,"GUIDE");
	AI_StopProcessInfos(self);
};


instance DIA_RAVEN_THERE(C_INFO)
{
	npc = ebr_105_raven;
	nr = 1;
	condition = dia_raven_there_condition;
	information = dia_raven_there_info;
	permanent = 0;
	important = 1;
};


func int dia_raven_there_condition()
{
	if(Npc_KnowsInfo(hero,dia_raven_aufnahme) && Hlp_StrCmp(Npc_GetNearestWP(self),"OCC_BARONS_GREATHALL_CENTER_MOVEMENT"))
	{
		return 1;
	};
};

func void dia_raven_there_info()
{
	AI_Output(self,other,"DIA_Raven_There_10_01");	//��� ��� ����� �����. ���� �� �������� �������� ���, � ����� ����� ���� ������� �������, ����?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PRESTART");
};


instance DIA_RAVEN_PERM(C_INFO)
{
	npc = ebr_105_raven;
	nr = 8;
	condition = dia_raven_perm_condition;
	information = dia_raven_perm_info;
	permanent = 1;
	description = "��� ���� ������ ����?";
};


func int dia_raven_perm_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_readyforgomez))
	{
		return 1;
	};
};

func void dia_raven_perm_info()
{
	AI_Output(other,self,"DIA_Raven_PERM_15_00");	//��� ���� ������ ����?
	AI_Output(self,other,"DIA_Raven_PERM_10_01");	//�������� �� ������ ����� ����������� �� �����. ��������� ���� �� �������� ���� ��� �������� �������.
};


instance DIA_RAVEN_BINDABEI(C_INFO)
{
	npc = ebr_105_raven;
	nr = 8;
	condition = dia_raven_bindabei_condition;
	information = dia_raven_bindabei_info;
	permanent = 0;
	description = "����� ������, ��� ������ � ������� �� ���.";
};


func int dia_raven_bindabei_condition()
{
	if(Npc_KnowsInfo(hero,dia_gomez_dabei))
	{
		return 1;
	};
};

func void dia_raven_bindabei_info()
{
	AI_Output(other,self,"DIA_Raven_BinDabei_15_00");	//����� ������, ��� ������ � ������� �� ���.
	AI_Output(self,other,"DIA_Raven_BinDabei_10_01");	//������. � ���� ��� ��� ���� ��� ���� ���� �������.
	AI_Output(self,other,"DIA_Raven_BinDabei_10_02");	//���� � ���� ������������� ������� �����, � ���� � ��� �� ��������� ������� �������.
	b_printtrademsg1("�������� ������ ��������.");
	CreateInvItem(self,stt_armor_m);
	b_giveinvitems(self,hero,stt_armor_m,1);
//	AI_EquipArmor(hero,stt_armor_m);
};

instance DIA_RAVEN_SPYSECT(C_INFO)
{
	npc = ebr_105_raven;
	nr = 1;
	condition = dia_raven_spysect_condition;
	information = dia_raven_spysect_info;
	permanent = 0;
	description = "��� � ������ �������?";
};


func int dia_raven_spysect_condition()
{
	if(Npc_KnowsInfo(hero,dia_raven_bindabei))
	{
		return 1;
	};
};

func void dia_raven_spysect_info()
{
	AI_Output(other,self,"DIA_Raven_SpySect_15_00");	//��� � ������ �������?
	AI_Output(self,other,"DIA_Raven_SpySect_10_01");	//�� ����� �������� � ���������. ���, �������, �� ������, ��� �� �������� ���� �������� ������.
	AI_Output(self,other,"DIA_Raven_SpySect_10_02");	//����� � �� ������.
	AI_Output(self,other,"DIA_Raven_SpySect_10_03");	//����� �� ������ ���, ����� �� ����, ��� ��� ����������. ��������� ���, ��� ������� � ��������. ��� ����� ��� �����������.
	AI_Output(self,other,"DIA_Raven_SpySect_10_04");	//� ��� ������ �� �������, ��� �����. �� ������ ����������� ���������. �����, �� ���������, ��� � ���� � ����?
	AI_Output(other,self,"DIA_Raven_SpySect_15_05");	//���� �������, � ���������� �� ��������� � ����.
	AI_Output(self,other,"DIA_Raven_SpySect_10_06");	//� ����, ��� �� ������� ���� ���������.
	RAVEN_SPYSECT = LOG_RUNNING;
	Log_CreateTopic(CH1_GOTOPSI,LOG_MISSION);
	Log_SetTopicStatus(CH1_GOTOPSI,LOG_RUNNING);
	b_logentry(CH1_GOTOPSI,"����� ������ ���� � ������ �� �������. � ������ ���������, ��� ������� ����. ����� ����, � ����� ����� ���-�� �������� ��� �������.");
};


instance DIA_RAVEN_EQUIPMENT(C_INFO)
{
	npc = ebr_105_raven;
	nr = 1;
	condition = dia_raven_equipment_condition;
	information = dia_raven_equipment_info;
	permanent = 0;
	description = "��� ����� ����� ����� ������� ����������?";
};


func int dia_raven_equipment_condition()
{
	if(RAVEN_SPYSECT == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_raven_equipment_info()
{
	AI_Output(other,self,"DIA_Raven_Equipment_15_00");	//��� ����� ����� ����� ������� ����������?
	AI_Output(self,other,"DIA_Raven_Equipment_10_01");	//��� � �����. �� ���� ���� ���� �� ��������. �� ����� ������� ���� ��������������� ������ � ������� �� ������.
	AI_Output(self,other,"DIA_Raven_Equipment_10_02");	//� ��� �� ������� ������ �� ����� ������. ����� �� ����� ���� �������������.
	AI_Output(self,other,"DIA_Raven_Equipment_10_03");	//� ���� ���� ����� ������, �������� �� ������. �� ������� ��� � ������� ����� �� ���������� ����� �����, ����� �� �����.
	Log_CreateTopic(GE_TRADEROC,LOG_NOTE);
	b_logentry(GE_TRADEROC,"� ����� ����� ����� ������� ������� ��� ���������. ���� �� ����� � ����� � �����.");
	if(!Npc_KnowsInfo(hero,dia_skip_first))
	{
		b_logentry(GE_TRADEROC,"�������� ���� �� ����� ����� ������� ������. �� ������ ����� ������.");
	};
};


instance DIA_RAVEN_SPYBERICHT(C_INFO)
{
	npc = ebr_105_raven;
	nr = 1;
	condition = dia_raven_spybericht_condition;
	information = dia_raven_spybericht_info;
	permanent = 1;
	description = "� �������, ��� ��� ����� �������� � ����� �������.";
};


func int dia_raven_spybericht_condition()
{
	if(RAVEN_SPYSECT == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_raven_spybericht_info()
{
	AI_Output(other,self,"DIA_Raven_SpyBericht_15_00");	//� �������, ��� ��� ����� �������� � ����� �������.
	AI_Output(self,other,"DIA_Raven_SpyBericht_10_01");	//������. ��� ����� ����� ���, ��� ���������� ������.
	if((Npc_HasItems(other,itat_crawlerqueen) >= 1) || (CORKALOM_BRINGMCQBALLS == LOG_SUCCESS))
	{
		if(KAPITEL >= 3)
		{
			AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_04");	//��� ������� ������� ���������.
		}
		else
		{
			AI_Output(other,self,"DIA_Raven_SpyBericht_15_02");	//�� ����� ���� ��������, ����� �������� ������ �����. � ��� ������� ��� ����� �������� ���� ���� � ������� �������. � ����� ���� � �������� ��������.
			AI_Output(self,other,"DIA_Raven_SpyBericht_10_03");	//���������. �������� �� ������, ��������� �� ��� ���. ������ ���� � ����.
		};
		AI_Output(self,other,"DIA_Raven_SpyBericht_10_04");	//�� ������ ���������.
		Npc_ExchangeRoutine(self,"START");
		RAVEN_SPYSECT = LOG_SUCCESS;
		b_givexp(XP_REPORTTORAVEN);
		Log_SetTopicStatus(CH1_GOTOPSI,LOG_SUCCESS);
		b_logentry(CH1_GOTOPSI,"����� ������������ ���� �� ������! ������ ������, � ���� ��������� ���� ������� � �������������. ������ � ���� ����������� ������ �� ������ ����������.");
	}
	else
	{
		AI_Output(other,self,"DIA_Raven_SpyBericht_15_05");	//� ��� �� ����, ��� ��� ��� ���������� ������.
		AI_Output(self,other,"DIA_Raven_SpyBericht_10_06");	//��� ����� �� �� ���� ����������?
	};
};

instance DIA_RAVEN_QUENTIN(C_INFO)
{
	npc = ebr_105_raven;
	nr = 1;
	condition = dia_raven_quentin_condition;
	information = dia_raven_quentin_info;
	permanent = 0;
	description = "� ���� ���� ��� ���� ��� �����-������ �������?";
};


func int dia_raven_quentin_condition()
{
	if(RAVEN_SPYSECT == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_raven_quentin_info()
{
	AI_Output(other,self,"Mis_1_Psi_Kalom_DrugMonopol_15_00");	//� ���� ���� ��� ���� ��� �����-������ �������?
	AI_Output(self,other,"DIA_Quentin_Raven_01");	//����. ������� ��������� ����� ���������. ������, ��� ����� �������� ���� ������ ��������.
	AI_Output(self,other,"DIA_Quentin_Raven_02");	//�� ������� ��������� � ������� � ������ ���� �������� �����������. ��������� ���� �� ������ ������ ������������� � ����.
	AI_Output(self,other,"DIA_Quentin_Raven_03");	//����� �� ������� � ��������� � ���� ���������. ��������!
	QUENTIN_GANG_QUEST_STARTED = LOG_RUNNING;
	Log_CreateTopic(QUENTIN_GANG,LOG_MISSION);
	Log_SetTopicStatus(QUENTIN_GANG,LOG_RUNNING);
	b_logentry(QUENTIN_GANG,"����� ��� ��� ����� �������: ����� ������ �������� �������� � ����������� � ����. ������ ���������� ������, ��� ������...");
	AI_StopProcessInfos(self);
};

instance DIA_RAVEN_QUENTIN_DONE(C_INFO)
{
	npc = ebr_105_raven;
	nr = 1;
	condition = dia_raven_quentin_done_condition;
	information = dia_raven_quentin_done_info;
	permanent = 0;
	description = "� ��������� ���������!";
};


func int dia_raven_quentin_done_condition()
{
	if(Npc_IsDead(org_858_quentin) && Npc_KnowsInfo(hero,dia_raven_quentin))
	{
		return 1;
	};
};

func void dia_raven_quentin_done_info()
{
	AI_Output(other,self,"DIA_Quentin_Raven_04");	//� ��������� ���������!
	AI_Output(other,self,"DIA_Quentin_Raven_05");	//�� ����� ��������� ������������� ���� � ����� �������� �� ����� ������.
	AI_Output(other,self,"DIA_Quentin_Raven_06");	//��� ������� ������� ������ ���� �����, � ���������� ����� ��� ������������ ��� ����� ��� ������.
	AI_Output(self,other,"DIA_Quentin_Raven_07");	//���������... � �������� ���� ����� �����. ������ ��� ���� ����!
	if(Npc_KnowsInfo(hero,dia_vlk595_quentin_done))
	{
		AI_Output(self,other,"DIA_Quentin_Raven_08");	//� ��� � ������ ����������?
		AI_Output(other,self,"DIA_Quentin_Raven_09");	//��������� � ������.
		b_clearimmortal(vlk_595_buddler);
		b_clearimmortal(vlk_596_buddler);
		b_clearimmortal(vlk_597_buddler);
	};
	AI_Output(self,other,"DIA_Quentin_Raven_10");	//����� ����� � ������ ��������!
	AI_Output(self,other,"DIA_Quentin_Raven_11");	//�� ���, ������, ������... � ������� ��� ��� ������� ���.
	AI_Output(self,other,"DIA_Quentin_Raven_12");	//� �� ������ ������� ������ ������� ������ � ������. ������, ��� ��������.
	b_printtrademsg1("�������� ����: 500");
	CAN_BUY_GRD_ARMOR_H = TRUE;
	b_givexp(1000);
	b_giveinvitems(self,other,itminugget,500);
	QUENTIN_GANG_QUEST_STARTED = LOG_SUCCESS;
	Log_SetTopicStatus(QUENTIN_GANG,LOG_SUCCESS);
	b_logentry(QUENTIN_GANG,"������� ���������, ����� ������������ ���� �����. ��, ������, ����� �� ������ � ���� ��������.");
	b_clearquentincamp();
	AI_StopProcessInfos(self);
};

