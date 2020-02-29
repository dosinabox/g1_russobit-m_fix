
instance INFO_TPL_8_EXIT(C_INFO)
{
	nr = 999;
	condition = info_tpl_8_exit_condition;
	information = info_tpl_8_exit_info;
	permanent = 1;
	description = "��������� ��������";
};


func int info_tpl_8_exit_condition()
{
	return 1;
};

func void info_tpl_8_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_TPL_8_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_tpl_8_einervoneuchwerden_condition;
	information = info_tpl_8_einervoneuchwerden_info;
	permanent = 1;
	description = "��� ����� ������ ����?";
};


func int info_tpl_8_einervoneuchwerden_condition()
{
	if((Npc_GetTrueGuild(other) != GIL_TPL) && !c_npcbelongstonewcamp(other) && !c_npcbelongstooldcamp(other))
	{
		return TRUE;
	};
};

func void info_tpl_8_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Tpl_8_EinerVonEuchWerden_15_00");	//��� ����� ������ ����?
	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_01");	//��, ����� ���� ��� ������ �����. �� ���� ��� ����� ��������� �����. ������ �������� ��������� ����� ����� �������.
	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_02");	//��� ������� ����� ��� ������������� �������� �������.
};


instance INFO_TPL_8_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_tpl_8_wichtigepersonen_condition;
	information = info_tpl_8_wichtigepersonen_info;
	permanent = 1;
	description = "��� ����� ���� ���������?";
};


func int info_tpl_8_wichtigepersonen_condition()
{
	return 1;
};

func void info_tpl_8_wichtigepersonen_info()
{
	var C_NPC yberion;
	var C_NPC corkalom;
	var C_NPC corangar;
	AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_00");	//��� ����� ���� ���������?
	AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_01");	//���� - ������� ����� ���. �� ������ ��, ��� ��� ��� �������. � ���� ������� ���� ����������.
	if(KAPITEL < 3)
	{
		AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_02");	//� ��� ����� ����?
		AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_03");	//��������� ���� ������, �������, ������������. ��� �������� ��� �����, ��� ������ � ��������� ������.
		yberion = Hlp_GetNpc(gur_1200_yberion);
		corkalom = Hlp_GetNpc(gur_1201_corkalom);
		corangar = Hlp_GetNpc(gur_1202_corangar);
		yberion.aivar[AIV_FINDABLE] = TRUE;
		corkalom.aivar[AIV_FINDABLE] = TRUE;
		corangar.aivar[AIV_FINDABLE] = TRUE;
	};
};


instance INFO_TPL_8_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_tpl_8_daslager_condition;
	information = info_tpl_8_daslager_info;
	permanent = 1;
	description = "�������� ��� �� ���� ������.";
};


func int info_tpl_8_daslager_condition()
{
	if(!c_npcbelongstopsicamp(other))
	{
		return 1;
	};
};

func void info_tpl_8_daslager_info()
{
	AI_Output(other,self,"Info_Tpl_8_DasLager_15_00");	//�������� ��� �� ���� ������.
	AI_Output(self,other,"Info_Tpl_8_DasLager_08_01");	//�� ����� �������. ���� ����� ������ �����. ��� �������� ������ ���� ���� �������.
	AI_Output(self,other,"Info_Tpl_8_DasLager_08_02");	//������� ����� ���� �� �������� �� ��������� ���������� � �� ���������� ����� �������� �� ����� ���������.
};


instance INFO_TPL_8_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_tpl_8_dielage_condition;
	information = info_tpl_8_dielage_info;
	permanent = 1;
	description = "��� ����?";
};


func int info_tpl_8_dielage_condition()
{
	if(!c_npcbelongstopsicamp(other))
	{
		return 1;
	};
};

func void info_tpl_8_dielage_info()
{
	AI_Output(other,self,"Info_Tpl_8_DieLage_15_00");	//��� ����?
	AI_Output(self,other,"Info_Tpl_8_DieLage_08_01");	//�� �������, �� ���� ���������� ������� ����� ���������� � ���������. � � - ���� �� ��������� ���������� ��������.
};

func void b_assignambientinfos_tpl_8(var C_NPC slf)
{
	b_assignfindnpc_st(slf);
	info_tpl_8_exit.npc = Hlp_GetInstanceID(slf);
	info_tpl_8_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_tpl_8_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_tpl_8_daslager.npc = Hlp_GetInstanceID(slf);
	info_tpl_8_dielage.npc = Hlp_GetInstanceID(slf);
};

