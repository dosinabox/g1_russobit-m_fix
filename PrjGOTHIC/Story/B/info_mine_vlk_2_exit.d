
instance INFO_MINE_VLK_2_EXIT(C_INFO)
{
	nr = 999;
	condition = info_mine_vlk_2_exit_condition;
	information = info_mine_vlk_2_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_mine_vlk_2_exit_condition()
{
	return 1;
};

func void info_mine_vlk_2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_MINE_VLK_2_MINE(C_INFO)
{
	nr = 4;
	condition = info_mine_vlk_2_mine_condition;
	information = info_mine_vlk_2_mine_info;
	permanent = 1;
	description = "�������� ��� � �����.";
};


func int info_mine_vlk_2_mine_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_vlk_2_mine_info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_Mine_15_00");	//�������� ��� � �����.
	AI_Output(self,other,"Info_Mine_Vlk_2_Mine_01_01");	//��� ����� �����, ��� ��� �������� ����. �� ��-�� �������� ������ �������� ����������.
	AI_Output(self,other,"Info_Mine_Vlk_2_Mine_01_02");	//������� ����� ����, ������� ������� ������.
};


instance INFO_MINE_VLK_2_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_mine_vlk_2_wichtigepersonen_condition;
	information = info_mine_vlk_2_wichtigepersonen_info;
	permanent = 1;
	description = "��� ��� ����� ���������� �� ���� �����?";
};


func int info_mine_vlk_2_wichtigepersonen_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_vlk_2_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_WichtigePersonen_15_00");	//��� ��� ����� ���������� �� ���� �����?
	AI_Output(self,other,"Info_Mine_Vlk_2_WichtigePersonen_01_01");	//������ ����������. �� ������ ������ ����, �� ��������� ����, �� � ��� ������ �� �����. ��� ��� � ���� �� ������ ����.
};


instance INFO_MINE_VLK_2_MINECRAWLER(C_INFO)
{
	nr = 2;
	condition = info_mine_vlk_2_minecrawler_condition;
	information = info_mine_vlk_2_minecrawler_info;
	permanent = 1;
	description = "��� �� ������ � ��������?";
};


func int info_mine_vlk_2_minecrawler_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_vlk_2_minecrawler_info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_Minecrawler_15_00");	//��� �� ������ � ��������?
	AI_Output(self,other,"Info_Mine_Vlk_2_Minecrawler_01_01");	//�� ���������� ������ ����, ������� ����� ����� ������. ��� ���� ���� ������.
	AI_Output(self,other,"Info_Mine_Vlk_2_Minecrawler_01_02");	//������� ��� �������. �� �� �������? � ����� �����.
};


instance INFO_MINE_VLK_2_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_mine_vlk_2_dielage_condition;
	information = info_mine_vlk_2_dielage_info;
	permanent = 1;
	description = "��� � ���� ����?";
};


func int info_mine_vlk_2_dielage_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_vlk_2_dielage_info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_DieLage_15_00");	//��� � ���� ����?
	AI_Output(self,other,"Info_Mine_Vlk_2_DieLage_01_01");	//� ������ ��������. ���� ��������� ������, ��� � ������������, ��� �������� ����.
};

func void b_assignambientinfos_mine_vlk_2(var C_NPC slf)
{
	info_mine_vlk_2_exit.npc = Hlp_GetInstanceID(slf);
	info_mine_vlk_2_minecrawler.npc = Hlp_GetInstanceID(slf);
	info_mine_vlk_2_mine.npc = Hlp_GetInstanceID(slf);
	info_mine_vlk_2_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_mine_vlk_2_dielage.npc = Hlp_GetInstanceID(slf);
};

