
instance INFO_GRD_7_EXIT(C_INFO)
{
	nr = 999;
	condition = info_grd_7_exit_condition;
	information = info_grd_7_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_grd_7_exit_condition()
{
	return 1;
};

func void info_grd_7_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_GRD_7_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 1;
	condition = info_grd_7_einervoneuchwerden_condition;
	information = info_grd_7_einervoneuchwerden_info;
	permanent = 1;
	description = "� ���� ���� ����� �� ���������� ������. ��� ��� ������� ��� �����?";
};


func int info_grd_7_einervoneuchwerden_condition()
{
	if((Npc_GetTrueGuild(other) != GIL_GRD) && (Npc_GetTrueGuild(other) != GIL_KDF) && !c_npcbelongstonewcamp(other) && !c_npcbelongstopsicamp(other))
	{
		return TRUE;
	};
};

func void info_grd_7_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_grd_7_EinerVonEuchWerden_15_00");	//� ���� ���� ����� �� ���������� ������. ��� ��� ������� ��� �����?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_01");	//��� �� ������ �������? �� ������? �������, ����� ������ ������ ���� � ����� ����� ����� �� ���?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_02");	//����� ��������� ������ ����������� ������ ����� ������.
	if(Npc_GetTrueGuild(other) != GIL_STT)
	{
		AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_03");	//���� �������� �������� ��� ��, ��� � ��� ���������. ������� ����� ����� ��������� � ��������, ��� �� ���� ����� ����������.
	};
};


instance INFO_GRD_7_WICHTIGEPERSONEN(C_INFO)
{
	nr = 1;
	condition = info_grd_7_wichtigepersonen_condition;
	information = info_grd_7_wichtigepersonen_info;
	permanent = 1;
	description = "��� ����� ���������?";
};


func int info_grd_7_wichtigepersonen_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void info_grd_7_wichtigepersonen_info()
{
	var C_NPC diego;
	var C_NPC thorus;
	AI_Output(other,self,"Info_grd_7_WichtigePersonen_15_00");	//��� ����� ���������?
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_01");	//����� ������ �� �������� � ������. ����� - ��� ������ ����.
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_02");	//���� �� ������ ����� ����� �� ���, �������� � ����.
	diego = Hlp_GetNpc(pc_thief);
	diego.aivar[AIV_FINDABLE] = TRUE;
	thorus = Hlp_GetNpc(grd_200_thorus);
	thorus.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_GRD_7_DASLAGER(C_INFO)
{
	nr = 1;
	condition = info_grd_7_daslager_condition;
	information = info_grd_7_daslager_info;
	permanent = 1;
	description = "����� ��� �������� �� ������?";
};


func int info_grd_7_daslager_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void info_grd_7_daslager_info()
{
	AI_Output(other,self,"Info_grd_7_DasLager_15_00");	//����� ��� �������� �� ������?
	AI_Output(self,other,"Info_grd_7_DasLager_07_01");	//���. ����������� ����� ������ ������� ��������.
	AI_Output(self,other,"Info_grd_7_DasLager_07_02");	//������ ��������� � �������� �������� ������ ������.
	Info_ClearChoices(info_grd_7_daslager);
	Info_AddChoice(info_grd_7_daslager,DIALOG_BACK,info_grd_7_daslager_zurueck);
	Info_AddChoice(info_grd_7_daslager,"��� ���������� ���������?",info_grd_7_daslager_gardisten);
	Info_AddChoice(info_grd_7_daslager,"��� ������ ��������?",info_grd_7_daslager_schatten);
	Info_AddChoice(info_grd_7_daslager,"��� ���������� ��������?",info_grd_7_daslager_buddler);
};

func void info_grd_7_daslager_zurueck()
{
	Info_ClearChoices(info_grd_7_daslager);
};

func void info_grd_7_daslager_gardisten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_WasIstAerger_15_00");	//��� ���������� ���������?
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_01");	//�� �������� ������ � �������� ���������.
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_02");	//�� ����� �� ��, ��� ��� ������ ����� � �������� �� ������. ���� ���� ������ �������, ����� ������ ������� �������� �����.
};

func void info_grd_7_daslager_schatten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_Schatten_15_00");	//��� ������ ��������?
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_01");	//��� ������ �� ���, ����� ��� ������� ������ ����������� ���, ��� �����.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_02");	//����������� �� ��� ������ ����� ������ ����� �������, �� ���� �� ������ ����-�� �������� � ���� ������, �� ������������ ������ ���� - ����� ���������.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_03");	//���� �� ������ ������ ��������� ���� ������, �� ������� ����� ����� �� ����������.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_04");	//��, � ����� �� ������� ����� �� ����� ������, ����� �� ���� ������� �� ������� ����� � ����, ������ ���.
};

func void info_grd_7_daslager_buddler()
{
	var C_NPC thorus;
	AI_Output(other,self,"Info_grd_7_DasLager_Buddler_15_00");	//��� ���������� ��������?
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_01");	//������� ������! ��� �������� � �����, � �� �� ������ �� ���������.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_02");	//������, ������ ��� �������, ����� ��������� ������������ ����, ����, �������, ����������� ��� ���������� �����.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_03");	//����� ���� �������������, ��� ������������ � �����. ��� ����� ����������� �� ���.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_04");	//��, ��-�����, �� �� ����� �� ��������, �������� �������� �������� ����� �����. �������� � �������, ���� �� ����� ��� �� ������.
	thorus = Hlp_GetNpc(grd_200_thorus);
	thorus.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_GRD_7_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_grd_7_dielage_condition;
	information = info_grd_7_dielage_info;
	permanent = 1;
	description = "��� ����?";
};


func int info_grd_7_dielage_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void info_grd_7_dielage_info()
{
	AI_Output(other,self,"Info_grd_7_DieLage_15_00");	//��� ����?
	AI_Output(self,other,"Info_grd_7_DieLage_07_01");	//���� �� �� �������������� � ������ �� �������, ���� ����� ����� �� ����� ������������ �������!
};

func void b_assignambientinfos_grd_7(var C_NPC slf)
{
	b_assignfindnpc_oc(slf);
	info_grd_7_exit.npc = Hlp_GetInstanceID(slf);
	info_grd_7_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_grd_7_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_grd_7_daslager.npc = Hlp_GetInstanceID(slf);
	info_grd_7_dielage.npc = Hlp_GetInstanceID(slf);
};

