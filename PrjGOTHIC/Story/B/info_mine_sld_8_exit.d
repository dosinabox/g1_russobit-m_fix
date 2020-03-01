
instance INFO_MINE_SLD_8_EXIT(C_INFO)
{
	nr = 999;
	condition = info_mine_sld_8_exit_condition;
	information = info_mine_sld_8_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_mine_sld_8_exit_condition()
{
	return 1;
};

func void info_mine_sld_8_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_MINE_SLD_8_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_mine_sld_8_einervoneuchwerden_condition;
	information = info_mine_sld_8_einervoneuchwerden_info;
	permanent = 1;
	description = "��� ��� �������������� � ���?";
};


func int info_mine_sld_8_einervoneuchwerden_condition()
{
	if((Npc_GetTrueGuild(other) != GIL_SLD) && (Npc_GetTrueGuild(other) != GIL_KDW) && !c_npcbelongstooldcamp(other) && !c_npcbelongstopsicamp(other))
	{
		return TRUE;
	};
};

func void info_mine_sld_8_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_EinerVonEuchWerden_15_00");	//��� ��� �������������� � ���?
	AI_Output(self,other,"Info_Mine_Sld_8_EinerVonEuchWerden_08_01");	//������ ��� �������� � ���, �� ������ �������� ����� � ����� ������, ��� �� ����-�� ������.
	AI_Output(self,other,"Info_Mine_Sld_8_EinerVonEuchWerden_08_02");	//����� ���� � ��� � ��� ��� �����.
};


instance INFO_MINE_SLD_8_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_mine_sld_8_wichtigepersonen_condition;
	information = info_mine_sld_8_wichtigepersonen_info;
	permanent = 1;
	description = "��� ����� ���������?";
};


func int info_mine_sld_8_wichtigepersonen_condition()
{
	if(FMTAKEN == FALSE)
	{
		return TRUE;
	};
};

func void info_mine_sld_8_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_WichtigePersonen_15_00");	//��� ����� ���������?
	AI_Output(self,other,"Info_Mine_Sld_8_WichtigePersonen_08_01");	//������� ����� ����. � � ������ ��� ��������� ��� ��������� ��.
	AI_Output(self,other,"Info_Mine_Sld_8_WichtigePersonen_08_02");	//������� ���� ����� ����� � ���������� � ����.
};


instance INFO_MINE_SLD_8_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_mine_sld_8_daslager_condition;
	information = info_mine_sld_8_daslager_info;
	permanent = 1;
	description = "��� ����� � ������?";
};


func int info_mine_sld_8_daslager_condition()
{
	if(FMTAKEN == FALSE)
	{
		return TRUE;
	};
};

func void info_mine_sld_8_daslager_info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_DasLager_15_00");	//��� ����� � ������?
	AI_Output(self,other,"Info_Mine_Sld_8_DasLager_08_01");	//�� ����� �������� ���� � �����.
	AI_Output(other,self,"Info_Mine_Sld_8_DasLager_08_02");	//� ����� �� ����������� ����� �� �����.
};


instance INFO_MINE_SLD_8_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_mine_sld_8_dielage_condition;
	information = info_mine_sld_8_dielage_info;
	permanent = 1;
	description = "��� � �������?";
};


func int info_mine_sld_8_dielage_condition()
{
	if(FMTAKEN == FALSE)
	{
		return TRUE;
	};
};

func void info_mine_sld_8_dielage_info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_DieLage_15_00");	//��� � �������?
	AI_Output(self,other,"Info_Mine_Sld_8_DieLage_08_01");	//��� �� ������? �������, � �������!
};

func void b_assignambientinfos_mine_sld_8(var C_NPC slf)
{
	info_mine_sld_8_exit.npc = Hlp_GetInstanceID(slf);
	info_mine_sld_8_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_mine_sld_8_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_mine_sld_8_daslager.npc = Hlp_GetInstanceID(slf);
	info_mine_sld_8_dielage.npc = Hlp_GetInstanceID(slf);
};

