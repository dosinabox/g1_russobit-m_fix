
instance GUR_1201_CORKALOM_FIRST(C_INFO)
{
	npc = gur_1201_corkalom;
	nr = 1;
	condition = gur_1201_corkalom_first_condition;
	information = gur_1201_corkalom_first_info;
	permanent = 1;
	important = 1;
};


func int gur_1201_corkalom_first_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return 1;
	};
};

func void gur_1201_corkalom_first_info()
{
	AI_Output(self,other,"GUR_1201_CorKalom_FIRST_10_00");	//Что тебе нужно?
	KALOM_TALKEDTO = TRUE;
};


instance GUR_1201_CORKALOM_WANNAJOIN(C_INFO)
{
	npc = gur_1201_corkalom;
	nr = 1;
	condition = gur_1201_corkalom_wannajoin_condition;
	information = gur_1201_corkalom_wannajoin_info;
	permanent = 0;
	description = "Я хочу быть принятым в Братство.";
};


func int gur_1201_corkalom_wannajoin_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2))
	{
		return 1;
	};
};

func void gur_1201_corkalom_wannajoin_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_WannaJoin_15_00");	//Я хочу быть принятым в Братство.
	AI_Output(other,self,"GUR_1201_CorKalom_WannaJoin_15_01");	//Я слышал, что ты наставляешь послушников и решаешь, кто из них будет принят.
	AI_Output(self,other,"GUR_1201_CorKalom_WannaJoin_10_02");	//У меня слишком много дел! Я провожу очень важные эксперименты, поэтому не могу уделить тебе ни минуты.
	AI_Output(self,other,"GUR_1201_CorKalom_WannaJoin_10_03");	//Я соглашусь с мнением Идолов. Если они скажут, что ты готов носить одежду послушника, то возвращайся ко мне.
	AI_StopProcessInfos(self);
	Log_CreateTopic(CH1_JOINPSI,LOG_MISSION);
	Log_SetTopicStatus(CH1_JOINPSI,LOG_RUNNING);
	b_logentry(CH1_JOINPSI,"Кор Галом примет меня в Братство послушником, если за меня скажут свое слово как минимум четыре Гуру.");
};


instance GUR_1201_CORKALOM_RECIPE(C_INFO)
{
	npc = gur_1201_corkalom;
	nr = 20;
	condition = gur_1201_corkalom_recipe_condition;
	information = gur_1201_corkalom_recipe_info;
	permanent = 0;
	description = "Торговец из Старого лагеря хочет получить рецепт целебного зелья.";
};


func int gur_1201_corkalom_recipe_condition()
{
	if(DEXTER_GETKALOMSRECIPE == LOG_RUNNING)
	{
		return 1;
	};
};

func void gur_1201_corkalom_recipe_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_Recipe_15_00");	//Один торговец из Старого лагеря хочет получить рецепт целебного зелья.
	AI_Output(self,other,"GUR_1201_CorKalom_Recipe_10_01");	//Я никому не продаю свои рецепты!
	b_logentry(CH1_KALOMSRECIPE,"Кор Галом отказывается отдавать свои рецепты. Но в его лаборатории есть сундук... И, кажется, этот работяга ничего кроме своих зелий не замечает...");
};


instance GUR_1201_CORKALOM_EXPERIMENTE(C_INFO)
{
	npc = gur_1201_corkalom;
	nr = 2;
	condition = gur_1201_corkalom_experimente_condition;
	information = gur_1201_corkalom_experimente_info;
	permanent = 1;
	description = "Что за исследования ты здесь проводишь?";
};


func int gur_1201_corkalom_experimente_condition()
{
	if(KAPITEL < 2)
	{
		return 1;
	};
};

func void gur_1201_corkalom_experimente_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_Experimente_15_00");	//Что за исследования ты здесь проводишь?
	AI_Output(self,other,"GUR_1201_CorKalom_Experimente_10_01");	//Мои исследования так сложны, что ты в них ничего не поймешь. Не отвлекай меня от работы!
};


instance GUR_1201_CORKALOM_BRINGWEED(C_INFO)
{
	npc = gur_1201_corkalom;
	nr = 2;
	condition = gur_1201_corkalom_bringweed_condition;
	information = gur_1201_corkalom_bringweed_info;
	permanent = 1;
	description = "Я принес тебе дневной сбор болотника.";
};


func int gur_1201_corkalom_bringweed_condition()
{
	if(BAALORUN_FETCHWEED == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void gur_1201_corkalom_bringweed_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_BRINGWEED_15_00");	//Я принес тебе дневной сбор болотника.
	if(Npc_HasItems(hero,itmi_plants_swampherb_01) < 100)
	{
		AI_Output(self,other,"GUR_1201_CorKalom_BRINGWEED_10_01");	//И это все? Мне нужен весь урожай, а это как минимум сто стеблей!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"GUR_1201_CorKalom_BRINGWEED_10_02");	//А, давай сюда. И не мешай мне работать!
		b_printtrademsg1("Отдан болотник (100).");
		b_giveinvitems(hero,self,itmi_plants_swampherb_01,100);
		Npc_RemoveInvItems(self,itmi_plants_swampherb_01,100);
		BAALORUN_FETCHWEED = LOG_SUCCESS;
		b_logentry(CH1_DELIVERWEED,"Кор Галом невыносим, как всегда. Я передал ему весь урожай болотника, а ему все мало.");
		Log_SetTopicStatus(CH1_DELIVERWEED,LOG_SUCCESS);
		b_givexp(XP_DELIVEREDWEEDHARVEST);
		BAALORUN_FETCHWEED = LOG_SUCCESS;
		//BALOR_CAN_GIVE = TRUE;
		AI_StopProcessInfos(self);
	};
};


var int corkalom_potions;

instance GUR_1201_CORKALOM_CRAWLERZANGEN(C_INFO)
{
	npc = gur_1201_corkalom;
	nr = 800;
	condition = gur_1201_corkalom_crawlerzangen_condition;
	information = gur_1201_corkalom_crawlerzangen_info;
	permanent = 1;
	description = "Я принес тебе челюсти ползунов...";
};


func int gur_1201_corkalom_crawlerzangen_condition()
{
	if(Npc_HasItems(other,itat_crawler_01) > 0 && Npc_KnowsInfo(hero,gur_1201_corkalom_sache))
	{
		return 1;
	};
};

func void gur_1201_corkalom_crawlerzangen_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_Crawlerzangen_15_00");	//Я принес тебе челюсти ползунов...
	b_printtrademsg1("Отданы все челюсти ползунов.");
	if(Npc_HasItems(other,itat_crawler_01) > 25)
	{
		AI_Output(self,other,"GUR_1201_CorKalom_Crawlerzangen_10_01");	//Очень хорошо. Вот, возьми за это некоторые из моих лучших зелий.
		b_printtrademsg2("Получено 10 зелий магической энергии.");
		CreateInvItems(self,itfo_potion_mana_03,5);
		b_giveinvitems(self,hero,itfo_potion_mana_03,5);
	}
	else if(Npc_HasItems(other,itat_crawler_01) > 15)
	{
		AI_Output(self,other,"GUR_1201_CorKalom_Crawlerzangen_10_01");	//Очень хорошо. Вот, возьми за это некоторые из моих лучших зелий.
		//CORKALOM_POTIONS = Npc_HasItems(hero,itat_crawler_01) / 3;
		b_printtrademsg2("Получено 5 зелий магической энергии.");
		CreateInvItems(self,itfo_potion_mana_03,5);
		b_giveinvitems(self,hero,itfo_potion_mana_03,5);
	}
	else if(Npc_HasItems(other,itat_crawler_01) > 5)
	{
		AI_Output(self,other,"GUR_1201_CorKalom_Crawlerzangen_10_02");	//Хорошо. Возьми несколько моих зелий в качестве награды.
		//CORKALOM_POTIONS = Npc_HasItems(hero,itat_crawler_01) / 2;
		b_printtrademsg2("Получено 5 экстрактов магической энергии.");
		CreateInvItems(self,itfo_potion_mana_02,5);
		b_giveinvitems(self,hero,itfo_potion_mana_02,5);
	}
	else
	{
		AI_Output(self,other,"GUR_1201_CorKalom_Crawlerzangen_10_03");	//Хм. И это все? Вот, возьми магическое зелье и уходи.
		b_printtrademsg2("Получена эссенция магической энергии.");
		CreateInvItems(self,itfo_potion_mana_01,1);
		b_giveinvitems(self,hero,itfo_potion_mana_01,1);
		AI_StopProcessInfos(self);
	};
	b_giveinvitems(other,self,itat_crawler_01,Npc_HasItems(other,itat_crawler_01));
};


instance GUR_1201_CORKALOM_JOINPSI(C_INFO)
{
	npc = gur_1201_corkalom;
	nr = 1;
	condition = gur_1201_corkalom_joinpsi_condition;
	information = gur_1201_corkalom_joinpsi_info;
	permanent = 1;
	description = "По-моему, я смог доказать Идолам свою преданность.";
};


func int gur_1201_corkalom_joinpsi_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_NONE) && Npc_KnowsInfo(hero,gur_1201_corkalom_wannajoin))
	{
		return 1;
	};
};

func void gur_1201_corkalom_joinpsi_info()
{
	var int counter;
	counter = 0;
	AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_00");	//По-моему, я смог доказать Идолам свою преданность.
	if(Npc_KnowsInfo(hero,dia_baalorun_gotweed))
	{
		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_01");	//Идол Оран считает, что я достоин стать верным слугой Спящего.
		counter = counter + 1;
	};
	if(Npc_KnowsInfo(hero,dia_baalcadar_sleepspell))
	{
		AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_02");	//Дальше...
		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_03");	//Идол Кадар считает, что я быстро учусь.
		counter = counter + 1;
	};
	if(Npc_KnowsInfo(hero,dia_baalnamib_firsttalk))
	{
		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_04");	//Идол Намиб уверен, что я истинный последователь веры в Спящего.
		counter = counter + 1;
	};
	if(Npc_KnowsInfo(hero,dia_baaltyon_vision))
	{
		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_05");	//Благодаря мне Идолу Тиону было видение.
		counter = counter + 1;
	};
	if(Npc_KnowsInfo(hero,dia_baaltondral_sendtokalom))
	{
		AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_06");	//И?
		AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_07");	//Идол Тондрал сказал, что я могу получить одежду послушника. Я привел к нему нового последователя.
		counter = counter + 1;
	};
	if(hero.level >= 5)
	{
		if(counter >= 4)
		{
			AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_08");	//Хорошо. Слов Идолов мне вполне достаточно.
			AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_09");	//Вот, возьми эту одежду. А теперь иди и постарайся быть полезным.
			b_printtrademsg1("Получен легкий доспех послушника.");
			CreateInvItem(self,nov_armor_m);
			b_giveinvitems(self,hero,nov_armor_m,1);
			AI_EquipArmor(hero,nov_armor_m);
			Npc_SetTrueGuild(hero,GIL_NOV);
			hero.guild = GIL_NOV;
			b_logentry(CH1_JOINPSI,"Сегодня Кор Галом зачислил меня в послушники. Он мог бы вести себя и получше, но, как бы то ни было, теперь я принят в Братство.");
			Log_CreateTopic(GE_TRADERPSI,LOG_NOTE);
			b_logentry(GE_TRADERPSI,"Доспехи послушников я могу получить у Идола Намиба.");
			Log_CreateTopic(GE_TEACHERPSI,LOG_NOTE);
			b_logentry(GE_TEACHERPSI,"Я вступил в Болотный лагерь и теперь некоторые учителя будут согласны учить меня бесплатно.");
			Log_SetTopicStatus(CH1_JOINPSI,LOG_SUCCESS);
			b_givexp(XP_BECOMENOVICE);
			Log_CreateTopic(CH1_JOINOC,LOG_MISSION);
			Log_SetTopicStatus(CH1_JOINOC,LOG_FAILED);
			b_logentry(CH1_JOINOC,"Я решил присоединиться к Братству Спящего из Болотного лагеря, поэтому я больше не смогу стать Призраком.");
			Log_CreateTopic(CH1_JOINNC,LOG_MISSION);
			Log_SetTopicStatus(CH1_JOINNC,LOG_FAILED);
			b_logentry(CH1_JOINNC,"Теперь меня не смогут принять в шайку воров из Нового лагеря, так как Братство стало моим новым домом.");
			if(KIRGO_CHARGED == TRUE && KIRGO_CHARGED_END == FALSE)
			{
				KIRGO_CHARGED = FALSE;
				b_exchangeroutine(grd_251_kirgo,"START");
			};
			if(KHARIM_CHARGED == TRUE && KHARIM_CHARGED_END == FALSE)
			{
				KHARIM_CHARGED = FALSE;
				b_exchangeroutine(sld_729_kharim,"START");
			};
			b_exchangeroutine(tpl_1422_gorhanis,"START");
			if(THORUS_MORDRAGKO == LOG_RUNNING)
			{
				THORUS_MORDRAGKO = LOG_FAILED;
				Log_SetTopicStatus(CH1_MORDRAGKO,LOG_FAILED);
				b_logentry(CH1_MORDRAGKO,"Пусть Торус сам разбирается со своими проблемами, они меня больше не касаются.");
			};
			if(DEXTER_GETKALOMSRECIPE == LOG_RUNNING)
			{
				DEXTER_GETKALOMSRECIPE = LOG_FAILED;
				Log_SetTopicStatus(CH1_KALOMSRECIPE,LOG_FAILED);
				if(!Npc_KnowsInfo(hero,gur_1201_corkalom_recipe))
				{
					b_logentry(CH1_KALOMSRECIPE,"Я стал одним из последователей Братства Спящего, разве я осмелюсь открывать тайны Гуру неверным из других лагерей?");
				}
				else if(Npc_HasItems(hero,kalomsrecipe) > 0)
				{
					b_logentry(CH1_KALOMSRECIPE,"Я стал одним из последователей Братства Спящего, разве я осмелюсь красть у Гуру? Пожалуй, верну рецепт Кор Галома на место!");
				}
				else
				{
					b_logentry(CH1_KALOMSRECIPE,"Я стал одним из последователей Братства Спящего, разве я осмелюсь красть у Гуру?");
				};
			};
		}
		else
		{
			AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_NOT_10_00");	//И?
			AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_NOT_15_01");	//И это все.
			AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_NOT_10_02");	//Ты отвлекаешь меня от очень важной работы! Приходи, когда заслужишь похвалу четырех Идолов.
		};
	}
	else
	{
		b_printguildcondition(5);
		AI_Output(self,other,"SVM_10_NoLearnYouAlreadyKnow");	//Сначала тебе нужно освоить основы, и только потом ты сможешь достичь мастерства.
	};
};


instance GUR_1201_CORKALOM_JOINPSI2(C_INFO)
{
	npc = gur_1201_corkalom;
	nr = 1;
	condition = gur_1201_corkalom_joinpsi2_condition;
	information = gur_1201_corkalom_joinpsi2_info;
	permanent = 0;
	description = "И это все? Даже 'добро пожаловать' трудно было сказать?";
};


func int gur_1201_corkalom_joinpsi2_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NOV)
	{
		return 1;
	};
};

func void gur_1201_corkalom_joinpsi2_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_10");	//И это все? Даже 'добро пожаловать' трудно было сказать?
	AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_11");	//Добро пожаловать.
	AI_Output(other,self,"GUR_1201_CorKalom_JoinPSI_15_12");	//Так немного лучше.
	AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_13");	//Ты почему ничего не делаешь? Вот, возьми эту траву и отнеси ее Гомезу в Старый лагерь.
	b_printtrademsg1("Получен болотник (30).");
	AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_14");	//Если его люди откажутся тебя пропускать, скажи им, что тебя прислал Кор Галом.
	CreateInvItems(self,itmijoint_3,30);
	b_giveinvitems(self,hero,itmijoint_3,30);
	KALOM_KRAUTBOTE = LOG_RUNNING;
	Log_CreateTopic(CH1_KRAUTBOTE,LOG_MISSION);
	Log_SetTopicStatus(CH1_KRAUTBOTE,LOG_RUNNING);
	b_logentry(CH1_KRAUTBOTE,"В своей обычной неподражаемой манере Кор Галом послал меня к Гомезу в Старый лагерь, чтобы отнести ему болотник.");
	AI_Output(self,other,"GUR_1201_CorKalom_JoinPSI_10_15");	//Ну, почему ты все еще здесь?
	AI_StopProcessInfos(self);
};


instance INFO_KALOM_DRUGMONOPOL(C_INFO)
{
	npc = gur_1201_corkalom;
	condition = info_kalom_drugmonopol_condition;
	information = info_kalom_drugmonopol_info;
	permanent = 0;
	description = "У тебя есть для меня еще какое-нибудь задание?";
};


func int info_kalom_drugmonopol_condition()
{
	if(KALOM_KRAUTBOTE == LOG_SUCCESS)
	{
		return 1;
	};
};

func void info_kalom_drugmonopol_info()
{
	var C_NPC renyu;
	var C_NPC killian;
	AI_Output(other,self,"Mis_1_Psi_Kalom_DrugMonopol_15_00");	//У тебя есть для меня еще какое-нибудь задание?
	AI_Output(self,other,"Mis_1_Psi_Kalom_DrugMonopol_10_01");	//В Новом лагере объявились умники, которые сами стали продавать болотник.
	AI_Output(self,other,"Mis_1_Psi_Kalom_DrugMonopol_10_03");	//Позаботься о том, чтобы их дело было закрыто.
	AI_Output(other,self,"Mis_1_Psi_Kalom_DrugMonopol_15_04");	//А как...
	AI_Output(self,other,"Mis_1_Psi_Kalom_DrugMonopol_10_05");	//Мне неинтересно, как!
	AI_Output(self,other,"Mis_1_Psi_Kalom_DrugMonopol_10_06");	//Думаю, они обосновались где-то за пределами Нового лагеря. Иди и найди их.
	KALOM_DRUGMONOPOL = LOG_RUNNING;
	Log_CreateTopic(CH1_DRUGMONOPOL,LOG_MISSION);
	Log_SetTopicStatus(CH1_DRUGMONOPOL,LOG_RUNNING);
	b_logentry(CH1_DRUGMONOPOL,"Кор Галом пожелал избавиться от конкурентов, торгующих болотником в Новом лагере. Я не знаю, где их искать, но, может быть, мне следует поискать перед Новым лагерем...");
	renyu = Hlp_GetNpc(org_860_renyu);
	renyu.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	killian = Hlp_GetNpc(org_861_killian);
	killian.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
};


instance INFO_KALOM_SUCCESS(C_INFO)
{
	npc = gur_1201_corkalom;
	condition = info_kalom_success_condition;
	information = info_kalom_success_info;
	permanent = 1;
	description = "По поводу торговли болотником в Новом лагере...";
};


func int info_kalom_success_condition()
{
	if(KALOM_DRUGMONOPOL == LOG_RUNNING)
	{
		return 1;
	};
};

func void info_kalom_success_info()
{
	var C_NPC killian;
	var C_NPC renyu;
	var C_NPC jacko;
	killian = Hlp_GetNpc(org_861_killian);
	renyu = Hlp_GetNpc(org_860_renyu);
	jacko = Hlp_GetNpc(org_862_jacko);
	AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_00");	//По поводу торговли болотником в Новом лагере...
	AI_Output(self,other,"Mis_1_Psi_Kalom_Success_10_01");	//Да?
	if((STOOGES_FLED == TRUE) || (Npc_IsDead(jacko) && Npc_IsDead(renyu) && Npc_IsDead(killian)))
	{
		AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_04");	//Я справился с твоим заданием.
		AI_Output(self,other,"Mis_1_Psi_Kalom_Success_10_05");	//Я удивлен. Я недооценивал тебя. Может быть, ты действительно будешь нам полезен.
		KALOM_DRUGMONOPOL = LOG_SUCCESS;
		b_logentry(CH1_DRUGMONOPOL,"Я рассказал Кор Галому все, что смог узнать о конкурентах. Он был как обычно очень 'любезен'.");
		Log_SetTopicStatus(CH1_DRUGMONOPOL,LOG_SUCCESS);
		b_givexp(XP_DRUGMONOPOL);
	}
	else
	{
		AI_Output(other,self,"Mis_1_Psi_Kalom_Success_15_02");	//Я не смог никого найти.
		AI_Output(self,other,"Mis_1_Psi_Kalom_Success_10_03");	//Да, так я думал. Разве тебе можно было доверить это дело?!
	};
};


instance INFO_KALOM_KRAUTBOTEBACK(C_INFO)
{
	npc = gur_1201_corkalom;
	nr = 1;
	condition = info_kalom_krautboteback_condition;
	information = info_kalom_krautboteback_info;
	permanent = 1;
	description = "Я принес болотник.";
};


func int info_kalom_krautboteback_condition()
{
	if((KALOM_DELIVEREDWEED == TRUE) && (KALOM_KRAUTBOTE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void info_kalom_krautboteback_info()
{
	AI_Output(other,self,"Mis_1_Psi_Kalom_KrautboteBACK_15_00");	//Я принес болотник.
	if(Npc_HasItems(hero,itminugget) >= 500)
	{
		AI_Output(self,other,"Mis_1_Psi_Kalom_KrautboteBACK_10_01");	//Хорошо. Иди, найди себе какое-нибудь дело.
		b_printtrademsg1("Отдано руды: 500");
		KALOM_KRAUTBOTE = LOG_SUCCESS;
		b_logentry(CH1_KRAUTBOTE,"Кор Галом получил руду за болотник для Баронов из Старого лагеря.");
		Log_SetTopicStatus(CH1_KRAUTBOTE,LOG_SUCCESS);
		b_giveinvitems(hero,self,itminugget,500);
		b_givexp(XP_WEEDSHIPMENTREPORTED);
	}
	else
	{
		AI_Output(self,other,"Mis_1_Psi_Kalom_KrautboteBACK_10_02");	//А где пятьсот кусков руды? Поторопись и принеси их мне сюда!
	};
};


instance INFO_CORKALOM_BRINGFOCUS(C_INFO)
{
	npc = gur_1201_corkalom;
	condition = info_corkalom_bringfocus_condition;
	information = info_corkalom_bringfocus_info;
	permanent = 0;
	important = 0;
	description = "Меня прислал Юберион. Я принес юнитор.";
};


func int info_corkalom_bringfocus_condition()
{
	if((YBERION_BRINGFOCUS == LOG_SUCCESS) && Npc_HasItems(hero,focus_1))
	{
		return 1;
	};
};

func void info_corkalom_bringfocus_info()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_Info3_15_01");	//Меня прислал Юберион. Я принес юнитор.
	b_printtrademsg1("Отдан юнитор.");
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info3_10_02");	//А-а, юнитор... Теперь-то я смогу изучить действие этого редкого артефакта.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info3_10_03");	//Если бы у меня было достаточно слюны этих мерзких тварей...
	b_logentry(CH2_FOCUS,"Я принес юнитор Кор Галому!");
	Log_SetTopicStatus(CH2_FOCUS,LOG_SUCCESS);
	//b_giveinvitems(hero,self,focus_1,1);
	Npc_RemoveInvItem(hero,focus_1);
	b_givexp(XP_BRINGFOCUSTOCORKALOM);
};


instance INFO_CORKALOM_BLUFF(C_INFO)
{
	npc = gur_1201_corkalom;
	nr = 10;
	condition = info_corkalom_bluff_condition;
	information = info_corkalom_bluff_info;
	permanent = 0;
	description = "Юберион сказал мне, что ты дашь мне награду за юнитор.";
};


func int info_corkalom_bluff_condition()
{
	if(Npc_KnowsInfo(hero,info_corkalom_bringfocus) && (CORKALOM_BRINGMCQBALLS != LOG_SUCCESS))
	{
		return 1;
	};
};

func void info_corkalom_bluff_info()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BLUFF_Info3_15_01");	//Юберион сказал мне, что ты дашь мне награду за юнитор.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BLUFF_Info3_10_02");	//Да? Он так сказал? Думаю, пятьдесят кусков руды тебя устроит?
	b_printtrademsg1("Получено руды: 50");
	CreateInvItems(self,itminugget,50);
	b_giveinvitems(self,other,itminugget,50);
};


instance GUR_1201_CORKALOM_SACHE(C_INFO)
{
	npc = gur_1201_corkalom;
	condition = gur_1201_corkalom_sache_condition;
	information = gur_1201_corkalom_sache_info;
	important = 0;
	permanent = 0;
	description = "Слюны?";
};


func int gur_1201_corkalom_sache_condition()
{
	if(Npc_KnowsInfo(hero,info_corkalom_bringfocus))
	{
		return 1;
	};
};

func void gur_1201_corkalom_sache_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_SACHE_Info_15_01");	//Слюны?
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_Info_10_02");	//Да, как ты уже знаешь, я делаю зелья для великой Церемонии. Слюна ползунов является одним из самых ценных компонентов!
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_Info_10_03");	//Ты ведь знаешь, кто такие ползуны?
	Info_ClearChoices(gur_1201_corkalom_sache);
	Info_AddChoice(gur_1201_corkalom_sache,"Нет.",gur_1201_corkalom_sache_nein);
	Info_AddChoice(gur_1201_corkalom_sache,"Да.",gur_1201_corkalom_sache_ja);
};

func void gur_1201_corkalom_sache_nein()
{
	AI_Output(other,self,"GUR_1201_CorKalom_SACHE_NEIN_15_01");	//Нет.
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_NEIN_10_02");	//Это очень опасные твари. Живут в темных шахтах и едят все, к чему могут дотянуться.
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_NEIN_10_03");	//В их пасти есть железы, выделяющие особую слюну.
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_NEIN_10_04");	//Из нее я делаю особые зелья, которые указывают нам духовный путь к Спящему.
	Info_ClearChoices(gur_1201_corkalom_sache);
};

func void gur_1201_corkalom_sache_ja()
{
	AI_Output(other,self,"GUR_1201_CorKalom_SACHE_JA_15_01");	//Да.
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_JA_10_02");	//Отлично!
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_NEIN_10_03");	//В их пасти есть железы, выделяющие особую слюну.
	AI_Output(self,other,"GUR_1201_CorKalom_SACHE_NEIN_10_04");	//Из нее я делаю особые зелья, которые указывают нам духовный путь к Спящему.
	Info_ClearChoices(gur_1201_corkalom_sache);
};


instance GUR_1201_CORKALOM_VISION(C_INFO)
{
	npc = gur_1201_corkalom;
	condition = gur_1201_corkalom_vision_condition;
	information = gur_1201_corkalom_vision_info;
	important = 0;
	permanent = 0;
	description = "Расскажи еще!";
};


func int gur_1201_corkalom_vision_condition()
{
	if(Npc_KnowsInfo(hero,gur_1201_corkalom_sache))
	{
		return 1;
	};
};

func void gur_1201_corkalom_vision_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_VISION_Info_15_01");	//Расскажи еще!
	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_02");	//Что ж, недавно Спящий послал мне одно видение. Он подал мне знак.
	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_03");	//Я понял, что кроме слюны ползунов в зелье нужно добавить что-то еще.
	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_04");	//И он избрал меня для этой миссии. Ты получишь задание не от меня. Эта честь будет оказана тебе самим Спящим!
	AI_Output(other,self,"GUR_1201_CorKalom_VISION_Info_15_05");	//Невероятно!
	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_06");	//Молчи, глупец!
	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_07");	//Он дал мне понять, что избранный мной путь верен, но средства недостаточно сильны.
	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_08");	//Это значит, что второй компонент тоже нужно получить у ползунов. Но это не слюна.
	AI_Output(self,other,"GUR_1201_CorKalom_VISION_Info_10_09");	//Должно быть что-то еще.
};


instance GUR_1201_CORKALOM_NEST(C_INFO)
{
	npc = gur_1201_corkalom;
	condition = gur_1201_corkalom_nest_condition;
	information = gur_1201_corkalom_nest_info;
	important = 0;
	permanent = 0;
	description = "А ты никогда не изучал ползунов?";
};


func int gur_1201_corkalom_nest_condition()
{
	if(Npc_KnowsInfo(hero,gur_1201_corkalom_vision))
	{
		return 1;
	};
};

func void gur_1201_corkalom_nest_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_NEST_Info_15_01");	//А ты никогда не изучал ползунов? Я хотел сказать... Может, в его теле есть еще что-нибудь, что будет сильнее слюны.
	AI_Output(self,other,"GUR_1201_CorKalom_NEST_Info_10_02");	//Конечно, мы изучили несколько ползунов. Но, кажется, нужное нам вещество содержится только в железах в пасти.
	AI_Output(self,other,"GUR_1201_CorKalom_NEST_Info_10_03");	//Должно быть что-то, о чем мы еще не знаем. Иди и найди ответ в их логове!
	CORKALOM_BRINGMCQBALLS = LOG_RUNNING;
};

func void gur_1201_corkalom_weg_accept()
{
	Log_CreateTopic(CH2_MCEGGS,LOG_MISSION);
	Log_SetTopicStatus(CH2_MCEGGS,LOG_RUNNING);
	b_logentry(CH2_MCEGGS,"Гуру Кор Галом дал мне задание найти источник сильнодействующего вещества, связанного с ползунами. До этого он использовал слюну этих тварей, но она оказалась недостаточно сильной. Нужно найти что-то другое.");
	if(PRESSETOURJANUAR2001)
	{
		CreateInvItems(hero,itat_crawlerqueen,3);
	};
};


instance GUR_1201_CORKALOM_WEG(C_INFO)
{
	npc = gur_1201_corkalom;
	condition = gur_1201_corkalom_weg_condition;
	information = gur_1201_corkalom_weg_info;
	nr = 21;
	important = 0;
	permanent = 0;
	description = "Думаю, в шахте будет не слишком светло.";
};


func int gur_1201_corkalom_weg_condition()
{
	if(Npc_KnowsInfo(hero,gur_1201_corkalom_nest) && !Npc_KnowsInfo(hero,gur_1201_corkalom_rat))
	{
		return 1;
	};
};

func void gur_1201_corkalom_weg_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_WEG_Info_15_01");	//Думаю, в шахте будет не слишком светло.
	AI_Output(self,other,"GUR_1201_CorKalom_WEG_Info_10_02");	//Возьми свитки с заклинанием света и используй их, чтобы развеять тьму.
	b_printtrademsg1("Получено 5 свитков света.");
	AI_Output(self,other,"GUR_1201_CorKalom_WEG_Info_10_03");	//Стражи в шахте помогут тебе.
	AI_Output(self,other,"GUR_1201_CorKalom_WEG_Info_10_04");	//Да пребудет с тобой сила Спящего, да осветит он твой путь своим светом, просветит твой дух и укрепит твою волю!
	CreateInvItems(self,itarscrolllight,5);
	b_giveinvitems(self,other,itarscrolllight,5);
	gur_1201_corkalom_weg_accept();
};


instance GUR_1201_CORKALOM_RAT(C_INFO)
{
	npc = gur_1201_corkalom;
	condition = gur_1201_corkalom_rat_condition;
	information = gur_1201_corkalom_rat_info;
	nr = 20;
	important = 0;
	permanent = 0;
	description = "Да, меня ждет очередное кровавое приключение...";
};


func int gur_1201_corkalom_rat_condition()
{
	if(Npc_KnowsInfo(hero,gur_1201_corkalom_nest) && !Npc_KnowsInfo(hero,gur_1201_corkalom_weg))
	{
		return 1;
	};
};

func void gur_1201_corkalom_rat_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_RAT_Info_15_01");	//Да, меня ждет очередное кровавое приключение...
	AI_Output(self,other,"GUR_1201_CorKalom_RAT_Info_10_02");	//Возьми эти целебные зелья.
	b_printtrademsg1("Получено 5 экстрактов магической энергии.");
	AI_Output(self,other,"GUR_1201_CorKalom_RAT_Info_10_03");	//Я даю их тебе не потому, что слишком беспокоюсь за твою жизнь, а потому что это задание для меня слишком важно.
	CreateInvItems(self,itfo_potion_health_02,5);
	b_giveinvitems(self,other,itfo_potion_health_02,5);
	gur_1201_corkalom_weg_accept();
};


instance GUR_1201_CORKALOM_RUN(C_INFO)
{
	npc = gur_1201_corkalom;
	condition = gur_1201_corkalom_run_condition;
	information = gur_1201_corkalom_run_info;
	important = 0;
	permanent = 0;
	description = "Где найти этих ползунов?";
};


func int gur_1201_corkalom_run_condition()
{
	if((CORKALOM_BRINGMCQBALLS == LOG_RUNNING) && (Npc_HasItems(hero,itat_crawlerqueen) < 1))
	{
		return 1;
	};
};

func void gur_1201_corkalom_run_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_RUN_Info_15_01");	//Где найти этих ползунов?
	AI_Output(self,other,"GUR_1201_CorKalom_RUN_Info_10_02");	//В Старой шахте.
	if(!ENTEREDOLDMINE)
	{
		AI_Output(other,self,"GUR_1201_CorKalom_RUN_Info_15_03");	//Где находится Старая шахта?
		AI_Output(self,other,"GUR_1201_CorKalom_RUN_Info_10_04");	//Возьми эту карту. На ней отмечены все важные места в колонии.
		b_printtrademsg1("Получена карта колонии.");
		CreateInvItem(self,itwrworldmap);
		b_giveinvitems(self,other,itwrworldmap,1);
	};
};


instance GUR_1201_CORKALOM_CRAWLER(C_INFO)
{
	npc = gur_1201_corkalom;
	condition = gur_1201_corkalom_crawler_condition;
	information = gur_1201_corkalom_crawler_info;
	important = 0;
	permanent = 0;
	description = "Есть какие-нибудь верные приемы охоты на ползунов?";
};


func int gur_1201_corkalom_crawler_condition()
{
	if(Npc_KnowsInfo(hero,gur_1201_corkalom_run) && (CORKALOM_BRINGMCQBALLS != LOG_SUCCESS))
	{
		return 1;
	};
};

func void gur_1201_corkalom_crawler_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_CRAWLER_Info_15_01");	//Есть какие-нибудь верные приемы охоты на ползунов?
	AI_Output(self,other,"GUR_1201_CorKalom_CRAWLER_Info_10_02");	//В шахте находятся несколько наших Стражей, которые добывают их челюсти. Поговори с Гор На Видом. Он поможет тебе.
};


instance GUR_1201_CORKALOM_FIND(C_INFO)
{
	npc = gur_1201_corkalom;
	condition = gur_1201_corkalom_find_condition;
	information = gur_1201_corkalom_find_info;
	important = 0;
	permanent = 0;
	description = "А в какой части шахты находится логово ползунов?";
};


func int gur_1201_corkalom_find_condition()
{
	if(Npc_KnowsInfo(hero,gur_1201_corkalom_crawler))
	{
		return 1;
	};
};

func void gur_1201_corkalom_find_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_FIND_Info_15_01");	//А в какой части шахты находится логово ползунов?
	AI_Output(self,other,"GUR_1201_CorKalom_FIND_Info_10_02");	//Это самая сложная часть миссии. Я ничего не могу тебе посоветовать. Ты сам должен его найти. Сила Спящего будет поддерживать тебя.
	AI_Output(other,self,"GUR_1201_CorKalom_FIND_Info_15_03");	//Да, ты меня успокоил.
};


instance INFO_CORKALOM_BRINGMCQBALLS_SUCCESS(C_INFO)
{
	npc = gur_1201_corkalom;
	condition = info_corkalom_bringmcqballs_success_condition;
	information = info_corkalom_bringmcqballs_success_info;
	permanent = 0;
	description = "Я нашел яйца королевы ползунов.";
};


func int info_corkalom_bringmcqballs_success_condition()
{
	if(Npc_HasItems(hero,itat_crawlerqueen) >= 3 && CORKALOM_BRINGMCQBALLS == LOG_RUNNING)
	{
		return 1;
	};
};

func void info_corkalom_bringmcqballs_success_info()
{
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_01");	//Я нашел яйца королевы ползунов.
	b_printtrademsg1("Отдано 3 яйца.");
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_02");	//Я знал это! Мое видение действительно было знаком. Самое сильное вещество для зелья содержится в яйцах.
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_03");	//Отлично, этого мне хватит, чтобы сделать зелье, которое поможет нам призвать Спящего!
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_04");	//А где моя награда?
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_05");	//Ах, да, награда... Спасибо тебе.
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_06");	//Да нет, я имел в виду нечто более материальное...
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_07");	//Да? Хорошо, чего же ты хочешь?
	CORKALOM_BRINGMCQBALLS = LOG_SUCCESS;
	b_giveinvitems(hero,self,itat_crawlerqueen,3);
	Npc_RemoveInvItems(self,itat_crawlerqueen,3);
	b_givexp(XP_BRINGMCEGGS);
	b_logentry(CH2_MCEGGS,"Я отдал Кор Галому три яйца ползунов. Он был невежлив, как и всегда. Мне почти расхотелось брать из его рук свою награду!");
	Log_SetTopicStatus(CH2_MCEGGS,LOG_SUCCESS);
	b_exchangeroutine(tpl_1439_gornadrak,"GC");
	b_exchangeroutine(tpl_1440_templer,"GC");
	Wld_InsertNpc(tpl_1400_gornabar_psi,"PSI_24_HUT_EX_SMALLTALK");
	Wld_InsertNpc(tpl_1401_gornakosh_psi,"PSI_24_HUT_EX_SMALLTALK");
	Wld_InsertNpc(tpl_1433_gornavid_psi,"PSI_24_HUT_EX_SMALLTALK");
	if(c_npcbelongstonewcamp(hero))
	{
		b_logentry(CH1_GOTOPSICAMP,"Думаю, теперь мне известно достаточно о том, что захотели сделать Гуру. Я должен сообщить об этом Мордрагу.");
	};
	if(c_npcbelongstooldcamp(hero))
	{
		b_logentry(CH1_GOTOPSI,"Думаю, теперь я знаю, что именно захотели сделать Гуру Братства. Я должен рассказать об этом Равену из Старого лагеря.");
	};
	Info_ClearChoices(info_corkalom_bringmcqballs_success);
	Info_AddChoice(info_corkalom_bringmcqballs_success,"Руну.",info_corkalom_bringmcqballs_success_rune);
	Info_AddChoice(info_corkalom_bringmcqballs_success,"Оружие.",info_corkalom_bringmcqballs_success_waffe);
	Info_AddChoice(info_corkalom_bringmcqballs_success,"Целебное зелье.",info_corkalom_bringmcqballs_success_heal);
	Info_AddChoice(info_corkalom_bringmcqballs_success,"Руду.",info_corkalom_bringmcqballs_success_ore);
	Info_AddChoice(info_corkalom_bringmcqballs_success,"Зелье магической силы.",info_corkalom_bringmcqballs_success_mana);
};

func void info_corkalom_bringmcqballs_success_rune()
{
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_15_01");	//Руну.
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_10_02");	//Пусть эта руна осветит твой путь!
	b_printtrademsg1("Получена руна света.");
	CreateInvItem(self,itarrunelight);
	b_giveinvitems(self,hero,itarrunelight,1);
	Info_ClearChoices(info_corkalom_bringmcqballs_success);
};

func void info_corkalom_bringmcqballs_success_waffe()
{
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_15_01");	//Оружие.
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_10_02");	//Пусть это оружие уничтожит всех твоих врагов!
	b_printtrademsg1("Получен Камнелом.");
	CreateInvItem(self,itmw_1h_mace_war_03);
	b_giveinvitems(self,hero,itmw_1h_mace_war_03,1);
	Info_ClearChoices(info_corkalom_bringmcqballs_success);
};

func void info_corkalom_bringmcqballs_success_heal()
{
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_15_01");	//Целебное зелье.
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_10_02");	//Пусть это зелье продлит твою жизнь!
	b_printtrademsg1("Получена эссенция жизни.");
	CreateInvItem(self,itfo_potion_health_perma_01);
	b_giveinvitems(self,hero,itfo_potion_health_perma_01,1);
	Info_ClearChoices(info_corkalom_bringmcqballs_success);
};

func void info_corkalom_bringmcqballs_success_ore()
{
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_15_01");	//Руду.
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_10_02");	//Возьми эту руду в знак благодарности всего Братства!
	b_printtrademsg1("Получено руды: 100");
	CreateInvItems(self,itminugget,100);
	b_giveinvitems(self,hero,itminugget,100);
	Info_ClearChoices(info_corkalom_bringmcqballs_success);
};

func void info_corkalom_bringmcqballs_success_mana()
{
	AI_Output(other,self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_15_01");	//Зелье магической силы.
	AI_Output(self,other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_10_02");	//Пусть это зелье увеличит твою магическую силу!
	if(!c_npcbelongstopsicamp(hero))
	{
		b_printtrademsg1("Получена эссенция силы духа.");
		CreateInvItem(self,itfo_potion_mana_perma_01);
		b_giveinvitems(self,hero,itfo_potion_mana_perma_01,1);
	}
	else
	{
		b_printtrademsg1("Получено зелье из яиц Королевы ползунов.");
		CreateInvItem(self,itfo_potion_elixier_egg);
		b_giveinvitems(self,hero,itfo_potion_elixier_egg,1);
	};
	Info_ClearChoices(info_corkalom_bringmcqballs_success);
};


instance INFO_CORKALOM_BRINGBOOK(C_INFO)
{
	npc = gur_1201_corkalom;
	condition = info_corkalom_bringbook_condition;
	information = info_corkalom_bringbook_info;
	permanent = 0;
	description = "Теперь мы можем начать Церемонию?";
};


func int info_corkalom_bringbook_condition()
{
	if(CORKALOM_BRINGMCQBALLS == LOG_SUCCESS)
	{
		return 1;
	};
};

func void info_corkalom_bringbook_info()
{
	AI_Output(other,self,"Info_CorKalom_BringBook_Info_15_01");	//Теперь мы можем начать Церемонию?
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_02");	//Нет! Мне до сих пор не удалось найти способ зарядить юнитор.
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_03");	//Моих знаний для этого недостаточно.
	AI_Output(other,self,"Info_CorKalom_BringBook_Info_15_04");	//Значит, я зря добывал эти яйца, так что ли?
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_05");	//Нет, послушай. Где-то есть альманах, в котором содержится нужное мне знание.
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_06");	//Мы купили эту книгу в Старом лагере у Корристо, мага Огня.
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_07");	//Но по пути в наш лагерь она была украдена.
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_08");	//Книгу должен был принести Талас, один из послушников. На него напали и ограбили.
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_09");	//Он меня разочаровал, но я дал ему еще один шанс. Он должен найти украденный альманах.
	AI_Output(self,other,"Info_CorKalom_BringBook_Info_10_10");	//Поговори с ним. Ему пригодится твоя помощь.
	CORKALOM_BRINGBOOK = LOG_RUNNING;
	Log_CreateTopic(CH2_BOOK,LOG_MISSION);
	Log_SetTopicStatus(CH2_BOOK,LOG_RUNNING);
	b_logentry(CH2_BOOK,"Кор Галому нужен еще один предмет, чтобы провести великую Церемонию. Речь идет о книге, в которой говорится, как использовать юнитор. Послушнику Таласу не удалось принести ее в лагерь, так как его обокрали гоблины. Сейчас он стоит на площади перед Храмом и ждет помощи в поисках альманаха.");
	Info_ClearChoices(info_corkalom_bringbook);
	Info_AddChoice(info_corkalom_bringbook,DIALOG_BACK,info_corkalom_bringbook_back);
	Info_AddChoice(info_corkalom_bringbook,"А я за это что-нибудь получу?",info_corkalom_bringbook_earn);
	Info_AddChoice(info_corkalom_bringbook,"Кто украл альманах?",info_corkalom_bringbook_who);
	Info_AddChoice(info_corkalom_bringbook,"Где сейчас находится Талас?",info_corkalom_bringbook_where);
};

func void info_corkalom_bringbook_back()
{
	Info_ClearChoices(info_corkalom_bringbook);
};

func void info_corkalom_bringbook_where()
{
	AI_Output(other,self,"Info_CorKalom_BringBook_Where_15_01");	//Где сейчас находится Талас?
	AI_Output(self,other,"Info_CorKalom_BringBook_Where_10_02");	//Он пытается найти людей, которые смогли бы ему помочь. Ты встретишь его на площади перед Храмом.
};

func void info_corkalom_bringbook_who()
{
	AI_Output(other,self,"Info_CorKalom_BringBook_Who_15_01");	//Кто украл альманах?
	AI_Output(self,other,"Info_CorKalom_BringBook_Who_10_02");	//Талас сказал, что на него напали черные гоблины. Странно, конечно, но вполне вероятно.
};

func void info_corkalom_bringbook_earn()
{
	AI_Output(other,self,"Info_CorKalom_BringBook_Earn_15_01");	//А я за это что-нибудь получу?
	AI_Output(self,other,"Info_CorKalom_BringBook_Earn_10_02");	//Разве тебе мало доказательств моей щедрости? Ты не останешься без награды.
};


instance INFO_CORKALOM_BRINGBOOK_SUCCESS(C_INFO)
{
	npc = gur_1201_corkalom;
	condition = info_corkalom_bringbook_success_condition;
	information = info_corkalom_bringbook_success_info;
	permanent = 0;
	description = "Я нашел книгу.";
};


func int info_corkalom_bringbook_success_condition()
{
	if(Npc_HasItems(hero,itwrfokusbuch) && (CORKALOM_BRINGBOOK == LOG_RUNNING))
	{
		return 1;
	};
};

func void info_corkalom_bringbook_success_info()
{
	AI_Output(other,self,"Info_CorKalom_BringBook_Success_15_01");	//Я нашел книгу.
	b_printtrademsg1("Отдан альманах.");
	AI_Output(self,other,"Info_CorKalom_BringBook_Success_10_02");	//Хорошая работа. Теперь ты достал все, что нам нужно.
	AI_Output(self,other,"Info_CorKalom_BringBook_Success_10_03");	//Еще немного, и все будет готово.
	AI_Output(other,self,"Info_CorKalom_BringBook_Success_15_04");	//Где состоится Церемония?
	AI_Output(self,other,"Info_CorKalom_BringBook_Success_10_05");	//Приходи ночью на площадь перед Храмом. Мы все соберемся там, чтобы призвать Спящего.
	//b_giveinvitems(hero,self,itwrfokusbuch,1);
	Npc_RemoveInvItem(hero,itwrfokusbuch);
	b_givexp(XP_BRINGBOOK);
	CORKALOM_BRINGBOOK = LOG_SUCCESS;
	b_logentry(CH2_BOOK,"После того как я принес альманах Кор Галому, все братья стали готовиться к великой Церемонии. Ее проведут ночью на площади перед Храмом.");
	Log_SetTopicStatus(CH2_BOOK,LOG_SUCCESS);
	AI_StopProcessInfos(self);
	b_story_prepareritual();
};


instance INFO_CORKALOM_BELOHNUNG(C_INFO)
{
	npc = gur_1201_corkalom;
	nr = 1;
	condition = info_corkalom_belohnung_condition;
	information = info_corkalom_belohnung_info;
	permanent = 0;
	description = "Давай поговорим о моей награде.";
};


func int info_corkalom_belohnung_condition()
{
	if(Npc_KnowsInfo(hero,info_corkalom_bringbook_success))
	{
		return 1;
	};
};

func void info_corkalom_belohnung_info()
{
	AI_Output(other,self,"Info_CorKalom_Belohnung_15_00");	//Давай поговорим о моей награде.
	AI_Output(self,other,"Info_CorKalom_Belohnung_10_01");	//Что ты хочешь получить?
	Info_ClearChoices(info_corkalom_belohnung);
	Info_AddChoice(info_corkalom_belohnung,"Дай мне свитки с заклинаниями.",info_corkalom_belohnung_scroll);
	Info_AddChoice(info_corkalom_belohnung,"Я возьму руду.",info_corkalom_belohnung_ore);
	Info_AddChoice(info_corkalom_belohnung,"Я возьму зелья.",info_corkalom_belohnung_mana);
};

func void info_corkalom_belohnung_scroll()
{
	AI_Output(other,self,"Info_CorKalom_Belohnung_SCROLL_15_00");	//Дай мне свитки с заклинаниями.
	AI_Output(self,other,"Info_CorKalom_Belohnung_SCROLL_10_01");	//Используй эти заклинания с умом!
	b_printtrademsg1("Получено 3 свитка сна.");
	CreateInvItems(self,itarscrollsleep,3);
	b_giveinvitems(self,hero,itarscrollsleep,3);
	Info_ClearChoices(info_corkalom_belohnung);
};

func void info_corkalom_belohnung_ore()
{
	AI_Output(other,self,"Info_CorKalom_Belohnung_ORE_15_00");	//Я возьму руду.
	AI_Output(self,other,"Info_CorKalom_Belohnung_ORE_10_01");	//Надеюсь, эта руда утолит твою жадность.
	b_printtrademsg1("Получено руды: 300");
	CreateInvItems(self,itminugget,300);
	b_giveinvitems(self,hero,itminugget,300);
	Info_ClearChoices(info_corkalom_belohnung);
};

func void info_corkalom_belohnung_mana()
{
	AI_Output(other,self,"Info_CorKalom_Belohnung_MANA_15_00");	//Я возьму зелья.
	AI_Output(self,other,"Info_CorKalom_Belohnung_MANA_10_01");	//Пусть эти зелья придадут тебе сил!
	b_printtrademsg1("Получено 5 экстрактов магической энергии.");
	CreateInvItems(self,itfo_potion_mana_02,5);
	b_giveinvitems(self,hero,itfo_potion_mana_02,5);
	Info_ClearChoices(info_corkalom_belohnung);
};


instance GUR_1201_CORKALOM_EXIT(C_INFO)
{
	npc = gur_1201_corkalom;
	nr = 999;
	condition = gur_1201_corkalom_exit_condition;
	information = gur_1201_corkalom_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int gur_1201_corkalom_exit_condition()
{
	return 1;
};

func void gur_1201_corkalom_exit_info()
{
	AI_Output(other,self,"GUR_1201_CorKalom_Exit_15_01");	//До встречи!
	AI_Output(self,other,"GUR_1201_CorKalom_Exit_10_02");	//Да просветит тебя Спящий!
	AI_StopProcessInfos(self);
};

