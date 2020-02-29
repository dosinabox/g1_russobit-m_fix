
instance INFO_SLD_11_EXIT(C_INFO)
{
	nr = 999;
	condition = info_sld_11_exit_condition;
	information = info_sld_11_exit_info;
	permanent = 1;
	description = "��������� ��������";
};


func int info_sld_11_exit_condition()
{
	return 1;
};

func void info_sld_11_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_SLD_11_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_sld_11_einervoneuchwerden_condition;
	information = info_sld_11_einervoneuchwerden_info;
	permanent = 1;
	description = "� �� ����� ���� ��������� �����.";
};


func int info_sld_11_einervoneuchwerden_condition()
{
	if((Npc_GetTrueGuild(other) != GIL_SLD) && (Npc_GetTrueGuild(other) != GIL_KDW) && !c_npcbelongstooldcamp(other) && !c_npcbelongstopsicamp(other))
	{
		return TRUE;
	};
};

func void info_sld_11_einervoneuchwerden_info()
{
	var C_NPC gorn;
	AI_Output(other,self,"Info_Sld_11_EinerVonEuchWerden_15_00");	//� �� ����� ���� ��������� �����.
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_01");	//��� �� ��� �� ������. ���� �� ��������, ��� ������ �������� �� ���, �� ������ ����.
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_02");	//�� ��� ����� ����� ����, ������� ������ ������� �����. � �� ������ ������� ��� � ����?
	AI_Output(other,self,"Info_Sld_11_EinerVonEuchWerden_15_03");	//��...�...
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_04");	//��� � � �������. ���� �� ��� �� ���������, �������� � ������. �����-�� �� ��� ���������� ��������.
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_05");	//����� ����, ���� �������, � �� ���������� ���������� ��� ����� ��������.
	gorn = Hlp_GetNpc(pc_fighter);
	gorn.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_SLD_11_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_sld_11_wichtigepersonen_condition;
	information = info_sld_11_wichtigepersonen_info;
	permanent = 1;
	description = "��� ����� �������?";
};


func int info_sld_11_wichtigepersonen_condition()
{
	return 1;
};

func void info_sld_11_wichtigepersonen_info()
{
	var C_NPC lee;
	var C_NPC cronos;
	AI_Output(other,self,"Info_Sld_11_WichtigePersonen_15_00");	//��� ����� �������?
	AI_Output(self,other,"Info_Sld_11_WichtigePersonen_11_01");	//�� ������ ��, ��� ������� ��� ����. �� ���� ����� ��� ������ ������. ��� ������� ���� ���� � �������� � ����� ������.
	AI_Output(self,other,"Info_Sld_11_WichtigePersonen_11_02");	//������-��, ��������� ����� ��. �� ��� �����.
	lee = Hlp_GetNpc(sld_700_lee);
	lee.aivar[AIV_FINDABLE] = TRUE;
	cronos = Hlp_GetNpc(kdw_604_cronos);
	cronos.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_SLD_11_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_sld_11_daslager_condition;
	information = info_sld_11_daslager_info;
	permanent = 1;
	description = "� ��� � ��� ���? ������� �����?";
};


func int info_sld_11_daslager_condition()
{
	if(FMTAKEN == FALSE)
	{
		return 1;
	};
};

func void info_sld_11_daslager_info()
{
	AI_Output(other,self,"Info_Sld_11_DasLager_15_00");	//� ��� � ��� ���? ������� �����?
	AI_Output(self,other,"Info_Sld_11_DasLager_11_01");	//� ��� ����� ������ ���� �����-������ ��������. ���� ������ ���, ��� �����, � �������� �������� ����� � �������� ������.
};


instance INFO_SLD_11_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_sld_11_dielage_condition;
	information = info_sld_11_dielage_info;
	permanent = 1;
	description = "��, � � ���� ��� �����?";
};


func int info_sld_11_dielage_condition()
{
	if(FMTAKEN == FALSE)
	{
		return 1;
	};
};

func void info_sld_11_dielage_info()
{
	AI_Output(other,self,"Info_Sld_11_DieLage_15_00");	//��, � � ���� ��� �����?
	AI_Output(self,other,"Info_Sld_11_DieLage_11_01");	//���� ��� ��������...
	AI_Output(other,self,"Info_Sld_11_DieLage_15_02");	//����?
	AI_Output(self,other,"Info_Sld_11_DieLage_11_03");	//���� ���� � ������ ����� ������� �������� ������, �� ������� ����� � ������� �� ��� ������.
	AI_Output(self,other,"Info_Sld_11_DieLage_11_04");	//� ��� ��� ����� ������ �����.
};


instance INFO_SLD_11_KRAUTPROBE(C_INFO)
{
	nr = 5;
	condition = info_sld_11_krautprobe_condition;
	information = info_sld_11_krautprobe_info;
	permanent = 1;
	description = "��������� ������?";
};


func int info_sld_11_krautprobe_condition()
{
	if(((BAALKAGAN_VERTEILKRAUT == LOG_RUNNING) || (BAALKAGAN_VERTEILKRAUT == LOG_SUCCESS)) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void info_sld_11_krautprobe_info()
{
	AI_Output(other,self,"Info_Sld_11_Krautprobe_15_00");	//��������� ������?
	if((Npc_HasItems(other,itmijoint_1) > 0) || (Npc_HasItems(other,itmijoint_2) > 0) || (Npc_HasItems(other,itmijoint_3) > 0))
	{
		if(Npc_HasItems(other,itmijoint_1))
		{
			b_giveinvitems(other,self,itmijoint_1,1);
			b_printtrademsg1("����� '�������'.");
		}
		else if(Npc_HasItems(other,itmijoint_2))
		{
			b_giveinvitems(other,self,itmijoint_2,1);
			b_printtrademsg1("����� '�������� ������'.");
		}
		else if(Npc_HasItems(other,itmijoint_3))
		{
			b_giveinvitems(other,self,itmijoint_3,1);
			b_printtrademsg1("����� '��� �����'.");
		};
		AI_Output(self,other,"Info_Sld_11_Krautprobe_11_01");	//�������. ��� ���� �� ���� ������ ������ ����.
		AI_Output(self,other,"Info_Sld_11_Krautprobe_11_02");	//���� � ���� ����� ���, �� ������, ��� ���� �����...
		b_printtrademsg2("�������� ����: 10");
		CreateInvItems(self,itminugget,10);
		b_giveinvitems(self,other,itminugget,10);
		NC_JOINTS_VERTEILT = NC_JOINTS_VERTEILT + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Sld_11_Krautprobe_No_Joint_11_00");	//������� ������� ���, � ����� ���������.
	};
};

func void b_assignambientinfos_sld_11(var C_NPC slf)
{
	b_assignfindnpc_nc(slf);
	info_sld_11_exit.npc = Hlp_GetInstanceID(slf);
	info_sld_11_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_sld_11_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_sld_11_daslager.npc = Hlp_GetInstanceID(slf);
	info_sld_11_dielage.npc = Hlp_GetInstanceID(slf);
	info_sld_11_krautprobe.npc = Hlp_GetInstanceID(slf);
};

