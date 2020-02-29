
instance INFO_GRD_6_EXIT(C_INFO)
{
	nr = 999;
	condition = info_grd_6_exit_condition;
	information = info_grd_6_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_grd_6_exit_condition()
{
	return 1;
};

func void info_grd_6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_GRD_6_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 1;
	condition = info_grd_6_einervoneuchwerden_condition;
	information = info_grd_6_einervoneuchwerden_info;
	permanent = 1;
	description = "��� ����� ����?";
};


func int info_grd_6_einervoneuchwerden_condition()
{
	if((Npc_GetTrueGuild(other) != GIL_GRD) && (Npc_GetTrueGuild(other) != GIL_STT) && (Npc_GetTrueGuild(other) != GIL_KDF) && !c_npcbelongstonewcamp(other) && !c_npcbelongstopsicamp(other))
	{
		return TRUE;
	};
};

func void info_grd_6_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Grd_6_EinerVonEuchWerden_15_00");	//��� ����� ����?
	AI_Output(self,other,"Info_Grd_6_EinerVonEuchWerden_06_01");	//�� ������� � �������, ��? ���� �� ����� ������, � �������� ������ ��������������, �������� � ����������. ��� ����� ���� ��� �������.
	AI_Output(self,other,"Info_Grd_6_EinerVonEuchWerden_06_02");	//� ��� ������ �� ��������� ���� ������... �������, ���� �� �� ������ ����� ���������� � �����!
};


instance INFO_GRD_6_WICHTIGEPERSONEN(C_INFO)
{
	nr = 1;
	condition = info_grd_6_wichtigepersonen_condition;
	information = info_grd_6_wichtigepersonen_info;
	permanent = 1;
	description = "��� ����� ���������?";
};


func int info_grd_6_wichtigepersonen_condition()
{
	return 1;
};

func void info_grd_6_wichtigepersonen_info()
{
	var C_NPC thorus;
	AI_Output(other,self,"Info_Grd_6_WichtigePersonen_15_00");	//��� ����� ���������?
	AI_Output(self,other,"Info_Grd_6_WichtigePersonen_06_01");	//����� ������ �� ��������. �� ����������� ������.
	thorus = Hlp_GetNpc(grd_200_thorus);
	thorus.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_GRD_6_DASLAGER(C_INFO)
{
	nr = 1;
	condition = info_grd_6_daslager_condition;
	information = info_grd_6_daslager_info;
	permanent = 1;
	description = "� ���������.";
};


func int info_grd_6_daslager_condition()
{
	if(!c_npcbelongstooldcamp(other) && !c_npcbelongstonewcamp(other) && !c_npcbelongstopsicamp(other))
	{
		return 1;
	};
};

func void info_grd_6_daslager_info()
{
	AI_Output(other,self,"Info_Grd_6_DasLager_15_00");	//� ���������.
	AI_Output(self,other,"Info_Grd_6_DasLager_06_01");	//��, � ����.
	AI_Output(other,self,"Info_Grd_6_DasLager_15_02");	//������ ������� �������?
	AI_Output(self,other,"Info_Grd_6_DasLager_06_03");	//�� �������� ��� �������, � ���� ����� �� ������.
	Info_ClearChoices(info_grd_6_daslager);
	Info_AddChoice(info_grd_6_daslager,"����.",info_grd_6_daslager_verstehe);
	Info_AddChoice(info_grd_6_daslager,"� ��� �� ������ � ����, ������ � ���������?",info_grd_6_daslager_wasistaerger);
};

func void info_grd_6_daslager_verstehe()
{
	AI_Output(other,self,"Info_Grd_6_DasLager_Verstehe_15_00");	//����.
	Info_ClearChoices(info_grd_6_daslager);
};

func void info_grd_6_daslager_wasistaerger()
{
	AI_Output(other,self,"Info_Grd_6_DasLager_WasIstAerger_15_00");	//� ��� �� ������ � ����, ������ � ���������?
	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_01");	//����������� ��������� ������ ���, � �� �� ��������.
	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_02");	//���� �� ������� ����-�� �� ���, ������ ����� ���� � ����.
	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_03");	//� ���� � ������ ���� � ����� ������, ��...
	AI_Output(other,self,"Info_Grd_6_DasLager_WasIstAerger_15_04");	//������, ������. � ��� �����.
	Info_ClearChoices(info_grd_6_daslager);
};


instance INFO_GRD_6_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_grd_6_dielage_condition;
	information = info_grd_6_dielage_info;
	permanent = 1;
	description = "��� ����?";
};


func int info_grd_6_dielage_condition()
{
	return 1;
};

func void info_grd_6_dielage_info()
{
	AI_Output(other,self,"Info_Grd_6_DieLage_15_00");	//��� ����?
	AI_Output(self,other,"Info_Grd_6_DieLage_06_01");	//����� �������������?
};

func void b_assignambientinfos_grd_6(var C_NPC slf)
{
	b_assignfindnpc_oc(slf);
	info_grd_6_exit.npc = Hlp_GetInstanceID(slf);
	info_grd_6_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_grd_6_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_grd_6_daslager.npc = Hlp_GetInstanceID(slf);
	info_grd_6_dielage.npc = Hlp_GetInstanceID(slf);
};

