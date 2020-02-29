
instance DIA_KALOMSGUARD_EXIT(C_INFO)
{
	npc = tpl_1406_templer;
	nr = 999;
	condition = dia_kalomsguard_exit_condition;
	information = dia_kalomsguard_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_kalomsguard_exit_condition()
{
	return 1;
};

func void dia_kalomsguard_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KALOMSGUARD_PERM(C_INFO)
{
	npc = tpl_1406_templer;
	nr = 1;
	condition = dia_kalomsguard_perm_condition;
	information = dia_kalomsguard_perm_info;
	permanent = 1;
	description = "�����, �� �� ������ ������, ���� � �����?";
};


func int dia_kalomsguard_perm_condition()
{
	return 1;
};

func void dia_kalomsguard_perm_info()
{
	AI_Output(other,self,"DIA_KalomsGuard_PERM_15_00");	//�����, �� �� ������ ������, ���� � �����?
	AI_Output(self,other,"DIA_KalomsGuard_PERM_13_01");	//�������� ������ �������� ���������� � ����� ���������, � � ���� ����.
	AI_StopProcessInfos(self);
};

