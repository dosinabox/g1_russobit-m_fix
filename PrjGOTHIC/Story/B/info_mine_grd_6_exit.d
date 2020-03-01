
instance INFO_MINE_GRD_6_EXIT(C_INFO)
{
	nr = 999;
	condition = info_mine_grd_6_exit_condition;
	information = info_mine_grd_6_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_mine_grd_6_exit_condition()
{
	return 1;
};

func void info_mine_grd_6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_MINE_GRD_6_MINE(C_INFO)
{
	nr = 1;
	condition = info_mine_grd_6_mine_condition;
	information = info_mine_grd_6_mine_info;
	permanent = 1;
	description = "��� ���������� �� �����?";
};


func int info_mine_grd_6_mine_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_grd_6_mine_info()
{
	AI_Output(other,self,"Info_Mine_Grd_6_Mine_15_00");	//��� ���������� �� �����?
	AI_Output(self,other,"Info_Mine_Grd_6_Mine_06_01");	//�������� �������� ����. ��� �� ����� ��������, ���� ���� �������� ���������.
};


instance INFO_MINE_GRD_6_WICHTIGEPERSONEN(C_INFO)
{
	nr = 1;
	condition = info_mine_grd_6_wichtigepersonen_condition;
	information = info_mine_grd_6_wichtigepersonen_info;
	permanent = 1;
	description = "��� ����� ���������?";
};


func int info_mine_grd_6_wichtigepersonen_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_grd_6_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Mine_Grd_6_WichtigePersonen_15_00");	//��� ����� ���������?
	AI_Output(self,other,"Info_Mine_Grd_6_WichtigePersonen_06_01");	//������ ��������� �����������, � �� ��������� ������, ���������� ������ ����.
};


instance INFO_MINE_GRD_6_MINECRAWLER(C_INFO)
{
	nr = 1;
	condition = info_mine_grd_6_minecrawler_condition;
	information = info_mine_grd_6_minecrawler_info;
	permanent = 1;
	description = "�������� ��� � ��������.";
};


func int info_mine_grd_6_minecrawler_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_grd_6_minecrawler_info()
{
	AI_Output(other,self,"Info_Mine_Grd_6_Minecrawler_15_00");	//�������� ��� � ��������.
	AI_Output(self,other,"Info_Mine_Grd_6_Minecrawler_06_01");	//��� ����� ������ ������ ��� �����. ���� �� ����, �� ���� ������ �������: �� ��� ��� �� ���������.
};


instance INFO_MINE_GRD_6_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_mine_grd_6_dielage_condition;
	information = info_mine_grd_6_dielage_info;
	permanent = 1;
	description = "��� ���� ����?";
};


func int info_mine_grd_6_dielage_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_grd_6_dielage_info()
{
	AI_Output(other,self,"Info_Mine_Grd_6_DieLage_15_00");	//��� ���� ����?
	AI_Output(self,other,"Info_Mine_Grd_6_DieLage_06_01");	//� �� ��� �������?
};

func void b_assignambientinfos_mine_grd_6(var C_NPC slf)
{
	info_mine_grd_6_exit.npc = Hlp_GetInstanceID(slf);
	info_mine_grd_6_mine.npc = Hlp_GetInstanceID(slf);
	info_mine_grd_6_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_mine_grd_6_minecrawler.npc = Hlp_GetInstanceID(slf);
	info_mine_grd_6_dielage.npc = Hlp_GetInstanceID(slf);
};

