
instance INFO_NOV_5_EXIT(C_INFO)
{
	nr = 999;
	condition = info_nov_5_exit_condition;
	information = info_nov_5_exit_info;
	permanent = 1;
	description = "��������� ��������";
};


func int info_nov_5_exit_condition()
{
	return 1;
};

func void info_nov_5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_NOV_5_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_nov_5_einervoneuchwerden_condition;
	information = info_nov_5_einervoneuchwerden_info;
	permanent = 1;
	description = "��� ��� �������������� � ����� ������?";
};


func int info_nov_5_einervoneuchwerden_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void info_nov_5_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Nov_5_EinerVonEuchWerden_15_00");	//��� ��� �������������� � ����� ������?
	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_01");	//��� ����� ������. �������� � ���-������ �� ������� ����. ��� ���� �������.
	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_02");	//���� � ��� ����������, ������ ���.
};


instance INFO_NOV_5_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_nov_5_wichtigepersonen_condition;
	information = info_nov_5_wichtigepersonen_info;
	permanent = 1;
	description = "��� ����� ���� ���������?";
};


func int info_nov_5_wichtigepersonen_condition()
{
	return 1;
};

func void info_nov_5_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Nov_5_WichtigePersonen_15_00");	//��� ����� ���� ���������?
	AI_Output(self,other,"Info_Nov_5_WichtigePersonen_05_01");	//������ ����� ����������� ����. �� ���� �� �� ������ �������� ����� �������, ��� ���� �� ������.
};


instance INFO_NOV_5_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_nov_5_daslager_condition;
	information = info_nov_5_daslager_info;
	permanent = 1;
	description = "�� ������ ���������� ��� �� ���� ������?";
};


func int info_nov_5_daslager_condition()
{
	return 1;
};

func void info_nov_5_daslager_info()
{
	var C_NPC corkalom;
	AI_Output(other,self,"Info_Nov_5_DasLager_15_00");	//�� ������ ���������� ��� �� ���� ������?
	AI_Output(self,other,"Info_Nov_5_DasLager_05_01");	//����� ����, ��� ���, �� �� ���� ������� �� �������.
	AI_Output(self,other,"Info_Nov_5_DasLager_05_02");	//� ����� ������ �� ������� ��������� �������� ��� � ��������, ���� ���� �� ���������� � ������ �������. ������ �������� � �������.
	AI_Output(other,self,"Info_Nov_5_DasLager_15_03");	//��� � ���� ����� ���?
	AI_Output(self,other,"Info_Nov_5_DasLager_05_04");	//� ���� ��� ������������ ��� ������, ����� � ����� ������.
	corkalom = Hlp_GetNpc(gur_1201_corkalom);
	corkalom.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_NOV_5_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_nov_5_dielage_condition;
	information = info_nov_5_dielage_info;
	permanent = 1;
	description = "��� ����?";
};


func int info_nov_5_dielage_condition()
{
	return 1;
};

func void info_nov_5_dielage_info()
{
	AI_Output(other,self,"Info_Nov_5_DieLage_15_00");	//��� ����?
	AI_Output(self,other,"Info_Nov_5_DieLage_05_01");	//������. ��� �� �� ��� ����������. � �� ����� ���������?
	AI_Output(other,self,"Info_Nov_5_DieLage_15_02");	//��, ������ ������� ������.
};

func void b_assignambientinfos_nov_5(var C_NPC slf)
{
	b_assignfindnpc_st(slf);
	info_nov_5_exit.npc = Hlp_GetInstanceID(slf);
	info_nov_5_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_nov_5_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_nov_5_daslager.npc = Hlp_GetInstanceID(slf);
	info_nov_5_dielage.npc = Hlp_GetInstanceID(slf);
};

