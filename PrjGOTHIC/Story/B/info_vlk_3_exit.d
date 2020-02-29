
instance INFO_VLK_3_EXIT(C_INFO)
{
	nr = 999;
	condition = info_vlk_3_exit_condition;
	information = info_vlk_3_exit_info;
	permanent = 1;
	description = "��������� ��������";
};


func int info_vlk_3_exit_condition()
{
	return 1;
};

func void info_vlk_3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_VLK_3_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_vlk_3_einervoneuchwerden_condition;
	information = info_vlk_3_einervoneuchwerden_info;
	permanent = 1;
	description = "��� ����, ����� �������������� � ����� ������?";
};


func int info_vlk_3_einervoneuchwerden_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void info_vlk_3_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Vlk_3_EinerVonEuchWerden_15_00");	//��� ����, ����� �������������� � ����� ������?
	AI_Output(self,other,"Info_Vlk_3_EinerVonEuchWerden_03_01");	//� ������� ������� � �� ��� �� ����� ���� ���������� ����. �������� ����� � ���������� ��� �����������.
};


instance INFO_VLK_3_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_vlk_3_wichtigepersonen_condition;
	information = info_vlk_3_wichtigepersonen_info;
	permanent = 1;
	description = "��� ����� �������?";
};


func int info_vlk_3_wichtigepersonen_condition()
{
	if(!c_npcbelongstooldcamp(other))
	{
		return 1;
	};
};

func void info_vlk_3_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Vlk_3_WichtigePersonen_15_00");	//��� ����� �������?
	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_01");	//�����. �� ����� � �����. �� �� ����� ������ ��� ����������, ������� ��������� ��� �������.
	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_02");	//����� �����, ���� ��� ���� ������ �� ����� ��������. ���� �� �������� � ��� �� ����, � ���� ����� ��������.
};


instance INFO_VLK_3_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_vlk_3_daslager_condition;
	information = info_vlk_3_daslager_info;
	permanent = 1;
	description = "��� ����������� ���� � ���� ������?";
};


func int info_vlk_3_daslager_condition()
{
	return 1;
};

func void info_vlk_3_daslager_info()
{
	AI_Output(other,self,"Info_Vlk_3_DasLager_15_00");	//��� ����������� ���� � ���� ������?
	AI_Output(self,other,"Info_Vlk_3_DasLager_03_01");	//���� ���� ���������� �������� ����, ������� ������� � �����. � ���� ������ ������ ���-������, �� ����� �� �����.
	AI_Output(self,other,"Info_Vlk_3_DasLager_03_02");	//� ������� ��������� ���� ����� ���. ����� ������ ���� ���. �� �� �� ������ ����� � �������. �� ����� � ���� �������� ����� �����.
};


instance INFO_VLK_3_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_vlk_3_dielage_condition;
	information = info_vlk_3_dielage_info;
	permanent = 1;
	description = "��� ����� �������?";
};


func int info_vlk_3_dielage_condition()
{
	return 1;
};

func void info_vlk_3_dielage_info()
{
	AI_Output(other,self,"Info_Vlk_3_DieLage_15_00");	//��� ����� �������?
	AI_Output(self,other,"Info_Vlk_3_DieLage_03_01");	//����� ����� �� ������������ �� �������� ���������. ���� ������ ������. �������� �� �����.
	AI_Output(self,other,"Info_Vlk_3_DieLage_03_02");	//������� ���������� ��� �������� � ��� �����. ��� ��� ��� ����� �� ������� ��������� ��� �������.
};

func void b_assignambientinfos_vlk_3(var C_NPC slf)
{
	b_assignfindnpc_oc(slf);
	info_vlk_3_exit.npc = Hlp_GetInstanceID(slf);
	info_vlk_3_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_vlk_3_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_vlk_3_daslager.npc = Hlp_GetInstanceID(slf);
	info_vlk_3_dielage.npc = Hlp_GetInstanceID(slf);
};

