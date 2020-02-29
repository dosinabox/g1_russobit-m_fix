
instance DIA_BAALKAGAN_EXIT(C_INFO)
{
	npc = nov_1332_baalkagan;
	nr = 999;
	condition = dia_baalkagan_exit_condition;
	information = dia_baalkagan_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_baalkagan_exit_condition()
{
	return 1;
};

func void dia_baalkagan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAALKAGAN_HELLO(C_INFO)
{
	npc = nov_1332_baalkagan;
	nr = 1;
	condition = dia_baalkagan_hello_condition;
	information = dia_baalkagan_hello_info;
	permanent = 0;
	description = "�� ������ �� ������ ���������?";
};


func int dia_baalkagan_hello_condition()
{
	if(!c_npcbelongstopsicamp(hero))
	{
		return 1;
	};
};

func void dia_baalkagan_hello_info()
{
	AI_Output(other,self,"DIA_BaalKagan_Hello_15_00");	//�� ������ �� ������ ���������?
	AI_Output(self,other,"DIA_BaalKagan_Hello_13_01");	//�� �������� ��� ������� ��������.
	AI_Output(self,other,"DIA_BaalKagan_Hello_13_02");	//���� ����� ���� �����. �� �������� � ����� ������!
};


instance DIA_BAALKAGAN_HELLO_2(C_INFO)
{
	npc = nov_1332_baalkagan;
	nr = 1;
	condition = dia_baalkagan_hello_2_condition;
	information = dia_baalkagan_hello_2_info;
	permanent = 0;
	description = "������!";
};


func int dia_baalkagan_hello_2_condition()
{
	if(c_npcbelongstopsicamp(hero) && !Npc_KnowsInfo(hero,dia_baalkagan_hello))
	{
		return 1;
	};
};

func void dia_baalkagan_hello_2_info()
{
	AI_Output(other,self,"DIA_Grd_217_First_15_00");	//������!
	AI_Output(other,self,"DIA_Raven_Who_15_00");	//��� ��?
	AI_Output(self,other,"DIA_BaalKagan_Hello_13_02");	//���� ����� ���� �����. �� �������� � ����� ������!
};


instance DIA_BAALKAGAN_WHYHERE(C_INFO)
{
	npc = nov_1332_baalkagan;
	nr = 1;
	condition = dia_baalkagan_whyhere_condition;
	information = dia_baalkagan_whyhere_info;
	permanent = 0;
	description = "� ��� �� ����� �������?";
};


func int dia_baalkagan_whyhere_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalkagan_hello))
	{
		return 1;
	};
};

func void dia_baalkagan_whyhere_info()
{
	AI_Output(other,self,"DIA_BaalKagan_WhyHere_15_00");	//� ��� �� ����� �������?
	AI_Output(self,other,"DIA_BaalKagan_WhyHere_13_01");	//���� �������� ���� ������������� ������ ������� ����� ��������.
	AI_Output(self,other,"DIA_BaalKagan_WhyHere_13_02");	//�� ��� ���� ������ �� ����� ����� � �������� ������������. ������� ������ � ������ ������ ��������.
	AI_Output(self,other,"DIA_BaalKagan_WhyHere_13_03");	//�� ���-�� ����� ��������� ������. ��� ������, ��� ����� ��������� ����� ������ �� �������.
	Log_CreateTopic(GE_TRADERNC,LOG_NOTE);
	b_logentry(GE_TRADERNC,"���� ����� ������� �������� ����� � ��������� �� ������ ������.");
};


instance DIA_BAALKAGAN_TRADE(C_INFO)
{
	npc = nov_1332_baalkagan;
	nr = 800;
	condition = dia_baalkagan_trade_condition;
	information = dia_baalkagan_trade_info;
	permanent = 1;
	description = "������ ��� ���� ������.";
	trade = 1;
};


func int dia_baalkagan_trade_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalkagan_whyhere))
	{
		return 1;
	};
};

func void dia_baalkagan_trade_info()
{
	AI_Output(other,self,"DIA_BaalKagan_TRADE_15_00");	//������ ��� ���� ������.
	AI_Output(self,other,"DIA_BaalKagan_TRADE_13_01");	//��� ���������!
};


instance DIA_BAALKAGAN_ORDERHELP(C_INFO)
{
	npc = nov_1332_baalkagan;
	nr = 2;
	condition = dia_baalkagan_orderhelp_condition;
	information = dia_baalkagan_orderhelp_info;
	permanent = 0;
	description = "������ �� �� �� ������� ���� ����-������ ���?";
};


func int dia_baalkagan_orderhelp_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalkagan_whyhere) && KAPITEL < 3)
	{
		return 1;
	};
};

func void dia_baalkagan_orderhelp_info()
{
	AI_Output(other,self,"DIA_BaalKagan_OrderHelp_15_00");	//������ �� �� �� ������� ���� ����-������ ���?
	AI_Output(self,other,"DIA_BaalKagan_OrderHelp_13_01");	//� ���� ���� ����� ��������. ���� ������. �� �� ������ ����� ��������� � ���� �� �����, ��� ��������� ���� ���� ��������.
	AI_Output(self,other,"DIA_BaalKagan_OrderHelp_13_02");	//��� ������ ���������� �����, ��� �������� �������. �� ���� ��� ������� ������.
	AI_Output(other,self,"DIA_BaalKagan_WannaHelp_15_04");	//�����, ������ � ���� ����� �� ��������� ���������� � ����.
	AI_Output(self,other,"DIA_BaalKagan_WannaHelp_13_05");	//���� ������ ����������� �� ����� ������. � ��� �������� ��������� ��� ������.
	if(LARES_GET400ORE == LOG_RUNNING)
	{
		Log_CreateTopic(CH1_DEALERJOB,LOG_MISSION);
		Log_SetTopicStatus(CH1_DEALERJOB,LOG_RUNNING);
		b_logentry(CH1_DEALERJOB,"���� ����� ��������, ��� ���� ������ ���� ���� ����� � ���� �� ����� � ����������.");
	};
};


instance DIA_BAALKAGAN_WANNAHELP(C_INFO)
{
	npc = nov_1332_baalkagan;
	nr = 3;
	condition = dia_baalkagan_wannahelp_condition;
	information = dia_baalkagan_wannahelp_info;
	permanent = 0;
	description = "� ���� ������ ���� ��������� ����� ��������.";
};


func int dia_baalkagan_wannahelp_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalkagan_whyhere))
	{
		return 1;
	};
};

func void dia_baalkagan_wannahelp_info()
{
	AI_Output(other,self,"DIA_BaalKagan_WannaHelp_15_00");	//� ���� ������ ���� ��������� ����� ��������.
	AI_Output(self,other,"DIA_BaalKagan_WannaHelp_13_01");	//� �� ���� �������� ��� ������ ���� ����������� ��������. ������ ������ �� ����� �������������� ���� ��������� ���.
	AI_Output(self,other,"DIA_BaalKagan_WannaHelp_13_02");	//�� � ���� ������ ����� ��� �����������.
	AI_Output(self,other,"DIA_BaalKagan_WannaHelp_13_03");	//� ���� ������ �� ��� ��� ����� � ���������. ���������� ��� ���� ���, ��� ����� ��������� �� ��� ��� � ���. ����� �� ���� ���������.
};


instance DIA_BAALKAGAN_WASDRIN(C_INFO)
{
	npc = nov_1332_baalkagan;
	nr = 3;
	condition = dia_baalkagan_wasdrin_condition;
	information = dia_baalkagan_wasdrin_info;
	permanent = 0;
	description = "� ��� � ������, ���� ������ ���� ��������?";
};


func int dia_baalkagan_wasdrin_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalkagan_wannahelp))
	{
		return 1;
	};
};

func void dia_baalkagan_wasdrin_info()
{
	AI_Output(other,self,"DIA_BaalKagan_WasDrin_15_00");	//� ��� � ������, ���� ������ ���� ��������?
	AI_Output(self,other,"DIA_BaalKagan_WasDrin_13_01");	//� ����� ����� ��������� ����.
	AI_Output(self,other,"DIA_BaalKagan_WasDrin_13_02");	//�� ������ ����� � ���� ������, �������� ������ ����� �������.
	if((Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2))
	{
		AI_Output(self,other,"DIA_BaalKagan_WasDrin_13_03");	//��� � ���� ������ ���� �������� � ���� ��������, ���� �� ����� ���������. � ���� ������� ��������� � ��� ������� � ������ ������, ������� �������� �� ����� �����������.
		AI_Output(self,other,"DIA_BaalKagan_WasDrin_13_04");	//������� �������������� � �� �������.
	};
	AI_Output(self,other,"DIA_BaalKagan_WasDrin_13_05");	//���� ��� ��� ���� �� �� �����, �� ������ ������� ����. ����� � ������� ���� 100 ������ �� ���� ��������.
};


var int baalkagan_verteilkraut;

instance DIA_BAALKAGAN_GIMMEKRAUT(C_INFO)
{
	npc = nov_1332_baalkagan;
	nr = 3;
	condition = dia_baalkagan_gimmekraut_condition;
	information = dia_baalkagan_gimmekraut_info;
	permanent = 0;
	description = "������. ����� ��������. ���� ��� ����� �������?";
};


func int dia_baalkagan_gimmekraut_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalkagan_wasdrin))
	{
		return 1;
	};
};

func void dia_baalkagan_gimmekraut_info()
{
	AI_Output(other,self,"DIA_BaalKagan_GimmeKraut_15_00");	//������. ����� ��������. ���� ��� ����� �������?
	b_printtrademsg1("�������� 10 '��������'.");
	AI_Output(self,other,"DIA_BaalKagan_GimmeKraut_13_01");	//�����, ���� ����� ������� ����� ���, ��� ������� � ���� ��������. �� ������ �� ��� ����� �������� ������ ���� ��������, �� ������.
	AI_Output(self,other,"DIA_BaalKagan_GimmeKraut_13_02");	//� ���: ���� ���-�� ������� � ���� ���� �������� ��� �� ��� ��� �����������, �� ������ �������, ��� �� �� � ��� �� ��������������.
	AI_Output(other,self,"DIA_BaalKagan_GimmeKraut_15_03");	//�������.
	BAALKAGAN_VERTEILKRAUT = LOG_RUNNING;
	Log_CreateTopic(CH1_SPREADJOINTS,LOG_MISSION);
	Log_SetTopicStatus(CH1_SPREADJOINTS,LOG_RUNNING);
	b_logentry(CH1_SPREADJOINTS,"��������� ���� ����� ��� ��� ������ ������ ���������, ����� � ������ ��� ����� � ������.");
	CreateInvItems(self,itmijoint_1,10);
	b_giveinvitems(self,hero,itmijoint_1,10);
};


instance DIA_BAALKAGAN_SUCCESS(C_INFO)
{
	npc = nov_1332_baalkagan;
	nr = 3;
	condition = dia_baalkagan_success_condition;
	information = dia_baalkagan_success_info;
	permanent = 1;
	description = "� ������ ���� ��������.";
};


func int dia_baalkagan_success_condition()
{
	if(BAALKAGAN_VERTEILKRAUT == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_baalkagan_success_info()
{
	AI_Output(other,self,"DIA_BaalKagan_SUCCESS_15_00");	//� ������ ���� ��������.
	if(NC_JOINTS_VERTEILT >= 8)
	{
		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_13_01");	//� ���� ��� �������� ����� ����������, �� ������ ��������� �� ����� �������.
		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_13_02");	//��� � ���� ������������� ����?
		Info_ClearChoices(dia_baalkagan_success);
		Info_AddChoice(dia_baalkagan_success,"��� ��� ��� ������ ����.",dia_baalkagan_success_erz);
		if((Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2))
		{
			Info_AddChoice(dia_baalkagan_success,"������ ��� �������������� � ��������.",dia_baalkagan_success_join);
		};
		Info_AddChoice(dia_baalkagan_success,"�� ������� ���-�� � ���������� �������. �������� � ���.",dia_baalkagan_success_whatspells);
		BAALKAGAN_VERTEILKRAUT = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_SPREADJOINTS,LOG_SUCCESS);
		b_logentry(CH1_SPREADJOINTS,"� ����� ������ ��������� ����� ����������, � � ������� ���� �������.");
		b_givexp(XP_DISTRIBUTEDWEEDFORKAGAN);
	}
	else
	{
		AI_Output(self,other,"DIA_BaalKagan_NO_SUCCESS_13_00");	//� ��� �� ����� ����� �����������. �������, �� ������ �� ���.
	};
};

func void dia_baalkagan_success_whatspells()
{
	AI_Output(other,self,"DIA_BaalKagan_SUCCESS_WhatSpells_15_00");	//�� ������� ���-�� � ���������� �������. �������� � ��� �����������.
	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_WhatSpells_13_01");	//����� �����, ����, ���������, ��������� � ���. �� ������ ������� ��� ������.
	Info_AddChoice(dia_baalkagan_success,"� ������ ���������� ������.",dia_baalkagan_success_takescrolls);
};

func void dia_baalkagan_success_join()
{
	Info_ClearChoices(dia_baalkagan_success);
	AI_Output(other,self,"DIA_BaalKagan_SUCCESS_Join_15_00");	//������ ��� �������������� � ��������.
	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_Join_13_01");	//���� ���������� ���������. � ������ ����, ������ ��. ���� ���� �������� ����� �� ������� ���� ������ ��������.
	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_Join_13_02");	//������� ������� �������� ��� ����� ����������. �� �� ����� ��� ��������� ������ ����������.
	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_Join_13_03");	//������ �� �������� �����, ��� �������, � ������� �� ������������� �� � ���, ����� ����� ��������.
	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_Join_13_04");	//���� �� �������� ��� ��� ����, �� ������� ��� ���� ����������.
	b_printtrademsg1("������� ���������� '��� �����'.");
	CreateInvItem(self,specialjoint);
	b_giveinvitems(self,other,specialjoint,1);
	Log_CreateTopic(CH1_JOINPSI,LOG_MISSION);
	Log_SetTopicStatus(CH1_JOINPSI,LOG_RUNNING);
	b_logentry(CH1_JOINPSI,"���� ����� ��� ��� ��� ����� ����� ���������� '��� �����'. ��� ������� ��� �������� � �������� �������.");
};

func void dia_baalkagan_success_erz()
{
	AI_Output(other,self,"DIA_BaalKagan_SUCCESS_Erz_15_00");	//��� ��� ��� ������ ����.
	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_Erz_13_01");	//�� ������ �����. ����.
	b_printtrademsg1("�������� ����: 100");
	CreateInvItems(self,itminugget,100);
	b_giveinvitems(self,other,itminugget,100);
	Info_ClearChoices(dia_baalkagan_success);
};

func void dia_baalkagan_success_takescrolls()
{
	AI_Output(other,self,"DIA_BaalKagan_SUCCESS_TakeScrolls_15_00");	//� ������ ���������� ������.
	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_TakeScrolls_13_01");	//�� ������ ������� �������. ������� ��� ������.
	Info_ClearChoices(dia_baalkagan_success);
	Info_AddChoice(dia_baalkagan_success,"����� �����",dia_baalkagan_success_takescrolls_windfaust);
	Info_AddChoice(dia_baalkagan_success,"���������",dia_baalkagan_success_takescrolls_telekinese);
	Info_AddChoice(dia_baalkagan_success,"���������",dia_baalkagan_success_takescrolls_pyrokinese);
	Info_AddChoice(dia_baalkagan_success,"���",dia_baalkagan_success_takescrolls_schlaf);
	Info_AddChoice(dia_baalkagan_success,"����",dia_baalkagan_success_takescrolls_charme);
};


var int baalkagan_drei;

func void dia_baalkagan_success_takescrolls_windfaust()
{
	b_printtrademsg1("������� ������ ������ �����.");
	CreateInvItem(self,itarscrollwindfist);
	b_giveinvitems(self,hero,itarscrollwindfist,1);
	BAALKAGAN_DREI = BAALKAGAN_DREI + 1;
	if(BAALKAGAN_DREI >= 3)
	{
		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00");	//�� ���� ��� ������. ��������� �� � ����.
		Info_ClearChoices(dia_baalkagan_success);
	};
};

func void dia_baalkagan_success_takescrolls_telekinese()
{
	b_printtrademsg1("������� ������ ����������.");
	CreateInvItem(self,itarscrolltelekinesis);
	b_giveinvitems(self,hero,itarscrolltelekinesis,1);
	BAALKAGAN_DREI = BAALKAGAN_DREI + 1;
	if(BAALKAGAN_DREI >= 3)
	{
		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00");	//�� ���� ��� ������. ��������� �� � ����.
		Info_ClearChoices(dia_baalkagan_success);
	};
};

func void dia_baalkagan_success_takescrolls_pyrokinese()
{
	b_printtrademsg1("������� ������ ����������.");
	CreateInvItem(self,itarscrollpyrokinesis);
	b_giveinvitems(self,hero,itarscrollpyrokinesis,1);
	BAALKAGAN_DREI = BAALKAGAN_DREI + 1;
	if(BAALKAGAN_DREI >= 3)
	{
		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00");	//�� ���� ��� ������. ��������� �� � ����.
		Info_ClearChoices(dia_baalkagan_success);
	};
};

func void dia_baalkagan_success_takescrolls_schlaf()
{
	b_printtrademsg1("������� ������ ���.");
	CreateInvItem(self,itarscrollsleep);
	b_giveinvitems(self,hero,itarscrollsleep,1);
	BAALKAGAN_DREI = BAALKAGAN_DREI + 1;
	if(BAALKAGAN_DREI >= 3)
	{
		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00");	//�� ���� ��� ������. ��������� �� � ����.
		Info_ClearChoices(dia_baalkagan_success);
	};
};

func void dia_baalkagan_success_takescrolls_charme()
{
	b_printtrademsg1("������� ������ ���.");
	CreateInvItem(self,itarscrollcharm);
	b_giveinvitems(self,hero,itarscrollcharm,1);
	BAALKAGAN_DREI = BAALKAGAN_DREI + 1;
	if(BAALKAGAN_DREI >= 3)
	{
		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00");	//�� ���� ��� ������. ��������� �� � ����.
		Info_ClearChoices(dia_baalkagan_success);
	};
};

