
instance DIA_SKIP_EXIT(C_INFO)
{
	npc = grd_211_skip;
	nr = 999;
	condition = dia_skip_exit_condition;
	information = dia_skip_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_skip_exit_condition()
{
	return 1;
};

func void dia_skip_exit_info()
{
	AI_StopProcessInfos(self);
};


var int skip_tradefree;

instance DIA_SKIP_FIRST(C_INFO)
{
	npc = grd_211_skip;
	nr = 1;
	condition = dia_skip_first_condition;
	information = dia_skip_first_info;
	permanent = 0;
	description = "��� �� �������?";
};


func int dia_skip_first_condition()
{
	if(!(Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_KDF))
	{
		return 1;
	};
};

func void dia_skip_first_info()
{
	AI_Output(other,self,"DIA_Skip_First_15_00");	//��� �� �������?
	AI_Output(self,other,"DIA_Skip_First_12_01");	//��� ������ - ��� ������ ��� ����������.
	AI_Output(other,self,"DIA_Skip_First_15_02");	//�� �������� ������?
	AI_Output(self,other,"DIA_Skip_First_12_03");	//��, ������ � ��� �����.
	if(!Npc_KnowsInfo(hero,dia_raven_equipment))
	{
		Log_CreateTopic(GE_TRADEROC,LOG_NOTE);
		b_logentry(GE_TRADEROC,"�������� ���� �� ���������� ����� ����� ������� ������. �� ������ ��� ����� ������ ���� ������.");
	};
	Info_ClearChoices(dia_skip_first);
	Info_AddChoice(dia_skip_first,"�������. �� �������!",dia_skip_first_back);
	Info_AddChoice(dia_skip_first,"����� ������, ��� �� ������� ��������� ��� ������.",dia_skip_first_thorus);
	Info_AddChoice(dia_skip_first,"����� ������� ���� � ����. � ������ ��������� ���� ����������.",dia_skip_first_gomez);
};

func void dia_skip_first_gomez()
{
	AI_Output(other,self,"DIA_Skip_First_Gomez_15_00");	//����� ������� ���� � ����. � ������ ��������� ���� ����������.
	AI_Output(self,other,"DIA_Skip_First_Gomez_12_01");	//��� ������, ��? ����� ������� � ������ ������ �� ����, ��� � ���� ����.
	AI_Output(self,other,"DIA_Skip_First_Gomez_12_02");	//�������� ������, ���� � �� ����������!
	Info_ClearChoices(dia_skip_first);
	AI_StopProcessInfos(self);
};

func void dia_skip_first_thorus()
{
	AI_Output(other,self,"DIA_Skip_First_Thorus_15_00");	//����� �������� ���� � ����. ������, ��� �� ������� ��������� ��� ������.
	AI_Output(self,other,"DIA_Skip_First_Thorus_12_01");	//���� ���?
	Info_ClearChoices(dia_skip_first);
	Info_AddChoice(dia_skip_first,"� �� ��� � ���� ������.",dia_skip_first_thorus_askhim);
	Info_AddChoice(dia_skip_first,"�� ������, ��� ���� �� �� ������ ��� ������, � ���� � ���� ��� ��������.",dia_skip_first_thorus_kickass);
	Info_AddChoice(dia_skip_first,"� ������ ��������� ���� ��� �������...",dia_skip_first_thorus_stranger);
};

func void dia_skip_first_back()
{
	AI_Output(other,self,"DIA_Skip_First_BACK_15_00");	//�������. �� �������!
	Info_ClearChoices(dia_skip_first);
	AI_StopProcessInfos(self);
};

func void dia_skip_first_thorus_stranger()
{
	AI_Output(other,self,"DIA_Skip_First_Thorus_Stranger_15_00");	//� ������ ��������� ���� ��� �������. ����� �� ��� �� ������ ��� �������.
	AI_Output(self,other,"DIA_Skip_First_Thorus_Stranger_12_01");	//��? � �� ������ ����� ����� ��������� ���� �� ���, �����?
	Info_ClearChoices(dia_skip_first);
	Info_AddChoice(dia_skip_first,"� �� ��� � ���� ������.",dia_skip_first_thorus_askhim);
	Info_AddChoice(dia_skip_first,"�� ����� ������ ���� �������, ���� �� �� ������ ��� ������.",dia_skip_first_thorus_kickassagain);
};

func void dia_skip_first_thorus_kickass()
{
	AI_Output(other,self,"DIA_Skip_First_Thorus_KickAss_15_00");	//�� ����� ������ ���� ����� ������� �� ��� ���, ���� �� �� ������ ��� ������.
	AI_Output(self,other,"DIA_Skip_First_Thorus_KickAss_12_01");	//� ����� ����? ��� �������, ���� �� �� ��������� ������ ���������� ������, �� � ���� ������ ���� �������.
	Info_ClearChoices(dia_skip_first);
	AI_StopProcessInfos(self);
};

func void dia_skip_first_thorus_askhim()
{
	AI_Output(other,self,"DIA_Skip_First_Thorus_AskHim_15_00");	//� �� ��� � ���� ������.
	AI_Output(self,other,"DIA_Skip_First_Thorus_AskHim_12_01");	//������ ��� � � ������, ������ �������. ������, ��� �� ������� �������� ���, ��� �� ������� � ���.
	if(Npc_GetTrueGuild(other) == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Skip_First_Thorus_AskHim_12_02");	//�� ����, ��� ���� �������, �� �� ����� ����� � �� �������� ������� ������!
	};
	Info_ClearChoices(dia_skip_first);
	AI_StopProcessInfos(self);
};

func void dia_skip_first_thorus_kickassagain()
{
	AI_Output(other,self,"DIA_Skip_First_Thorus_KickAssAGAIN_15_00");	//�� ������, ��� ���� �� �� ������ ��� ������, � ���� � ���� ��� ��������.
	AI_Output(self,other,"DIA_Skip_First_Thorus_KickAssAGAIN_12_01");	//������, ��������. ��� ���� �����?
	Info_ClearChoices(dia_skip_first);
	SKIP_TRADEFREE = TRUE;
};


instance DIA_SKIP_VERPATZT(C_INFO)
{
	npc = grd_211_skip;
	nr = 1;
	condition = dia_skip_verpatzt_condition;
	information = dia_skip_verpatzt_info;
	permanent = 1;
	description = "� �������, ��� ������� ���� ���������� � ����� � ����������.";
};


func int dia_skip_verpatzt_condition()
{
	if(!((Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_KDF)) && (Npc_KnowsInfo(hero,dia_skip_first) && (SKIP_TRADEFREE == FALSE)))
	{
		return 1;
	};
};

func void dia_skip_verpatzt_info()
{
	AI_Output(other,self,"DIA_Skip_VERPATZT_15_00");	//� ������ �������, ��� ������� ���� �� ���������� � ����� � ����������.
	AI_Output(self,other,"DIA_Skip_VERPATZT_12_01");	//�������� ������!
};


instance GRD_211_SKIP_TRADE(C_INFO)
{
	npc = grd_211_skip;
	condition = grd_211_skip_trade_condition;
	information = grd_211_skip_trade_info;
	permanent = 1;
	description = "� �������, ��� ������� ���� ���������� � ����� � ����������.";
	trade = 1;
};


func int grd_211_skip_trade_condition()
{
	if((Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_KDF) || (SKIP_TRADEFREE == TRUE))
	{
		return TRUE;
	};
};

func void grd_211_skip_trade_info()
{
	AI_Output(other,self,"GRD_211_Skip_TRADE_Info_15_01");	//� ������ �������, ��� ������� ���� �� ���������� � ����� � ����������.
	AI_Output(self,other,"GRD_211_Skip_TRADE_Info_12_02");	//���� ����, ���� ���-��� �������.
};


instance GRD_211_SKIP_WELCOME(C_INFO)
{
	npc = grd_211_skip;
	condition = grd_211_skip_welcome_condition;
	information = grd_211_skip_welcome_info;
	important = 1;
	permanent = 0;
};


func int grd_211_skip_welcome_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void grd_211_skip_welcome_info()
{
	AI_Output(self,other,"GRD_211_Skip_WELCOME_Info_12_01");	//��, �� �� ����� ��� ��������� ��� �������.
};

