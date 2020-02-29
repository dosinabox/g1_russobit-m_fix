
instance INFO_VLK_2_EXIT(C_INFO)
{
	nr = 999;
	condition = info_vlk_2_exit_condition;
	information = info_vlk_2_exit_info;
	permanent = 1;
	description = "��������� ��������";
};


func int info_vlk_2_exit_condition()
{
	return 1;
};

func void info_vlk_2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_VLK_2_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_vlk_2_einervoneuchwerden_condition;
	information = info_vlk_2_einervoneuchwerden_info;
	permanent = 1;
	description = "� ���� ����� ����� �� ���.";
};


func int info_vlk_2_einervoneuchwerden_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void info_vlk_2_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Vlk_2_EinerVonEuchWerden_15_00");	//� ���� ����� ����� �� ���.
	AI_Output(self,other,"Info_Vlk_2_EinerVonEuchWerden_02_01");	//�� �������, ����� ���� ����������� �������� � �����. ����� ��� �� ������ ���� - � �����.
};


instance INFO_VLK_2_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_vlk_2_wichtigepersonen_condition;
	information = info_vlk_2_wichtigepersonen_info;
	permanent = 1;
	description = "��� ����� ���� ���������?";
};


func int info_vlk_2_wichtigepersonen_condition()
{
	return 1;
};

func void info_vlk_2_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Vlk_2_WichtigePersonen_15_00");	//��� ����� ���� ���������?
	AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_01");	//�����, �� ������� ������, ������ �� ������ �������� �������, ������� � �����. � ������� �� ��� ���� ���� �����.
	AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_02");	//���� �������� � ����, ������, ��� � �������.
};


instance INFO_VLK_2_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_vlk_2_daslager_condition;
	information = info_vlk_2_daslager_info;
	permanent = 1;
	description = "�������� ��� ���-������ ��� � ������.";
};


func int info_vlk_2_daslager_condition()
{
	return 1;
};

func void info_vlk_2_daslager_info()
{
	AI_Output(other,self,"Info_Vlk_2_DasLager_15_00");	//�������� ��� ���-������ ��� � ������.
	AI_Output(self,other,"Info_Vlk_2_DasLager_02_01");	//���� ����� ���������� � ����������. ��� ����� ��� ����, ��� ���� �����. �� ���� ��������� - ����������� �� ��� ������ ��������.
};


instance INFO_VLK_2_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_vlk_2_dielage_condition;
	information = info_vlk_2_dielage_info;
	permanent = 1;
	description = "��� ����� �������?";
};


func int info_vlk_2_dielage_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void info_vlk_2_dielage_info()
{
	AI_Output(other,self,"Info_Vlk_2_DieLage_15_00");	//��� ����� �������?
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_01");	//���� ���� �������� ������, ����� ��, ��� � �� ���� �������������. � �� � ��� �� ������ �� ����.
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_02");	//� ������� ���, ��� ��� ���� ���.
	AI_Output(other,self,"Info_Vlk_2_DieLage_15_03");	//����� ���� �� �������. � ������ ������� ������ ����.
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_04");	//���������, �? ������� ������ ������ �������� � ������������. � ��� �� ����� ��������, �����?
};

func void b_assignambientinfos_vlk_2(var C_NPC slf)
{
	b_assignfindnpc_oc(slf);
	info_vlk_2_exit.npc = Hlp_GetInstanceID(slf);
	info_vlk_2_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_vlk_2_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_vlk_2_daslager.npc = Hlp_GetInstanceID(slf);
	info_vlk_2_dielage.npc = Hlp_GetInstanceID(slf);
};

