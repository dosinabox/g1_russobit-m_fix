
instance INFO_SATURAS_EXIT(C_INFO)
{
	npc = kdw_600_saturas;
	nr = 999;
	condition = info_saturas_exit_condition;
	information = info_saturas_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_saturas_exit_condition()
{
	return 1;
};

func void info_saturas_exit_info()
{
	AI_Output(self,other,"Info_Saturas_EXIT_14_01");	//�������, � ���� ��� ���������!
	AI_StopProcessInfos(self);
};


instance INFO_SATURAS_INTRUDER(C_INFO)
{
	npc = kdw_600_saturas;
	nr = 1;
	condition = info_saturas_intruder_condition;
	information = info_saturas_intruder_info;
	permanent = 1;
	important = 1;
};


func int info_saturas_intruder_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KAPITEL < 3))
	{
		return 1;
	};
};

func void info_saturas_intruder_info()
{
	AI_Output(self,other,"Info_Saturas_Intruder_14_00");	//��� �� ����� �������? ���� ���� ������! �����!
	AI_StopProcessInfos(self);
};


instance INFO_SATURAS_NEWS(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_news_condition;
	information = info_saturas_news_info;
	permanent = 0;
	important = 0;
	description = "� ���� ���� ������ ������� �� ������ ��������!";
};


func int info_saturas_news_condition()
{
	if((CORANGAR_SENDTONC == TRUE) && Npc_KnowsInfo(hero,info_cronos_sleeper))
	{
		return TRUE;
	};
};

func void info_saturas_news_info()
{
	AI_Output(other,self,"Info_Saturas_NEWS_15_01");	//� ���� ���� ������ ������� �� ������ ��������!
	AI_Output(self,other,"Info_Saturas_NEWS_14_02");	//���� ���� ��� ������ ��� ���������� �� ������� �� ����, ������, ��������� ���-�� ������������� ������!
};


instance INFO_SATURAS_YBERION(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_yberion_condition;
	information = info_saturas_yberion_info;
	permanent = 0;
	important = 0;
	description = "������� ����! ��� ��������� ����� ��������� ������ �������!";
};


func int info_saturas_yberion_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_news))
	{
		return TRUE;
	};
};

func void info_saturas_yberion_info()
{
	AI_Output(other,self,"Info_Saturas_YBERION_15_01");	//������� ����! ��� ��������� ����� ������� ��������� ������ �������!
	AI_Output(self,other,"Info_Saturas_YBERION_14_02");	//��� ������ ������� �� ���� ���������.
	AI_Output(self,other,"Info_Saturas_YBERION_14_03");	//��� �� ��������� ��������? �� ���� �� �������� ����������� ��� �����?
	AI_Output(other,self,"Info_Saturas_YBERION_15_04");	//���! ��� ����� ���������� �� ��������. �� ���� � ����� ���������� ������� � ���� ���������� ����.
	AI_Output(self,other,"Info_Saturas_YBERION_14_05");	//��� �������! �� �� ������ ��� ����� ���������� ��������!
	AI_Output(other,self,"Info_Saturas_YBERION_15_06");	//��� ������� ������� ���� � ���, ��� ��� ��������, ������ ������� ����� �����. �� �������� ���� �������.
	AI_Output(other,self,"Info_Saturas_YBERION_15_07");	//���� �� ���� ��������� ����� ����, ������ ��� ������� �������, ���� ����� ���� � ���� ��� �����.
	AI_Output(other,self,"Info_Saturas_YBERION_15_08");	//��� ����� ��� ������������ ����, ������� �� ��������� �� ����� ���� � �������, �������� �� ��� �������� �������. ������� �� ������� �������� ������.
	AI_Output(self,other,"Info_Saturas_YBERION_14_09");	//��� ����! ��� �, � �����, ��� � �������. ��� ����� ������� �������, �������, �� �������.
	AI_Output(self,other,"Info_Saturas_YBERION_14_10");	//���� ����-������ � ������� �������� �������� � �������� ����� ����� �������� ����������, �� ������ ���.
	b_logentry(CH3_ESCAPEPLANNC,"� ������� �������� � �������� � �������� ������. �� ����������� ����, ��� ������ �������� ����� ����������� ��� �����, � �� ��� �����.");
};


instance INFO_SATURAS_BOOK(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_book_condition;
	information = info_saturas_book_info;
	permanent = 0;
	important = 0;
	description = "� ���� ���� ��������...";
};


func int info_saturas_book_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_yberion) && Npc_HasItems(hero,itwrfokusbuch))
	{
		return TRUE;
	};
};

func void info_saturas_book_info()
{
	AI_Output(other,self,"Info_Saturas_BOOK_15_01");	//� ���� ���� ��������...
	AI_Output(other,self,"Info_Saturas_BOOK_15_02");	//������� ����������� ��� ��� ����, ����� �������� ������.
	AI_Output(self,other,"Info_Saturas_BOOK_14_03");	//����� ������. ��� ����������� ��� �����, ����� �������� ��� ���� ������-��������.
	AI_Output(self,other,"Info_Saturas_BOOK_14_04");	//� ������ ��!
	b_giveinvitems(hero,self,itwrfokusbuch,1);
	Npc_RemoveInvItem(self,itwrfokusbuch);
	b_givexp(XP_DELIVERBOOKTOSATURAS);
};


instance INFO_SATURAS_FOCUS(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_focus_condition;
	information = info_saturas_focus_info;
	permanent = 0;
	important = 0;
	description = "� ���� ���� ���� ������...";
};


func int info_saturas_focus_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_yberion) && Npc_HasItems(hero,focus_1))
	{
		return TRUE;
	};
};

func void info_saturas_focus_info()
{
	AI_Output(other,self,"Info_Saturas_FOCUS_15_01");	//� ���� ���� ���� ������...
	AI_Output(self,other,"Info_Saturas_FOCUS_14_02");	//� ���� ���� ����, � ������� �������� �� �������� ���� �����.
	AI_Output(self,other,"Info_Saturas_FOCUS_14_03");	//��� ���� �� ������-��������, ������� ����� ������� ���������� ������.
	AI_Output(self,other,"Info_Saturas_FOCUS_14_04");	//���� ���������� ��� ���� ������, �� �� ������ ������� ��� ���������� �����.
	AI_Output(other,self,"Info_Saturas_FOCUS_15_05");	//�� ��� ����� ��� ����������� ��� ���� ���������� ����!
	AI_Output(self,other,"Info_Saturas_FOCUS_14_06");	//�� ����. ������ � ���� ����� �� �������� ����, � �� �������� �� ������ � ����� �� �����-�� ����������.
	AI_Output(self,other,"Info_Saturas_FOCUS_14_07");	//��� �� ��� ������, ������ ����� ���� �������� ������� ���������� �������. ���� ������� ���� ���� ������ ������� �� ��, ����� ��������� ������.
	AI_Output(other,self,"Info_Saturas_FOCUS_15_08");	//�������, ��� ����� ������.
	AI_Output(self,other,"Info_Saturas_FOCUS_14_09");	//��� ����� �� ������� �����, � ����������. �� ������� ������ ��, ��� ����� ���������� �������. ��� ����� �� �� ������������ ������� ������.
	AI_Output(other,self,"Info_Saturas_FOCUS_15_10");	//���, ������ ������. �������, �� ������� ��� ����� �� �������.
	b_giveinvitems(hero,self,focus_1,1);
	Npc_RemoveInvItem(self,focus_1);
	b_givexp(XP_DELIVERFOCUSTOSATURAS);
};


instance INFO_SATURAS_WHATNOW(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_whatnow_condition;
	information = info_saturas_whatnow_info;
	permanent = 0;
	important = 0;
	description = "�� ����������� ������ � �������� ����� ������?";
};


func int info_saturas_whatnow_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_focus) && Npc_KnowsInfo(hero,info_saturas_book))
	{
		return TRUE;
	};
};

func void info_saturas_whatnow_info()
{
	AI_Output(other,self,"Info_Saturas_WHATNOW_15_01");	//�� ����������� ������ � �������� ����� ������?
	AI_Output(self,other,"Info_Saturas_WHATNOW_14_03");	//�� ����� ��� ������. ��� ����� ��������� �����-�������.
	AI_Output(self,other,"Info_Saturas_WHATNOW_14_04");	//� ���������, �� � ��� ��� ���.
};


instance INFO_SATURAS_OFFER(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_offer_condition;
	information = info_saturas_offer_info;
	permanent = 0;
	important = 0;
	description = "� ������ ���� ����� ��� ������ �����.";
};


func int info_saturas_offer_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_whatnow))
	{
		return TRUE;
	};
};

func void info_saturas_offer_info()
{
	AI_Output(other,self,"Info_Saturas_OFFER_15_01");	//� ������ ���� ����� ��� ������ �����.
	AI_Output(other,self,"Info_Saturas_OFFER_15_02");	//���� � � ��� ���� ��������� ������.
	AI_Output(self,other,"Info_Saturas_OFFER_14_03");	//�� ������ �����, ��� ��� ������ ����� � ��������, � ��������.
	AI_Output(self,other,"Info_Saturas_OFFER_14_04");	//� ��� ��� ���� ��������� �� ������ ������� ������ ����������, � �� ����� ���� ���� � ������ �� ������ ��������.
	AI_Output(self,other,"Info_Saturas_OFFER_14_05");	//���� �������� ���������� ������ �� ���� ����.
	AI_Output(other,self,"Info_Saturas_OFFER_15_06");	//��� �... ��������. � ��� ������ ������ ��� ���.
	AI_Output(self,other,"Info_Saturas_OFFER_14_07");	//���� ����������� ���������, �� ���-��� ���� ��� �� ����� �����������.
	AI_Output(self,other,"Info_Saturas_OFFER_14_08");	//������ ��� �����. ��� �������� ������, ������� �� ��� ����� ����� �����, � ������� ������������� ������� �� ����, ��� �� ������� ���� ������.
	AI_Output(self,other,"Info_Saturas_OFFER_14_09");	//���� ����������� ��� ����������, ��� ������� ������� ��������� � ������.
	AI_Output(self,other,"Info_Saturas_OFFER_14_10");	//� ���: �������� � ���������. �� ������� ��� ��� �����.
	AI_Output(self,other,"Info_Saturas_OFFER_14_11");	//��� ��� �� ������� �� ������� ������.
	b_story_bringfoci();
};

func void b_deliverfocus()
{
	if(SATURAS_BRINGFOCI == 1)
	{
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_01");	//��, ������� ������! �� ������.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_02");	//�� ����� ����� ��� ��� �����.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_03");	//��� � ��������� �� ���������.
		SATURAS_BRINGFOCI = 2;
		b_givexp(XP_DELIVERSECONDFOCUS);
	}
	else if(SATURAS_BRINGFOCI == 2)
	{
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_04");	//������, ��� ��� ������ ������. 
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_05");	//����� �� ������ ����������� ��� ����.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_06");	//����� ��� ������ � ������� ��� ��� ��� �����.
		SATURAS_BRINGFOCI = 3;
		b_givexp(XP_DELIVERTHIRDFOCUS);
	}
	else if(SATURAS_BRINGFOCI == 3)
	{
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_07");	//����������! � ��� ���� ����� ������ �����!
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_08");	//��� �� ������� ����� ������. ����� �� ����� ����, �� ������ ���������� � ����.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_09");	//�� ������ ��� ���������� ������. �� ����� ��� ��������� ������, � �� ������ ������������ �� ���� ������.
		SATURAS_BRINGFOCI = 4;
		b_givexp(XP_DELIVERFOURTHFOCUS);
	}
	else if(SATURAS_BRINGFOCI == 4)
	{
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_10");	//�������! � ��� ���� ��� ���� ������!
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_11");	//��� ������ � ���������� ����� ����� �����. �� ������������ ��� ������ �������������.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_12");	//����� � ��������. �������, ��� ������� ����� ���� �� ��������� � ���, ��� �� ������ ��� ���, �� ��� ���� �����.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_13");	//������ ���� ����� ���� ������. �� ���������� ���� ��������� �������.
		SATURAS_BRINGFOCI = 5;
		b_givexp(XP_DELIVERFIFTHFOCUS);
		b_logentry(CH3_BRINGFOCI,"��� ������� ����� ��� ������ �������. ������� �������, ��� �������. ��, �� ���� ��� ��� ������� ������� ���-�� ������������� ��������...");
		b_logentry(CH3_BRINGFOCI,"� ������� � �������� ���� ��� ���� ��������� ������� �� ��, ��� � ����� �������. ��� ����� ����������� � ����.");
		Log_SetTopicStatus(CH3_MONASTERYRUIN,LOG_SUCCESS);
		Log_SetTopicStatus(CH3_STONEHENGE,LOG_SUCCESS);
		Log_SetTopicStatus(CH3_FORTRESS,LOG_SUCCESS);
		Log_SetTopicStatus(CH3_TROLLCANYON,LOG_SUCCESS);
	};
	if(!Npc_HasItems(hero,itarscrollteleport2) && (SATURAS_BRINGFOCI < 5))
	{
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_14");	//�� �������� ���������� ������������, ��� � ����. ������ ��� ����, ����� ����������.
		CreateInvItem(self,itarscrollteleport2);
		b_giveinvitems(self,other,itarscrollteleport2,1);
	};
};


instance INFO_SATURAS_BRINGFOCUS2(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_bringfocus2_condition;
	information = info_saturas_bringfocus2_info;
	permanent = 0;
	important = 0;
	description = "� ����� ������ � ������ �������!";
};


func int info_saturas_bringfocus2_condition()
{
	if(Npc_HasItems(hero,focus_2) && (SATURAS_BRINGFOCI > 0))
	{
		return TRUE;
	};
};

func void info_saturas_bringfocus2_info()
{
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS2_15_01");	//� ����� ������ � ������ �������!
	b_logentry(CH3_TROLLCANYON,"� ����� �������� ������ �� ������ ������.");
	Log_SetTopicStatus(CH3_TROLLCANYON,LOG_SUCCESS);
	b_giveinvitems(hero,self,focus_2,1);
	Npc_RemoveInvItem(self,focus_2);
	b_deliverfocus();
};


instance INFO_SATURAS_BRINGFOCUS3(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_bringfocus3_condition;
	information = info_saturas_bringfocus3_info;
	permanent = 0;
	important = 0;
	description = "� ������ ����� � ����� ���� �� ��������.";
};


func int info_saturas_bringfocus3_condition()
{
	if(Npc_HasItems(hero,focus_3) && (SATURAS_BRINGFOCI > 0))
	{
		return TRUE;
	};
};

func void info_saturas_bringfocus3_info()
{
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS3_15_01");	//� ������ ����� � ����� ���� �� ��������.
	b_logentry(CH3_FORTRESS,"������ � �������� ���� ������ �� ������� �����.");
	Log_SetTopicStatus(CH3_FORTRESS,LOG_SUCCESS);
	b_giveinvitems(hero,self,focus_3,1);
	Npc_RemoveInvItem(hero,focus_3);
	b_deliverfocus();
};


instance INFO_SATURAS_BRINGFOCUS4(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_bringfocus4_condition;
	information = info_saturas_bringfocus4_info;
	permanent = 0;
	important = 0;
	description = "� ����� ���� �� �������� � ����������� ���������!";
};


func int info_saturas_bringfocus4_condition()
{
	if(Npc_HasItems(hero,focus_4) && (SATURAS_BRINGFOCI > 0))
	{
		return TRUE;
	};
};

func void info_saturas_bringfocus4_info()
{
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS4_15_01");	//� ����� ���� �� �������� � ����������� ���������!
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS4_15_02");	//��� � �������� �������� �����, � �� ����� ��� � �������.
	b_logentry(CH3_MONASTERYRUIN,"��� ������� �������� �������� ������ �� �������� ���������.");
	Log_SetTopicStatus(CH3_MONASTERYRUIN,LOG_SUCCESS);
	b_giveinvitems(hero,self,focus_4,1);
	Npc_RemoveInvItem(hero,focus_4);
	b_deliverfocus();
};


instance INFO_SATURAS_BRINGFOCUS5(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_bringfocus5_condition;
	information = info_saturas_bringfocus5_info;
	permanent = 0;
	important = 0;
	description = "� ����� ������ � �������� ��� �������� �������!";
};


func int info_saturas_bringfocus5_condition()
{
	if(Npc_HasItems(hero,focus_5) && (SATURAS_BRINGFOCI > 0))
	{
		return TRUE;
	};
};

func void info_saturas_bringfocus5_info()
{
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS5_15_01");	//� ����� ������ � �������� ��� �������� �������!
	b_logentry(CH3_STONEHENGE,"� ������ �������� ������ �� ������ ��� ������ ������.");
	Log_SetTopicStatus(CH3_STONEHENGE,LOG_SUCCESS);
	b_giveinvitems(hero,self,focus_5,1);
	Npc_RemoveInvItem(hero,focus_5);
	b_deliverfocus();
};


instance INFO_SATURAS_ALLFOCI(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_allfoci_condition;
	information = info_saturas_allfoci_info;
	permanent = 0;
	important = 0;
	description = "������ �� ����� �������� ������ ����?";
};


func int info_saturas_allfoci_condition()
{
	if((SATURAS_BRINGFOCI == 5) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void info_saturas_allfoci_info()
{
	AI_Output(other,self,"Info_Saturas_ALLFOCI_15_01");	//������ �� ����� �������� ������ ����?
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_02");	//������ � ��� ���� ��� �����������, ����� ����������� ����������.
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_03");	//������ ��� ������ ��� �������� ����������� ������.
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_04");	//����� ��������� ��� �������� ������� ����, ���� �����, ����� ����� ���� ������������.
	AI_Output(other,self,"Info_Saturas_ALLFOCI_15_05");	//��� �� ����� ����� �������?
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_06");	//�� ��� ������ ��� ��� ����� �����, � �� � ����� ����� �����...
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_07");	//... �� ���� �� ����������� �� ��� �����������, �� ������� ���� ������� ���� �������.
};


instance INFO_SATURAS_FAVOR(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_favor_condition;
	information = info_saturas_favor_info;
	permanent = 0;
	important = 0;
	description = "�� ����� �����������?";
};


func int info_saturas_favor_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_allfoci))
	{
		return TRUE;
	};
};

func void info_saturas_favor_info()
{
	AI_Output(other,self,"Info_Saturas_FAVOR_15_01");	//�� ����� �����������?
	AI_Output(self,other,"Info_Saturas_FAVOR_14_02");	//����� � ������ ������ � ��������� ��������� ��������� ����� ����� ���� ������ ���.
	AI_Output(other,self,"Info_Saturas_FAVOR_15_03");	//����� ����� ����? �� �����, ��� ��� ���������� � ����� ������������.
	AI_Output(other,self,"Info_Saturas_FAVOR_15_04");	//���� ������ ����� ��������, ��� ������� ���� ����� ������.
	AI_Output(self,other,"Info_Saturas_FAVOR_14_05");	//������ �� ���� ������� � ��������� ���� ��������� ��� ������. � ���� ���� �������� �� ���� �������.
	AI_Output(self,other,"Info_Saturas_FAVOR_14_06");	//����� ����� ����, ��� �� ��� ��� ������ �� ������ ������ �������, ����� �� ������ ������� ���������� ���������.
};


instance INFO_SATURAS_ACCEPT(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_accept_condition;
	information = info_saturas_accept_info;
	permanent = 0;
	important = 0;
	description = "��� �, � ��������� ��������� ����� ����.";
};


func int info_saturas_accept_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_favor))
	{
		return TRUE;
	};
};

func void info_saturas_accept_info()
{
	AI_Output(other,self,"Info_Saturas_ACCEPT_15_01");	//��� �, � ��������� ��������� ����� ����.
	AI_Output(other,self,"Info_Saturas_ACCEPT_15_02");	//�� � ������ �� ������. ��-�����, ��� ����� ����������.
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_03");	//��� �� ��������. ���� ���� �� ������� ��� �������, �� ��������� ��� ����...
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_04");	//���� ����...
	AI_Output(other,self,"Info_Saturas_ACCEPT_15_05");	//... ���� ���?
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_06");	//�������! �� ������ ��������� ��.
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_07");	//������ ��� ����. ������� �� ��������, ���������� ���� ����� ����. ��� ���� ������ �������.
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_08");	//���� ������� ��� ����������� �� ���, ����� ������.
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_09");	//�����, ��� ����� ������� ��������������� ����� ������.
	b_kapitelwechsel(4);
};


instance INFO_SATURAS_AMBUSH(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_ambush_condition;
	information = info_saturas_ambush_info;
	permanent = 0;
	important = 1;
};


func int info_saturas_ambush_condition()
{
	if(FMTAKEN && !FINDXARDAS)
	{
		return TRUE;
	};
};

func void info_saturas_ambush_info()
{
	var C_NPC gorn;
	gorn = Hlp_GetNpc(pc_fighter);
	AI_TurnToNPC(gorn,hero);
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_01");	//������, ��� �� ��������. ��� �������� ������� ���������!
	AI_Output(hero,self,"Info_Saturas_AMBUSH_15_02");	//��-��, � �������� �������, ��� ���������. ��������� ����� ���� ��������� ����������� ������� ������. ����� �� �����, ��� ��� ������� � ������...
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_03");	//�������... � ������... ��, �������... �� ����� ��� ��� � ������ ������!
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_04");	//����� ����� ����� ���� ������ ����.
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_05");	//������ ����� ������� �� ���� ���? ������ �� ������� ��������� �� ��� ��� ���� �����?
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_06");	//�� �� ������ ��������, ��� ��� �������� ����� ������� ����� � �������!
};


instance INFO_SATURAS_COLLAPSE(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_collapse_condition;
	information = info_saturas_collapse_info;
	permanent = 0;
	important = 0;
	description = "������ ����� ����������, ����� ���� ��� �� ������ ����!";
};


func int info_saturas_collapse_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_ambush))
	{
		return TRUE;
	};
};

func void info_saturas_collapse_info()
{
	AI_Output(hero,self,"Info_Saturas_COLLAPSE_15_01");	//������ ����� ����������, ����� ���� ��� �� ������ ����!
	AI_Output(self,hero,"Info_Saturas_COLLAPSE_14_02");	//... ����������... �������... ����� ��� �������.
	AI_Output(self,hero,"Info_Saturas_COLLAPSE_14_03");	//����� ������� ���� ����� � ���� ������� �������. ��� ��� ������ ������, ��� ��� ������ �� �������� �� ���.
};


instance INFO_SATURAS_MURDER(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_murder_condition;
	information = info_saturas_murder_info;
	permanent = 0;
	important = 0;
	description = "����� ���� ���� ����� ����� ����!";
};


func int info_saturas_murder_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_ambush))
	{
		return TRUE;
	};
};

func void info_saturas_murder_info()
{
	AI_Output(hero,self,"Info_Saturas_MURDER_15_01");	//����� ���� ���� ����� ����� ����!
	AI_Output(self,hero,"Info_Saturas_MURDER_14_02");	//���� ����?! �� �����? ����� �� ��� ������?
	AI_Output(hero,self,"Info_Saturas_MURDER_15_03");	//��� �� ���������� ������ � ��������� ������ ��������� �� ��������� �����.
	AI_Output(self,hero,"Info_Saturas_MURDER_14_04");	//������, �� ��������. ���������� ������� ������ ���� ����� ������ � ����� �� ���������� �����. � ��� ����� �����.
	AI_Output(self,hero,"Info_Saturas_MURDER_14_05");	//�������� �� ��, ��� �� ������ ��� ��������� �����, � ��������� ����.
	b_givexp(XP_REPORTTOSATURAS);
	b_logentry(CH4_FIREMAGES,"������� ��� ��������� ���� ���������� � ��������� �������� � ������ ������. ��� ����� ������ � ��� ������ ���������� �������... ��� �, ��� ������ �� �������� ������������ �� ������� ����� ����.");
	Log_SetTopicStatus(CH4_FIREMAGES,LOG_SUCCESS);
};


instance KDW_600_SATURAS_NOMOREOC(C_INFO)
{
	npc = kdw_600_saturas;
	condition = kdw_600_saturas_nomoreoc_condition;
	information = kdw_600_saturas_nomoreoc_info;
	important = 0;
	permanent = 0;
	description = "���� ������� �� ������� ������ �� ��, ��� � ����� ���!";
};


func int kdw_600_saturas_nomoreoc_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_murder) && ((OLDHEROGUILD == GIL_GRD) || (OLDHEROGUILD == GIL_KDF)))
	{
		return TRUE;
	};
};

func void kdw_600_saturas_nomoreoc_info()
{
	AI_Output(other,self,"KDW_600_Saturas_NOMOREOC_Info_15_01");	//���� ������� �� ������� ������ �� ��, ��� � ����� ���!
	AI_Output(self,other,"KDW_600_Saturas_NOMOREOC_Info_14_02");	//������� �� ������� ������, ��������?
	AI_Output(self,other,"KDW_600_Saturas_NOMOREOC_Info_14_03");	//�� � �������� ������ ����!
	Log_CreateTopic(CH4_BANNEDFROMOC,LOG_MISSION);
	Log_SetTopicStatus(CH4_BANNEDFROMOC,LOG_RUNNING);
	b_logentry(CH4_BANNEDFROMOC,"����� ���� ��� ���� �������� �� ������� ������, ������� ��������� ���� �������������� � ������ ������.");
};


instance KDW_600_SATURAS_GOTOLEE(C_INFO)
{
	npc = kdw_600_saturas;
	condition = kdw_600_saturas_gotolee_condition;
	information = kdw_600_saturas_gotolee_info;
	important = 0;
	permanent = 0;
	description = "������ �� ���, ��� �� ������� ���� � ��������?";
};


func int kdw_600_saturas_gotolee_condition()
{
	if((OLDHEROGUILD == GIL_GRD) && Npc_KnowsInfo(hero,kdw_600_saturas_nomoreoc))
	{
		return TRUE;
	};
};

func void kdw_600_saturas_gotolee_info()
{
	AI_Output(other,self,"KDW_600_Saturas_GOTOLEE_Info_15_01");	//������ �� ���, ��� �� ������� ���� � ��������?
	AI_Output(self,other,"KDW_600_Saturas_GOTOLEE_Info_14_02");	//�� ���� ����� ���������� � ��. ������� �� ���, ����� ���� ������ ����� �����.
	b_logentry(CH4_BANNEDFROMOC,"��, ����� ���������, ����� ���������� �� ����. ����� ��������� � ��� � ������ ��������� � ��������.");
};


instance KDW_600_SATURAS_OATH(C_INFO)
{
	npc = kdw_600_saturas;
	condition = kdw_600_saturas_oath_condition;
	information = kdw_600_saturas_oath_info;
	important = 0;
	permanent = 0;
	description = "������ �� ���, ��� � ���� ������ � ������� ����� ����� ����?";
};


func int kdw_600_saturas_oath_condition()
{
	if((OLDHEROGUILD == GIL_KDF) && Npc_KnowsInfo(hero,kdw_600_saturas_nomoreoc))
	{
		return TRUE;
	};
};

func void kdw_600_saturas_oath_info()
{
	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_01");	//������ �� ���, ��� � ���� ������ � ������� ����� ����� ����?
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_02");	//���. ������� �� ������ �������� ������ ����.
	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_03");	//�� � ��� �������� ������� ����!
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_04");	//��...
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_05");	//���� ������ ���� �� ����� ��������!
	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_06");	//��... � �� �������...
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_07");	//� ������� ������ �� ��������� ����� � ������� ����� ���� ������!
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_08");	//���� ���� � ������ ���� ����� ���������� ����!
	b_logentry(CH4_BANNEDFROMOC,"������� ��������� ��� �������� � ���� ����� ����. ��� ���� ��� ������ ���� �� ����� ��������.");
};


instance KDW_600_SATURAS_KDWAUFNAHME(C_INFO)
{
	npc = kdw_600_saturas;
	condition = kdw_600_saturas_kdwaufnahme_condition;
	information = kdw_600_saturas_kdwaufnahme_info;
	important = 0;
	permanent = 0;
	description = "� ����� �������� ������.";
};


func int kdw_600_saturas_kdwaufnahme_condition()
{
	if(Npc_KnowsInfo(hero,kdw_600_saturas_oath))
	{
		return TRUE;
	};
};

func void kdw_600_saturas_kdwaufnahme_info()
{
	AI_GotoNpc(hero,self);
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01");	//� ����� �������� ������.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_02");	//��������� ����, ����������� �������� ������������� ����!
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03");	//�������� �� ���� ����� ������:
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04");	//������� ����������� �����...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05");	//������� ����������� �����...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06");	//... � ����� ��������� ����...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07");	//... � ����� ��������� ����...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08");	//...��� ������ � �������� ��� ����� ������� ���� ������ � �� ��������� �����...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09");	//...��� ������ � ������� ��� ����� ������� ���� ������ � �� ��������� �����...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10");	//...�� ��� ���, ���� ��� ������� ���� �� ������� ����� � �������� ������� � �� �������� �������� ���� �����.
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11");	//...�� ��� ���, ���� ��� ������� ���� �� ������� ����� � �������� ������� � �� �������� �������� ���� �����.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_12");	//��� ������ ��������� � ���� ���� ���� � ������������� ����.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_13");	//��������� ��, ��� �� ���� ���� ������������. ������ ���� ����� ����� ������ ����������� ������.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14");	//������ ��� ������� � ���� ��� � ���� ����� �� ��������� ����� � � ��������. 
	CreateInvItem(self,kdw_armor_l);
	b_giveinvitems(self,other,kdw_armor_l,1);
	AI_EquipBestArmor(hero);
	Snd_Play("MFX_Heal_Cast");
	Npc_SetTrueGuild(hero,GIL_KDW);
	hero.guild = GIL_KDW;
	b_logentry(CH4_BANNEDFROMOC,"�� ������ ���� � ���� ����� ����. ������ � ���������� ���� ���������� ������ ������������.");
	Log_SetTopicStatus(CH4_BANNEDFROMOC,LOG_SUCCESS);
	AI_StopProcessInfos(self);
};


instance KDW_600_SATURAS_LESSON(C_INFO)
{
	npc = kdw_600_saturas;
	nr = 100;
	condition = kdw_600_saturas_lesson_condition;
	information = kdw_600_saturas_lesson_info;
	important = 0;
	permanent = 0;
	description = "�� ������ ����� ���� ��������?";
};


func int kdw_600_saturas_lesson_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDW)
	{
		return TRUE;
	};
};

func void kdw_600_saturas_lesson_info()
{
	AI_Output(other,self,"KDW_600_Saturas_LESSON_Info_15_01");	//�� ������ ����� ���� ��������?
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) <= 3)
	{
		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_02");	//���� ��� ������� ����� ���������. ������� �� ���, ����� ������ �����.
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
	{
		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_03");	//� ���� ��������� ���� � ��� ���� �����, ������� ���� ��� ����������, �� ������ �����, ����� �� ������ �����.
	}
	else
	{
		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_04");	//�� ��� �������� � ����� ���� �����! ���� ������ �����.
		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_05");	//� �� ����� ������ ������� ����.
	};
	Log_CreateTopic(GE_TEACHERNC,LOG_NOTE);
	b_logentry(GE_TEACHERNC,"�������, ����� ����� ����, ����� ��������� ���� � ����� ������ �����. � ����� ����� ��� � ����������� �� ������ ������ ������ ������.");
};


instance KDW_600_SATURAS_KREIS1(C_INFO)
{
	npc = kdw_600_saturas;
	nr = 100;
	condition = kdw_600_saturas_kreis1_condition;
	information = kdw_600_saturas_kreis1_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARNMAGE_1,LPCOST_TALENT_MAGE_1,0);
};


func int kdw_600_saturas_kreis1_condition()
{
	if(Npc_KnowsInfo(hero,kdw_600_saturas_lesson) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 0) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void kdw_600_saturas_kreis1_info()
{
	AI_Output(other,self,"KDW_600_Saturas_KREIS1_Info_15_01");	//� ����� �������� � ������ ����.
	if(b_giveskill(other,NPC_TALENT_MAGE,1,LPCOST_TALENT_MAGE_1))
	{
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_02");	//���������� � ������ ���� ����� ���� ���� ������ ������������ ���������� ����.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_03");	//������ ���� �������� � ���� ���� ���������� ����������.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_04");	//��������� ���� ���������� ����, �� ������� ��������� ��� ����������.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_05");	//�� � ������� �� ���������� �������, ������� ������ ���� ���� ����� ������� ���������, ���������� ���� ����� ������ ����� � �����, � ��� �� ��������. 
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_06");	//������ ���� �������� ���������� ���������� ����, ������� ����� ���� ������������� � ����� �����.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_07");	//��� � ��� ������, ��� ��������� ���������� ���� ��� ������ ����� ������������� ���� ���������� ����.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_08");	//������ ������� ������ ����� ������� ���� ������ ����� ������� ���������� ���.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_09");	//��������� ���� ���, �� ������� ������, ����� ����� ��������� ���.
		kdw_600_saturas_kreis1.permanent = 0;
	};
};


instance KDW_600_SATURAS_KREIS2(C_INFO)
{
	npc = kdw_600_saturas;
	nr = 100;
	condition = kdw_600_saturas_kreis2_condition;
	information = kdw_600_saturas_kreis2_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARNMAGE_2,LPCOST_TALENT_MAGE_2,0);
};


func int kdw_600_saturas_kreis2_condition()
{
	if(Npc_KnowsInfo(hero,kdw_600_saturas_lesson) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void kdw_600_saturas_kreis2_info()
{
	AI_Output(other,self,"KDW_600_Saturas_KREIS2_Info_15_01");	//� ����� � ���������� �� ������ ����.
	if(b_giveskill(other,NPC_TALENT_MAGE,2,LPCOST_TALENT_MAGE_2))
	{
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_02");	//�� ��� �������� ������ ���������� ���. ������ ����� �������� ���� ������.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_03");	//������ ���� ����� ���� ���� ����������� ������ ������� ������ ����������, �� ����� �������, �� ������� �������� �������.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_04");	//�� ���� ��������� ��� ������� ���������, ����� ������� �������� ����� �����.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_05");	//�� ��� ������, ��� ������ ������������ ����� ����, ���� �� ��� ������ ����� ������ ����.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_06");	//�� ��� ������� ������, � �� �� ������ ��������. ���� ���� ����, ������� ����� ��������� ������ � ����������.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_07");	//�������� ��� ���������� �� ���� �����, ����� ��� ������������� ����������.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_08");	//����������� ����� �� ���, ��� ���������� ������, � ����� �� ������� ������� ���� ���.
		kdw_600_saturas_kreis2.permanent = 0;
	};
};


instance KDW_600_SATURAS_KREIS3(C_INFO)
{
	npc = kdw_600_saturas;
	nr = 100;
	condition = kdw_600_saturas_kreis3_condition;
	information = kdw_600_saturas_kreis3_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARNMAGE_3,LPCOST_TALENT_MAGE_3,0);
};


func int kdw_600_saturas_kreis3_condition()
{
	if(Npc_KnowsInfo(hero,kdw_600_saturas_lesson) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void kdw_600_saturas_kreis3_info()
{
	AI_Output(other,self,"KDW_600_Saturas_KREIS3_Info_15_01");	//� ����� �������� ������ �������� �����.
	if(b_giveskill(other,NPC_TALENT_MAGE,3,LPCOST_TALENT_MAGE_3))
	{
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_02");	//������ ���� - ����� ������ ����� ����, ������� �������� ������ ���. ��� ����������� ����������� ���� �����.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_03");	//�� ��� �� �������� ���� �������� �����. �� ��� ������ ������ ���������� ���.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_04");	//��� ������ ������ ������� ��� ����������� �����������������. �������, ������ ��� ������������ �� ��� ���� ����.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_05");	//�� ������ ������ �� ��� �� ������, �� ���� ����� ������ ���� �������.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_06");	//���� �� ������ �����, �� ������ ��������� ��� �� ����������.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_07");	//������ ���� ����, � �� �������� ���� ����� �������.
		kdw_600_saturas_kreis3.permanent = 0;
	};
};


instance KDW_600_SATURAS_KREIS4(C_INFO)
{
	npc = kdw_600_saturas;
	nr = 100;
	condition = kdw_600_saturas_kreis4_condition;
	information = kdw_600_saturas_kreis4_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARNMAGE_4,LPCOST_TALENT_MAGE_4,0);
};


func int kdw_600_saturas_kreis4_condition()
{
	if(Npc_KnowsInfo(hero,kdw_600_saturas_lesson) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void kdw_600_saturas_kreis4_info()
{
	AI_Output(other,self,"KDW_600_Saturas_KREIS4_Info_15_01");	//� ����� �������� � ��������� ����.
	if(b_giveskill(other,NPC_TALENT_MAGE,4,LPCOST_TALENT_MAGE_4))
	{
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_02");	//���� ��� ������� ������ ���� ������ �����. ������ ����� ������� �� �����.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_03");	//����� ���� ������� � �����. ������ ���� �������� ��� �������� ���������� ����.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_04");	//����� ����, ������� �������� � ������� ������. ������ ���������� ���������� �������� � ������ ������. ��� �� ���������� ������� ����� ����.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_05");	//��� ����, ������� �� ������ ������������, ��������� ���� ������ � ������� � ���������� ����� ������.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_07");	//������ �����, � �� �������� ����� ����� ����.
		kdw_600_saturas_kreis4.permanent = 0;
	};
};


instance KDW_600_SATURAS_KREIS5(C_INFO)
{
	npc = kdw_600_saturas;
	nr = 100;
	condition = kdw_600_saturas_kreis5_condition;
	information = kdw_600_saturas_kreis5_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARNMAGE_5,LPCOST_TALENT_MAGE_5,0);
};


func int kdw_600_saturas_kreis5_condition()
{
	if(Npc_KnowsInfo(hero,kdw_600_saturas_lesson) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void kdw_600_saturas_kreis5_info()
{
	AI_Output(other,self,"KDW_600_Saturas_KREIS5_Info_15_01");	//� ����� �������� � ����� ����.
	if(b_giveskill(other,NPC_TALENT_MAGE,5,LPCOST_TALENT_MAGE_5))
	{
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_02");	//�� ����� ���. � ������ ���� �������� ����� ������ �����.
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_03");	//����������� � ������ ������ ����� ����� ������ ���������� ��� �������� �����, ������� ����� � ����������� ������.
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_04");	//�� ����� ������� ����������� ������ ����� �������� ����� ������. ���� �� ������� ��� ����, � ����� ����� �������� �������� ������� �������������� ���.
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_05");	//��������� �� ������ � ������ ����������� ���������, ���� ��� ���� ���� ����� ����.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_06");	//������ �� ������ ���, ��� ���� � ���.
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_06");	//����� ������� ����������, � �� �������� ���� �������� ����.
		kdw_600_saturas_kreis5.permanent = 0;
	};
};


instance KDW_600_SATURAS_HEAVYARMOR(C_INFO)
{
	npc = kdw_600_saturas;
	nr = 100;
	condition = kdw_600_saturas_heavyarmor_condition;
	information = kdw_600_saturas_heavyarmor_info;
	important = 0;
	permanent = 1;
	description = b_buildbuyarmorstring("������� ���������� ����",VALUE_KDW_ARMOR_H);
};


func int kdw_600_saturas_heavyarmor_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDW)
	{
		return TRUE;
	};
};

func void kdw_600_saturas_heavyarmor_info()
{
	AI_Output(other,self,"KDW_600_Saturas_HEAVYARMOR_Info_15_01");	//� ���� ������ ������� ��������� ����� ����.
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) < 4) && (KAPITEL < 5))
	{
		AI_Output(self,other,"KDW_600_Saturas_HEAVYARMOR_Info_14_02");	//�� ��� �� ������ ������ ����� ���������. ����� ��� �� ������.
	}
	else if(Npc_HasItems(hero,itminugget) < VALUE_KDW_ARMOR_H)
	{
		AI_Output(self,other,"KDW_600_Saturas_HEAVYARMOR_Info_14_03");	//���� �� ������� ����.
	}
	else
	{
		AI_Output(self,other,"KDW_600_Saturas_HEAVYARMOR_Info_14_04");	//� ����, ��� �� ��� ������� ������ ��������� ���������� ���� ����� ����.
		kdw_600_saturas_heavyarmor.permanent = 0;
		b_giveinvitems(hero,self,itminugget,VALUE_KDW_ARMOR_H);
		CreateInvItem(hero,kdw_armor_h);
		CreateInvItem(self,itamarrow);
		b_giveinvitems(self,hero,itamarrow,1);
		Npc_RemoveInvItem(hero,itamarrow);
		AI_EquipBestArmor(hero);
	};
};


instance INFO_SATURAS_NOWSLD(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_nowsld_condition;
	information = info_saturas_nowsld_info;
	permanent = 0;
	important = 0;
	description = "�� ������ ���� � ��������.";
};


func int info_saturas_nowsld_condition()
{
	if(Npc_KnowsInfo(hero,sld_700_lee_changeside))
	{
		return TRUE;
	};
};

func void info_saturas_nowsld_info()
{
	AI_Output(hero,self,"Info_Saturas_NOWSLD_15_01");	//�� ������ ���� � ��������.
	AI_Output(self,hero,"Info_Saturas_NOWSLD_14_02");	//������. ������ �� ���� �� ���, �� ������������ ������ ������.
	AI_Output(self,hero,"Info_Saturas_NOWSLD_14_03");	//����� ����������!
	b_logentry(CH4_BANNEDFROMOC,"������� ��������� ���� � ���, ��� � ���� ���������.");
	Log_SetTopicStatus(CH4_BANNEDFROMOC,LOG_SUCCESS);
};


instance INFO_SATURAS_XARDAS(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_xardas_condition;
	information = info_saturas_xardas_info;
	permanent = 0;
	important = 0;
	description = "��������� ���� � ����� ����, �� ������, ��� ���� ����... ���-��.";
};


func int info_saturas_xardas_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_collapse) && Npc_KnowsInfo(hero,info_saturas_murder))
	{
		if((Npc_GetTrueGuild(hero) != GIL_GRD) && (Npc_GetTrueGuild(hero) != GIL_KDF))
		{
			return TRUE;
		};
	};
};

func void info_saturas_xardas_info()
{
	AI_Output(hero,self,"Info_Saturas_XARDAS_15_01");	//����� �� �������� ���� � ����� ����, �� ������, ��� ���� ��� ����... ���-��.
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_02");	//��, � ��������, ��� ��� �� �������� ���� �� ��� ����... ���������� � ����... �� ��� ������������ ���...
	AI_Output(hero,self,"Info_Saturas_XARDAS_15_03");	//� ���� ����������?
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_04");	//������, � ����� ����!
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_05");	//����� ��� �����...
	AI_Output(hero,self,"Info_Saturas_XARDAS_15_06");	//����������, ��� �����������!
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_07");	//�� ������ ����! ��� ��, ���������� �����, ������ ��������� ������, �� ���� ���� ��������� � ��������� ����������� ���.
	AI_Output(hero,self,"Info_Saturas_XARDAS_15_08");	//�����������? � ������ �����, ��� ��� ���� ������ ����������!
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_09");	//����������� �����, ��������� � ������� ����� �������� �������, ������ ����� �����.
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_10");	//��� ����������� ��� ��� ����� �������������. ��� ���� ��� �� ����, ��� �� ����������� �� ����� ���� � ����.
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_11");	//�� ������� �� ������� ������ ������, ������� ����� ��� ������������ � �������.
};


instance INFO_SATURAS_XARDASWHO(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_xardaswho_condition;
	information = info_saturas_xardaswho_info;
	permanent = 0;
	important = 0;
	description = "� ��� ����� ����� ������������ ����?";
};


func int info_saturas_xardaswho_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_xardas))
	{
		return TRUE;
	};
};

func void info_saturas_xardaswho_info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASWHO_15_01");	//� ��� ����� ����� ������������ ����?
	AI_Output(self,hero,"Info_Saturas_XARDASWHO_14_02");	//��� ����� �������. ������ ��� ���� ��� ������, ��� ��� ��� �� �������.
	AI_Output(self,hero,"Info_Saturas_XARDASWHO_14_03");	//� ��, ��� ������, �������� ��� ����������� �������, �����������!
};


instance INFO_SATURAS_XARDASWHY(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_xardaswhy_condition;
	information = info_saturas_xardaswhy_info;
	permanent = 0;
	important = 0;
	description = "������ �� ���� �� ������� ������?";
};


func int info_saturas_xardaswhy_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_xardas))
	{
		return TRUE;
	};
};

func void info_saturas_xardaswhy_info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASWHY_15_01");	//������ �� ���� �� ������� ������?
	AI_Output(self,hero,"Info_Saturas_XARDASWHY_14_02");	//�� ���� ������� ����������, ����������� ������ � ������ ������ ��� ����������� ����������.
	AI_Output(self,hero,"Info_Saturas_XARDASWHY_14_03");	//��� ����� �� ����������� ������, � �� ������ ���. ������ ���� ����������� �� ���� � ������ �� ���������� �� ��� ������.
	AI_Output(hero,self,"Info_Saturas_XARDASWHY_15_04");	//� ��� ���� �����?
	AI_Output(self,hero,"Info_Saturas_XARDASWHY_14_05");	//� ������� �� ������ ������� �� ��� ������ �������� � ���� �� ������, ����� �������� ���������.
};


instance INFO_SATURAS_XARDASWHERE(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_xardaswhere_condition;
	information = info_saturas_xardaswhere_info;
	permanent = 0;
	important = 0;
	description = "� ��� �� ����� ������?";
};


func int info_saturas_xardaswhere_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_xardas))
	{
		return TRUE;
	};
};

func void info_saturas_xardaswhere_info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASWHERE_15_01");	//� ��� �� ����� ������?
	AI_Output(self,hero,"Info_Saturas_XARDASWHERE_14_02");	//�� ����� � ��������� � �����, ������� �� ����� �����.
	AI_Output(self,hero,"Info_Saturas_XARDASWHERE_14_03");	//�� ����� ��������� �� ��� �������.
};


instance INFO_SATURAS_XARDASHELP(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_xardashelp_condition;
	information = info_saturas_xardashelp_info;
	permanent = 0;
	important = 0;
	description = "� ����� �������� � ������� ��� � ������!";
};


func int info_saturas_xardashelp_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_xardaswho) && Npc_KnowsInfo(hero,info_saturas_xardaswhy) && Npc_KnowsInfo(hero,info_saturas_xardaswhere))
	{
		return TRUE;
	};
};

func void info_saturas_xardashelp_info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASHELP_15_01");	//� ����� �������� � ������� ��� � ������!
	AI_Output(self,hero,"Info_Saturas_XARDASHELP_14_02");	//������ ������ �� ������ ������ ���.
	AI_Output(self,hero,"Info_Saturas_XARDASHELP_14_03");	//�� ���� �� �� �����, ��� ��� �������, ��� ������ �� �������...
	AI_Output(hero,self,"Info_Saturas_XARDASHELP_15_04");	//�������!
	AI_Output(self,hero,"Info_Saturas_XARDASHELP_14_05");	//�� ���� ��� ���� ��������...
	b_story_findxardas();
};


instance INFO_SATURAS_XARDASPROBLEM(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_xardasproblem_condition;
	information = info_saturas_xardasproblem_info;
	permanent = 0;
	important = 0;
	description = "��������?";
};


func int info_saturas_xardasproblem_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_xardashelp))
	{
		return TRUE;
	};
};

func void info_saturas_xardasproblem_info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASPROBLEM_15_01");	//��������?
	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_02");	//��. �� ����� ��� �������� ��������� � ���������, �� ��� ��� �� ���� �� �������.
	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_03");	//��� �������, ��� �� �����, ����� ��� �������� � �����.
	AI_Output(hero,self,"Info_Saturas_XARDASPROBLEM_15_04");	//��� �� ������ � ����?
	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_05");	//����� �� ����� ������ �� �������� �� ��� �����.
	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_06");	//�� ������ ������, ��� ����� ������ ���� ��� ������� ��������.
	AI_Output(hero,self,"Info_Saturas_XARDASPROBLEM_15_07");	//��� ���������� � ����������!
	b_logentry(CH4_FINDXARDAS,"������� ������ ���, ��� �������� �������� ���������� ��������.");
};


instance INFO_SATURAS_XARDASGO(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_xardasgo_condition;
	information = info_saturas_xardasgo_info;
	permanent = 0;
	important = 0;
	description = "� ��� �� ��� ������ ���� ���?";
};


func int info_saturas_xardasgo_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_xardasproblem))
	{
		return TRUE;
	};
};

func void info_saturas_xardasgo_info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASGO_15_01");	//� ��� �� ��� ������ ���� ���?
	AI_Output(self,hero,"Info_Saturas_XARDASGO_14_02");	//� �� ������ ����, ���� �� ��� ����!
	AI_Output(self,hero,"Info_Saturas_XARDASGO_14_03");	//��� �����, ����� ����� �� ��� � ����� ����������.
	AI_Output(self,hero,"Info_Saturas_XARDASGO_14_04");	//����� ����, � ������ ������ ���� ���-�� � ���� � ��������� �������, ����������� ������.
	AI_Output(hero,self,"Info_Saturas_XARDASGO_15_05");	//� ��������� ��� ����������. � �� ��������...
	AI_Output(hero,self,"Info_Saturas_XARDASGO_15_06");	//� ��� �������!
	b_logentry(CH4_FINDXARDAS,"� ���������� ����� ���� ���� ����������, � ������� ����������� ���������� ��������. ��� ������� ������������ � ����.");
};


instance KDW_600_SATURAS_TIMESUP(C_INFO)
{
	npc = kdw_600_saturas;
	condition = kdw_600_saturas_timesup_condition;
	information = kdw_600_saturas_timesup_info;
	important = 1;
	permanent = 0;
};


func int kdw_600_saturas_timesup_condition()
{
	if((FINDORCSHAMAN == LOG_RUNNING) || (FINDORCSHAMAN == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void kdw_600_saturas_timesup_info()
{
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_00");	//�� ������� � ���������?
	Info_ClearChoices(kdw_600_saturas_timesup);
	Info_AddChoice(kdw_600_saturas_timesup,"��...",kdw_600_saturas_timesup_ja1);
	Info_AddChoice(kdw_600_saturas_timesup,"���...",kdw_600_saturas_timesup_ja2);
	Info_AddChoice(kdw_600_saturas_timesup,"��� ������ �� ���, ��� �� �������...",kdw_600_saturas_timesup_ja3);
};

func void kdw_600_saturas_timesup_ja1()
{
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_01");	//��...
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_02");	//��?.. �� ���?
};

func void kdw_600_saturas_timesup_ja2()
{
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_05");	//���...
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_06");	//������?
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_07");	//� ���� �� ���� ����� ��� �����...
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_08");	//���� ���� ����� ��� � �������� ������!
	b_story_cancelfindxardas();
	AI_StopProcessInfos(self);
};

func void kdw_600_saturas_timesup_ja3()
{
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_09");	//��� ������ �� ���, ��� �� �������...
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_10");	//��� �� ������ � ����? �� ������ ����� ������ �������� ��� �������� ����.
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_11");	//������ ����... �... ��� ��� ����� �������!
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_12");	//����� ��������, �� ������ ������ ���!
	b_story_cancelfindxardas();
	AI_StopProcessInfos(self);
};


instance KDW_600_SATURAS_HOGEAUFNAHME(C_INFO)
{
	npc = kdw_600_saturas;
	nr = 10;
	condition = kdw_600_saturas_hogeaufnahme_condition;
	information = kdw_600_saturas_hogeaufnahme_info;
	permanent = 0;
	description = "�������� ������, ��� � ��� ����� ������ ������� ���� ����.";
};


func int kdw_600_saturas_hogeaufnahme_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_murder) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return 1;
	};
};

func void kdw_600_saturas_hogeaufnahme_info()
{
	AI_Output(other,self,"KDW_600_Saturas_HogeAUFNAHME_15_00");	//�������� ������, ��� � ��� ����� ������ ������� ���� ����.
	AI_Output(self,other,"KDW_600_Saturas_NOMOREOC_Info_14_03");	//�� � �������� ������ ����!
	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_01");	//������ �� ���, ��� � ���� ������ � ������� ����� ����� ����?
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_02");	//���. ������� �� ������ �������� ������ ����.
};


instance KDW_600_SATURAS_HOGEAUFNAHMETEIL2(C_INFO)
{
	npc = kdw_600_saturas;
	nr = 10;
	condition = kdw_600_saturas_hogeaufnahmeteil2_condition;
	information = kdw_600_saturas_hogeaufnahmeteil2_info;
	permanent = 0;
	description = "� ����� �������� ������.";
};


func int kdw_600_saturas_hogeaufnahmeteil2_condition()
{
	if(Npc_KnowsInfo(hero,kdw_600_saturas_hogeaufnahme) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return 1;
	};
};

func void kdw_600_saturas_hogeaufnahmeteil2_info()
{
	AI_GotoNpc(hero,self);
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01");	//� ����� �������� ������.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03");	//�������� �� ���� ����� ������:
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04");	//������� ����������� �����...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05");	//������� ����������� �����...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06");	//... � ����� ��������� ����...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07");	//... � ����� ��������� ����...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08");	//...��� ������ � �������� ��� ����� ������� ���� ������ � �� ��������� �����...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09");	//...��� ������ � ������� ��� ����� ������� ���� ������ � �� ��������� �����...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10");	//...�� ��� ���, ���� ��� ������� ���� �� ������� ����� � �������� ������� � �� �������� �������� ���� �����.
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11");	//...�� ��� ���, ���� ��� ������� ���� �� ������� ����� � �������� ������� � �� �������� �������� ���� �����.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14");	//������ ��� ������� � ���� ��� � ���� ����� �� ��������� ����� � � ��������. 
	CreateInvItem(self,kdw_armor_l);
	b_giveinvitems(self,other,kdw_armor_l,1);
	AI_EquipBestArmor(hero);
	Snd_Play("MFX_Heal_Cast");
	Npc_SetTrueGuild(hero,GIL_KDW);
	hero.guild = GIL_KDW;
	Log_CreateTopic(CH4_SLDTOKDW,LOG_NOTE);
	b_logentry(CH4_SLDTOKDW,"������� ������ ���� � ���� ����� ����.");
	AI_StopProcessInfos(self);
};

