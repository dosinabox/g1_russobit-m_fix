
instance ORG_843_SHARKY_EXIT(C_INFO)
{
	npc = org_843_sharky;
	nr = 999;
	condition = org_843_sharky_exit_condition;
	information = org_843_sharky_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int org_843_sharky_exit_condition()
{
	return 1;
};

func void org_843_sharky_exit_info()
{
	AI_StopProcessInfos(self);
};


instance ORG_843_SHARKY_FISK(C_INFO)
{
	npc = org_843_sharky;
	nr = 2;
	condition = org_843_sharky_fisk_condition;
	information = org_843_sharky_fisk_info;
	permanent = 0;
	description = "����� �� ������� ������ ����� ��������.";
};


func int org_843_sharky_fisk_condition()
{
	if(FISK_GETNEWHEHLER == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void org_843_sharky_fisk_info()
{
	AI_Output(other,self,"Org_843_Sharky_Fisk_Info_15_00");	//����� �� ������� ������ ����� ��������.
	AI_Output(self,other,"Org_843_Sharky_Fisk_Info_10_01");	//� ����� �� ������������� ��� ���?
	AI_Output(other,self,"Org_843_Sharky_Fisk_Info_15_02");	//� �������, ��� �� �������� ���������� ������� ����.
	AI_Output(self,other,"Org_843_Sharky_Fisk_Info_10_03");	//��, ������ �� � ���...����� �����, ��� �� ����� ������������ �� ����.
	b_logentry(CH1_FISKNEWDEALER,"����� ���������� �������� � ������.");
};


instance ORG_843_SHARKY_TRADE(C_INFO)
{
	npc = org_843_sharky;
	condition = org_843_sharky_trade_condition;
	information = org_843_sharky_trade_info;
	important = 0;
	permanent = 1;
	description = "��� �� �� �������� ���� �����...";
	trade = 1;
};


func int org_843_sharky_trade_condition()
{
	if(Npc_KnowsInfo(hero,org_843_sharky_greet))
	{
		return TRUE;
	};
};

func void org_843_sharky_trade_info()
{
	AI_Output(other,self,"Org_843_Sharky_TRADE_Info_15_01");	//��� �� �� �������� ���� �����...
};


instance ORG_843_SHARKY_GREET(C_INFO)
{
	npc = org_843_sharky;
	condition = org_843_sharky_greet_condition;
	information = org_843_sharky_greet_info;
	important = 0;
	permanent = 0;
	description = "��, ��� ����?";
};


func int org_843_sharky_greet_condition()
{
	return TRUE;
};

func void org_843_sharky_greet_info()
{
	AI_Output(other,self,"Org_843_Sharky_GREET_Info_15_01");	//��, ��� ����?
	AI_Output(self,other,"Org_843_Sharky_GREET_Info_10_02");	//������ ���-������ ������?
	Log_CreateTopic(GE_TRADERNC,LOG_NOTE);
	b_logentry(GE_TRADERNC,"��� ����� ������� ������ � ������ ������. ��� ����� ����� � ����� ������.");
};

