
instance DIA_SILAS_EXIT(C_INFO)
{
	npc = org_841_silas;
	nr = 999;
	condition = dia_silas_exit_condition;
	information = dia_silas_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_silas_exit_condition()
{
	return 1;
};

func void dia_silas_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SILAS_HEHLER(C_INFO)
{
	npc = org_841_silas;
	nr = 1;
	condition = dia_silas_hehler_condition;
	information = dia_silas_hehler_info;
	permanent = 0;
	description = "��� ������?";
};


func int dia_silas_hehler_condition()
{
	return 1;
};

func void dia_silas_hehler_info()
{
	AI_Output(other,self,"DIA_Silas_Hehler_15_00");	//��� ������?
	AI_Output(self,other,"DIA_Silas_Hehler_06_01");	//�������! �� ������� ����� ������� ����� � �������� ������ ����.
	AI_Output(self,other,"DIA_Silas_Hehler_06_02");	//��� ���������� ����. �� � �� ��� ����� ��� ������� ����, ����� �������?
	Log_CreateTopic(GE_TRADERNC,LOG_NOTE);
	b_logentry(GE_TRADERNC,"����� ������� ��� � ������� � ���� �� �����.");
};


instance DIA_SILAS_TRADE(C_INFO)
{
	npc = org_841_silas;
	nr = 1;
	condition = dia_silas_trade_condition;
	information = dia_silas_trade_info;
	permanent = 1;
	description = "� ���� ������.";
	trade = 1;
};


func int dia_silas_trade_condition()
{
	return 1;
};

func void dia_silas_trade_info()
{
	AI_Output(other,self,"DIA_Silas_Trade_15_00");	//� ���� ������.
	AI_Output(self,other,"DIA_Silas_Trade_06_01");	//������� � ��� �� ��������.
};

