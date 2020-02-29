
instance DIA_SNAF_EXIT(C_INFO)
{
	npc = vlk_581_snaf;
	nr = 999;
	condition = dia_snaf_exit_condition;
	information = dia_snaf_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_snaf_exit_condition()
{
	return 1;
};

func void dia_snaf_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SNAF_HELLO(C_INFO)
{
	npc = vlk_581_snaf;
	nr = 2;
	condition = dia_snaf_hello_condition;
	information = dia_snaf_hello_info;
	permanent = 0;
	description = "��� � ���� ����?";
};


func int dia_snaf_hello_condition()
{
	return 1;
};

func void dia_snaf_hello_info()
{
	AI_Output(other,self,"DIA_Snaf_Hello_15_00");	//��� � ���� ����?
	AI_Output(self,other,"DIA_Snaf_Hello_01_01");	//�������. ���� ������ ������ ��������, ������ � ���� ���� ������.
	AI_Output(self,other,"DIA_Snaf_Hello_01_02");	//������ ����������� ������� ���? ��� ������, � ��� �������, ��� ��� ������.
	b_printtrademsg1("������� ���.");
	AI_Output(other,self,"DIA_Snaf_Hello_15_03");	//�������.
	AI_Output(self,other,"DIA_Snaf_Hello_01_04");	//� �� ��� �� ��� ������.
	CreateInvItem(self,itforice);
	b_giveinvitems(self,other,itforice,1);
};

instance DIA_SNAF_ZUTATEN(C_INFO)
{
	npc = vlk_581_snaf;
	nr = 2;
	condition = dia_snaf_zutaten_condition;
	information = dia_snaf_zutaten_info;
	permanent = 0;
	description = "��� ���� �����?";
};


func int dia_snaf_zutaten_condition()
{
	if(Npc_KnowsInfo(hero,dia_snaf_hello))
	{
		return 1;
	};
};

func void dia_snaf_zutaten_info()
{
	AI_Output(other,self,"DIA_Snaf_Zutaten_15_00");	//��� ���� �����?
	AI_Output(self,other,"DIA_Snaf_Zutaten_01_01");	//�����, �� ������ ������ ������. � �������� ����� �����: ���� �� ������ ����� �-�� ���� � ����� � �������.
	AI_Output(self,other,"DIA_Snaf_Zutaten_01_02");	//� ��� ���� ������� ����, ������� ��������, �� ��� ��� ������������� ��� ����� ��� ���� � ������� ������. ���� ������ ���� ����������.
	AI_Output(self,other,"DIA_Snaf_WhereMushrooms_01_01");	//����� �� ������� ����� ����� ������ - ���, ��� ����������� �����, - �� ����� ������� ������, �� ������� ��� ������.
	Info_ClearChoices(dia_snaf_zutaten);
	Info_AddChoice(dia_snaf_zutaten,"�� ������ ���� ��������?",dia_snaf_zutaten_kotz);
	Info_AddChoice(dia_snaf_zutaten,"��� �������� ���� � ����.",dia_snaf_zutaten_doit);
};

func void dia_snaf_zutaten_kotz()
{
	AI_Output(other,self,"DIA_Snaf_Zutaten_KOTZ_15_00");	//�� ������ ���� ��������?
	AI_Output(self,other,"DIA_Snaf_Zutaten_KOTZ_01_01");	//���� �� ������ ����, �� ���. ����� �� ����������. �� ����� ����, �� ��� �� ����������? ���� ��������� ���, ��� ��� �����, �������.
	AI_Output(self,other,"DIA_Snaf_Zutaten_KOTZ_01_02");	//� ��� ������ ����-�� ������� �� �������, �� �� ��� � �� ��������. ��������, ���� � ����� ������.
	SNAF_ZUTATEN = LOG_RUNNING;
	Log_CreateTopic(CH1_SNAFSRECIPE,LOG_MISSION);
	Log_SetTopicStatus(CH1_SNAFSRECIPE,LOG_RUNNING);
	b_logentry(CH1_SNAFSRECIPE,"����� ���� �� ������� ������ �������� ���� ����� ��� ���� ���� ������ ����� � ���� ������ ������. �� ����� ����������� ����� �����.");
	Info_ClearChoices(dia_snaf_zutaten);
};

func void dia_snaf_zutaten_doit()
{
	AI_Output(other,self,"DIA_Snaf_Zutaten_DoIt_15_00");	//��� �������� ���� � ����.
	AI_Output(self,other,"DIA_Snaf_Zutaten_DoIt_01_01");	//����� ���������� ������� ��� ������ �����������.
	AI_Output(self,other,"DIA_Snaf_Zutaten_DoIt_01_02");	//���, ���� � � ��������� ��� ��������� �� ����, ��� � �� ��������. ��������, ���� � ����� ������.
	SNAF_ZUTATEN = LOG_RUNNING;
	SNAF_FREEMBRAGOUT = TRUE;
	Log_CreateTopic(CH1_SNAFSRECIPE,LOG_MISSION);
	Log_SetTopicStatus(CH1_SNAFSRECIPE,LOG_RUNNING);
	b_logentry(CH1_SNAFSRECIPE,"����� ���� �� ������� ������ �������� ���� ����� ��� ���� ���� ������ ����� � ���� ������ ������. �� ����� ����������� ����� �����. � ���� ����� ��� �����������.");
	Info_ClearChoices(dia_snaf_zutaten);
};


instance DIA_SNAF_ZUTATENSUCCESS(C_INFO)
{
	npc = vlk_581_snaf;
	nr = 2;
	condition = dia_snaf_zutatensuccess_condition;
	information = dia_snaf_zutatensuccess_info;
	permanent = 0;
	description = "� ������ ��� �����������, ��������.";
};


func int dia_snaf_zutatensuccess_condition()
{
	if((SNAF_ZUTATEN == LOG_RUNNING) && (Npc_HasItems(other,itfo_plants_mushroom_01) >= 5) && (Npc_HasItems(other,itat_meatbug_01) >= 3))
	{
		return 1;
	};
};

var int snaf_ragoutday;

func void dia_snaf_zutatensuccess_info()
{
	AI_Output(other,self,"DIA_Snaf_ZutatenSuccess_15_00");	//� ������ ��� �����������, ��������.
	b_printtrademsg1("������ ������ ����� � ���� �����.");
	Npc_RemoveInvItems(hero,itfo_plants_mushroom_01,5);
	Npc_RemoveInvItems(hero,itat_meatbug_01,3);
	if(Wld_IsTime(8,0,22,0) && Npc_GetDistToWP(self,"OCR_CAULDRON_2") < 230)
	{
		AI_Output(self,other,"DIA_Snaf_ZutatenSuccess_01_01");	//������! ������ �� ����� �������� � �����, � ���� ����� ������... ��� ���...
		AI_UseMob(self,"CAULDRON",1);
		AI_Wait(self,2);
		AI_UseMob(self,"CAULDRON",-1);
		AI_Output(self,other,"DIA_Snaf_Hello_01_02_01");	//��� ������, � ��� �������, ��� ��� ������.
		b_printtrademsg2("�������� ���� �� �����.");
		CreateInvItems(hero,itfomeatbugragout,1);
		SNAF_RAGOUTDAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Snaf_Hello_01_01");	//�������. ���� ������ ������ ��������, ������ � ���� ���� ������.
		SNAF_RAGOUTDAY = Wld_GetDay();
	};
	SNAF_ZUTATEN = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_SNAFSRECIPE,LOG_SUCCESS);
	b_logentry(CH1_SNAFSRECIPE,"���� ������� ������� ���, ��� � ������ ��� ����������� �����������.");
	if(SNAF_FREEMBRAGOUT == TRUE)
	{
		b_logentry(CH1_SNAFSRECIPE,"������ � ����� ������ ���� �������� � ���� ������ ���� �� ������ �����.");
	};
	b_givexp(100);
	AI_StopProcessInfos(self);
};

instance DIA_SNAF_AFTERSUCCESS(C_INFO)
{
	npc = vlk_581_snaf;
	nr = 2;
	condition = dia_snaf_aftersuccess_condition;
	information = dia_snaf_aftersuccess_info;
	permanent = 1;
	description = "�� �������, ��� � ���� ����� ������� ������, ������� ������...";
};


func int dia_snaf_aftersuccess_condition()
{
	if((SNAF_ZUTATEN == LOG_SUCCESS) && (SNAF_FREEMBRAGOUT == TRUE))
	{
		return 1;
	};
};

func void dia_snaf_aftersuccess_info()
{
	AI_Output(other,self,"DIA_Snaf_AfterSuccess_15_00");	//�� �������, ��� � ���� ����� ������� ������, ������� ������...
	if(SNAF_RAGOUTDAY != Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Snaf_AfterSuccess_01_01");	//��, ��� � ����. ���, ������ ��� ������.
		b_printtrademsg1("�������� 3 ������ ���� �� �����.");
		CreateInvItems(self,itfomeatbugragout,3);
		b_giveinvitems(self,other,itfomeatbugragout,3);
		SNAF_RAGOUTDAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Snaf_AfterSuccess_01_02");	//�������! �� ����������� ���� �����������. ������� ������.
	};
};


instance DIA_SNAF_WHEREMEATBUGS(C_INFO)
{
	npc = vlk_581_snaf;
	nr = 3;
	condition = dia_snaf_wheremeatbugs_condition;
	information = dia_snaf_wheremeatbugs_info;
	permanent = 0;
	description = "�� ������, ��� ����� �����?";
};


func int dia_snaf_wheremeatbugs_condition()
{
	if(SNAF_ZUTATEN == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_snaf_wheremeatbugs_info()
{
	AI_Output(other,self,"DIA_Snaf_WhereMeatbugs_15_00");	//�� ������, ��� ����� �����?
	AI_Output(self,other,"DIA_Snaf_WhereMeatbugs_01_01");	//���, ��� ����� ������. ����� ���� ������ ���� ��������� ����������� �����, ����� ����, ��� �� ���-������ �������.
	AI_Output(self,other,"DIA_Snaf_WhereMeatbugs_01_02");	//�� ������ ������ ��� ������� ������������, �� ��� ���������� �����������. �� ��� ���������� �������� ����.
	b_logentry(CH1_SNAFSRECIPE,"������ ����� ����� ����� � ����������� ����� � ���� �����.");
};


instance DIA_SNAF_WHERENEK(C_INFO)
{
	npc = vlk_581_snaf;
	nr = 5;
	condition = dia_snaf_wherenek_condition;
	information = dia_snaf_wherenek_info;
	permanent = 0;
	description = "� ��� ����� ����, ���� �� ������� �� ������� �� ����?";
};


func int dia_snaf_wherenek_condition()
{
	if(SNAF_ZUTATEN == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_snaf_wherenek_info()
{
	AI_Output(other,self,"DIA_Snaf_WhereNek_15_00");	//� ��� ����� ����, ���� �� ������� �� ������� �� ����?
	AI_Output(self,other,"DIA_Snaf_WhereNek_01_01");	//���. ��� ����� �� ����� ���������. �����, �� ��� ����� ���-������ � ����� ������.
	AI_Output(self,other,"DIA_Snaf_WhereNek_01_02");	//� ������� ��� �� �������, �� �� ��� � �� ��������...
	if((SLY_LOSTNEK != LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		Log_CreateTopic(CH1_LOSTNEK,LOG_MISSION);
		Log_SetTopicStatus(CH1_LOSTNEK,LOG_RUNNING);
		b_logentry(CH1_LOSTNEK,"����� ���� ������ ���� �� �������. ����� ����� �� ��� �� ���� �� �����.");
	};
};

