
instance INFO_STT_10_EXIT(C_INFO)
{
	nr = 999;
	condition = info_stt_10_exit_condition;
	information = info_stt_10_exit_info;
	permanent = 1;
	description = "��������� ��������";
};


func int info_stt_10_exit_condition()
{
	return 1;
};

func void info_stt_10_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_STT_10_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_stt_10_einervoneuchwerden_condition;
	information = info_stt_10_einervoneuchwerden_info;
	permanent = 1;
	description = "� �� ����� ����� ���������.";
};


func int info_stt_10_einervoneuchwerden_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void info_stt_10_einervoneuchwerden_info()
{
	var C_NPC diego;
	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_15_00");	//� �� ����� ����� ���������.
	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_10_01");	//��? � �� ��� ��������� � �����?
	diego = Hlp_GetNpc(pc_thief);
	diego.aivar[AIV_FINDABLE] = TRUE;
	Info_ClearChoices(info_stt_10_einervoneuchwerden);
	Info_AddChoice(info_stt_10_einervoneuchwerden,"��� ���.",info_stt_10_einervoneuchwerden_nein);
	Info_AddChoice(info_stt_10_einervoneuchwerden,"� ������� � ����.",info_stt_10_einervoneuchwerden_ja);
};

func void info_stt_10_einervoneuchwerden_nein()
{
	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_Nein_15_00");	//��� ���.
	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_Nein_10_01");	//��� ��������. �� ������� ��� ����� �������� �����.
	Info_ClearChoices(info_stt_10_einervoneuchwerden);
};

func void info_stt_10_einervoneuchwerden_ja()
{
	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_Ja_15_00");	//� ������� � ����.
	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_Ja_10_01");	//������. ����� ��, ��� �� ���� ������. ��� ��� ����� �� ��������. �� ��� �����...
	Info_ClearChoices(info_stt_10_einervoneuchwerden);
};


instance INFO_STT_10_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_stt_10_wichtigepersonen_condition;
	information = info_stt_10_wichtigepersonen_info;
	permanent = 1;
	description = "���� ��� ���-������, ��� ����� ���� ��� �������?";
};


func int info_stt_10_wichtigepersonen_condition()
{
	return 1;
};

func void info_stt_10_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Stt_10_WichtigePersonen_15_00");	//���� ��� ���-������, ��� ����� ���� ��� �������?
	AI_Output(self,other,"Info_Stt_10_WichtigePersonen_10_01");	//���� �� ��������� ��������� � ���-������ �� ������, �������� � �����. �� ����� ����� �������� ����� � �������� �����. �� �������� ����� ��������� �� ��������. � �������� ���� ����� ��������� � ����� ��������, ��� ��.
};


instance INFO_STT_10_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_stt_10_daslager_condition;
	information = info_stt_10_daslager_info;
	permanent = 1;
	description = "��� �� ������ ���������� �� ���� ������?";
};


func int info_stt_10_daslager_condition()
{
	return 1;
};

func void info_stt_10_daslager_info()
{
	AI_Output(other,self,"Info_Stt_10_DasLager_15_00");	//��� �� ������ ���������� �� ���� ������?
	AI_Output(self,other,"Info_Stt_10_DasLager_10_01");	//��-�����, ����� ���������� ����� � ������ - �����. ��� ��������� ����� ���. ��� ��� ������ ����, ���� ���-������ �����������.
	AI_Output(self,other,"Info_Stt_10_DasLager_10_02");	//�� ��������� ��� ������� ������ �� ������� ������, � ��� �� �����.
};


instance INFO_STT_10_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_stt_10_dielage_condition;
	information = info_stt_10_dielage_info;
	permanent = 1;
	description = "������!";
};


func int info_stt_10_dielage_condition()
{
	return 1;
};

func void info_stt_10_dielage_info()
{
	AI_Output(other,self,"Info_Stt_10_DieLage_15_00");	//������!
	AI_Output(self,other,"Info_Stt_10_DieLage_10_01");	//��� ���� �����?
};

func void b_assignambientinfos_stt_10(var C_NPC slf)
{
	b_assignfindnpc_oc(slf);
	info_stt_10_exit.npc = Hlp_GetInstanceID(slf);
	info_stt_10_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_stt_10_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_stt_10_daslager.npc = Hlp_GetInstanceID(slf);
	info_stt_10_dielage.npc = Hlp_GetInstanceID(slf);
};

