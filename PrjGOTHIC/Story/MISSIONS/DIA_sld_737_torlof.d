
instance DIA_TORLOF_EXIT(C_INFO)
{
	npc = sld_737_torlof;
	nr = 999;
	condition = dia_torlof_exit_condition;
	information = dia_torlof_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_torlof_exit_condition()
{
	return 1;
};

func void dia_torlof_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_HALLO(C_INFO)
{
	npc = sld_737_torlof;
	nr = 1;
	condition = dia_torlof_hallo_condition;
	information = dia_torlof_hallo_info;
	permanent = 0;
	description = "��� �� �����?";
};


func int dia_torlof_hallo_condition()
{
	return 1;
};

func void dia_torlof_hallo_info()
{
	AI_Output(other,self,"DIA_Torlof_Hallo_15_00");	//��� �� �����?
	AI_Output(self,other,"DIA_Torlof_Hallo_04_01");	//������.
	AI_Output(self,other,"DIA_Torlof_Hallo_04_02");	//� ��� ����� �� ������� ������������� ������ �� ����� �� ������� ��������.
	AI_Output(self,other,"DIA_Torlof_Hallo_04_03");	//�� ������ ����� ��������. ������� ����� ������� ���� �� ������� ��������.
	AI_Output(self,other,"DIA_Torlof_Hallo_04_04");	//��� ������� � � ����� ����.
};


instance DIA_TORLOF_MITMACHEN(C_INFO)
{
	npc = sld_737_torlof;
	nr = 2;
	condition = dia_torlof_mitmachen_condition;
	information = dia_torlof_mitmachen_info;
	permanent = 1;
	description = "� ���� ����� ����� �� ���.";
};


func int dia_torlof_mitmachen_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_NONE) || (Npc_GetTrueGuild(hero) == GIL_ORG))
	{
		return 1;
	};
};

func void dia_torlof_mitmachen_info()
{
	AI_Output(other,self,"DIA_Torlof_Mitmachen_15_00");	//� ���� ����� ����� �� ���.
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_01");	//�� �� ������� � ���� ���������� ����. ������� �� ������ ��������, �� ��� �� ��������.
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_02");	//� �� ����� ���� �������� ����� ���� � ������ � ��� ������.
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_03");	//���� ������, ���������� ����� ������: ������ ���-������ ������ �� ������� ������ ��� �� ������ �����.
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_04");	//���� ���� �� ����� ����� ������, ��� �� ���� ������ ������, ���� ����� ������ � ��� ������.
	AI_Output(other,self,"DIA_Torlof_Mitmachen_15_05");	//� ��� ��� ������� ���-�� ������?
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_06");	//������� ���������� ����� � ��� � �������, � ����� �� �������� ������� �� ��������!
};

