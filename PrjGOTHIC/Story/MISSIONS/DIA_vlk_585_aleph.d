
instance VLK_585_ALEPH_EXIT(C_INFO)
{
	npc = vlk_585_aleph;
	nr = 999;
	condition = vlk_585_aleph_exit_condition;
	information = vlk_585_aleph_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int vlk_585_aleph_exit_condition()
{
	return 1;
};

func void vlk_585_aleph_exit_info()
{
	if(!Npc_KnowsInfo(hero,grd_261_brandick_aleph))
	{
		AI_Output(other,self,"VLK_585_Aleph_Exit_Info_15_01");	//����� �����!
		AI_Output(self,other,"VLK_585_Aleph_Exit_Info_05_02");	//�� ������, ��� ���� �����.
	};
	AI_StopProcessInfos(self);
};


instance VLK_585_ALEPH_CLEVER(C_INFO)
{
	npc = vlk_585_aleph;
	condition = vlk_585_aleph_clever_condition;
	information = vlk_585_aleph_clever_info;
	important = 1;
	permanent = 0;
};


func int vlk_585_aleph_clever_condition()
{
	return 1;
};

func void vlk_585_aleph_clever_info()
{
	AI_Output(self,other,"VLK_585_Aleph_CLEVER_Info_05_01");	//��-��-��, ��������� ������� �� ������� ����!
};


instance VLK_585_ALEPH_GUARDS(C_INFO)
{
	npc = vlk_585_aleph;
	condition = vlk_585_aleph_guards_condition;
	information = vlk_585_aleph_guards_info;
	important = 0;
	permanent = 0;
	description = "� ��� �� ��������?";
};


func int vlk_585_aleph_guards_condition()
{
	if(Npc_KnowsInfo(hero,vlk_585_aleph_clever))
	{
		return 1;
	};
};

func void vlk_585_aleph_guards_info()
{
	AI_Output(other,self,"VLK_585_Aleph_GUARDS_Info_15_01");	//� ��� �� ��������?
	AI_Output(self,other,"VLK_585_Aleph_GUARDS_Info_05_02");	//� ������� ������ �����, ����� ��� �������� ������� ������. ��� ��������� ����� � ��������� ������ ������.
	AI_Output(other,self,"VLK_585_Aleph_GUARDS_Info_15_03");	//�����, ��� ��� ����� ���� �����������. ����� ��� ����?
	AI_Output(self,other,"VLK_585_Aleph_GUARDS_Info_05_04");	//�������, �� ����, � ������� ��� �� ���� ����, ��� ��� �����. �� ������ �� �������, ��� ��� ���������� ��������.
	AI_Output(self,other,"VLK_585_Aleph_GUARDS_Info_05_05");	//� ������ � ����� ��������� �������. ���� ���������� ����� �����������. � ���� � �����, ��������, ���� ����? ��, ������, 10 ������.
};


instance VLK_585_ALEPH_INFO(C_INFO)
{
	npc = vlk_585_aleph;
	condition = vlk_585_aleph_info_condition;
	information = vlk_585_aleph_info_info;
	important = 0;
	permanent = 0;
	description = "(���� 10 ������ ����)";
};


func int vlk_585_aleph_info_condition()
{
	if((Npc_HasItems(hero,itminugget) >= 10) && Npc_KnowsInfo(hero,vlk_585_aleph_guards))
	{
		return 1;
	};
};

func void vlk_585_aleph_info_info()
{
	AI_Output(other,self,"VLK_585_Aleph_INFO_Info_15_01");	//������, ������ ������ ������.
	b_printtrademsg1("������ ����: 10");
	b_giveinvitems(other,self,itminugget,10);
	AI_Output(self,other,"VLK_585_Aleph_INFO_Info_05_02");	//�������. ���� �� ��������� � ������� ����� ����� � ���������� ����, �� ������� ��� ������.
	AI_Output(self,other,"VLK_585_Aleph_INFO_Info_05_03");	//� ����� �� ��� ����� ������ ��������. ��� �� ����� ������ �����.
	AI_Output(self,other,"VLK_585_Aleph_INFO_Info_05_04");	//���� ���� �������, �� ������� ����� �������, �� ���� ���������, ��� ������� �������.
	AI_Output(self,other,"VLK_585_Aleph_INFO_Info_05_05");	//���� �������� ������ ���-������ ���, ������� �� ���, �� � ����� ���� ������...
};


instance VLK_585_ALEPH_ANGRY(C_INFO)
{
	npc = vlk_585_aleph;
	condition = vlk_585_aleph_angry_condition;
	information = vlk_585_aleph_angry_info;
	important = 1;
	permanent = 0;
};


func int vlk_585_aleph_angry_condition()
{
	if(Npc_KnowsInfo(hero,grd_261_brandick_aleph))
	{
		return 1;
	};
};

func void vlk_585_aleph_angry_info()
{
	AI_Output(self,other,"VLK_585_Aleph_ANGRY_Info_05_01");	//�� ��������� ��� ��������! �����, ���������!
	AI_StopProcessInfos(self);
	Npc_SetTempAttitude(self,ATT_ANGRY);
};


instance VLK_585_ALEPH_KEY(C_INFO)
{
	npc = vlk_585_aleph;
	condition = vlk_585_aleph_key_condition;
	information = vlk_585_aleph_key_info;
	important = 0;
	permanent = 0;
	description = "���� �����-������ �������? ����������?";
};


func int vlk_585_aleph_key_condition()
{
	if(!Npc_KnowsInfo(hero,grd_261_brandick_aleph) && Npc_KnowsInfo(hero,vlk_585_aleph_info))
	{
		return 1;
	};
};

func void vlk_585_aleph_key_info()
{
	AI_Output(other,self,"VLK_585_Aleph_KEY_Info_15_01");	//���� �����-������ �������? ����������?
	AI_Output(self,other,"VLK_585_Aleph_KEY_Info_05_02");	//� � ���� ��� ���� ����?
};


instance VLK_585_ALEPH_GLEN(C_INFO)
{
	npc = vlk_585_aleph;
	condition = vlk_585_aleph_glen_condition;
	information = vlk_585_aleph_glen_info;
	important = 0;
	permanent = 0;
	description = "(���� 10 ������ ����)";
};


func int vlk_585_aleph_glen_condition()
{
	if((Npc_HasItems(hero,itminugget) >= 10) && Npc_KnowsInfo(hero,vlk_585_aleph_key))
	{
		return 1;
	};
};

func void vlk_585_aleph_glen_info()
{
	AI_Output(other,self,"VLK_585_Aleph_GLEN_Info_15_01");	//�������, �� ��� ������ ������ �� ���������� ��� ���-������ �������.
	b_printtrademsg1("������ ����: 10");
	b_giveinvitems(other,self,itminugget,10);
	AI_Output(self,other,"VLK_585_Aleph_GLEN_Info_05_02");	//����� ����� ����� �������� ��������. ������� ����� ������ � �������� �� ����� ����. �� ������� ��� �������.
	Log_CreateTopic(GE_TRADEROM,LOG_NOTE);
	b_logentry(GE_TRADEROM,"�� ��������� ����� ���� ��������� ���, ��� ������� �� ����� ���� ������� �������.");
};

func void b_aleph_storageshedkey()
{
	b_logentry(CH2_STORAGESHED,"���� ������ ��� ���� �� ������ �� ������!");
};


instance VLK_585_ALEPH_SCHUPPEN(C_INFO)
{
	npc = vlk_585_aleph;
	condition = vlk_585_aleph_schuppen_condition;
	information = vlk_585_aleph_schuppen_info;
	important = 0;
	permanent = 1;
	description = "�� ������ ���-������ � ����� � ������ �� ������?";
};


func int vlk_585_aleph_schuppen_condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_drunk) && !Npc_KnowsInfo(hero,grd_261_brandick_aleph) && ALEPH_KEY == FALSE && Npc_KnowsInfo(hero,vlk_585_aleph_guards))
	{
		return 1;
	};
};

func void vlk_585_aleph_schuppen_info()
{
	AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_Info_15_01");	//�� ������ ���-������ � ����� � ������ �� ������?
	AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_Info_05_02");	//��, ��� ������� ��...
	AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_Info_15_03");	//�� ����, ������� � �������?
	AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_Info_05_04");	//���, �� ������ �������.
	Info_ClearChoices(vlk_585_aleph_schuppen);
	Info_AddChoice(vlk_585_aleph_schuppen,DIALOG_BACK,vlk_585_aleph_schuppen_back);
	Info_AddChoice(vlk_585_aleph_schuppen,"��������� 50 ������.",vlk_585_aleph_schuppen_50);
	Info_AddChoice(vlk_585_aleph_schuppen,"��������� 30 ������.",vlk_585_aleph_schuppen_30);
	Info_AddChoice(vlk_585_aleph_schuppen,"��������� 15 ������.",vlk_585_aleph_schuppen_15);
};

func void vlk_585_aleph_schuppen_50()
{
	if(Npc_HasItems(hero,itminugget) >= 50)
	{
		AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_50_15_01");	//50 ������ ���� ������?
		b_printtrademsg1("������ ����: 50");
		b_giveinvitems(other,self,itminugget,50);
		AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_50_05_02");	//���� �������� �����������! ������ ����. � ��� ������ ��� ������. ��� ���� ���� ���������� �� �������.
		b_printtrademsg2("������� ���� �� ������� � ������ ����.");
		CreateInvItems(other,itke_om_03,1);
		CreateInvItems(other,staerkering,1);
		Info_ClearChoices(vlk_585_aleph_schuppen);
		ALEPH_KEY = TRUE;
		b_aleph_storageshedkey();
	}
	else
	{
		AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_50_05_03");	//� ���� �� ��� ����!
	};
};

func void vlk_585_aleph_schuppen_30()
{
	if(Npc_HasItems(hero,itminugget) >= 30)
	{
		Info_ClearChoices(vlk_585_aleph_schuppen);
		AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_30_15_01");	//��������� 30 ������.
		b_printtrademsg1("������ ����: 30");
		b_giveinvitems(other,self,itminugget,30);
		AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_30_05_02");	//������. � ���� ��� ��� ���� ����. ���������� ��������, ������.
		b_printtrademsg2("������� ���� �� �������.");
		CreateInvItem(self,itke_om_03);
		b_giveinvitems(self,other,itke_om_03,1);
		ALEPH_KEY = TRUE;
		b_aleph_storageshedkey();
	}
	else
	{
		AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_30_05_03");	//�� �������� ��, ���� ���!
	};
};

func void vlk_585_aleph_schuppen_15()
{
	AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_15_15_01");	//���� ������� 15 ������?
	AI_Output(self,other,"VLK_585_Aleph_SCHUPPEN_15_05_02");	//15 ������? ������� �� ����� �������� �����!
};

func void vlk_585_aleph_schuppen_back()
{
	Info_ClearChoices(vlk_585_aleph_schuppen);
};


instance VLK_585_ALEPH_DIRTY(C_INFO)
{
	npc = vlk_585_aleph;
	condition = vlk_585_aleph_dirty_condition;
	information = vlk_585_aleph_dirty_info;
	important = 0;
	permanent = 1;
	description = "�� ������ ���-������ � ����� � ������ �� ������?";
};


func int vlk_585_aleph_dirty_condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_drunk) && Npc_KnowsInfo(hero,grd_261_brandick_aleph) && ALEPH_KEY == FALSE && Npc_KnowsInfo(hero,vlk_585_aleph_guards))
	{
		return 1;
	};
};

func void vlk_585_aleph_dirty_info()
{
	AI_Output(other,self,"VLK_585_Aleph_DIRTY_Info_15_01");	//�� ������ ���-������ � ����� � ������ �� ������?
	AI_Output(self,other,"VLK_585_Aleph_DIRTY_Info_05_02");	//��, �� �� ������, ��� �������...
	AI_Output(other,self,"VLK_585_Aleph_DIRTY_Info_15_03");	//�� ����, ������� � �������?
	AI_Output(self,other,"VLK_585_Aleph_DIRTY_Info_05_04");	//�� ������ ��� ���������. ��� ����� 100 ������.
	Info_ClearChoices(vlk_585_aleph_dirty);
	Info_AddChoice(vlk_585_aleph_dirty,"(��������� 100 ������ ����)",vlk_585_aleph_dirty_100);
	Info_AddChoice(vlk_585_aleph_dirty,"(�� �������)",vlk_585_aleph_dirty_no);
};

func void vlk_585_aleph_dirty_100()
{
	if(Npc_HasItems(hero,itminugget) >= 100)
	{
		b_printtrademsg1("������ ����: 100");
		b_giveinvitems(hero,self,itminugget,100);
		AI_Output(other,self,"VLK_585_Aleph_DIRTY_100_Info_15_01");	//�� ���� ������ ��������. ����� �� ���� 100 ������.
		AI_Output(self,other,"VLK_585_Aleph_DIRTY_100_Info_05_02");	//������� �����������! �� ���� ��������. ����� ���� ����.
		b_printtrademsg2("������� ���� �� �������.");
		CreateInvItem(self,itke_om_03);
		b_giveinvitems(self,other,itke_om_03,1);
		Info_ClearChoices(vlk_585_aleph_dirty);
		ALEPH_KEY = TRUE;
		b_aleph_storageshedkey();
	}
	else
	{
		AI_Output(self,other,"VLK_585_Aleph_DIRTY_100_Info_05_03");	//�� �� ���� ���� ����������? 100 ������ � �� ����� ������!
	};
};

func void vlk_585_aleph_dirty_no()
{
	AI_Output(other,self,"VLK_585_Aleph_DIRTY_NO_Info_15_01");	//��� ������ - �� ��� �� ����� ���������. � �� ������!
	AI_Output(self,other,"VLK_585_Aleph_DIRTY_NO_Info_05_02");	//��, � ������� �� ������� ������. ��� �� �� ��� ��� ����� ���������!..
	Info_ClearChoices(vlk_585_aleph_dirty);
};

