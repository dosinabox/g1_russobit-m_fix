
instance DIA_DARRION_EXIT(C_INFO)
{
	npc = nov_1312_darrion;
	nr = 999;
	condition = dia_darrion_exit_condition;
	information = dia_darrion_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_darrion_exit_condition()
{
	return 1;
};

func void dia_darrion_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DARRION_HELLO(C_INFO)
{
	npc = nov_1312_darrion;
	nr = 1;
	condition = dia_darrion_hello_condition;
	information = dia_darrion_hello_info;
	permanent = 0;
	description = "������! � ����� ������� � ����� �� ������������ � �������.";
};


func int dia_darrion_hello_condition()
{
	return 1;
};

func void dia_darrion_hello_info()
{
	AI_Output(other,self,"DIA_Darrion_Hello_15_00");	//������! � ����� ������� � ����� �� ������������ � �������.
	AI_Output(self,other,"DIA_Darrion_Hello_11_01");	//�� ������ �� ������ ����, ���� �����. ������ ��������� � �����, � � ��� �� �� ��� ��� �������.
	AI_Output(self,other,"DIA_Darrion_Hello_11_02");	//� �� ���� ����������� ���� �������. �� ����� ���, ���� �� ������ ������ � ���� ���-������.
	Log_CreateTopic(GE_TRADERPSI,LOG_NOTE);
	b_logentry(GE_TRADERPSI,"��������� ������� ������� ������. ������� ����� ������� �� �������� � �������.");
};


instance DIA_DARRION_TRADE(C_INFO)
{
	npc = nov_1312_darrion;
	nr = 800;
	condition = dia_darrion_trade_condition;
	information = dia_darrion_trade_info;
	permanent = 1;
	description = "������ ��� ���� ������.";
	trade = 1;
};


func int dia_darrion_trade_condition()
{
	if(Npc_KnowsInfo(hero,dia_darrion_hello))
	{
		return TRUE;
	};
};

func void dia_darrion_trade_info()
{
	AI_Output(other,self,"DIA_Darrion_Trade_15_00");	//������ ��� ���� ������.
	AI_Output(self,other,"DIA_Darrion_Trade_11_01");	//� ����� ���� ���� ��������. ��� ���, ��� � ������.
	if(Npc_HasItems(self,itmiswordraw) < 5)
	{
		CreateInvItems(self,itmiswordraw,5);
	};
	if(Npc_HasItems(self,itmiswordrawhot) < 5)
	{
		CreateInvItems(self,itmiswordrawhot,5);
	};
	if(Npc_HasItems(self,itmiswordbladehot) < 5)
	{
		CreateInvItems(self,itmiswordbladehot,5);
	};
	if(Npc_HasItems(self,itmiswordblade) < 5)
	{
		CreateInvItems(self,itmiswordblade,5);
	};
};

