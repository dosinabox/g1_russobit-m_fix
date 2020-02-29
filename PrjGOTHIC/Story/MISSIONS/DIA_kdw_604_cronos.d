
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
	description = "У меня есть послание к Верховному Магу Круга Огня.";
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
	AI_Output(other,self,"DIA_Cronos_Brief_15_00");	//У меня есть послание к Верховному Магу Круга Огня.
	AI_Output(self,other,"DIA_Cronos_Brief_08_01");	//Здесь живут только маги Круга Воды. Магов Круга Огня можно найти в Старом лагере.
	AI_Output(other,self,"DIA_Cronos_Brief_15_02");	//Но мне нельзя в замок. Ты можешь помочь мне попасть туда?
	AI_Output(self,other,"DIA_Cronos_Brief_08_03");	//Иногда мы посылаем гонцов к нашим братьям в Старом лагере...
	AI_Output(self,other,"DIA_Cronos_Brief_08_04");	//Но мы доверяем свои послания только людям Ларса. Он заботится о сохранности наших посланий в течение многих лет.
};


instance KDW_604_CRONOS_BARRIER(C_INFO)
{
	npc = kdw_604_cronos;
	nr = 2;
	condition = kdw_604_cronos_barrier_condition;
	information = kdw_604_cronos_barrier_info;
	permanent = 0;
	description = "Вы хотите разрушить Барьер? А как это можно сделать?";
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
	AI_Output(other,self,"DIA_Cronos_Barrier_15_00");	//Вы хотите разрушить Барьер? А как это можно сделать?
	AI_Output(self,other,"DIA_Cronos_Barrier_08_01");	//Для этого нам нужно очень много руды.
	AI_Output(self,other,"DIA_Cronos_Barrier_08_02");	//Во время особой церемонии мы направим всю силу собранной руды на Барьер и уничтожим его.
	AI_Output(self,other,"DIA_Cronos_Barrier_08_03");	//Конечно, эта руда привлекает многих, кто любит брать все, что плохо лежит.
	AI_Output(self,other,"DIA_Cronos_Barrier_08_04");	//Поэтому у нас каждый защитник нашего плана на счету.
};


instance KDW_604_CRONOS_WANNAJOIN(C_INFO)
{
	npc = kdw_604_cronos;
	nr = 3;
	condition = kdw_604_cronos_wannajoin_condition;
	information = kdw_604_cronos_wannajoin_info;
	permanent = 0;
	description = "Я хочу присоединиться к этому лагерю.";
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
	AI_Output(other,self,"DIA_Cronos_WannaJoin_15_00");	//Я хочу присоединиться к этому лагерю.
	AI_Output(self,other,"DIA_Cronos_WannaJoin_08_01");	//Если ты хочешь присоединиться к этому лагерю, поговори с Ли или с Ларсом.
};


instance KDW_604_CRONOS_WANNAMAGE(C_INFO)
{
	npc = kdw_604_cronos;
	nr = 3;
	condition = kdw_604_cronos_wannamage_condition;
	information = kdw_604_cronos_wannamage_info;
	permanent = 0;
	description = "Я хочу стать магом!";
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
	AI_Output(other,self,"DIA_Cronos_WannaMage_15_00");	//Я хочу стать магом!
	AI_Output(self,other,"DIA_Cronos_WannaMage_08_01");	//Мы не можем раскрывать наше тайное знание своим врагам.
	AI_Output(self,other,"DIA_Cronos_WannaMage_08_02");	//Только когда ты докажешь нам, что ты верен нашему делу, мы сможем приступить к твоему обучению.
};


instance KDW_604_CRONOS_BANDIT(C_INFO)
{
	npc = kdw_604_cronos;
	nr = 4;
	condition = kdw_604_cronos_bandit_condition;
	information = kdw_604_cronos_bandit_info;
	permanent = 0;
	description = "Я стал одним из людей Ларса... У тебя есть для меня что-нибудь?";
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
	AI_Output(other,self,"DIA_Cronos_Bandit_15_00");	//Я стал одним из людей Ларса. Теперь я могу носить послания магам Огня. У тебя есть для меня что-нибудь?
	AI_Output(self,other,"DIA_Cronos_Bandit_08_01");	//Да, есть. Но тебе нужен знак нашего посланника, иначе люди Гомеза не пропустят тебя в замок.
	AI_Output(self,other,"DIA_Cronos_Bandit_08_02");	//Вот, возьми это письмо и знак. А теперь тебе нужно спешить!
	CreateInvItem(other,kdw_amulett);
	CreateInvItem(other,cronos_brief);
	CRONOS_MESSENGER = LOG_RUNNING;
	Log_CreateTopic(KDWLETTER,LOG_MISSION);
	Log_SetTopicStatus(KDWLETTER,LOG_RUNNING);
	b_logentry(KDWLETTER,"Кронос доверил мне важное послание, которое я должен отнести магам Огня в Старый лагерь.");
};


instance KDW_604_CRONOS_BRIEFBACK(C_INFO)
{
	npc = kdw_604_cronos;
	nr = 3;
	condition = kdw_604_cronos_briefback_condition;
	information = kdw_604_cronos_briefback_info;
	permanent = 0;
	description = "Я передал послание!";
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
	AI_Output(other,self,"DIA_Cronos_BriefBack_15_00");	//Я передал послание!
	AI_Output(self,other,"DIA_Cronos_BriefBack_08_01");	//А, хорошо! Возьми это в награду за твои труды...
	CRONOS_MESSENGER = LOG_SUCCESS;
	CreateInvItems(self,itminugget,200);
	b_giveinvitems(self,other,itminugget,200);
	b_givexp(XP_CRONOSLETTER);
	Log_SetTopicStatus(KDWLETTER,LOG_SUCCESS);
	b_logentry(KDWLETTER,"Маги Воды довольны моей услугой.");
};


instance INFO_CRONOS_NEWS(C_INFO)
{
	npc = kdw_604_cronos;
	condition = info_cronos_news_condition;
	information = info_cronos_news_info;
	permanent = 0;
	important = 0;
	description = "Я хочу сообщить Сатурасу нечто важное.";
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
	AI_Output(other,self,"Info_Cronos_NEWS_15_01");	//Я хочу сообщить Сатурасу нечто важное.
	AI_Output(self,other,"Info_Cronos_NEWS_08_02");	//Разве это послание так важно, чтобы отвлекать нашего духовного лидера от его важной работы?
};


instance INFO_CRONOS_KALOM(C_INFO)
{
	npc = kdw_604_cronos;
	nr = 10;
	condition = info_cronos_kalom_condition;
	information = info_cronos_kalom_info;
	permanent = 0;
	important = 0;
	description = "Кор Галом с несколькими фанатиками Стражами ушли из Братства!";
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
	AI_Output(other,self,"Info_Cronos_KALOM_15_01");	//Кор Галом с несколькими фанатиками Стражами ушли из Братства!
	AI_Output(other,self,"Info_Cronos_KALOM_15_02");	//Они сами хотят найти Спящего и прервать его тысячелетний сон.
	AI_Output(self,other,"Info_Cronos_KALOM_08_03");	//Я никогда ему не доверял. Не важно, какое место он занимает, важно то, что его ослепила жажда власти. Он способен на все.
	AI_Output(self,other,"Info_Cronos_KALOM_08_04");	//Думаю, без него в Братстве будет гораздо лучше!
	AI_Output(self,other,"Info_Cronos_KALOM_08_05");	//Я сообщу об этом Сатурасу, как только у меня будет возможность. А теперь иди!
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
	description = "Гуру Братства провели одну церемонию. Они вызывали Спящего.";
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
	AI_Output(other,self,"Info_Cronos_YBERION_15_03");	//Гуру Братства провели одну церемонию. Они вызывали Спящего.
	AI_Output(other,self,"Info_Cronos_YBERION_15_04");	//Но умственное напряжение плохо сказалось на Юберионе. Он этого не выдержал.
	if(YBERION_DIED == TRUE)
	{
		AI_Output(other,self,"Info_Cronos_YBERION_15_01");	//Юберион, лидер сектантов Болотного лагеря, умер!
	};
	AI_Output(self,other,"Info_Cronos_YBERION_08_02");	//Что? Как это могло произойти?
	AI_Output(self,other,"Info_Cronos_YBERION_08_05");	//Это очень печальная новость. Юберион был одним из наших союзников.
	AI_Output(self,other,"Info_Cronos_YBERION_08_06");	//Но не стоит из-за этого отвлекать Сатураса от исследований.
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
	description = "Гуру узнали, что их бог Спящий на самом деле - злой демон!";
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
	AI_Output(other,self,"Info_Cronos_SLEEPER_15_01");	//Гуру узнали, что их бог Спящий на самом деле - настоящий злой демон!
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_02");	//Теперь они считают Спящего одним из демонов?
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_03");	//Это очень похоже на очередную безумную идею братьев, но...
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_04");	//... Что если они правы... тогда вся наша колония находится в опасности.
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_05");	//Ты должен сообщить об этом Сатурасу. Он сможет решить, что делать дальше.
	AI_Output(other,self,"Info_Cronos_SLEEPER_15_06");	//Где найти Сатураса?
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_07");	//Поднимись на верхний уровень. Скажи охранникам, что ты получил мое разрешение.
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_08");	//Пароль входа - Тетриандох.
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_09");	//Сатурас обычно стоит у большой пентаграммы.
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_10");	//Там он проводит свои исследования, пытается вычислить, как лучше всего взорвать гору руды.
	b_logentry(CH3_ESCAPEPLANNC,"Кронос дал мне разрешение на разговор с Сатурасом. Обычно верховного мага можно найти у пентаграммы. Нужно сказать стражникам пароль... Вот черт, неужели я его забыл?!");
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
	description = "Скажи мне пароль, я не смог его запомнить.";
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
	AI_Output(other,self,"Info_Cronos_PAROLE_15_01");	//Скажи мне пароль, я не смог его запомнить.
	AI_Output(self,other,"Info_Cronos_PAROLE_08_02");	//Да, памяти у тебя нет. Запомни, пароль Тетриандох.
};


instance INFO_CRONOS_REWARD(C_INFO)
{
	npc = kdw_604_cronos;
	nr = 30;
	condition = info_cronos_reward_condition;
	information = info_cronos_reward_info;
	permanent = 0;
	important = 0;
	description = "Сатурас сказал, что у тебя есть для меня награда.";
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
	AI_Output(other,self,"Info_Cronos_REWARD_15_01");	//Сатурас сказал, что у тебя есть для меня награда.
	AI_Output(self,other,"Info_Cronos_REWARD_08_02");	//Как хранитель руды я дам тебе небольшую часть наших запасов, как награду за твои труды.
	AI_Output(self,other,"Info_Cronos_REWARD_08_03");	//Надеюсь, ты сможешь разумно использовать ее.
	b_logentry(CH3_BRINGFOCI,"Кронос дал мне достаточно много руды, но от этого рудная гора нисколько не уменьшилась.");
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
	AI_Output(self,other,"KDW_604_Cronos_WELCOME_Info_08_01");	//Ты принял правильное решение. Теперь ты один из магов Воды. Добро пожаловать, брат!
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
	description = "Я хочу увеличить свою магическую силу.";
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
	AI_Output(other,self,"KDW_604_Cronos_MANA_Info_15_01");	//Я хочу увеличить свою магическую силу.
	AI_Output(self,other,"KDW_604_Cronos_MANA_Info_08_02");	//Я могу помочь тебе в этом. Используй свою силу с умом.
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
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"SVM_8_NotNow");	//Сейчас не время.
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
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"SVM_8_NotNow");	//Сейчас не время.
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
	AI_Output(other,self,"KDW_604_Cronos_SELLSTUFF_Info_15_01");	//Я хочу приобрести магические свитки.
};


instance KDW_604_CRONOS_GREET(C_INFO)
{
	npc = kdw_604_cronos;
	condition = kdw_604_cronos_greet_condition;
	information = kdw_604_cronos_greet_info;
	important = 0;
	permanent = 0;
	description = "Приветствую тебя, маг!";
};


func int kdw_604_cronos_greet_condition()
{
	return TRUE;
};

func void kdw_604_cronos_greet_info()
{
	AI_Output(other,self,"KDW_604_Cronos_GREET_Info_15_01");	//Приветствую тебя, маг!
	AI_Output(self,other,"KDW_604_Cronos_GREET_Info_08_02");	//Да пребудет с тобой благословение Аданоса! Я могу помочь твоему духу стать сильнее или дать тебе что-то полезное.
	AI_Output(self,other,"KDW_604_Cronos_GREET_Info_08_03");	//Что я могу сделать для тебя?
	Log_CreateTopic(GE_TRADERNC,LOG_NOTE);
	b_logentry(GE_TRADERNC,"Кронос продает руны, свитки и кольца. Целыми днями он стоит у решетки, закрывающей рудную гору.");
	Log_CreateTopic(GE_TEACHERNC,LOG_NOTE);
	b_logentry(GE_TEACHERNC,"Кронос может помочь мне повысить мою магическую силу. Его можно найти у рудной горы.");
};

