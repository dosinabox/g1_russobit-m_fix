
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
	return 1;
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
	Log_CreateTopic(GE_TRADEROC,LOG_NOTE);
	b_logentry(GE_TRADEROC,"��� ������� ������� � ������ ������ ���� ������ �� �������� �����.");
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
	if(Npc_KnowsInfo(hero,org_818_ratford_whydangerous))
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
	if(Npc_KnowsInfo(hero,org_818_ratford_whydangerous))
	{
		return 1;
	};
};

func void org_818_ratford_wokarte_info()
{
	AI_Output(other,self,"Org_818_Ratford_WoKarte_15_00");	//��� ��� ������� �����?
	AI_Output(self,other,"Org_818_Ratford_WoKarte_07_01");	//������ �� ���� ����� �� ������� ������. ��-�����, ��� ��� ���� ���������.
	AI_Output(self,other,"Org_818_Ratford_WoKarte_07_02");	//�����, � ���� ���������� ������� � ���� �����-������ �����. �, �����, � ���� ����� ����� � ��� ����?
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
	return 1;
};

func void org_818_ratford_thanks_info()
{
	AI_Output(other,self,"Org_818_Ratford_Thanks_15_00");	//������� �� ������.
	AI_Output(self,other,"Org_818_Ratford_Thanks_07_01");	//������ �� �����, ��� ����� ��� ����� ���� ������ ����!
	AI_Output(self,other,"Org_818_Ratford_Thanks_07_02");	//�������, � ������� �������� ������, �� ��������� ����� ����� ���� ������ ������, ��� �� ������������ ���� �����.
	AI_Output(other,self,"Org_818_Ratford_Thanks_15_04");	//� ��� �������.
};

