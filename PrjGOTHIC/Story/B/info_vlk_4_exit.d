
instance INFO_VLK_4_EXIT(C_INFO)
{
	nr = 999;
	condition = info_vlk_4_exit_condition;
	information = info_vlk_4_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_vlk_4_exit_condition()
{
	return 1;
};

func void info_vlk_4_exit_info()
{
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_00");	//�������. �����!
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_01");	//���� ���, ������.
	AI_StopProcessInfos(self);
};


instance INFO_VLK_4_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_vlk_4_einervoneuchwerden_condition;
	information = info_vlk_4_einervoneuchwerden_info;
	permanent = 1;
	description = "��� ����� �������, ����� �������������� � ����� ������?";
};


func int info_vlk_4_einervoneuchwerden_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void info_vlk_4_einervoneuchwerden_info()
{
	var C_NPC thorus;
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_01");	//��� ����� �������, ����� �������������� � ����� ������?
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_04");	//����� ���� ����� � ���������� ��� ���������, �� ������ �������? ��� �� ��� �� ������. ������ ����� ������ ���� � ������ ������ �����, ����� �� �������� ���������.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_02");	//� ��� ���� �������� ������������� � ������� ������. �� ���� �� �� ��������� � ������ �� �������, ����� �� ����� ������������ ���� �������.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_03");	//�� ����� ����� � �� ������� ����� � ���������. �� ��������� ������� ����� ����� ��� ����, ��� ������� ����. �� �����, ������� ��.
	thorus = Hlp_GetNpc(grd_200_thorus);
	thorus.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_VLK_4_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_vlk_4_wichtigepersonen_condition;
	information = info_vlk_4_wichtigepersonen_info;
	permanent = 1;
	description = "��� ��� ����� ���� ��� �������?";
};


func int info_vlk_4_wichtigepersonen_condition()
{
	return 1;
};

func void info_vlk_4_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Vlk_4_WichtigePersonen_15_00");	//��� ��� ����� ���� ��� �������?
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_01");	//���� ����� ���������� � �����. ���������� �� ��������� � ���. ����� �� � �������, �� ������ � ���������� ������. �� ���� ����� ���� � ��������.
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_02");	//�� ����� ������ ����, ���� � ���� ����� �������� ������� ����� ����� ������.
};


instance INFO_VLK_4_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_vlk_4_daslager_condition;
	information = info_vlk_4_daslager_info;
	permanent = 1;
	description = "� ��� ��� ��� ����� �����?";
};


func int info_vlk_4_daslager_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void info_vlk_4_daslager_info()
{
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_00");	//� ��� ��� ��� ����� �����?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_01");	//���� ������ � ����� ���� �� ����������, �� ����� ����� ���� ����� ����� � �������� ����� ��������� �������� � �������� �����.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_02");	//���� �������, ���� ������� ����� ��� �����. �� ����������� �� �� ���������, ���� ������ �������� ���� �����. ����� ����� �� ����� ������ - ����� ������.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_03");	//� ����� ����, �� ���� ��������� ����. ������ ��� �������, ����� ���� ���������. ��� ������ ������ ������ �� ����� ������.
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_04");	//���� ������� �� �����? �����?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_05");	//����� � �� ����. ������ ����� ���, ��� ����� ����������.
};


instance INFO_VLK_4_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_vlk_4_dielage_condition;
	information = info_vlk_4_dielage_info;
	permanent = 1;
	description = "��� � ���� ����?";
};


func int info_vlk_4_dielage_condition()
{
	return 1;
};

func void info_vlk_4_dielage_info()
{
	AI_Output(other,self,"Info_Vlk_4_DieLage_15_00");	//��� � ���� ����?
	AI_Output(self,other,"Info_Vlk_4_DieLage_04_01");	//��� ��, ��� � �������� ��� �����. �� ��� ����� ����� ����� ������ �� ����������.
};

func void b_assignambientinfos_vlk_4(var C_NPC slf)
{
	b_assignfindnpc_oc(slf);
	info_vlk_4_exit.npc = Hlp_GetInstanceID(slf);
	info_vlk_4_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_vlk_4_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_vlk_4_daslager.npc = Hlp_GetInstanceID(slf);
	info_vlk_4_dielage.npc = Hlp_GetInstanceID(slf);
};

