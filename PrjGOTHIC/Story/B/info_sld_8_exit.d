
instance INFO_SLD_8_EXIT(C_INFO)
{
	nr = 999;
	condition = info_sld_8_exit_condition;
	information = info_sld_8_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_sld_8_exit_condition()
{
	return 1;
};

func void info_sld_8_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_SLD_8_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_sld_8_einervoneuchwerden_condition;
	information = info_sld_8_einervoneuchwerden_info;
	permanent = 1;
	description = "��� ����� ����?";
};


func int info_sld_8_einervoneuchwerden_condition()
{
	if((Npc_GetTrueGuild(other) != GIL_SLD) && (Npc_GetTrueGuild(other) != GIL_KDW) && !c_npcbelongstooldcamp(other) && !c_npcbelongstopsicamp(other))
	{
		return TRUE;
	};
};

func void info_sld_8_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Sld_8_EinerVonEuchWerden_15_00");	//��� ����� ����?
	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_01");	//�� �� ��������� � ���� � ������� �����, ������� ����� ���� �� ��������. ��� ����� ������� ��������.
	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_02");	//���� �� ������ �������������� � ������ ������, ���� ������� ����� ���������� � �����.
};


instance INFO_SLD_8_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_sld_8_wichtigepersonen_condition;
	information = info_sld_8_wichtigepersonen_info;
	permanent = 1;
	description = "��� ����� ���� ���������?";
};


func int info_sld_8_wichtigepersonen_condition()
{
	return 1;
};

func void info_sld_8_wichtigepersonen_info()
{
	var C_NPC lee;
	var C_NPC cronos;
	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_00");	//��� ����� ���� ���������?
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_01");	//��. �� ��������� ����������. �� ����������� � ������. �� �� ��������, � ��� ������� ������ �������� ��� ������.
	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_02");	//������, ���-���� ���� ��� ������������?
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_03");	//���. �� ����� ���� � ���� ������ ��� ������ ������. ������ ������ ������� ���� �� ������� ������.
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_04");	//����� ������ ��� �� ����. � ������ ���� ��� ���������� - ������� ��������� �� ���� ������� ��� ����� �������. ��� ��� ����� ������� ���� � ����� ���� � �������� ��, ��� ������ ���� ����� ������!
	lee = Hlp_GetNpc(sld_700_lee);
	lee.aivar[AIV_FINDABLE] = TRUE;
	cronos = Hlp_GetNpc(kdw_604_cronos);
	cronos.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_SLD_8_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_sld_8_daslager_condition;
	information = info_sld_8_daslager_info;
	permanent = 1;
	description = "�� ������ ���������� ��� �� ���� ������?";
};


func int info_sld_8_daslager_condition()
{
	if(!c_npcbelongstonewcamp(other))
	{
		return 1;
	};
};

func void info_sld_8_daslager_info()
{
	var C_NPC cronos;
	AI_Output(other,self,"Info_Sld_8_DasLager_15_00");	//�������� ��� �� ���� ������.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_01");	//����� ����� ����� ����������� � �����, ��� ��� ���� ���������.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_02");	//� ��� ���� ��������� ��������� �������, ������� ���������� ���������. ������: � ����� ����� �������� ������ ��������.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_03");	//������: ������ ������ ������������ � ����� ����. ������: �������� ����� �� �������� � ��� �� �����.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_04");	//���� ��� ����������� �����, � ��� �� �����, ����� ������ ���� ����� ���������� ����.
	cronos = Hlp_GetNpc(kdw_604_cronos);
	cronos.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_SLD_8_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_sld_8_dielage_condition;
	information = info_sld_8_dielage_info;
	permanent = 1;
	description = "��� ���� ����?";
};


func int info_sld_8_dielage_condition()
{
	if(FMTAKEN == FALSE)
	{
		return 1;
	};
};

func void info_sld_8_dielage_info()
{
	var C_NPC cronos;
	AI_Output(other,self,"Info_Sld_8_DieLage_15_00");	//��� ���� ����?
	AI_Output(self,other,"Info_Sld_8_DieLage_08_01");	//��� ������. ����� �� ���, ����� ����� �� ��������� ����� � �� �������� � ���� ����.
	cronos = Hlp_GetNpc(kdw_604_cronos);
	cronos.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_SLD_8_KRAUTPROBE(C_INFO)
{
	nr = 5;
	condition = info_sld_8_krautprobe_condition;
	information = info_sld_8_krautprobe_info;
	permanent = 1;
	description = "� ���� ���� ������� ���������, �����, ������?";
};


func int info_sld_8_krautprobe_condition()
{
	if(((BAALKAGAN_VERTEILKRAUT == LOG_RUNNING) || (BAALKAGAN_VERTEILKRAUT == LOG_SUCCESS)) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void info_sld_8_krautprobe_info()
{
	AI_Output(other,self,"Info_Sld_8_Krautprobe_15_00");	//� ���� ���� ������� ���������, �����, ������?
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
		AI_Output(self,other,"Info_Sld_8_Krautprobe_08_01");	//�, �����. ��� ���� �� ���� ������ ������ ����.
		AI_Output(self,other,"Info_Sld_8_Krautprobe_08_02");	//������ ���� ������. ��� ���� �� ���������.
		b_printtrademsg2("�������� ����: 10");
		CreateInvItems(self,itminugget,10);
		b_giveinvitems(self,other,itminugget,10);
		NC_JOINTS_VERTEILT = NC_JOINTS_VERTEILT + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Sld_8_Krautprobe_No_Joint_08_00");	//� ��� �� ���� ��������, �? � ���� ��� ���!
	};
};

func void b_assignambientinfos_sld_8(var C_NPC slf)
{
	b_assignfindnpc_nc(slf);
	info_sld_8_exit.npc = Hlp_GetInstanceID(slf);
	info_sld_8_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_sld_8_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_sld_8_daslager.npc = Hlp_GetInstanceID(slf);
	info_sld_8_dielage.npc = Hlp_GetInstanceID(slf);
	info_sld_8_krautprobe.npc = Hlp_GetInstanceID(slf);
};

