
instance DIA_JEREMIAH_EXIT(C_INFO)
{
	npc = bau_912_jeremiah;
	nr = 999;
	condition = dia_jeremiah_exit_condition;
	information = dia_jeremiah_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_jeremiah_exit_condition()
{
	return 1;
};

func void dia_jeremiah_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JEREMIAH_HALLO(C_INFO)
{
	npc = bau_912_jeremiah;
	nr = 1;
	condition = dia_jeremiah_hallo_condition;
	information = dia_jeremiah_hallo_info;
	permanent = 0;
	description = "��� �� �������?";
};


func int dia_jeremiah_hallo_condition()
{
	return 1;
};

func void dia_jeremiah_hallo_info()
{
	AI_Output(other,self,"DIA_Jeremiah_Hallo_15_00");	//��� �� �������?
	AI_Output(self,other,"DIA_Jeremiah_Hallo_04_01");	//� ������� ����� �� ����.
	AI_Output(self,other,"DIA_Jeremiah_Hallo_04_02");	//���, ������ �������. ������ �� ������ �� ���� ������.
	CreateInvItems(self,itfobooze,1);
	b_giveinvitems(self,other,itfobooze,1);
};


var int jeremiah_bauer;

instance DIA_JEREMIAH_PERM(C_INFO)
{
	npc = bau_912_jeremiah;
	nr = 1;
	condition = dia_jeremiah_perm_condition;
	information = dia_jeremiah_perm_info;
	permanent = 1;
	description = "� ��� ���� �������������?";
};


func int dia_jeremiah_perm_condition()
{
	return 1;
};

func void dia_jeremiah_perm_info()
{
	AI_Output(other,self,"DIA_Jeremiah_PERM_15_00");	//� ��� ���� �������������?
	AI_Output(self,other,"DIA_Jeremiah_PERM_04_01");	//� �� ������� �������� ������� ������, ������� ���� ��� ��� ����. � ���� ��� ����� �����, ������ ���.
	AI_Output(self,other,"DIA_Jeremiah_PERM_04_02");	//�� � ��� ������. ���� � ����� �������, ����������� ����� ��� �� ������.
	JEREMIAH_BAUER = TRUE;
};


instance DIA_JEREMIAH_HORATIO(C_INFO)
{
	npc = bau_912_jeremiah;
	nr = 2;
	condition = dia_jeremiah_horatio_condition;
	information = dia_jeremiah_horatio_info;
	permanent = 0;
	description = "��� �� ������ � �����?";
};


func int dia_jeremiah_horatio_condition()
{
	if(JEREMIAH_BAUER == TRUE)
	{
		return 1;
	};
};

func void dia_jeremiah_horatio_info()
{
	AI_Output(other,self,"DIA_Jeremiah_Horatio_15_00");	//��� �� ������ � �����?
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_01");	//�� ����� ������� ��� �� ����, ���� � ����. ��� ����������� ���������� ����� ������ � ���������� �� �������� �� ������� �����.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_02");	//������������, ��� ��� �� ���������� � ���, ��� �������. �� �� ����� ��������� �� �������.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_03");	//� ������, ��� �� �������, ��� ��� �� � ������������� ���������� �� �����. �� �� ����� ������� �� �������.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_04");	//��� ������ ��� ���������.
};

