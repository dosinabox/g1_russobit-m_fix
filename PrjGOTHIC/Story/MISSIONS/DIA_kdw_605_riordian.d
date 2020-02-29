
instance INFO_RIORDIAN_EXIT(C_INFO)
{
	npc = kdw_605_riordian;
	nr = 999;
	condition = info_riordian_exit_condition;
	information = info_riordian_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_riordian_exit_condition()
{
	return TRUE;
};

func void info_riordian_exit_info()
{
	AI_StopProcessInfos(self);
	if(!Npc_HasItems(self,itarrunethunderball))
	{
		CreateInvItem(self,itarrunethunderball);
	};
};


instance INFO_RIORDIAN_NEWS(C_INFO)
{
	npc = kdw_605_riordian;
	condition = info_riordian_news_condition;
	information = info_riordian_news_info;
	permanent = 0;
	important = 0;
	description = "���� ������� �������.";
};


func int info_riordian_news_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_offer))
	{
		return TRUE;
	};
};

func void info_riordian_news_info()
{
	AI_Output(other,self,"Info_Riordian_NEWS_15_01");	//���� ������� �������.
	AI_Output(self,other,"Info_Riordian_NEWS_14_02");	//������. ��� ��� �������� � ����.
	AI_Output(self,other,"Info_Riordian_NEWS_14_03");	//���, ������ ��� ��������. ����� ���, ��� ���� ����� �����������.
	AI_Output(self,other,"Info_Riordian_NEWS_14_04");	//������ ������ ����. ��� ����� ���� ��������� ������� - ����� ��!
	CreateInvItems(self,itfo_potion_health_01,20);
	b_giveinvitems(self,hero,itfo_potion_health_01,20);
	Npc_RemoveInvItems(hero,itfo_potion_health_01,15);
	CreateInvItems(hero,itfo_potion_mana_01,5);
	CreateInvItems(hero,itfo_potion_health_02,2);
	CreateInvItems(hero,itfo_potion_mana_02,2);
	CreateInvItems(hero,itfo_potion_health_03,1);
	CreateInvItems(hero,itfo_potion_mana_03,1);
	CreateInvItems(hero,itfo_potion_haste_02,2);
	CreateInvItems(hero,itfo_potion_strength_01,1);
	CreateInvItems(hero,itfo_potion_dex_01,1);
};


instance INFO_RIORDIAN_REWARD(C_INFO)
{
	npc = kdw_605_riordian;
	condition = info_riordian_reward_condition;
	information = info_riordian_reward_info;
	permanent = 0;
	important = 0;
	description = "������� ������, ��� � ���� ���� ��� ���� �������.";
};


func int info_riordian_reward_condition()
{
	if(SATURAS_BRINGFOCI == 5)
	{
		return TRUE;
	};
};

func void info_riordian_reward_info()
{
	AI_Output(other,self,"Info_Riordian_REWARD_15_01");	//������� ������, ��� � ���� ���� ��� ���� �������.
	AI_Output(self,other,"Info_Riordian_REWARD_14_02");	//�, �� �������, �������.
	AI_Output(self,other,"Info_Riordian_REWARD_14_03");	//��� �������� ��������� ��������� � ����� ��������� ���������.
	AI_Output(self,other,"Info_Riordian_REWARD_14_04");	//��� ������ ������ - �� ��� ���, ���� ������� - � �������� ����� ����� �����.
	AI_Output(self,other,"Info_Riordian_REWARD_14_05");	//����� �� ��� ��� �������� ������� � ���� ����� �������������.
	CreateInvItems(self,itfo_potion_health_02,20);
	b_giveinvitems(self,hero,itfo_potion_health_02,20);
	Npc_RemoveInvItems(hero,itfo_potion_health_02,15);
	CreateInvItems(hero,itfo_potion_mana_02,5);
	CreateInvItems(hero,itfo_potion_health_03,2);
	CreateInvItems(hero,itfo_potion_mana_03,2);
	CreateInvItems(hero,itfo_potion_haste_02,3);
	CreateInvItems(hero,itfo_potion_master_01,1);
	CreateInvItems(hero,itfo_potion_health_perma_02,1);
	CreateInvItems(hero,itfo_potion_mana_perma_02,1);
	b_logentry(CH3_BRINGFOCI,"�������� ��� ��� ��������� �����, ������� ��� ����� ����������� � ��������� �����.");
	if(Npc_KnowsInfo(hero,info_cronos_reward))
	{
		Log_SetTopicStatus(CH3_BRINGFOCI,LOG_SUCCESS);
	};
};


instance INFO_RIORDIAN_MESSAGE(C_INFO)
{
	npc = kdw_605_riordian;
	condition = info_riordian_message_condition;
	information = info_riordian_message_info;
	permanent = 0;
	important = 1;
};


func int info_riordian_message_condition()
{
	if(URSHAK_SPOKEOFULUMULU && !ENTEREDFREEMINE)
	{
		return TRUE;
	};
};

func void info_riordian_message_info()
{
	AI_Output(self,hero,"Info_Riordian_MESSAGE_14_01");	//���, ��� �� ������! � ���� ����!
};


instance INFO_RIORDIAN_MESSAGEWHY(C_INFO)
{
	npc = kdw_605_riordian;
	condition = info_riordian_messagewhy_condition;
	information = info_riordian_messagewhy_info;
	permanent = 0;
	important = 0;
	description = "�� ���� ����? �����?";
};


func int info_riordian_messagewhy_condition()
{
	if(Npc_KnowsInfo(hero,info_riordian_message))
	{
		return TRUE;
	};
};

func void info_riordian_messagewhy_info()
{
	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_01");	//�� ���� ����? �����?
	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_02");	//���� ������ ��������� ���� � ����, ��� ������ �� ����������!
	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_03");	//� � ��� ����?
	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_04");	//� ���� ���� ����, ��� ���������� ����������� �����.
	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_05");	//�� ��� ��� �������� ���� � �����?
	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_06");	//��! �, ����������, ����������� � ����, ��� ����� �������.
};


instance KDW_605_RIORDIAN_WELCOME(C_INFO)
{
	npc = kdw_605_riordian;
	condition = kdw_605_riordian_welcome_condition;
	information = kdw_605_riordian_welcome_info;
	important = 1;
	permanent = 0;
};


func int kdw_605_riordian_welcome_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDW)
	{
		return TRUE;
	};
};

func void kdw_605_riordian_welcome_info()
{
	AI_Output(self,other,"KDW_605_Riordian_WELCOME_Info_14_01");	//� ���, ��� �� ������ � ����.
};


instance KDW_605_RIORDIAN_HEAL(C_INFO)
{
	npc = kdw_605_riordian;
	condition = kdw_605_riordian_heal_condition;
	information = kdw_605_riordian_heal_info;
	important = 1;
	permanent = 0;
};


func int kdw_605_riordian_heal_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_KDW) && Npc_KnowsInfo(hero,kdw_605_riordian_welcome))
	{
		return TRUE;
	};
};

func void kdw_605_riordian_heal_info()
{
	AI_Output(self,other,"KDW_605_Riordian_HEAL_Info_14_01");	//���� �� �����, � ���� �������� ����.
};


instance KDW_605_RIORDIAN_HEALINFO(C_INFO)
{
	npc = kdw_605_riordian;
	nr = 100;
	condition = kdw_605_riordian_healinfo_condition;
	information = kdw_605_riordian_healinfo_info;
	important = 0;
	permanent = 1;
	description = "� �����. �� ������ �������� ����?";
};


func int kdw_605_riordian_healinfo_condition()
{
	if((hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void kdw_605_riordian_healinfo_info()
{
	AI_Output(other,self,"KDW_605_Riordian_HEALINFO_Info_15_01");	//� �����. �� ������ �������� ����?
	AI_Output(self,other,"KDW_605_Riordian_HEALINFO_Info_14_02");	//�� ������� ����� ��� �������� � ���� ����!
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	//Snd_Play("MFX_Heal_Cast");
};


instance KDW_605_RIORDIAN_GREET(C_INFO)
{
	npc = kdw_605_riordian;
	condition = kdw_605_riordian_greet_condition;
	information = kdw_605_riordian_greet_info;
	important = 0;
	permanent = 0;
	description = "����������� ����, ���!";
};


func int kdw_605_riordian_greet_condition()
{
	return TRUE;
};

func void kdw_605_riordian_greet_info()
{
	AI_Output(other,self,"KDW_605_Riordian_GREET_Info_15_01");	//����������� ����, ���!
	AI_Output(self,other,"KDW_605_Riordian_GREET_Info_14_02");	//� �������, �������. �������, ���� ����� �������?
	Log_CreateTopic(GE_TRADERNC,LOG_NOTE);
	b_logentry(GE_TRADERNC,"��� ����� ���� ������� ������� ���������� �����. � ���� ����� ��� � ����������� �� ������ ������ ������.");
};


instance KDW_605_RIORDIAN_TRADE(C_INFO)
{
	npc = kdw_605_riordian;
	condition = kdw_605_riordian_trade_condition;
	information = kdw_605_riordian_trade_info;
	important = 0;
	permanent = 1;
	description = "������ ��� ���� ������.";
	trade = 1;
};


func int kdw_605_riordian_trade_condition()
{
	if(Npc_KnowsInfo(hero,kdw_605_riordian_greet))
	{
		return TRUE;
	};
};

func void kdw_605_riordian_trade_info()
{
	AI_Output(other,self,"KDW_605_Riordian_TRADE_Info_15_01");	//������ ��� ���� ������.
	if(Npc_HasItems(self,itarrunethunderball) >= 1)
	{
		Npc_RemoveInvItems(self,itarrunethunderball,Npc_HasItems(self,itarrunethunderball));
	};
};

