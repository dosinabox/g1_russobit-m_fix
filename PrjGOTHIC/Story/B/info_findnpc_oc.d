
instance INFO_FINDNPC_OC(C_INFO)
{
	nr = 900;
	condition = info_findnpc_oc_condition;
	information = info_findnpc_oc_info;
	permanent = 1;
	description = "��� ���������...";
};


func int info_findnpc_oc_condition()
{
	return 1;
};

func void info_findnpc_oc_info()
{
	var C_NPC diego;
	var C_NPC thorus;
	Info_ClearChoices(info_findnpc_oc);
	Info_AddChoice(info_findnpc_oc,DIALOG_BACK,info_findnpc_oc_back);
	diego = Hlp_GetNpc(pc_thief);
	if(diego.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(info_findnpc_oc,"...�����?",info_findnpc_oc_diego);
	};
	thorus = Hlp_GetNpc(grd_200_thorus);
	if(thorus.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(info_findnpc_oc,"...�����?",info_findnpc_oc_thorus);
	};
};

func void info_findnpc_oc_back()
{
	Info_ClearChoices(info_findnpc_oc);
};

func void info_findnpc_oc_diego()
{
	var C_NPC diego;
	AI_Output(other,self,"Info_FindNPC_Diego_15_00");	//��� � ���� ����� �����?
	diego = Hlp_GetNpc(pc_thief);
	if(Npc_GetDistToNpc(self,diego) < PERC_DIST_INTERMEDIAT)
	{
		b_pointatnpc(self,other,diego);
	}
	else if(self.guild == GIL_VLK)
	{
		if(self.voice == 1)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Diego_01_01");	//�� ������� ����� ��� � ����� � �����. �� ����� ������������� � �������.
		}
		else if(self.voice == 2)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Diego_02_01");	//������ �� �������� ���� � ����� � ����� ������ � �������.
		}
		else if(self.voice == 3)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Diego_03_01");	//�� ����� � ����� � �����. �� ����� ������������� � �������.
		}
		else if(self.voice == 4)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Diego_04_01");	//�� ������� ����� ��� � ����� � �����. �� ����� ������������� � �������.
		};
	}
	else if(self.guild == GIL_GRD)
	{
		if(self.voice == 6)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Diego_06_01");	//�� ������� ����� ��� � ����� � �����. �� ����� ������������� � �������.
		}
		else if(self.voice == 7)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Diego_07_01");	//�� ����� � ����� � �����. �� ����� ������������� � �������.
		}
		else if(self.voice == 13)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Diego_13_01");	//�� ������� ����� ��� � ����� � �����. �� ����� ������������� � �������.
		};
	}
	else if(self.guild == GIL_STT)
	{
		if(self.voice == 10)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Diego_10_01");	//�� ������� ����� ��� � ����� � �����. �� ����� ������������� � �������.
		}
		else if(self.voice == 12)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Diego_12_01");	//�� ������� ����� ��� � ����� � �����. �� ����� ������������� � �������.
		};
	};
	Info_ClearChoices(info_findnpc_oc);
};

func void info_findnpc_oc_thorus()
{
	var C_NPC thorus;
	AI_Output(other,self,"Info_FindNPC_OC_Thorus_15_00");	//��� � ���� ����� ������?
	thorus = Hlp_GetNpc(grd_200_thorus);
	if(Npc_GetDistToNpc(self,thorus) < PERC_DIST_INTERMEDIAT)
	{
		b_pointatnpc(self,other,thorus);
	}
	else if(self.guild == GIL_VLK)
	{
		if(self.voice == 1)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Thorus_01_01");	//���� �� ������ ����� � ����� �����.
		}
		else if(self.voice == 2)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Thorus_02_01");	//������ �� ����� � ����� � �����.
		}
		else if(self.voice == 3)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Thorus_03_01");	//������ ��� ����� ����� � ����� � �����.
		}
		else if(self.voice == 4)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Thorus_04_01");	//���� �� ������ ����� � ����� �����.
		};
	}
	else if(self.guild == GIL_GRD)
	{
		if(self.voice == 6)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Thorus_06_01");	//���� �� ������ ����� � ����� �����.
		}
		else if(self.voice == 7)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Thorus_07_01");	//������ ��� ����� ����� � ����� � �����.
		}
		else if(self.voice == 13)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Thorus_13_01");	//���� �� ������ ����� � ����� �����.
		};
	}
	else if(self.guild == GIL_STT)
	{
		if(self.voice == 10)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Thorus_10_01");	//���� �� ������ ����� � ����� �����.
		}
		else if(self.voice == 12)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Thorus_12_01");	//���� �� ������ ����� � ����� �����.
		};
	};
	Info_ClearChoices(info_findnpc_oc);
};

func void b_assignfindnpc_oc(var C_NPC slf)
{
	info_findnpc_oc.npc = Hlp_GetInstanceID(slf);
};

