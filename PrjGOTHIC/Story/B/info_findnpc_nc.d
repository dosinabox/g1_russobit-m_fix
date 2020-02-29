
instance INFO_FINDNPC_NC(C_INFO)
{
	nr = 900;
	condition = info_findnpc_nc_condition;
	information = info_findnpc_nc_info;
	permanent = 1;
	description = "��� ���������...";
};


func int info_findnpc_nc_condition()
{
	return 1;
};

func void info_findnpc_nc_info()
{
	var C_NPC cronos;
	var C_NPC gorn;
	var C_NPC lares;
	var C_NPC lee;
	Info_ClearChoices(info_findnpc_nc);
	Info_AddChoice(info_findnpc_nc,DIALOG_BACK,info_findnpc_nc_back);
	cronos = Hlp_GetNpc(kdw_604_cronos);
	if(cronos.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(info_findnpc_nc,"...���� �� �����?",info_findnpc_nc_mage);
	};
	gorn = Hlp_GetNpc(pc_fighter);
	if(gorn.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(info_findnpc_nc,"...����?",info_findnpc_nc_gorn);
	};
	lares = Hlp_GetNpc(org_801_lares);
	if(lares.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(info_findnpc_nc,"...����?",info_findnpc_nc_lares);
	};
	lee = Hlp_GetNpc(sld_700_lee);
	if(lee.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(info_findnpc_nc,"...��?",info_findnpc_nc_lee);
	};
};

func void info_findnpc_nc_back()
{
	Info_ClearChoices(info_findnpc_nc);
};

func void info_findnpc_nc_gorn()
{
	var C_NPC gorn;
	AI_Output(other,self,"Info_FindNPC_NC_Gorn_15_00");	//��� � ���� ����� �����?
	gorn = Hlp_GetNpc(pc_fighter);
	if(Npc_GetDistToNpc(self,gorn) < PERC_DIST_INTERMEDIAT)
	{
		b_pointatnpc(self,other,gorn);
	}
	else if(self.guild == GIL_ORG)
	{
		if(self.voice == 6)
		{
			AI_Output(self,other,"Info_FindNPC_NC_Gorn_06_01");	//����� ������� � ������, ������ �������. ����� ����� ����� �� ������� ��������� �����. �� ����� � ����� �� ���.
		}
		else if(self.voice == 7)
		{
			AI_Output(self,other,"Info_FindNPC_NC_Gorn_07_01");	//�� ����� � ������ ������ �������. �� ����� �� ������� ��������� �������. �� ����� � ����� �� ���.
		}
		else if(self.voice == 13)
		{
			AI_Output(self,other,"Info_FindNPC_NC_Gorn_13_01");	//����� ������� � ������, ������ �������. ����� ����� ����� �� ������� ��������� �����. �� ����� � ����� �� ���.
		};
	}
	else if(self.guild == GIL_SLD)
	{
		if(self.voice == 8)
		{
			AI_Output(self,other,"Info_FindNPC_NC_Gorn_08_01");	//����� ������� � ������, ������ �������. ����� ����� ����� �� ������� ��������� �����. �� ����� � ����� �� ���.
		}
		else if(self.voice == 11)
		{
			AI_Output(self,other,"Info_FindNPC_NC_Gorn_11_01");	//����� ������� � ������, ������ �������. ����� ����� ����� �� ������� ��������� �����. �� ����� � ����� �� ���.
		};
	};
	Info_ClearChoices(info_findnpc_nc);
};

func void info_findnpc_nc_lares()
{
	var C_NPC lares;
	AI_Output(other,self,"Info_FindNPC_NC_Lares_15_00");	//��� � ���� ����� �����?
	lares = Hlp_GetNpc(org_801_lares);
	if(Npc_GetDistToNpc(self,lares) < PERC_DIST_INTERMEDIAT)
	{
		b_pointatnpc(self,other,lares);
	}
	else if(self.guild == GIL_ORG)
	{
		if(self.voice == 6)
		{
			AI_Output(self,other,"Info_FindNPC_NC_Lares_06_01");	//� ������� ����� ������, �����. ��� ���������� ����������, ���� ��� ���� ����� ���� ���������.
		}
		else if(self.voice == 7)
		{
			AI_Output(self,other,"Info_FindNPC_NC_Lares_07_01");	//�� ����� � ������ ������� ������ � ��� �����. �� ��� �� ����������. ����� ���� ���������, ������, ��� �� ����� ���.
		}
		else if(self.voice == 13)
		{
			AI_Output(self,other,"Info_FindNPC_NC_Lares_13_01");	//� ������� ����� ������, �����. ��� ���������� ����������, ���� ��� ���� ����� ���� ���������.
		};
	}
	else if(self.guild == GIL_SLD)
	{
		if(self.voice == 8)
		{
			AI_Output(self,other,"Info_FindNPC_NC_Lares_08_01");	//� ������� ����� ������, �����. ��� ���������� ����������, ���� ��� ���� ����� ���� ���������.
		}
		else if(self.voice == 11)
		{
			AI_Output(self,other,"Info_FindNPC_NC_Lares_11_01");	//� ������� ����� ������, �����. ��� ���������� ����������, ���� ��� ���� ����� ���� ���������.
		};
	};
	Info_ClearChoices(info_findnpc_nc);
};

func void info_findnpc_nc_lee()
{
	var C_NPC lee;
	AI_Output(other,self,"Info_FindNPC_NC_Lee_15_00");	//��� � ���� ����� ��?
	lee = Hlp_GetNpc(sld_700_lee);
	if(Npc_GetDistToNpc(self,lee) < PERC_DIST_INTERMEDIAT)
	{
		b_pointatnpc(self,other,lee);
	}
	else if(self.guild == GIL_ORG)
	{
		if(self.voice == 6)
		{
			AI_Output(self,other,"Info_FindNPC_NC_Lee_06_01");	//����� � ������� ������, ������ ������� � ��������� ������. �� ����� ���.
		}
		else if(self.voice == 7)
		{
			AI_Output(self,other,"Info_FindNPC_NC_Lee_07_01");	//������� ������� �� ����� � ������� ������ � ��������� ������.
		}
		else if(self.voice == 13)
		{
			AI_Output(self,other,"Info_FindNPC_NC_Lee_13_01");	//����� � ������� ������, ������ ������� � ��������� ������. �� ����� ���.
		};
	}
	else if(self.guild == GIL_SLD)
	{
		if(self.voice == 8)
		{
			AI_Output(self,other,"Info_FindNPC_NC_Lee_08_01");	//����� � ������� ������, ������ ������� � ��������� ������. �� ����� ���.
		}
		else if(self.voice == 11)
		{
			AI_Output(self,other,"Info_FindNPC_NC_Lee_11_01");	//����� � ������� ������, ������ ������� � ��������� ������. �� ����� ���.
		};
	};
	Info_ClearChoices(info_findnpc_nc);
};

func void info_findnpc_nc_mage()
{
	var C_NPC cronos;
	AI_Output(other,self,"Info_FindNPC_NC_Cronos_15_00");	//��� � ���� ����� ����?
	cronos = Hlp_GetNpc(kdw_604_cronos);
	if(Npc_GetDistToNpc(self,cronos) < PERC_DIST_INTERMEDIAT)
	{
		b_pointatnpc(self,other,cronos);
	}
	else if(self.guild == GIL_ORG)
	{
		if(self.voice == 6)
		{
			AI_Output(self,other,"Info_FindNPC_NC_Cronos_06_01");	//���� ����� � ������� ����� ����� ������. ��� ������� �� �������� ��� �����, �� ������ ���� �� ��� �������� � ����� ������. ��� �� � ������� ��� ���������.
		}
		else if(self.voice == 7)
		{
			AI_Output(self,other,"Info_FindNPC_NC_Cronos_07_01");	//���� ����� � ������� ����� ������, ������. �� ������ ���� �� ��� ����� ����� ���� ���� �����.
		}
		else if(self.voice == 13)
		{
			AI_Output(self,other,"Info_FindNPC_NC_Cronos_13_01");	//���� ����� � ������� ����� ����� ������. ��� ������� �� �������� ��� �����, �� ������ ���� �� ��� �������� � ����� ������. ��� �� � ������� ��� ���������.
		};
	}
	else if(self.guild == GIL_SLD)
	{
		if(self.voice == 8)
		{
			AI_Output(self,other,"Info_FindNPC_NC_Cronos_08_01");	//���� ����� � ������� ����� ����� ������. ��� ������� �� �������� ��� �����, �� ������ ���� �� ��� �������� � ����� ������. ��� �� � ������� ��� ���������.
		}
		else if(self.voice == 11)
		{
			AI_Output(self,other,"Info_FindNPC_NC_Cronos_11_01");	//���� ����� � ������� ����� ����� ������. ��� ������� �� �������� ��� �����, �� ������ ���� �� ��� �������� � ����� ������. ��� �� � ������� ��� ���������.
		};
	};
	Info_ClearChoices(info_findnpc_nc);
};

func void b_assignfindnpc_nc(var C_NPC slf)
{
	info_findnpc_nc.npc = Hlp_GetInstanceID(slf);
};

