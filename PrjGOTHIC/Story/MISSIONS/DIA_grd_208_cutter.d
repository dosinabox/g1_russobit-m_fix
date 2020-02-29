
instance DIA_CUTTER_EXIT(C_INFO)
{
	npc = grd_208_cutter;
	nr = 999;
	condition = dia_cutter_exit_condition;
	information = dia_cutter_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_cutter_exit_condition()
{
	return 1;
};

func void dia_cutter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CUTTER_HELLO(C_INFO)
{
	npc = grd_208_cutter;
	nr = 1;
	condition = dia_cutter_hello_condition;
	information = dia_cutter_hello_info;
	permanent = 0;
	description = "��, ����� ������� �����.";
};


func int dia_cutter_hello_condition()
{
	if(!c_npcbelongstooldcamp(other))
	{
		return 1;
	};
};

func void dia_cutter_hello_info()
{
	AI_Output(other,self,"DIA_Cutter_Hello_15_00");	//��, ����� ������� �����.
	AI_Output(self,other,"DIA_Cutter_Hello_08_01");	//������ � ���� ����� �� �����. ��� ��?
	AI_Output(other,self,"DIA_Cutter_Hello_15_02");	//� ����� �������. ���� ������� ��������� ��� �����.
};


instance DIA_CUTTER_BURG(C_INFO)
{
	npc = grd_208_cutter;
	nr = 1;
	condition = dia_cutter_burg_condition;
	information = dia_cutter_burg_info;
	permanent = 10;
	description = "�� ������ ���������� ��� ���-������ � �����?";
};


func int dia_cutter_burg_condition()
{
	if(Npc_KnowsInfo(hero,dia_cutter_hello))
	{
		return 1;
	};
};

func void dia_cutter_burg_info()
{
	AI_Output(other,self,"DIA_Cutter_Burg_15_00");	//�� ������ ���������� ��� ���-������ � �����?
	AI_Output(self,other,"DIA_Cutter_Burg_08_01");	//����� �������� ��������� �� ��� ����� ������� � ��� ������. ������ ����� ������ �� ����� ������������ � ����.
	AI_Output(self,other,"DIA_Cutter_Burg_08_02");	//� ��� ����� �����, ��� ����� ����� ����� �������������� � ������.
	AI_Output(self,other,"DIA_Cutter_Burg_08_03");	//��� � �� �������, ����� ��� �� ������ � ����������� � �������� �� �����, �� ��� ����� ����������� ����� �����������.
	AI_Output(other,self,"DIA_Cutter_Burg_15_04");	//��� ��� ������ ���� ����������?
	AI_Output(self,other,"DIA_Cutter_Burg_08_05");	//��, �� ������ ��� �����. �� ������ ��������� ���� ����� �� ���������.
};


instance DIA_CUTTER_PERM(C_INFO)
{
	npc = grd_208_cutter;
	nr = 1;
	condition = dia_cutter_perm_condition;
	information = dia_cutter_perm_info;
	permanent = 1;
	description = "��� ������� ����� ����������?";
};


func int dia_cutter_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_cutter_burg))
	{
		return 1;
	};
};

func void dia_cutter_perm_info()
{
	AI_Output(other,self,"DIA_Cutter_PERM_15_00");	//��� ������� ����� ����������?
	AI_Output(self,other,"DIA_Cutter_PERM_08_01");	//�������� �������. ��� ������ ���������� � �������. � ���� ����� �� ���������.
	AI_Output(other,self,"DIA_Cutter_PERM_15_02");	//� ��� �����.
	AI_StopProcessInfos(self);
};


instance GRD_208_CUTTER_WELCOME(C_INFO)
{
	npc = grd_208_cutter;
	condition = grd_208_cutter_welcome_condition;
	information = grd_208_cutter_welcome_info;
	important = 1;
	permanent = 0;
};


func int grd_208_cutter_welcome_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void grd_208_cutter_welcome_info()
{
	AI_Output(self,other,"GRD_208_Cutter_WELCOME_Info_08_01");	//�� ������ ���������� �������. �����, ���� ���������� ���� ����������.
	AI_StopProcessInfos(self);
};

