
instance INFO_SFB_5_PRE(C_INFO)
{
	nr = 1;
	condition = info_sfb_5_pre_condition;
	information = info_sfb_5_pre_info;
	permanent = 0;
	important = 1;
};


func int info_sfb_5_pre_condition()
{
	return 1;
};

func void info_sfb_5_pre_info()
{
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_00");	//������!
};


instance INFO_SFB_5_EXIT(C_INFO)
{
	nr = 999;
	condition = info_sfb_5_exit_condition;
	information = info_sfb_5_exit_info;
	permanent = 1;
	description = "��������� ��������";
};


func int info_sfb_5_exit_condition()
{
	return 1;
};

func void info_sfb_5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_SFB_5_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_sfb_5_einervoneuchwerden_condition;
	information = info_sfb_5_einervoneuchwerden_info;
	permanent = 1;
	description = "� ��� ����� �������������� � ���.";
};


func int info_sfb_5_einervoneuchwerden_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void info_sfb_5_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_00");	//� ����� �������������� � ���.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_01");	//������ ��������������, ��? ��������� ������ �����, ��� ��?
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_02");	//���, ���������.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_03");	//����� �������� ����: ����� � ���� ��������� ����� �� �������� �����������.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_04");	//�� ��� �� ��� ������... ��� � ����� �����. �� ��-�� ������� ���� ������ ������, ������� ����� ��� ����� � ����.
};


instance INFO_SFB_5_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_sfb_5_wichtigepersonen_condition;
	information = info_sfb_5_wichtigepersonen_info;
	permanent = 1;
	description = "���� ����� ����� ������� ������ ���������?";
};


func int info_sfb_5_wichtigepersonen_condition()
{
	return 1;
};

func void info_sfb_5_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_SFB_5_WichtigePersonen_15_00");	//���� ����� ����� ������� ������ ���������?
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_01");	//������? �������. � ���� �� ���.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_02");	//�����, �� ����� ������, ���� ����� ����������� ������.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_03");	//��� �, ��-�����, ���� ������� ���������� � ���������� ��� ������. � ��� � ����� ����� ���� ��������� �� �����.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_04");	//����� �� ����� ������ ���, �� ��� �� ������� ���� ������� ������. � ���� �� ������ ������� ����� � ����������� �������� �����.
};


instance INFO_SFB_5_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_sfb_5_daslager_condition;
	information = info_sfb_5_daslager_info;
	permanent = 1;
	description = "��� ����� ���� ��� ���� ������?";
};


func int info_sfb_5_daslager_condition()
{
	return 1;
};

func void info_sfb_5_daslager_info()
{
	AI_Output(other,self,"Info_SFB_5_DasLager_15_00");	//��� ����� ���� ��� ���� ������?
	AI_Output(self,other,"Info_SFB_5_DasLager_02_01");	//��� ������� �� ����, ��� �� ����� ������. ��������� �������� � ���� ����, � ��������� ���������� �� ������.
};


instance INFO_SFB_5_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_sfb_5_dielage_condition;
	information = info_sfb_5_dielage_info;
	permanent = 1;
	description = "��� ����� �������?";
};


func int info_sfb_5_dielage_condition()
{
	return 1;
};

func void info_sfb_5_dielage_info()
{
	AI_Output(other,self,"Info_SFB_5_DieLage_15_00");	//��� ����� �������?
	AI_Output(self,other,"Info_SFB_5_DieLage_02_01");	//������!
	AI_Output(self,other,"Info_SFB_5_DieLage_02_02");	//��, ��� ����� ��� ��������, ��� �� ��� ���� ��� �������� ������� ������.
	AI_Output(self,other,"Info_SFB_5_DieLage_02_03");	//��� ��, ��-������, ���������? �� � ������, � ��� ����� ������������ ������ ������������?
};

func void b_assignambientinfos_sfb_5(var C_NPC slf)
{
	info_sfb_5_pre.npc = Hlp_GetInstanceID(slf);
	info_sfb_5_exit.npc = Hlp_GetInstanceID(slf);
	info_sfb_5_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_sfb_5_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_sfb_5_daslager.npc = Hlp_GetInstanceID(slf);
	info_sfb_5_dielage.npc = Hlp_GetInstanceID(slf);
};

