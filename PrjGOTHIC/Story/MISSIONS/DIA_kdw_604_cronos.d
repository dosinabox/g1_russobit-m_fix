
func void b_cronoslearn()
{
	Info_ClearChoices(kdw_604_cronos_mana);
	Info_AddChoice(kdw_604_cronos_mana,DIALOG_BACK,kdw_604_cronos_mana_back);
	if(hero.guild == GIL_ORG || hero.guild == GIL_SLD || hero.guild == GIL_KDW)
	{
		Info_AddChoice(kdw_604_cronos_mana,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,0),kdw_604_cronos_mana_man_5);
		Info_AddChoice(kdw_604_cronos_mana,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,0),kdw_604_cronos_mana_man_1);
	}
	else
	{
		Info_AddChoice(kdw_604_cronos_mana,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,OTHERCAMPLEARNPAY * 5),kdw_604_cronos_mana_man_5);
		Info_AddChoice(kdw_604_cronos_mana,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,OTHERCAMPLEARNPAY),kdw_604_cronos_mana_man_1);
	};
};

instance KDW_604_CRONOS_EXIT(C_INFO)
{
	npc = kdw_604_cronos;
	nr = 999;
	condition = kdw_604_cronos_exit_condition;
	information = kdw_604_cronos_exit_info;
	permanent = 1;
	important = 0;
	description = DIALOG_ENDE;
};


func int kdw_604_cronos_exit_condition()
{
	return 1;
};

func void kdw_604_cronos_exit_info()
{
	AI_StopProcessInfos(self);
};


instance KDW_604_CRONOS_BRIEF(C_INFO)
{
	npc = kdw_604_cronos;
	nr = 1;
	condition = kdw_604_cronos_brief_condition;
	information = kdw_604_cronos_brief_info;
	permanent = 0;
	description = "� ���� ���� �������� � ���������� ���� ����� ����.";
};


func int kdw_604_cronos_brief_condition()
{
	if(Npc_KnowsInfo(hero,kdw_604_cronos_greet) && (Npc_GetTrueGuild(hero) != GIL_STT) && (Npc_GetTrueGuild(hero) != GIL_KDF) && (Npc_GetTrueGuild(hero) != GIL_ORG) && (Npc_HasItems(hero,itwr_fire_letter_01) || Npc_HasItems(hero,itwr_fire_letter_02)))
	{
		return 1;
	};
};

func void kdw_604_cronos_brief_info()
{
	AI_Output(other,self,"DIA_Cronos_Brief_15_00");	//� ���� ���� �������� � ���������� ���� ����� ����.
	AI_Output(self,other,"DIA_Cronos_Brief_08_01");	//����� ����� ������ ���� ����� ����. ����� ����� ���� ����� ����� � ������ ������.
	AI_Output(other,self,"DIA_Cronos_Brief_15_02");	//�� ��� ������ � �����. �� ������ ������ ��� ������� ����?
	AI_Output(self,other,"DIA_Cronos_Brief_08_03");	//������ �� �������� ������ � ����� ������� � ������ ������...
	AI_Output(self,other,"DIA_Cronos_Brief_08_04");	//�� �� �������� ���� �������� ������ ����� �����. �� ��������� � ����������� ����� �������� � ������� ������ ���.
};


instance KDW_604_CRONOS_BARRIER(C_INFO)
{
	npc = kdw_604_cronos;
	nr = 2;
	condition = kdw_604_cronos_barrier_condition;
	information = kdw_604_cronos_barrier_info;
	permanent = 0;
	description = "�� ������ ��������� ������? � ��� ��� ����� �������?";
};


func int kdw_604_cronos_barrier_condition()
{
	if(Npc_KnowsInfo(hero,kdw_604_cronos_greet))
	{
		return 1;
	};
};

func void kdw_604_cronos_barrier_info()
{
	AI_Output(other,self,"DIA_Cronos_Barrier_15_00");	//�� ������ ��������� ������? � ��� ��� ����� �������?
	AI_Output(self,other,"DIA_Cronos_Barrier_08_01");	//��� ����� ��� ����� ����� ����� ����.
	AI_Output(self,other,"DIA_Cronos_Barrier_08_02");	//�� ����� ������ ��������� �� �������� ��� ���� ��������� ���� �� ������ � ��������� ���.
	AI_Output(self,other,"DIA_Cronos_Barrier_08_03");	//�������, ��� ���� ���������� ������, ��� ����� ����� ���, ��� ����� �����.
	AI_Output(self,other,"DIA_Cronos_Barrier_08_04");	//������� � ��� ������ �������� ������ ����� �� �����.
};


instance KDW_604_CRONOS_WANNAJOIN(C_INFO)
{
	npc = kdw_604_cronos;
	nr = 3;
	condition = kdw_604_cronos_wannajoin_condition;
	information = kdw_604_cronos_wannajoin_info;
	permanent = 0;
	description = "� ���� �������������� � ����� ������.";
};


func int kdw_604_cronos_wannajoin_condition()
{
	if(Npc_KnowsInfo(hero,kdw_604_cronos_greet))
	{
		return 1;
	};
};

func void kdw_604_cronos_wannajoin_info()
{
	AI_Output(other,self,"DIA_Cronos_WannaJoin_15_00");	//� ���� �������������� � ����� ������.
	AI_Output(self,other,"DIA_Cronos_WannaJoin_08_01");	//���� �� ������ �������������� � ����� ������, �������� � �� ��� � ������.
};


instance KDW_604_CRONOS_WANNAMAGE(C_INFO)
{
	npc = kdw_604_cronos;
	nr = 3;
	condition = kdw_604_cronos_wannamage_condition;
	information = kdw_604_cronos_wannamage_info;
	permanent = 0;
	description = "� ���� ����� �����!";
};


func int kdw_604_cronos_wannamage_condition()
{
	if(Npc_KnowsInfo(hero,kdw_604_cronos_wannajoin))
	{
		return 1;
	};
};

func void kdw_604_cronos_wannamage_info()
{
	AI_Output(other,self,"DIA_Cronos_WannaMage_15_00");	//� ���� ����� �����!
	AI_Output(self,other,"DIA_Cronos_WannaMage_08_01");	//�� �� ����� ���������� ���� ������ ������ ����� ������.
	AI_Output(self,other,"DIA_Cronos_WannaMage_08_02");	//������ ����� �� �������� ���, ��� �� ����� ������ ����, �� ������ ���������� � ������ ��������.
};


instance KDW_604_CRONOS_BANDIT(C_INFO)
{
	npc = kdw_604_cronos;
	nr = 4;
	condition = kdw_604_cronos_bandit_condition;
	information = kdw_604_cronos_bandit_info;
	permanent = 0;
	description = "� ���� ����� �� ����� �����... � ���� ���� ��� ���� ���-������?";
};


func int kdw_604_cronos_bandit_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_ORG) || (Npc_GetTrueGuild(hero) == GIL_SLD) && KAPITEL < 4)
	{
		return 1;
	};
};

func void kdw_604_cronos_bandit_info()
{
	AI_Output(other,self,"DIA_Cronos_Bandit_15_00");	//� ���� ����� �� ����� �����. ������ � ���� ������ �������� ����� ����. � ���� ���� ��� ���� ���-������?
	AI_Output(self,other,"DIA_Cronos_Bandit_08_01");	//��, ����. �� ���� ����� ���� ������ ����������, ����� ���� ������ �� ��������� ���� � �����.
	AI_Output(self,other,"DIA_Cronos_Bandit_08_02");	//���, ������ ��� ������ � ����. � ������ ���� ����� �������!
	CreateInvItem(other,kdw_amulett);
	CreateInvItem(other,cronos_brief);
	CRONOS_MESSENGER = LOG_RUNNING;
	Log_CreateTopic(KDWLETTER,LOG_MISSION);
	Log_SetTopicStatus(KDWLETTER,LOG_RUNNING);
	b_logentry(KDWLETTER,"������ ������� ��� ������ ��������, ������� � ������ ������� ����� ���� � ������ ������.");
};


instance KDW_604_CRONOS_BRIEFBACK(C_INFO)
{
	npc = kdw_604_cronos;
	nr = 3;
	condition = kdw_604_cronos_briefback_condition;
	information = kdw_604_cronos_briefback_info;
	permanent = 0;
	description = "� ������� ��������!";
};


func int kdw_604_cronos_briefback_condition()
{
	if(CRONOS_MESSENGER == LOG_RUNNING && Npc_KnowsInfo(hero,dia_milten_nocheinbrief))
	{
		return 1;
	};
};

func void kdw_604_cronos_briefback_info()
{
	AI_Output(other,self,"DIA_Cronos_BriefBack_15_00");	//� ������� ��������!
	AI_Output(self,other,"DIA_Cronos_BriefBack_08_01");	//�, ������! ������ ��� � ������� �� ���� �����...
	CRONOS_MESSENGER = LOG_SUCCESS;
	CreateInvItems(self,itminugget,200);
	b_giveinvitems(self,other,itminugget,200);
	b_givexp(XP_CRONOSLETTER);
	Log_SetTopicStatus(KDWLETTER,LOG_SUCCESS);
	b_logentry(KDWLETTER,"���� ���� �������� ���� �������.");
};


instance INFO_CRONOS_NEWS(C_INFO)
{
	npc = kdw_604_cronos;
	condition = info_cronos_news_condition;
	information = info_cronos_news_info;
	permanent = 0;
	important = 0;
	description = "� ���� �������� �������� ����� ������.";
};


func int info_cronos_news_condition()
{
	if((CORANGAR_SENDTONC == TRUE) && !Npc_KnowsInfo(hero,info_cronos_sleeper))
	{
		return TRUE;
	};
};

func void info_cronos_news_info()
{
	AI_Output(other,self,"Info_Cronos_NEWS_15_01");	//� ���� �������� �������� ����� ������.
	AI_Output(self,other,"Info_Cronos_NEWS_08_02");	//����� ��� �������� ��� �����, ����� ��������� ������ ��������� ������ �� ��� ������ ������?
};


instance INFO_CRONOS_KALOM(C_INFO)
{
	npc = kdw_604_cronos;
	nr = 10;
	condition = info_cronos_kalom_condition;
	information = info_cronos_kalom_info;
	permanent = 0;
	important = 0;
	description = "��� ����� � ����������� ���������� �������� ���� �� ��������!";
};


func int info_cronos_kalom_condition()
{
	if(Npc_KnowsInfo(hero,info_cronos_news) && !Npc_KnowsInfo(hero,info_cronos_sleeper))
	{
		return TRUE;
	};
};

func void info_cronos_kalom_info()
{
	AI_Output(other,self,"Info_Cronos_KALOM_15_01");	//��� ����� � ����������� ���������� �������� ���� �� ��������!
	AI_Output(other,self,"Info_Cronos_KALOM_15_02");	//��� ���� ����� ����� ������� � �������� ��� ������������ ���.
	AI_Output(self,other,"Info_Cronos_KALOM_08_03");	//� ������� ��� �� �������. �� �����, ����� ����� �� ��������, ����� ��, ��� ��� �������� ����� ������. �� �������� �� ���.
	AI_Output(self,other,"Info_Cronos_KALOM_08_04");	//�����, ��� ���� � �������� ����� ������� �����!
	AI_Output(self,other,"Info_Cronos_KALOM_08_05");	//� ������ �� ���� ��������, ��� ������ � ���� ����� �����������. � ������ ���!
	AI_StopProcessInfos(self);
};


instance INFO_CRONOS_YBERION(C_INFO)
{
	npc = kdw_604_cronos;
	nr = 20;
	condition = info_cronos_yberion_condition;
	information = info_cronos_yberion_info;
	permanent = 0;
	important = 0;
	description = "���� �������� ������� ���� ���������. ��� �������� �������.";
};


func int info_cronos_yberion_condition()
{
	if(Npc_KnowsInfo(hero,info_cronos_news) && !Npc_KnowsInfo(hero,info_cronos_sleeper))
	{
		return TRUE;
	};
};

func void info_cronos_yberion_info()
{
	AI_Output(other,self,"Info_Cronos_YBERION_15_03");	//���� �������� ������� ���� ���������. ��� �������� �������.
	AI_Output(other,self,"Info_Cronos_YBERION_15_04");	//�� ���������� ���������� ����� ��������� �� ��������. �� ����� �� ��������.
	if(YBERION_DIED == TRUE)
	{
		AI_Output(other,self,"Info_Cronos_YBERION_15_01");	//�������, ����� ��������� ��������� ������, ����!
	};
	AI_Output(self,other,"Info_Cronos_YBERION_08_02");	//���? ��� ��� ����� ���������?
	AI_Output(self,other,"Info_Cronos_YBERION_08_05");	//��� ����� ��������� �������. ������� ��� ����� �� ����� ���������.
	AI_Output(self,other,"Info_Cronos_YBERION_08_06");	//�� �� ����� ��-�� ����� ��������� �������� �� ������������.
	AI_StopProcessInfos(self);
};


instance INFO_CRONOS_SLEEPER(C_INFO)
{
	npc = kdw_604_cronos;
	nr = 30;
	condition = info_cronos_sleeper_condition;
	information = info_cronos_sleeper_info;
	permanent = 0;
	important = 0;
	description = "���� ������, ��� �� ��� ������ �� ����� ���� - ���� �����!";
};


func int info_cronos_sleeper_condition()
{
	if(Npc_KnowsInfo(hero,info_cronos_news))
	{
		return TRUE;
	};
};

func void info_cronos_sleeper_info()
{
	AI_Output(other,self,"Info_Cronos_SLEEPER_15_01");	//���� ������, ��� �� ��� ������ �� ����� ���� - ��������� ���� �����!
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_02");	//������ ��� ������� ������� ����� �� �������?
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_03");	//��� ����� ������ �� ��������� �������� ���� �������, ��...
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_04");	//... ��� ���� ��� �����... ����� ��� ���� ������� ��������� � ���������.
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_05");	//�� ������ �������� �� ���� ��������. �� ������ ������, ��� ������ ������.
	AI_Output(other,self,"Info_Cronos_SLEEPER_15_06");	//��� ����� ��������?
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_07");	//��������� �� ������� �������. ����� ����������, ��� �� ������� ��� ����������.
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_08");	//������ ����� - ����������.
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_09");	//������� ������ ����� � ������� �����������.
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_10");	//��� �� �������� ���� ������������, �������� ���������, ��� ����� ����� �������� ���� ����.
	b_logentry(CH3_ESCAPEPLANNC,"������ ��� ��� ���������� �� �������� � ���������. ������ ���������� ���� ����� ����� � �����������. ����� ������� ���������� ������... ��� ����, ������� � ��� �����?!");
	b_givexp(XP_GETCRONOSPERMISSION);
	AI_StopProcessInfos(self);
};


instance INFO_CRONOS_PAROLE(C_INFO)
{
	npc = kdw_604_cronos;
	nr = 30;
	condition = info_cronos_parole_condition;
	information = info_cronos_parole_info;
	permanent = 0;
	important = 0;
	description = "����� ��� ������, � �� ���� ��� ���������.";
};


func int info_cronos_parole_condition()
{
	if(Npc_KnowsInfo(hero,info_cronos_sleeper) && !Npc_KnowsInfo(hero,info_saturas_news))
	{
		return TRUE;
	};
};

func void info_cronos_parole_info()
{
	AI_Output(other,self,"Info_Cronos_PAROLE_15_01");	//����� ��� ������, � �� ���� ��� ���������.
	AI_Output(self,other,"Info_Cronos_PAROLE_08_02");	//��, ������ � ���� ���. �������, ������ ����������.
};


instance INFO_CRONOS_REWARD(C_INFO)
{
	npc = kdw_604_cronos;
	nr = 30;
	condition = info_cronos_reward_condition;
	information = info_cronos_reward_info;
	permanent = 0;
	important = 0;
	description = "������� ������, ��� � ���� ���� ��� ���� �������.";
};


func int info_cronos_reward_condition()
{
	if(SATURAS_BRINGFOCI == 5)
	{
		return TRUE;
	};
};

func void info_cronos_reward_info()
{
	AI_Output(other,self,"Info_Cronos_REWARD_15_01");	//������� ������, ��� � ���� ���� ��� ���� �������.
	AI_Output(self,other,"Info_Cronos_REWARD_08_02");	//��� ��������� ���� � ��� ���� ��������� ����� ����� �������, ��� ������� �� ���� �����.
	AI_Output(self,other,"Info_Cronos_REWARD_08_03");	//�������, �� ������� ������� ������������ ��.
	b_logentry(CH3_BRINGFOCI,"������ ��� ��� ���������� ����� ����, �� �� ����� ������ ���� ��������� �� �����������.");
	if(Npc_KnowsInfo(hero,info_riordian_reward))
	{
		Log_SetTopicStatus(CH3_BRINGFOCI,LOG_SUCCESS);
	};
	CreateInvItems(self,itminugget,1000);
	b_giveinvitems(self,hero,itminugget,1000);
};


instance KDW_604_CRONOS_WELCOME(C_INFO)
{
	npc = kdw_604_cronos;
	condition = kdw_604_cronos_welcome_condition;
	information = kdw_604_cronos_welcome_info;
	important = 1;
	permanent = 0;
};


func int kdw_604_cronos_welcome_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDW)
	{
		return TRUE;
	};
};

func void kdw_604_cronos_welcome_info()
{
	AI_Output(self,other,"KDW_604_Cronos_WELCOME_Info_08_01");	//�� ������ ���������� �������. ������ �� ���� �� ����� ����. ����� ����������, ����!
	AI_StopProcessInfos(self);
};


instance KDW_604_CRONOS_MANA(C_INFO)
{
	npc = kdw_604_cronos;
	nr = 800;
	condition = kdw_604_cronos_mana_condition;
	information = kdw_604_cronos_mana_info;
	important = 0;
	permanent = 1;
	description = "� ���� ��������� ���� ���������� ����.";
};


func int kdw_604_cronos_mana_condition()
{
	if(Npc_KnowsInfo(hero,kdw_604_cronos_greet) && ((CORANGAR_SENDTONC == FALSE) || Npc_KnowsInfo(hero,info_cronos_sleeper)))
	{
		return TRUE;
	};
};

func void kdw_604_cronos_mana_info()
{
	AI_Output(other,self,"KDW_604_Cronos_MANA_Info_15_01");	//� ���� ��������� ���� ���������� ����.
	AI_Output(self,other,"KDW_604_Cronos_MANA_Info_08_02");	//� ���� ������ ���� � ����. ��������� ���� ���� � ����.
	b_cronoslearn();
};

func void kdw_604_cronos_mana_back()
{
	Info_ClearChoices(kdw_604_cronos_mana);
};

func void kdw_604_cronos_mana_man_1()
{
	if(hero.guild == GIL_ORG || hero.guild == GIL_SLD || hero.guild == GIL_KDW)
	{
		b_buyattributepoints(other,ATR_MANA_MAX,LPCOST_ATTRIBUTE_MANA);
	}
	else if(Npc_HasItems(hero,itminugget) >= OTHERCAMPLEARNPAY)
	{
		if(hero.lp >= 1 && hero.attribute[ATR_MANA_MAX] < 100)
		{
			b_giveinvitems(other,self,itminugget,OTHERCAMPLEARNPAY);
		};
		b_buyattributepoints(other,ATR_MANA_MAX,LPCOST_ATTRIBUTE_MANA);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� �� ��� ����� ����.
		AI_Output(self,other,"SVM_8_NotNow");	//������ �� �����.
	};
	b_cronoslearn();
};

func void kdw_604_cronos_mana_man_5()
{
	if(hero.guild == GIL_ORG || hero.guild == GIL_SLD || hero.guild == GIL_KDW)
	{
		b_buyattributepoints(other,ATR_MANA_MAX,5 * LPCOST_ATTRIBUTE_MANA);
	}
	else if(Npc_HasItems(hero,itminugget) >= OTHERCAMPLEARNPAY * 5)
	{
		if(hero.lp >= 5 && hero.attribute[ATR_MANA_MAX] < 96)
		{
			b_giveinvitems(other,self,itminugget,OTHERCAMPLEARNPAY * 5);
		};
		b_buyattributepoints(other,ATR_MANA_MAX,5 * LPCOST_ATTRIBUTE_MANA);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� �� ��� ����� ����.
		AI_Output(self,other,"SVM_8_NotNow");	//������ �� �����.
	};
	b_cronoslearn();
};


instance KDW_604_CRONOS_SELLSTUFF(C_INFO)
{
	npc = kdw_604_cronos;
	nr = 900;
	condition = kdw_604_cronos_sellstuff_condition;
	information = kdw_604_cronos_sellstuff_info;
	important = 0;
	permanent = 1;
	description = DIALOG_TRADE;
	trade = 1;
};


func int kdw_604_cronos_sellstuff_condition()
{
	if(Npc_KnowsInfo(hero,kdw_604_cronos_greet) && ((CORANGAR_SENDTONC == FALSE) || Npc_KnowsInfo(hero,info_cronos_sleeper)))
	{
		return TRUE;
	};
};

func void kdw_604_cronos_sellstuff_info()
{
	AI_Output(other,self,"KDW_604_Cronos_SELLSTUFF_Info_15_01");	//� ���� ���������� ���������� ������.
};


instance KDW_604_CRONOS_GREET(C_INFO)
{
	npc = kdw_604_cronos;
	condition = kdw_604_cronos_greet_condition;
	information = kdw_604_cronos_greet_info;
	important = 0;
	permanent = 0;
	description = "����������� ����, ���!";
};


func int kdw_604_cronos_greet_condition()
{
	return TRUE;
};

func void kdw_604_cronos_greet_info()
{
	AI_Output(other,self,"KDW_604_Cronos_GREET_Info_15_01");	//����������� ����, ���!
	AI_Output(self,other,"KDW_604_Cronos_GREET_Info_08_02");	//�� �������� � ����� ������������� �������! � ���� ������ ������ ���� ����� ������� ��� ���� ���� ���-�� ��������.
	AI_Output(self,other,"KDW_604_Cronos_GREET_Info_08_03");	//��� � ���� ������� ��� ����?
	Log_CreateTopic(GE_TRADERNC,LOG_NOTE);
	b_logentry(GE_TRADERNC,"������ ������� ����, ������ � ������. ������ ����� �� ����� � �������, ����������� ������ ����.");
	Log_CreateTopic(GE_TEACHERNC,LOG_NOTE);
	b_logentry(GE_TEACHERNC,"������ ����� ������ ��� �������� ��� ���������� ����. ��� ����� ����� � ������ ����.");
};

