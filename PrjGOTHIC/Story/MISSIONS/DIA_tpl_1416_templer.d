
instance DIA_TPL_1416_TORWACHE_EXIT(C_INFO)
{
	npc = tpl_1416_templer;
	nr = 999;
	condition = dia_tpl_1416_torwache_exit_condition;
	information = dia_tpl_1416_torwache_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_tpl_1416_torwache_exit_condition()
{
	return 1;
};

func void dia_tpl_1416_torwache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TPL_1416_TORWACHE_LIFE(C_INFO)
{
	npc = tpl_1416_templer;
	nr = 1;
	condition = dia_tpl_1416_torwache_life_condition;
	information = dia_tpl_1416_torwache_life_info;
	permanent = 1;
	description = "��� ����� ������� ������� ��������?";
};


func int dia_tpl_1416_torwache_life_condition()
{
	return 1;
};

func void dia_tpl_1416_torwache_life_info()
{
	AI_Output(other,self,"DIA_Tpl_1416_Torwache_Life_15_00");	//��� ����� ������� ������� ��������?
	AI_Output(self,other,"DIA_Tpl_1416_Torwache_Life_08_01");	//��� �������� ������ �������. ��� ������������� � ��� ������� ������������ �� ����.
	AI_Output(self,other,"DIA_Tpl_1416_Torwache_Life_08_02");	//��� ������� ����� �������� � �������. � ���� ����� �� ��� �� - ������� �������.
};

