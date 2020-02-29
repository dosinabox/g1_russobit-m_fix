
instance INFO_MINE_GRD_7_EXIT(C_INFO)
{
	nr = 999;
	condition = info_mine_grd_7_exit_condition;
	information = info_mine_grd_7_exit_info;
	permanent = 1;
	description = "��������� ��������";
};


func int info_mine_grd_7_exit_condition()
{
	return 1;
};

func void info_mine_grd_7_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_MINE_GRD_7_MINE(C_INFO)
{
	nr = 1;
	condition = info_mine_grd_7_mine_condition;
	information = info_mine_grd_7_mine_info;
	permanent = 1;
	description = "�������� ��� � �����.";
};


func int info_mine_grd_7_mine_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_grd_7_mine_info()
{
	AI_Output(other,self,"Info_Mine_Grd_7_Mine_15_00");	//�������� ��� � �����.
	AI_Output(self,other,"Info_Mine_Grd_7_Mine_07_01");	//� ��� ��� ������������? �������� �������� ����, � �� �� �������� �� ��������.
};


instance INFO_MINE_GRD_7_WICHTIGEPERSONEN(C_INFO)
{
	nr = 1;
	condition = info_mine_grd_7_wichtigepersonen_condition;
	information = info_mine_grd_7_wichtigepersonen_info;
	permanent = 1;
	description = "��� ����� ���������?";
};


func int info_mine_grd_7_wichtigepersonen_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_grd_7_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Mine_Grd_7_WichtigePersonen_15_00");	//��� ����� ���������?
	AI_Output(self,other,"Info_Mine_Grd_7_WichtigePersonen_07_01");	//�� � ������. ��������� � ���, ���� ���� ���-������ �����������.
};


instance INFO_MINE_GRD_7_MINECRAWLER(C_INFO)
{
	nr = 1;
	condition = info_mine_grd_7_minecrawler_condition;
	information = info_mine_grd_7_minecrawler_info;
	permanent = 1;
	description = "��� �� ������ � ��������?";
};


func int info_mine_grd_7_minecrawler_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_grd_7_minecrawler_info()
{
	AI_Output(other,self,"Info_Mine_Grd_7_Minecrawler_15_00");	//��� �� ������ � ��������?
	AI_Output(self,other,"Info_Mine_Grd_7_Minecrawler_07_01");	//��� ��� � �����, �� ���� ����� ���������� ��� ����� �������.
};


instance INFO_MINE_GRD_7_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_mine_grd_7_dielage_condition;
	information = info_mine_grd_7_dielage_info;
	permanent = 1;
	description = "��� ����?";
};


func int info_mine_grd_7_dielage_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_grd_7_dielage_info()
{
	AI_Output(other,self,"Info_Mine_Grd_7_DieLage_15_00");	//��� �����?
	AI_Output(self,other,"Info_Mine_Grd_7_DieLage_07_01");	//������, �� �������� ���� �� ������!
};

func void b_assignambientinfos_mine_grd_7(var C_NPC slf)
{
	info_mine_grd_7_exit.npc = Hlp_GetInstanceID(slf);
	info_mine_grd_7_mine.npc = Hlp_GetInstanceID(slf);
	info_mine_grd_7_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_mine_grd_7_minecrawler.npc = Hlp_GetInstanceID(slf);
	info_mine_grd_7_dielage.npc = Hlp_GetInstanceID(slf);
};

