
instance INFO_FINDNPC_ST(C_INFO)
{
	nr = 900;
	condition = info_findnpc_st_condition;
	information = info_findnpc_st_info;
	permanent = 1;
	description = "��� ���������...";
};


func int info_findnpc_st_condition()
{
	return 1;
};

func void info_findnpc_st_info()
{
	var C_NPC corangar;
	var C_NPC corkalom;
	var C_NPC yberion;
	Info_ClearChoices(info_findnpc_st);
	Info_AddChoice(info_findnpc_st,DIALOG_BACK,info_findnpc_st_back);
	corangar = Hlp_GetNpc(gur_1202_corangar);
	if(corangar.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(info_findnpc_st,"...��� �����?",info_findnpc_st_corangar);
	};
	corkalom = Hlp_GetNpc(gur_1201_corkalom);
	if((corkalom.aivar[AIV_FINDABLE] == TRUE) && (CORANGAR_GOTOOGY != TRUE))
	{
		Info_AddChoice(info_findnpc_st,"...��� �����?",info_findnpc_st_corkalom);
	};
	yberion = Hlp_GetNpc(gur_1200_yberion);
	if((yberion.aivar[AIV_FINDABLE] == TRUE) && (KAPITEL < 3))
	{
		Info_AddChoice(info_findnpc_st,"...�������?",info_findnpc_st_yberion);
	};
};

func void info_findnpc_st_back()
{
	Info_ClearChoices(info_findnpc_st);
};

func void info_findnpc_st_corangar()
{
	var C_NPC corangar;
	AI_Output(other,self,"Info_FindNPC_ST_CorAngar_15_00");	//��� � ���� ����� ��� ������?
	corangar = Hlp_GetNpc(gur_1202_corangar);
	if(Npc_GetDistToNpc(self,corangar) < PERC_DIST_INTERMEDIAT)
	{
		b_pointatnpc(self,other,corangar);
	}
	else if(self.guild == GIL_NOV)
	{
		if(self.voice == 2)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorAngar_02_01");	//������������� �������� ��� ������� ��������� �� ������ ������. ������ �� �������� ��� ���� ����.
		}
		else if(self.voice == 3)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorAngar_03_01");	//�� ������ ������ ��������� ������������� �������� ��� �������. ��� �� ��������� ����� ������.
		}
		else if(self.voice == 5)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorAngar_05_01");	//�� ������ ������ ��������� ������� ������������� ��������. ��� �� � ������� ��� �����.
		};
	}
	else if(self.guild == GIL_TPL)
	{
		if(self.voice == 8)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorAngar_08_01");	//�� ������ ������ ��������� ������� ������������� ��������. ��� �� � ������� ��� �����.
		}
		else if(self.voice == 13)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorAngar_13_01");	//�� ������ ������ ��������� ������� ������������� ��������. ��� �� � ������� ��� �����.
		};
	};
	Info_ClearChoices(info_findnpc_st);
};

func void info_findnpc_st_corkalom()
{
	var C_NPC corkalom;
	AI_Output(other,self,"Info_FindNPC_ST_CorKalom_15_00");	//��� � ���� ����� ��� ������?
	corkalom = Hlp_GetNpc(gur_1201_corkalom);
	if(Npc_GetDistToNpc(self,corkalom) < PERC_DIST_INTERMEDIAT)
	{
		b_pointatnpc(self,other,corkalom);
	}
	else if(self.guild == GIL_NOV)
	{
		if(self.voice == 2)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorKalom_02_01");	//����������� ��������� �� ������ ������ ����� � ������, �� ������� ����� ����. �� �������� ��� ���� � �����.
		}
		else if(self.voice == 3)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorKalom_03_01");	//�������� �� ����� �� ������ ������ ����� ��� �����������. �� ������ ����� �������� ���.
		}
		else if(self.voice == 5)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorKalom_05_01");	//�� ������ ������ ����������� �����������. �� �������� ��� ���� � �����.
		};
	}
	else if(self.guild == GIL_TPL)
	{
		if(self.voice == 8)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorKalom_08_01");	//�� ������ ������ ����������� �����������. �� �������� ��� ���� � �����.
		}
		else if(self.voice == 13)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorKalom_13_01");	//�� ������ ������ ����������� �����������. �� �������� ��� ���� � �����.
		};
	};
	Info_ClearChoices(info_findnpc_st);
};

func void info_findnpc_st_yberion()
{
	var C_NPC yberion;
	AI_Output(other,self,"Info_FindNPC_ST_YBerion_15_00");	//��� � ���� ����� ��������?
	yberion = Hlp_GetNpc(gur_1200_yberion);
	if(Npc_GetDistToNpc(self,yberion) < PERC_DIST_INTERMEDIAT)
	{
		b_pointatnpc(self,other,yberion);
	}
	else if(self.guild == GIL_NOV)
	{
		if(self.voice == 2)
		{
			AI_Output(self,other,"Info_FindNPC_ST_YBerion_02_01");	//������������ ����� � ��������� � �������� �����. �� ������� � ����� ���� �� ������ �������.
		}
		else if(self.voice == 3)
		{
			AI_Output(self,other,"Info_FindNPC_ST_YBerion_03_01");	//��� ������� ����� ��������� ��� ����� ������ �����. �� ������� � ��� ������ � ������ �������.
		}
		else if(self.voice == 5)
		{
			AI_Output(self,other,"Info_FindNPC_ST_YBerion_05_01");	//��� ������� ����� � ��������� �������� �� �����. �� ������� � ��� ������ � ������ �������.
		};
	}
	else if(self.guild == GIL_TPL)
	{
		if(self.voice == 8)
		{
			AI_Output(self,other,"Info_FindNPC_ST_YBerion_08_01");	//��� ������� ����� � ��������� �������� �� �����. �� ������� � ��� ������ � ������ �������.
		}
		else if(self.voice == 13)
		{
			AI_Output(self,other,"Info_FindNPC_ST_YBerion_13_01");	//��� ������� ����� � ��������� �������� �� �����. �� ������� � ��� ������ � ������ �������.
		};
	};
	Info_ClearChoices(info_findnpc_st);
};

func void b_assignfindnpc_st(var C_NPC slf)
{
	info_findnpc_st.npc = Hlp_GetInstanceID(slf);
};

