
instance DIA_GILBERT_EXIT(C_INFO)
{
	npc = non_1500_gilbert;
	nr = 999;
	condition = dia_gilbert_exit_condition;
	information = dia_gilbert_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_gilbert_exit_condition()
{
	return 1;
};

func void dia_gilbert_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GILBERT_FIRST(C_INFO)
{
	npc = non_1500_gilbert;
	nr = 1;
	condition = dia_gilbert_first_condition;
	information = dia_gilbert_first_info;
	permanent = 0;
	important = 1;
};


func int dia_gilbert_first_condition()
{
	if(Npc_GetDistToNpc(self,other) <= ZIVILANQUATSCHDIST)
	{
		return 1;
	};
};

func void dia_gilbert_first_info()
{
	AI_Output(self,other,"DIA_Gilbert_First_04_00");	//��� �� ����� �������? ����� ��� ������� �� ��� ����, ��-��!
	AI_Output(self,other,"DIA_Gilbert_First_04_01");	//���� ������� ����� ��� �������, ��� �� ������ ��� ����.
	b_givexp(XP_GILBERTFOUND);
};


instance DIA_GILBERT_HALLO(C_INFO)
{
	npc = non_1500_gilbert;
	nr = 1;
	condition = dia_gilbert_hallo_condition;
	information = dia_gilbert_hallo_info;
	permanent = 1;
	description = "��� �� ����� �������?";
};


func int dia_gilbert_hallo_condition()
{
	return 1;
};

func void dia_gilbert_hallo_info()
{
	AI_Output(other,self,"DIA_Gilbert_Hallo_15_00");	//��� �� ����� �������?
	AI_Output(self,other,"DIA_Gilbert_Hallo_04_01");	//������ ������ ��� ����� ������. � ��� ������ ����������� � ������ ������. ��� ����� ��� ��� ��������...
	AI_Output(self,other,"DIA_Gilbert_Hallo_04_02");	//������ ��� ���, ��������, ����� � �� ������. �� � ��� ����� �������� �����. � ������ ������ ����� ������� ����� ��������.
};

