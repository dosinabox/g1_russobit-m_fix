
instance ORG_818_RATFORD_EXIT(C_INFO)
{
	npc = org_818_ratford;
	nr = 999;
	condition = org_818_ratford_exit_condition;
	information = org_818_ratford_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int org_818_ratford_exit_condition()
{
	return 1;
};

func void org_818_ratford_exit_info()
{
	AI_StopProcessInfos(self);
};


instance ORG_818_RATFORD_WRONGWAY(C_INFO)
{
	npc = org_818_ratford;
	nr = 1;
	condition = org_818_ratford_wrongway_condition;
	information = org_818_ratford_wrongway_info;
	permanent = 0;
	important = 1;
};


func int org_818_ratford_wrongway_condition()
{
	return 1;
};

func void org_818_ratford_wrongway_info()
{
	AI_Output(self,other,"Org_818_Ratford_WrongWay_07_00");	//��, ��!
	AI_Output(other,self,"Org_818_Ratford_WrongWay_15_01");	//��� ���� �����?
	AI_Output(self,other,"Org_818_Ratford_WrongWay_07_02");	//���� ������������ ����. ����� �� ���� ���������� ��������� ������.
};


instance ORG_818_RATFORD_WHATGAME(C_INFO)
{
	npc = org_818_ratford;
	nr = 1;
	condition = org_818_ratford_whatgame_condition;
	information = org_818_ratford_whatgame_info;
	permanent = 0;
	description = "� �� ���� ����� ����� ���������?";
};


func int org_818_ratford_whatgame_condition()
{
	return 1;
};

func void org_818_ratford_whatgame_info()
{
	AI_Output(other,self,"Org_818_Ratford_WhatGame_15_00");	//� �� ���� ����� ����� ���������?
	AI_Output(self,other,"Org_818_Ratford_WhatGame_07_01");	//�� �����������. �� �������� ����, � ���� �� �� �� ��� �� ������ �������. ����� ������ ����� ���.
	AI_Output(other,self,"Org_818_Ratford_WhatGame_15_02");	//��? � ��� ��� �������?
	AI_Output(self,other,"Org_818_Ratford_WhatGame_07_03");	//������ ����� ��������� ������. �� � ���� ������� ����� �����������.
};


instance ORG_818_RATFORD_WHYDANGEROUS(C_INFO)
{
	npc = org_818_ratford;
	nr = 1;
	condition = org_818_ratford_whydangerous_condition;
	information = org_818_ratford_whydangerous_info;
	permanent = 0;
	description = "������ ��� ����� ��������� ��������?";
};


func int org_818_ratford_whydangerous_condition()
{
	if(Npc_KnowsInfo(hero,org_818_ratford_whatgame))
	{
		return 1;
	};
};

func void org_818_ratford_whydangerous_info()
{
	AI_Output(other,self,"Org_818_Ratford_WhyDangerous_15_00");	//������ ��� ����� ��������� ��������?
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_01");	//�� ������ ��� ������, ��? � ������� ��� ���������� ����, ������ ��� ���� �����-�� ���������.
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_02");	//�� ������� ����� �������� �� ��� ������, �� ���� ��� ���� ����� ��������� ���� ������ ��� ������, ��� ������� �� ������� ������ �������.
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_03");	//� ���� �� ��� �� ��������, ���� � ���� ��� �� �������� �������, �� �������� ������.
};


instance ORG_818_RATFORD_WOEQUIPMENT(C_INFO)
{
	npc = org_818_ratford;
	nr = 1;
	condition = org_818_ratford_woequipment_condition;
	information = org_818_ratford_woequipment_info;
	permanent = 0;
	description = "��� � ���� ����� ������� ������� � ������?";
};


func int org_818_ratford_woequipment_condition()
{
	if(Npc_KnowsInfo(hero,org_818_ratford_whydangerous))
	{
		return 1;
	};
};

func void org_818_ratford_woequipment_info()
{
	AI_Output(other,self,"Org_818_Ratford_WoEquipment_15_00");	//��� � ���� ����� ������� ������� � ������?
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_01");	//� ��������� � �������. ������ �������� �� ������� ������. ��� �� ������ � ��� ����� ��� �������.
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_02");	//�� � ����� ������, �� �������� �� ������, ���� ����� �� ��� ������, ����, �������, ����� ������ �����.
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_03");	//���� ������� � ������ ������, ����� ��������. �� ���� �� ���. � ���� �� ������� ������ ������� ����� �� ������ ����.
	if(MORDRAG_TRADED == 0)
	{
		Log_CreateTopic(GE_TRADEROC,LOG_NOTE);
		b_logentry(GE_TRADEROC,"��� ������� ������� � ������ ������ ���� ������ �� �������� �����.");
		MORDRAG_TRADED = 1;
	};
};


instance ORG_818_RATFORD_MORELOCATIONS(C_INFO)
{
	npc = org_818_ratford;
	nr = 1;
	condition = org_818_ratford_morelocations_condition;
	information = org_818_ratford_morelocations_info;
	permanent = 0;
	description = "�������� ��� � ���, ��� ��������� � ���� �������.";
};


func int org_818_ratford_morelocations_condition()
{
	if(Npc_KnowsInfo(hero,org_818_ratford_woequipment))
	{
		return 1;
	};
};

func void org_818_ratford_morelocations_info()
{
	AI_Output(other,self,"Org_818_Ratford_MoreLocations_15_00");	//�������� ��� � ���, ��� ��������� � ���� �������.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_01");	//����� ������ ����� ������ �� ������ ������ � �������, ����� ������ �����. ��� �� �������� ������ �������������.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_02");	//� ���� � ���� ������� � ������� ����������, ������� ����� ������� �� ���������. ��� ������� � ������ �������.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_03");	//������� ������ ��������. ����� �� ����� �����. ����������� �� ��� - ������ ����������, ���������� �� ������ ������ ����� � ������. ������ ����� ��������� � ��������� ��������� �����.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_04");	//������ � ����� ������ ����� ��� ��������� ����� ��� ���� ����� ������� ������. � ����� �� ����� ���� ������ ����� ��������� ��������.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_05");	//� ��� ��������� �����: �� ����� ������� �� ������� �����!
};


instance ORG_818_RATFORD_WOKARTE(C_INFO)
{
	npc = org_818_ratford;
	nr = 1;
	condition = org_818_ratford_wokarte_condition;
	information = org_818_ratford_wokarte_info;
	permanent = 0;
	description = "��� ��� ������� �����?";
};


func int org_818_ratford_wokarte_condition()
{
	if(Npc_KnowsInfo(hero,org_818_ratford_morelocations))
	{
		return 1;
	};
};

func void org_818_ratford_wokarte_info()
{
	AI_Output(other,self,"Org_818_Ratford_WoKarte_15_00");	//��� ��� ������� �����?
	AI_Output(self,other,"Org_818_Ratford_WoKarte_07_01");	//������ �� ���� ����� �� ������� ������. ��-�����, ��� ��� ���� ���������.
	AI_Output(self,other,"Org_818_Ratford_WoKarte_07_02");	//�����, � ���� ���������� ������� � ���� �����-������ �����. � �����, � ���� ����� ����� � ��� ����?
	Info_ClearChoices(org_818_ratford_wokarte);
	Info_AddChoice(org_818_ratford_wokarte,"���� � ������� ����� ���������, � ������ ���, ��� ����� ������.",org_818_ratford_wokarte_stehlen);
	Info_AddChoice(org_818_ratford_wokarte,"� ����� ��� ����? ����� �� �� ������� ��?",org_818_ratford_wokarte_kaufen);
};

func void org_818_ratford_wokarte_stehlen()
{
	var C_NPC lares;
	AI_Output(other,self,"Org_818_Ratford_WoKarte_Stehlen_15_00");	//���� � ���� ��������� ������� ����� ���������, �� � ������ �������, ������� ����� ������.
	AI_Output(self,other,"Org_818_Ratford_WoKarte_Stehlen_07_01");	//� �� ��� ���������! ���� �����, �� �������� �������������� � ������ ������? ���� ������� ����, ����� �����. �� ��������� ����� �����. �����, � ���� �������� ��� ���� ������.
	lares = Hlp_GetNpc(org_801_lares);
	lares.aivar[AIV_FINDABLE] = TRUE;
	Info_ClearChoices(org_818_ratford_wokarte);
};

func void org_818_ratford_wokarte_kaufen()
{
	AI_Output(other,self,"Org_818_Ratford_WoKarte_Kaufen_15_00");	//� ����� ��� ����? ����� �� �� ������� ��?
	AI_Output(self,other,"Org_818_Ratford_WoKarte_Kaufen_07_01");	//��, �� ��� �������� ������ �� ��� �� ���� ����...
	Info_ClearChoices(org_818_ratford_wokarte);
};


instance ORG_818_RATFORD_THANKS(C_INFO)
{
	npc = org_818_ratford;
	nr = 888;
	condition = org_818_ratford_thanks_condition;
	information = org_818_ratford_thanks_info;
	permanent = 0;
	description = "������� �� ������.";
};


func int org_818_ratford_thanks_condition()
{
	if(Npc_KnowsInfo(hero,org_818_ratford_morelocations))
	{
		return 1;
	};
};

func void org_818_ratford_thanks_info()
{
	AI_Output(other,self,"Org_818_Ratford_Thanks_15_00");	//������� �� ������.
	AI_Output(self,other,"Org_818_Ratford_Thanks_07_01");	//������ �� �����, ��� ����� ��� ����� ���� ������ ����!
	AI_Output(self,other,"Org_818_Ratford_Thanks_07_02");	//�������, � ������� �������� ������, �� ��������� ����� ����� ���� ������ ������, ��� �� ������������ ���� �����.
	AI_Output(other,self,"Org_818_Ratford_Thanks_15_04");	//� ��� �������.
};

instance ORG_818_RATFORD_QUEST1(C_INFO)
{
	npc = org_818_ratford;
	nr = 1;
	condition = org_818_ratford_quest1_condition;
	information = org_818_ratford_quest1_info;
	permanent = 0;
	description = "� ��� �����, ����� ���� ��� � ����� �� ����?";
};


func int org_818_ratford_quest1_condition()
{
	if(Npc_KnowsInfo(hero,org_818_ratford_wokarte))
	{
		return 1;
	};
};

func void org_818_ratford_quest1_info()
{
	AI_Output(other,self,"Info_Jackal_Hello_WhatDoIGet_15_00");	//� ��� �����, ����� ���� ��� � ����� �� ����?
	AI_Output(self,other,"Info_Jackal_PermPaid_07_01");	//�� ������ ������������ �� ��� ������!
	Log_CreateTopic(RATFORDMAPS,LOG_MISSION);
	Log_SetTopicStatus(RATFORDMAPS,LOG_RUNNING);
	b_logentry(RATFORDMAPS,"�������� ����� ����� �������. ���� � ���� ����� ���������� ����, �� � ����� ������ �� � ������ ������. � ���� �� �����, �� � ���-������ ��������...");
};

instance ORG_818_RATFORD_QUEST2(C_INFO)
{
	npc = org_818_ratford;
	nr = 1;
	condition = org_818_ratford_quest2_condition;
	information = org_818_ratford_quest2_info;
	permanent = 1;
	description = "(������ �����)";
};


func int org_818_ratford_quest2_condition()
{
	if(Npc_KnowsInfo(hero,org_818_ratford_quest1) && ((Npc_HasItems(hero,itwrworldmap) && RATFORD_ITWRWORLDMAP == FALSE) || (Npc_HasItems(hero,itwrommap) && RATFORD_ITWROMMAP == FALSE) || (Npc_HasItems(hero,itwrfocusmappsi) && (RATFORD_ITWRFOCUSMAPPSI == FALSE)) || Npc_HasItems(hero,itwrfocimap)))
	{
		return 1;
	};
};

func void org_818_ratford_quest2_info()
{
	Info_ClearChoices(org_818_ratford_quest2);
	Info_AddChoice(org_818_ratford_quest2,DIALOG_BACK,org_818_ratford_back);
	if(Npc_HasItems(hero,itwrworldmap) && (RATFORD_ITWRWORLDMAP == FALSE))
	{
		Info_AddChoice(org_818_ratford_quest2,"...�������.",org_818_ratford_itwrworldmap);
	};
	if(Npc_HasItems(hero,itwrommap) && (RATFORD_ITWROMMAP == FALSE))
	{
		Info_AddChoice(org_818_ratford_quest2,"...������ � ������ �����.",org_818_ratford_itwrommap);
	};
	if(Npc_HasItems(hero,itwrfocusmappsi) && (RATFORD_ITWRFOCUSMAPPSI == FALSE))
	{
		Info_AddChoice(org_818_ratford_quest2,"...��������.",org_818_ratford_itwrfocusmappsi);
	};
	if(Npc_HasItems(hero,itwrfocimap))
	{
		Info_AddChoice(org_818_ratford_quest2,"...��������.",org_818_ratford_itwrfocimap);
	};
};

func void org_818_ratford_back()
{
	Info_ClearChoices(org_818_ratford_quest2);
	Npc_RemoveInvItem(self,itwrommap);
	Npc_RemoveInvItem(self,itwrfocusmappsi);
};

func void org_818_ratford_itwrworldmap()
{
	AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_04");	//� ��������� � ����� ��������.
	b_printtrademsg1("������ ����� �������.");
	CreateInvItem(self,itwrworldmap);
	AI_UseItemToState(self,itwrworldmap,1);
	AI_Wait(self,2);
	AI_UseItemToState(self,itwrworldmap,-1);
	AI_Output(self,other,"VLK_584_Snipes_DEAL_RUN_Info_07_02");	//������, �� �������� ��.
	b_printtrademsg2("�������� 4 ������� �����.");
	b_giveinvitems(other,self,itwrworldmap,1);
	CreateInvItems(self,itat_wolf_01,4);
	b_giveinvitems(self,other,itat_wolf_01,4);
	b_logentry(RATFORDMAPS,"� ����� �������� ����� �������, � ������ ������� ��������� ������� ����.");
	Log_SetTopicStatus(RATFORDMAPS,LOG_SUCCESS);
	RATFORD_ITWRWORLDMAP = TRUE;
	b_givexp(200);
};

func void org_818_ratford_itwrommap()
{
	AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_04");	//� ��������� � ����� ��������.
	b_printtrademsg1("������ ����� ������ � ������ �����.");
	CreateInvItem(self,itwrommap);
	AI_UseItemToState(self,itwrommap,1);
	AI_Wait(self,1);
	AI_UseItemToState(self,itwrommap,-1);
	AI_Output(self,other,"SVM_7_OkayKeepIt");	//������, ������! ������ ����!
	b_printtrademsg2("�������� ����� ������ � ������ �����.");
	b_logentry(RATFORDMAPS,"����� ������ � ������ ����� ������� ����.");
	RATFORD_ITWROMMAP = TRUE;
	b_givexp(40);
};

func void org_818_ratford_itwrfocusmappsi()
{
	AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_04");	//� ��������� � ����� ��������.
	b_printtrademsg1("������ ����� ��������.");
	CreateInvItem(self,itwrfocusmappsi);
	AI_UseItemToState(self,itwrfocusmappsi,1);
	AI_Wait(self,1);
	AI_UseItemToState(self,itwrfocusmappsi,-1);
	AI_Output(self,other,"SVM_7_YouCanKeeptheCrap");	//��, �����, ������ ����! � � ����� ���� ���-�� ������.
	b_printtrademsg2("�������� ����� ��������.");
	b_logentry(RATFORDMAPS,"����� �������� �� �������� ��� �����.");
	RATFORD_ITWRFOCUSMAPPSI = TRUE;
	b_givexp(40);
};

func void org_818_ratford_itwrfocimap()
{
	AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_04");	//� ��������� � ����� ��������.
	b_printtrademsg1("������ ����� ��������.");
	CreateInvItem(self,itwrfocimap);
	AI_UseItemToState(self,itwrfocimap,1);
	AI_Wait(self,2);
	AI_UseItemToState(self,itwrfocimap,-1);
	AI_Output(self,other,"VLK_584_Snipes_DEAL_RUN_Info_07_02");	//������, �� �������� ��.
	b_printtrademsg2("�������� 4 ������� �����.");
	b_giveinvitems(other,self,itwrfocimap,1);
	CreateInvItems(self,itat_wolf_01,4);
	b_giveinvitems(self,other,itat_wolf_01,4);
	b_logentry(RATFORDMAPS,"���� ����� �������� � �������� ������, �� �������� ��� ����� ����� �������.");
	Log_SetTopicStatus(RATFORDMAPS,LOG_SUCCESS);
	b_givexp(200);
};

