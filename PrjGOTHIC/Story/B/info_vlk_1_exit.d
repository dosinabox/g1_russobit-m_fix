
instance INFO_VLK_1_EXIT(C_INFO)
{
	nr = 999;
	condition = info_vlk_1_exit_condition;
	information = info_vlk_1_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_vlk_1_exit_condition()
{
	return 1;
};

func void info_vlk_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_VLK_1_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_vlk_1_einervoneuchwerden_condition;
	information = info_vlk_1_einervoneuchwerden_info;
	permanent = 1;
	description = "� ���� �������������� � ������. ��� ��� ��� �������?";
};


func int info_vlk_1_einervoneuchwerden_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void info_vlk_1_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Vlk_1_EinerVonEuchWerden_15_00");	//� ���� �������������� � ������. ��� ��� ��� �������?
	AI_Output(self,other,"Info_Vlk_1_EinerVonEuchWerden_01_01");	//����� ������. ����� ���� ����� � ��� � �����. ����� �������� ���� ���� �������� �������� ��������, � �� ���������� ����� ����� ���� ���-��� ������� ����� � �������.
	AI_Output(self,other,"Info_Vlk_1_EinerVonEuchWerden_01_02");	//����, ������� ��������� ����� �� ������ �� �������� ����, ������ ������������. �� ��� ��� �� �����, ��� ������ ����� ������ ���, ��� � ����� ������.
};


instance INFO_VLK_1_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_vlk_1_wichtigepersonen_condition;
	information = info_vlk_1_wichtigepersonen_info;
	permanent = 1;
	description = "��� ����� ���� ���������?";
};


func int info_vlk_1_wichtigepersonen_condition()
{
	return 1;
};

func void info_vlk_1_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Vlk_1_WichtigePersonen_15_00");	//��� ����� ���� ���������?
	AI_Output(self,other,"Info_Vlk_1_WichtigePersonen_01_01");	//������. ��� ���������� �������� ���� ��� ������. ��� ����� �� � ���, ��� ������ ���������.
};


instance INFO_VLK_1_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_vlk_1_daslager_condition;
	information = info_vlk_1_daslager_info;
	permanent = 1;
	description = "����� ���� ���-������ ����������, ����� ���� �����?";
};


func int info_vlk_1_daslager_condition()
{
	return 1;
};

func void info_vlk_1_daslager_info()
{
	AI_Output(other,self,"Info_Vlk_1_DasLager_15_00");	//����� ���� ���-������ ����������, ����� ���� �����?
	AI_Output(self,other,"Info_Vlk_1_DasLager_01_01");	//��, �� ������� ����� ������������ ���, ��� ��������� �������� ���� ����� �� �����.
	AI_Output(other,self,"Info_Vlk_1_DasLager_01_02");	//�������.
};


instance INFO_VLK_1_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_vlk_1_dielage_condition;
	information = info_vlk_1_dielage_info;
	permanent = 1;
	description = "��� � ���� ����?";
};


func int info_vlk_1_dielage_condition()
{
	return 1;
};

func void info_vlk_1_dielage_info()
{
	AI_Output(other,self,"Info_Vlk_1_DieLage_15_00");	//��� � ���� ����?
	AI_Output(self,other,"Info_Vlk_1_DieLage_01_01");	//��������� ��� ������ � ������� � �����. ������ � ���� ���������, ��� ��� �� �����.
};

func void b_assignambientinfos_vlk_1(var C_NPC slf)
{
	b_assignfindnpc_oc(slf);
	info_vlk_1_exit.npc = Hlp_GetInstanceID(slf);
	info_vlk_1_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_vlk_1_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_vlk_1_daslager.npc = Hlp_GetInstanceID(slf);
	info_vlk_1_dielage.npc = Hlp_GetInstanceID(slf);
};

