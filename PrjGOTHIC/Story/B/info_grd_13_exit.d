
instance INFO_GRD_13_EXIT(C_INFO)
{
	nr = 999;
	condition = info_grd_13_exit_condition;
	information = info_grd_13_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_grd_13_exit_condition()
{
	return 1;
};

func void info_grd_13_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_GRD_13_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 1;
	condition = info_grd_13_einervoneuchwerden_condition;
	information = info_grd_13_einervoneuchwerden_info;
	permanent = 1;
	description = "� ���� ����� ����� �� ����������.";
};


func int info_grd_13_einervoneuchwerden_condition()
{
	if((Npc_GetTrueGuild(other) != GIL_GRD) && (Npc_GetTrueGuild(other) != GIL_KDF) && !c_npcbelongstonewcamp(other) && !c_npcbelongstopsicamp(other))
	{
		return TRUE;
	};
};

func void info_grd_13_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_grd_13_EinerVonEuchWerden_15_00");	//� ���� ����� ����� �� ����������.
	AI_Output(self,other,"Info_grd_13_EinerVonEuchWerden_13_01");	//��� ����� ���� ����� ���-�� �������� ����.
};


instance INFO_GRD_13_WICHTIGEPERSONEN(C_INFO)
{
	nr = 1;
	condition = info_grd_13_wichtigepersonen_condition;
	information = info_grd_13_wichtigepersonen_info;
	permanent = 1;
	description = "� ��� ����� �������?";
};


func int info_grd_13_wichtigepersonen_condition()
{
	return 1;
};

func void info_grd_13_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_grd_13_WichtigePersonen_15_00");	//� ��� ����� �������?
	AI_Output(self,other,"Info_grd_13_WichtigePersonen_13_01");	//����� � �������. � �������� ����: ����� �� ���, ��� �� ��������!
};


instance INFO_GRD_13_DASLAGER(C_INFO)
{
	nr = 1;
	condition = info_grd_13_daslager_condition;
	information = info_grd_13_daslager_info;
	permanent = 1;
	description = "��� ��� ����� � �����?";
};


func int info_grd_13_daslager_condition()
{
	if(KAPITEL == 1)
	{
		return 1;
	};
};

func void info_grd_13_daslager_info()
{
	AI_Output(other,self,"Info_grd_13_DasLager_15_00");	//��� ��� ����� � �����?
	AI_Output(self,other,"Info_grd_13_DasLager_13_01");	//�����. � ����� ����� �������� ������ ���� ������.
	Info_ClearChoices(info_grd_13_daslager);
	Info_AddChoice(info_grd_13_daslager,"����.",info_grd_13_daslager_verstehe);
	Info_AddChoice(info_grd_13_daslager,"� ���� ��������� ����������?",info_grd_13_daslager_wachenbestechen);
	Info_AddChoice(info_grd_13_daslager,"��� ����� ���������� � �������. ��� ��� � ��� �����������?",info_grd_13_daslager_gomezsprechen);
};

func void info_grd_13_daslager_verstehe()
{
	AI_Output(other,self,"Info_grd_13_DasLager_Verstehe_15_00");	//����.
	Info_ClearChoices(info_grd_13_daslager);
};

func void info_grd_13_daslager_wachenbestechen()
{
	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_00");	//� ���� ��������� ����������?
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_01");	//�������� ���� �� ��������. �����, ���� �� ���������� �� ���������� ����, ��� ����� ����������� ���������.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_02");	//�� ���� ����� ������ � ���, ��� ��� ���������� � ����� ������, �� ������� �� � ����������.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_03");	//������� ������ ��������� ���� ����� ��������.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_04");	//�� ���� �� �� �������� � �����, ���� �� ������� ������ ������ �����. ��� ������ ������.
	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_05");	//��, � ������ ���������������, ��� � ���.
};

func void info_grd_13_daslager_gomezsprechen()
{
	var C_NPC thorus;
	AI_Output(other,self,"Info_grd_13_DasLager_GomezSprechen_15_00");	//��� ����� ���������� � �������. ��� ��� � ��� �����������?
	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_01");	//������ �� ����� ����, ������� ����� ����� �� �����.
	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_02");	//�� ���� ��� ���� ��� ��� �����, �������� � �������.
	thorus = Hlp_GetNpc(grd_200_thorus);
	thorus.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_GRD_13_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_grd_13_dielage_condition;
	information = info_grd_13_dielage_info;
	permanent = 1;
	description = "��� ����?";
};


func int info_grd_13_dielage_condition()
{
	if(!c_npcbelongstonewcamp(other) && !c_npcbelongstopsicamp(other))
	{
		return 1;
	};
};

func void info_grd_13_dielage_info()
{
	AI_Output(other,self,"Info_grd_13_DieLage_15_00");	//��� ����?
	AI_Output(self,other,"Info_grd_13_DieLage_13_01");	//��� ��������. ����, ������, ���� �������� � ������ ������ ������, �� ��� ��� ��� �������� �������� �����������.
	AI_Output(self,other,"Info_grd_13_DieLage_13_02");	//�� ����� ��� ���������, ������� ��� ���� ��� �� ��� �����, �� ����� �� �������������� � ������ �� �������, �� �������, ��� ����������� �� ������ ������.
};

func void b_assignambientinfos_grd_13(var C_NPC slf)
{
	b_assignfindnpc_oc(slf);
	info_grd_13_exit.npc = Hlp_GetInstanceID(slf);
	info_grd_13_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_grd_13_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_grd_13_daslager.npc = Hlp_GetInstanceID(slf);
	info_grd_13_dielage.npc = Hlp_GetInstanceID(slf);
};

