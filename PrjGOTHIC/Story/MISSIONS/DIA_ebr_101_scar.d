
instance DIA_SCAR_EXIT(C_INFO)
{
	npc = ebr_101_scar;
	nr = 999;
	condition = dia_scar_exit_condition;
	information = dia_scar_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_scar_exit_condition()
{
	return 1;
};

func void dia_scar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SCAR_HELLO(C_INFO)
{
	npc = ebr_101_scar;
	nr = 3;
	condition = dia_scar_hello_condition;
	information = dia_scar_hello_info;
	permanent = 0;
	description = "�� ���?";
};


func int dia_scar_hello_condition()
{
	return 1;
};

func void dia_scar_hello_info()
{
	AI_Output(other,self,"DIA_SCAR_Hello_15_00");	//�� ���?
	AI_Output(self,other,"DIA_SCAR_Hello_08_01");	//��� �������� ���� ����.
};


instance DIA_SCAR_WHAT(C_INFO)
{
	npc = ebr_101_scar;
	nr = 3;
	condition = dia_scar_what_condition;
	information = dia_scar_what_info;
	permanent = 0;
	description = "� ��� �� �����������?";
};


func int dia_scar_what_condition()
{
	if(Npc_KnowsInfo(hero,dia_scar_hello))
	{
		return 1;
	};
};

func void dia_scar_what_info()
{
	AI_Output(other,self,"DIA_SCAR_What_15_00");	//� ��� �� �����������?
	AI_Output(self,other,"DIA_SCAR_What_08_01");	//� � ��� �������� ���� ������ �� ���, ����� � ������ �� �������� ����������� �����.
	AI_Output(self,other,"DIA_SCAR_What_08_02");	//��� �� ��������� � ���, ����� ����� �� �������� � �������� ������� ������.
};


instance DIA_SCAR_FRAU(C_INFO)
{
	npc = ebr_101_scar;
	nr = 3;
	condition = dia_scar_frau_condition;
	information = dia_scar_frau_info;
	permanent = 0;
	description = "����� ���� ���������� ����, � ����� �������.";
};


func int dia_scar_frau_condition()
{
	if(Npc_KnowsInfo(hero,dia_scar_what))
	{
		return 1;
	};
};

func void dia_scar_frau_info()
{
	AI_Output(other,self,"DIA_SCAR_Frau_15_00");	//����� ���� ���������� ����, � ����� ������� �� ��������� � �������.
	AI_Output(self,other,"DIA_SCAR_Frau_08_01");	//�� � ���?
	AI_Output(other,self,"DIA_SCAR_Frau_15_02");	//��� �����?
	AI_Output(self,other,"DIA_SCAR_Frau_08_03");	//���� ��� ���� �����������, ��� ���� �����: ������ � ���.
	AI_Output(self,other,"DIA_SCAR_Frau_08_04");	//��� ������ ��� ����� ���������, ����� ����� �� � ���� ������� � ����� ���.
	AI_Output(self,other,"DIA_SCAR_Frau_08_05");	//����� ��� ��� �������, �� �������� �� ����. �� ���� ��� ����������� ���, ��� ��� ����� ��������� � ��� ����������.
};


instance DIA_SCAR_PERM(C_INFO)
{
	npc = ebr_101_scar;
	nr = 3;
	condition = dia_scar_perm_condition;
	information = dia_scar_perm_info;
	permanent = 1;
	description = "��� �� ������ � ������?";
};


func int dia_scar_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_scar_frau))
	{
		return 1;
	};
};

func void dia_scar_perm_info()
{
	AI_Output(other,self,"DIA_SCAR_PERM_15_00");	//��� �� ������ � ������?
	AI_Output(self,other,"DIA_SCAR_PERM_08_01");	//� ���� ������� ���� ������ ��, ��� �� ���� �� ����� ����������� ����� �������.
	AI_Output(self,other,"DIA_SCAR_PERM_08_02");	//�� ����� �������� ���, ��� �����, �� ������������, ��� ��� ������������� ����� - ��� ������.
};

