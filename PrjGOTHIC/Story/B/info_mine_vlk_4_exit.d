
instance INFO_MINE_VLK_4_EXIT(C_INFO)
{
	nr = 999;
	condition = info_mine_vlk_4_exit_condition;
	information = info_mine_vlk_4_exit_info;
	permanent = 1;
	description = "��������� ��������";
};


func int info_mine_vlk_4_exit_condition()
{
	return 1;
};

func void info_mine_vlk_4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_MINE_VLK_4_MINE(C_INFO)
{
	nr = 4;
	condition = info_mine_vlk_4_mine_condition;
	information = info_mine_vlk_4_mine_info;
	permanent = 1;
	description = "�������� ��� � ����� � �����.";
};


func int info_mine_vlk_4_mine_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_vlk_4_mine_info()
{
	AI_Output(other,self,"Info_Mine_Vlk_4_Mine_15_00");	//�������� ��� � ����� � �����.
	AI_Output(self,other,"Info_Mine_Vlk_4_Mine_01_01");	//�������� ����� �������� ��� ���������. ��� � ���� �������. � �� ������ � ����� ������, �� ����, ��� ��� �����.
	AI_Output(self,other,"Info_Mine_Vlk_4_Mine_01_02");	//...� ����� �� ������ ����������� �� ������, � ����� ��� ����� ���� ������ ������, ������� ����. ����� �� � ���� ������. � ����� �����.
};


instance INFO_MINE_VLK_4_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_mine_vlk_4_wichtigepersonen_condition;
	information = info_mine_vlk_4_wichtigepersonen_info;
	permanent = 1;
	description = "��� ����� ���� ���������?";
};


func int info_mine_vlk_4_wichtigepersonen_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_vlk_4_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Mine_Vlk_4_WichtigePersonen_15_00");	//��� ����� ���� ���������?
	AI_Output(self,other,"Info_Mine_Vlk_4_WichtigePersonen_01_01");	//������� � ��������, ����� �������. ��� ������ ����, ������� �� ��������, �� ������. ��� �� ������� ��� ������� ����.
};


instance INFO_MINE_VLK_4_MINECRAWLER(C_INFO)
{
	nr = 2;
	condition = info_mine_vlk_4_minecrawler_condition;
	information = info_mine_vlk_4_minecrawler_info;
	permanent = 1;
	description = "��� �� ������ � ��������?";
};


func int info_mine_vlk_4_minecrawler_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_vlk_4_minecrawler_info()
{
	AI_Output(other,self,"Info_Mine_Vlk_4_Minecrawler_15_00");	//��� �� ������ � ��������?
	AI_Output(self,other,"Info_Mine_Vlk_4_Minecrawler_01_01");	//���� �� ��������� ������ �� ���, ����� ��� ��� ������� ������ �� ������. �� ���� �� �������� � ������� ����, ������� ����� �� ���� �� ����.
};


instance INFO_MINE_VLK_4_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_mine_vlk_4_dielage_condition;
	information = info_mine_vlk_4_dielage_info;
	permanent = 1;
	description = "��� ����?";
};


func int info_mine_vlk_4_dielage_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_vlk_4_dielage_info()
{
	AI_Output(other,self,"Info_Mine_Vlk_4_DieLage_15_00");	//��� ����?
	AI_Output(self,other,"Info_Mine_Vlk_4_DieLage_01_01");	//������ � �����.
};

func void b_assignambientinfos_mine_vlk_4(var C_NPC slf)
{
	info_mine_vlk_4_exit.npc = Hlp_GetInstanceID(slf);
	info_mine_vlk_4_minecrawler.npc = Hlp_GetInstanceID(slf);
	info_mine_vlk_4_mine.npc = Hlp_GetInstanceID(slf);
	info_mine_vlk_4_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_mine_vlk_4_dielage.npc = Hlp_GetInstanceID(slf);
};

