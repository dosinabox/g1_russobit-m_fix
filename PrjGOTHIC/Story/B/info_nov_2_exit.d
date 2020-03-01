
instance INFO_NOV_2_EXIT(C_INFO)
{
	nr = 999;
	condition = info_nov_2_exit_condition;
	information = info_nov_2_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_nov_2_exit_condition()
{
	return 1;
};

func void info_nov_2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_NOV_2_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_nov_2_einervoneuchwerden_condition;
	information = info_nov_2_einervoneuchwerden_info;
	permanent = 1;
	description = "� ���� �������������� � ���.";
};


func int info_nov_2_einervoneuchwerden_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void info_nov_2_einervoneuchwerden_info()
{
	var C_NPC corkalom;
	AI_Output(other,self,"Info_Nov_2_EinerVonEuchWerden_15_00");	//� ���� �������������� � ���.
	AI_Output(self,other,"Info_Nov_2_EinerVonEuchWerden_02_01");	//�� ����� ������� �������? � ���� ������� ����� �� ����� � �� ����� ���� � �����!
	AI_Output(self,other,"Info_Nov_2_EinerVonEuchWerden_02_02");	//�������� � ��� �������. �� �����, ��� ���� ����� ����������.
	corkalom = Hlp_GetNpc(gur_1201_corkalom);
	corkalom.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_NOV_2_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_nov_2_wichtigepersonen_condition;
	information = info_nov_2_wichtigepersonen_info;
	permanent = 1;
	description = "��� ����� ������������������?";
};


func int info_nov_2_wichtigepersonen_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_nov_2_wichtigepersonen_info()
{
	var C_NPC yberion;
	var C_NPC corkalom;
	var C_NPC corangar;
	AI_Output(other,self,"Info_Nov_2_WichtigePersonen_15_00");	//��� ����� ������������������?
	AI_Output(self,other,"Info_Nov_2_WichtigePersonen_02_01");	//���� ���������� - �������, ��� ����� � ��� �����.
	AI_Output(self,other,"Info_Nov_2_WichtigePersonen_02_02");	//��� ������ ��� ����� �� ������. �� ����� ��������� ��� �������� � ���.
	yberion = Hlp_GetNpc(gur_1200_yberion);
	corkalom = Hlp_GetNpc(gur_1201_corkalom);
	corangar = Hlp_GetNpc(gur_1202_corangar);
	yberion.aivar[AIV_FINDABLE] = TRUE;
	corkalom.aivar[AIV_FINDABLE] = TRUE;
	corangar.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_NOV_2_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_nov_2_daslager_condition;
	information = info_nov_2_daslager_info;
	permanent = 1;
	description = "��� ��� ��� ���� ����� �� ���� �����?";
};


func int info_nov_2_daslager_condition()
{
	return 1;
};

func void info_nov_2_daslager_info()
{
	AI_Output(other,self,"Info_Nov_2_DasLager_15_00");	//��� ��� ��� ���� ����� �� ���� �����?
	AI_Output(self,other,"Info_Nov_2_DasLager_02_01");	//��� ����� ����, ����. ���, ��� � ��� ����, �� ������ ��������� � ������, ��� ����� � ������ �������.
	AI_Output(self,other,"Info_Nov_2_DasLager_02_02");	//�������� � ����� �� ����, ������� ���� ����.
};


instance INFO_NOV_2_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_nov_2_dielage_condition;
	information = info_nov_2_dielage_info;
	permanent = 1;
	description = "��� ���� ����?";
};


func int info_nov_2_dielage_condition()
{
	return 1;
};

func void info_nov_2_dielage_info()
{
	AI_Output(other,self,"Info_Nov_2_DieLage_15_00");	//��� ���� ����?
	AI_Output(self,other,"Info_Nov_2_DieLage_02_01");	//� ���� ���� �������. ���� ��������� ������� ����.
};

func void b_assignambientinfos_nov_2(var C_NPC slf)
{
	b_assignfindnpc_st(slf);
	info_nov_2_exit.npc = Hlp_GetInstanceID(slf);
	info_nov_2_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_nov_2_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_nov_2_daslager.npc = Hlp_GetInstanceID(slf);
	info_nov_2_dielage.npc = Hlp_GetInstanceID(slf);
};

