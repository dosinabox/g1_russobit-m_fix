
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
	description = "Меня прислал Сатурас.";
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
	AI_Output(other,self,"Info_Riordian_NEWS_15_01");	//Меня прислал Сатурас.
	AI_Output(self,other,"Info_Riordian_NEWS_14_02");	//Заходи. Мне уже доложили о тебе.
	AI_Output(self,other,"Info_Riordian_NEWS_14_03");	//Вот, возьми эти эликсиры. Здесь все, что тебе может пригодиться.
	AI_Output(self,other,"Info_Riordian_NEWS_14_04");	//Теперь можешь идти. Эти камни наша последняя надежда - отыщи их!
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
	description = "Сатурас сказал, что у тебя есть для меня награда.";
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
	AI_Output(other,self,"Info_Riordian_REWARD_15_01");	//Сатурас сказал, что у тебя есть для меня награда.
	AI_Output(self,other,"Info_Riordian_REWARD_14_02");	//А, ну проходи, проходи.
	AI_Output(self,other,"Info_Riordian_REWARD_14_03");	//Наш духовный наставник рассказал о твоих геройских поступках.
	AI_Output(self,other,"Info_Riordian_REWARD_14_04");	//Все жители лагеря - да что там, всей колонии - в глубоком долгу перед тобой.
	AI_Output(self,other,"Info_Riordian_REWARD_14_05");	//Прими от нас эту скромную награду в знак нашей благодарности.
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
	b_logentry(CH3_BRINGFOCI,"Риоридан дал мне несколько зелий, которые мне могут пригодиться в ближайшее время.");
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
	AI_Output(self,hero,"Info_Riordian_MESSAGE_14_01");	//Рад, что ты пришел! Я ждал тебя!
};


instance INFO_RIORDIAN_MESSAGEWHY(C_INFO)
{
	npc = kdw_605_riordian;
	condition = info_riordian_messagewhy_condition;
	information = info_riordian_messagewhy_info;
	permanent = 0;
	important = 0;
	description = "Ты ждал меня? Зачем?";
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
	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_01");	//Ты ждал меня? Зачем?
	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_02");	//Горн просил отправить тебя к нему, как только ты объявишься!
	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_03");	//А в чем дело?
	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_04");	//У него есть план, как освободить захваченную шахту.
	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_05");	//Он все еще охраняет вход в шахту?
	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_06");	//Да! И, пожалуйста, отправляйся к нему, как можно быстрее.
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
	AI_Output(self,other,"KDW_605_Riordian_WELCOME_Info_14_01");	//Я рад, что ты теперь с нами.
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
	AI_Output(self,other,"KDW_605_Riordian_HEAL_Info_14_01");	//Если ты ранен, я могу вылечить тебя.
};


instance KDW_605_RIORDIAN_HEALINFO(C_INFO)
{
	npc = kdw_605_riordian;
	nr = 100;
	condition = kdw_605_riordian_healinfo_condition;
	information = kdw_605_riordian_healinfo_info;
	important = 0;
	permanent = 1;
	description = "Я ранен. Ты можешь вылечить меня?";
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
	AI_Output(other,self,"KDW_605_Riordian_HEALINFO_Info_15_01");	//Я ранен. Ты можешь вылечить меня?
	AI_Output(self,other,"KDW_605_Riordian_HEALINFO_Info_14_02");	//Да подарят слова мои здоровье и силу тебе!
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
	description = "Приветствую тебя, маг!";
};


func int kdw_605_riordian_greet_condition()
{
	return TRUE;
};

func void kdw_605_riordian_greet_info()
{
	AI_Output(other,self,"KDW_605_Riordian_GREET_Info_15_01");	//Приветствую тебя, маг!
	AI_Output(self,other,"KDW_605_Riordian_GREET_Info_14_02");	//Я Риордан, алхимик. Полагаю, тебе нужен эликсир?
	Log_CreateTopic(GE_TRADERNC,LOG_NOTE);
	b_logentry(GE_TRADERNC,"Маг Круга Воды Риордан продает магические зелья. Я могу найти его в лаборатории на втором уровне пещеры.");
};


instance KDW_605_RIORDIAN_TRADE(C_INFO)
{
	npc = kdw_605_riordian;
	condition = kdw_605_riordian_trade_condition;
	information = kdw_605_riordian_trade_info;
	important = 0;
	permanent = 1;
	description = "Покажи мне свои товары.";
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
	AI_Output(other,self,"KDW_605_Riordian_TRADE_Info_15_01");	//Покажи мне свои товары.
	if(Npc_HasItems(self,itarrunethunderball) >= 1)
	{
		Npc_RemoveInvItems(self,itarrunethunderball,Npc_HasItems(self,itarrunethunderball));
	};
};

