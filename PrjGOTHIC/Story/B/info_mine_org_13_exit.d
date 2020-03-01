
instance INFO_MINE_ORG_13_EXIT(C_INFO)
{
	nr = 999;
	condition = info_mine_org_13_exit_condition;
	information = info_mine_org_13_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_mine_org_13_exit_condition()
{
	return 1;
};

func void info_mine_org_13_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_MINE_ORG_13_MINE(C_INFO)
{
	nr = 1;
	condition = info_mine_org_13_mine_condition;
	information = info_mine_org_13_mine_info;
	permanent = 1;
	description = "�������� ��� �� ���� ������.";
};


func int info_mine_org_13_mine_condition()
{
	return 1;
};

func void info_mine_org_13_mine_info()
{
	AI_Output(other,self,"Info_Mine_Org_13_Mine_15_00");	//�������� ��� �� ���� ������.
	AI_Output(self,other,"Info_Mine_Org_13_Mine_13_01");	//�� ��� �������� �� ��, ��� ������ ������� ���������� ���� �� ����� �����, ����� �������� ���� ������.
};


instance INFO_MINE_ORG_13_WICHTIGEPERSONEN(C_INFO)
{
	nr = 1;
	condition = info_mine_org_13_wichtigepersonen_condition;
	information = info_mine_org_13_wichtigepersonen_info;
	permanent = 1;
	description = "��� ����� ����������?";
};


func int info_mine_org_13_wichtigepersonen_condition()
{
	return 1;
};

func void info_mine_org_13_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Mine_Org_13_WichtigePersonen_15_00");	//��� ����� ����������?
	AI_Output(self,other,"Info_Mine_Org_13_WichtigePersonen_13_01");	//����� ��������� ����.
	AI_Output(self,other,"Info_Mine_Org_13_WichtigePersonen_13_02");	//�� �����, ����� ��� ��, �� �� �������.
};


instance INFO_MINE_ORG_13_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_mine_org_13_dielage_condition;
	information = info_mine_org_13_dielage_info;
	permanent = 1;
	description = "��� ���������?";
};


func int info_mine_org_13_dielage_condition()
{
	return 1;
};

func void info_mine_org_13_dielage_info()
{
	AI_Output(other,self,"Info_Mine_Org_13_DieLage_15_00");	//��� ���������?
	AI_Output(self,other,"Info_Mine_Org_13_DieLage_13_01");	//��� ��� ��, ��� � ������.
};

func void b_assignambientinfos_mine_org_13(var C_NPC slf)
{
	info_mine_org_13_exit.npc = Hlp_GetInstanceID(slf);
	info_mine_org_13_mine.npc = Hlp_GetInstanceID(slf);
	info_mine_org_13_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_mine_org_13_dielage.npc = Hlp_GetInstanceID(slf);
};

