
instance GRD_271_ULBERT_EXIT(C_INFO)
{
	npc = grd_271_ulbert;
	nr = 999;
	condition = grd_271_ulbert_exit_condition;
	information = grd_271_ulbert_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int grd_271_ulbert_exit_condition()
{
	return 1;
};

func void grd_271_ulbert_exit_info()
{
	AI_StopProcessInfos(self);
};


instance GRD_271_ULBERT_KEY(C_INFO)
{
	npc = grd_271_ulbert;
	condition = grd_271_ulbert_key_condition;
	information = grd_271_ulbert_key_info;
	important = 0;
	permanent = 0;
	description = "��� �������� �� ������?";
};


func int grd_271_ulbert_key_condition()
{
	return 1;
};

func void grd_271_ulbert_key_info()
{
	AI_Output(other,self,"GRD_271_ULBERT_KEY_Info_15_01");	//��� �������� �� ������?
	AI_Output(self,other,"GRD_271_ULBERT_KEY_Info_07_02");	//��� ���� �� ��������.
};


instance GRD_271_ULBERT_TRICK(C_INFO)
{
	npc = grd_271_ulbert;
	condition = grd_271_ulbert_trick_condition;
	information = grd_271_ulbert_trick_info;
	important = 0;
	permanent = 0;
	description = "� �� ����� ����� ������. ������ ����?";
};


func int grd_271_ulbert_trick_condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_key))
	{
		return 1;
	};
};

func void grd_271_ulbert_trick_info()
{
	AI_Output(other,self,"GRD_271_ULBERT_TRICK_Info_15_01");	//� �� ����� ����� ������. ������ ����?
	AI_Output(self,other,"GRD_271_ULBERT_TRICK_Info_07_02");	//�� ����! ��, � ������������� �� ���-������ �����. � � ���� ���� � ����� ���-������?
	Log_CreateTopic(CH2_STORAGESHED,LOG_MISSION);
	Log_SetTopicStatus(CH2_STORAGESHED,LOG_RUNNING);
	b_logentry(CH2_STORAGESHED,"�������� ������� �������� ����� �� ������ � ������ �����. � ������ ����� ��� �����-������ �������!");
};


instance GRD_271_ULBERT_DRINK(C_INFO)
{
	npc = grd_271_ulbert;
	condition = grd_271_ulbert_drink_condition;
	information = grd_271_ulbert_drink_info;
	important = 0;
	permanent = 0;
	description = "(��������)";
};


func int grd_271_ulbert_drink_condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_trick) && (Npc_HasItems(hero,itfobeer) || Npc_HasItems(hero,itfowine) || Npc_HasItems(hero,itfobooze)))
	{
		return 1;
	};
};

func void grd_271_ulbert_drink_info()
{
	AI_Output(other,self,"GRD_271_ULBERT_DRINK_Info_15_01");	//���, ����� ��� �� ��� ��������!
	AI_Output(self,other,"GRD_271_ULBERT_DRINK_Info_07_02");	//�������.
	if(Npc_HasItems(hero,itfobeer))
	{
		b_printtrademsg1("������ ����.");
		b_giveinvitems(hero,self,itfobeer,1);
		if(c_bodystatecontains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,itfobeer);
	}
	else if(Npc_HasItems(hero,itfowine))
	{
		b_printtrademsg1("������ ����.");
		b_giveinvitems(hero,self,itfowine,1);
		if(c_bodystatecontains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,itfowine);
	}
	else if(Npc_HasItems(hero,itfobooze))
	{
		b_printtrademsg1("����� �����.");
		b_giveinvitems(hero,self,itfobooze,1);
		if(c_bodystatecontains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,itfobooze);
	};
};


instance GRD_271_ULBERT_DRUNK(C_INFO)
{
	npc = grd_271_ulbert;
	condition = grd_271_ulbert_drunk_condition;
	information = grd_271_ulbert_drunk_info;
	important = 0;
	permanent = 0;
	description = "��� �� ������ �������, ��� �������� �� ������?";
};


func int grd_271_ulbert_drunk_condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_drink))
	{
		return 1;
	};
};

func void grd_271_ulbert_drunk_info()
{
	AI_Output(other,self,"GRD_271_ULBERT_DRUNK_Info_15_01");	//��� �� ������ �������, ��� �������� �� ������?
	AI_Output(self,other,"GRD_271_ULBERT_DRUNK_Info_07_02");	//��, ��������� �������� � ���������. ������ ��� ���� �� ��� ��� ����� ���������.
	AI_Output(other,self,"GRD_271_ULBERT_DRUNK_Info_15_03");	//���������?
	AI_Output(self,other,"GRD_271_ULBERT_DRUNK_Info_07_04");	//��. �����, ��� ����� ����� �� ��������. ��� ������ �� ����� ��������.
	b_logentry(CH2_STORAGESHED,"����� � ������ �������� �������, �� ��������� ���, ��� ������� ���� �� ������. ����� ����, ����, �������, ���-�� ����� �� ����?");
};


instance GRD_271_ULBERT_LOCK(C_INFO)
{
	npc = grd_271_ulbert;
	condition = grd_271_ulbert_lock_condition;
	information = grd_271_ulbert_lock_info;
	important = 0;
	permanent = 0;
	description = "(������� ��������)";
};


func int grd_271_ulbert_lock_condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_drunk))
	{
		return 1;
	};
};

func void grd_271_ulbert_lock_info()
{
	AI_Output(other,self,"GRD_271_ULBERT_LOCK_Info_15_01");	//������, �� � ��������� ����� ����� � ���� ������� ����.
	AI_Output(self,other,"GRD_271_ULBERT_LOCK_Info_07_02");	//���? ��� ����? ��, ��� � ����� � ������ ���� ����.
	self.aivar[AIV_ITEMSCHWEIN] = FALSE;
	b_logentry(CH2_STORAGESHED,"� ���� ����� ������� ��������. �� ���� �� ������!");
	Npc_ExchangeRoutine(self,"away");
	AI_StopProcessInfos(self);
};


instance GRD_271_ULBERT_ANGRY(C_INFO)
{
	npc = grd_271_ulbert;
	condition = grd_271_ulbert_angry_condition;
	information = grd_271_ulbert_angry_info;
	important = 1;
	permanent = 0;
};


func int grd_271_ulbert_angry_condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_lock) && (Npc_GetDistToWP(hero,"OM_CAVE1_49") < 600))
	{
		return TRUE;
	};
};

func void grd_271_ulbert_angry_info()
{
	AI_Output(self,other,"GRD_271_ULBERT_ANGRY_Info_07_01");	//��, ��, �� ���� ��� �������� ����!
	AI_Output(other,self,"GRD_271_ULBERT_ANGRY_Info_15_02");	//�... �... ��������, � ������! ����� �������� ���!
	self.aivar[AIV_ITEMSCHWEIN] = TRUE;
	b_givexp(XP_LUREULBERTAWAY);
	b_logentry(CH2_STORAGESHED,"� ����� �������� ��������. �� �� ��� ��� �� �����, ��� � ������� ���. ����� ������� ������!");
	Log_SetTopicStatus(CH2_STORAGESHED,LOG_SUCCESS);
	Npc_ExchangeRoutine(self,"start");
	AI_StopProcessInfos(self);
};

