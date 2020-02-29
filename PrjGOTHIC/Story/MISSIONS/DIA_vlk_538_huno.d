
instance DIA_HUNO_EXIT(C_INFO)
{
	npc = vlk_538_huno;
	nr = 999;
	condition = dia_huno_exit_condition;
	information = dia_huno_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_huno_exit_condition()
{
	return 1;
};

func void dia_huno_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HUNO_YOUKNOWYOURJOB(C_INFO)
{
	npc = vlk_538_huno;
	nr = 2;
	condition = dia_huno_youknowyourjob_condition;
	information = dia_huno_youknowyourjob_info;
	permanent = 0;
	important = 0;
	description = "� � ���� ������� ����������, ��� � ����.";
};


func int dia_huno_youknowyourjob_condition()
{
	return TRUE;
};

func void dia_huno_youknowyourjob_info()
{
	AI_Output(other,self,"DIA_Huno_YouKnowYourJob_15_00");	//� � ���� ������� ����������, ��� � ����.
	AI_Output(self,other,"DIA_Huno_YouKnowYourJob_09_01");	//�� ��, ����������� � ��� �� ��������.
	AI_Output(self,other,"DIA_Huno_YouKnowYourJob_09_02");	//�� ���� ������� � ��������, �� �� ����. ����� ����� �� ����� ���������� ��� ������, � ������ ������� ���� ���� ������ �.
};


instance DIA_HUNO_HOWLONG(C_INFO)
{
	npc = vlk_538_huno;
	nr = 2;
	condition = dia_huno_howlong_condition;
	information = dia_huno_howlong_info;
	permanent = 0;
	important = 0;
	description = "����� ������� ������ �� ���� ���?";
};


func int dia_huno_howlong_condition()
{
	if(Npc_KnowsInfo(hero,dia_huno_youknowyourjob))
	{
		return TRUE;
	};
};

func void dia_huno_howlong_info()
{
	AI_Output(other,self,"DIA_Huno_HowLong_15_00");	//����� ������� ������ �� ���� ���?
	AI_Output(self,other,"DIA_Huno_HowLong_09_01");	//��� ������� �� ����. ������� ��� � ���� �������� ����� ������. �� � ������ �������� �� �������.
	AI_Output(self,other,"DIA_Huno_HowLong_09_02");	//����, �������, ��� ������ ����� �������� ��������.
	AI_Output(self,other,"DIA_Huno_HowLong_09_03");	//� ��� �����, ��� �������, ���������� ����� ������ ����.
	AI_Output(other,self,"DIA_Huno_HowLong_15_04");	//������? ������ ������� ����?
	AI_Output(self,other,"DIA_Huno_HowLong_09_05");	//�� ���, ��� ��� ��������. �� ��������� ��� �� �������� ��� 150 ������ ����.
	AI_Output(self,other,"DIA_Huno_HowLong_09_06");	//��� ������� �� ������� ���, � � ����������� � ������� ������� ��������, � ��� ����� ��������.
	AI_Output(self,other,"DIA_Huno_HowLong_09_07");	//��, ��� �������, �� ���� �� ��������!
};


instance DIA_HUNO_HOWSYOURBUSINESS(C_INFO)
{
	npc = vlk_538_huno;
	nr = 2;
	condition = dia_huno_howsyourbusiness_condition;
	information = dia_huno_howsyourbusiness_info;
	permanent = 1;
	important = 0;
	description = "��, ������, ��� ����?";
};


func int dia_huno_howsyourbusiness_condition()
{
	if(Npc_KnowsInfo(hero,dia_huno_youknowyourjob))
	{
		return TRUE;
	};
};

func void dia_huno_howsyourbusiness_info()
{
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_00");	//��, ������, ��� ����?
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_01");	//� ����� �� ������ ��� �����?
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_02");	//����� ����, � ������ ���� ���-������.
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_03");	//������? � ��� �� ���?
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_04");	//� ��� �� �����.
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_05");	//������� �� ���, ����� ���� ������������� ���-������ �����������, � �� ������� ���� �� ��������.
};


var int huno_learnsmith;

instance DIA_HUNO_LEARNSMITH(C_INFO)
{
	npc = vlk_538_huno;
	nr = 2;
	condition = dia_huno_learnsmith_condition;
	information = dia_huno_learnsmith_info;
	permanent = 1;
	important = 0;
	description = "� ����� �� ����������� ���������� � ���� � �������.";
};


func int dia_huno_learnsmith_condition()
{
	if(Npc_KnowsInfo(hero,dia_huno_youknowyourjob))
	{
		return TRUE;
	};
};

func void dia_huno_learnsmith_info()
{
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_00");	//� ����� �� ����������� ���������� � ���� � �������.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_01");	//���, ���... ������ � ������� ���� � ���� ��� ����� �� ��������� �������� ������� ������!
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_02");	//��� ��� ����� ������?
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_03");	//��� �, ������ ��������� � ������� �� ��� �����.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_04");	//����������� �������� ��������� ������ �� ���������� � ��������� ���. 
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_05");	//����� �� ����� �����, ��� ����� ��������, ������� � ����� � �����.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_06");	//����� ����������� ������ ����� ����� �������� �� ��������� �����.
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_07");	//� ��� �����.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_08");	//�� ��� ���������� � ���� ������ �� ������. ���� ������, ������ ������ �� � ����. 
	HUNO_LEARNSMITH = TRUE;
};


instance DIA_HUNO_BUYSMITH(C_INFO)
{
	npc = vlk_538_huno;
	nr = 2;
	condition = dia_huno_buysmith_condition;
	information = dia_huno_buysmith_info;
	permanent = 1;
	important = 0;
	description = "� ���� ������ � ���� ���������.";
	trade = 1;
};


func int dia_huno_buysmith_condition()
{
	if(HUNO_LEARNSMITH == TRUE)
	{
		return TRUE;
	};
};

func void dia_huno_buysmith_info()
{
	AI_Output(other,self,"DIA_Huno_BUYSMITH_15_00");	//� ���� ������ � ���� ���������.
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

