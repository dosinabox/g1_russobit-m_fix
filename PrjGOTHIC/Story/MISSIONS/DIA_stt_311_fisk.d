
instance STT_311_FISK_EXIT(C_INFO)
{
	npc = stt_311_fisk;
	nr = 999;
	condition = stt_311_fisk_exit_condition;
	information = stt_311_fisk_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int stt_311_fisk_exit_condition()
{
	return 1;
};

func void stt_311_fisk_exit_info()
{
	AI_StopProcessInfos(self);
};


instance STT_311_FISK_FIRST(C_INFO)
{
	npc = stt_311_fisk;
	nr = 1;
	condition = stt_311_fisk_first_condition;
	information = stt_311_fisk_first_info;
	permanent = 0;
	important = 1;
};


func int stt_311_fisk_first_condition()
{
	return 1;
};

func void stt_311_fisk_first_info()
{
	AI_Output(self,other,"Stt_311_Fisk_First_12_00");	//Эй, привет! Я Фиск. Я продаю здесь свои товары. Если тебе что-то понадобится, у меня ты точно сможешь это найти.
	Log_CreateTopic(GE_TRADEROC,LOG_NOTE);
	b_logentry(GE_TRADEROC,"Призрак Фиск торгует различными товарами, но главное - он продает оружие. Большую часть времени он проводит на рыночной площади.");
};


instance STT_311_FISK_TRADE(C_INFO)
{
	npc = stt_311_fisk;
	nr = 800;
	condition = stt_311_fisk_trade_condition;
	information = stt_311_fisk_trade_info;
	permanent = 1;
	description = "Покажи, что у тебя есть.";
	trade = 1;
};


func int stt_311_fisk_trade_condition()
{
	return 1;
};

func void stt_311_fisk_trade_info()
{
	AI_Output(other,self,"Stt_311_Fisk_Trade_15_00");	//Покажи, что у тебя есть.
};


instance STT_311_FISK_WHISTLERSSWORD(C_INFO)
{
	npc = stt_311_fisk;
	nr = 801;
	condition = stt_311_fisk_whistlerssword_condition;
	information = stt_311_fisk_whistlerssword_info;
	permanent = 1;
	description = "Мне нужен меч. Но не такой, как у всех. Необычный меч.";
};


func int stt_311_fisk_whistlerssword_condition()
{
	if((FISK_FORGETSWORD == FALSE) && (WHISTLER_BUYMYSWORD == LOG_RUNNING) && (FISK_SWORDSOLD == FALSE))
	{
		return 1;
	};
};

func void stt_311_fisk_whistlerssword_info()
{
	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_15_00");	//Мне нужен меч. Но не такой, как у всех. Необычный меч.
	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_12_01");	//У меня как раз есть один такой. Он тебе понравится. Тот Призрак, который хотел его купить, больше за ним не придет.
	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_12_02");	//Он стоит 110 кусков. Хочешь посмотреть?
	FISK_SCKNOWS110 = TRUE;
	Info_ClearChoices(stt_311_fisk_whistlerssword);
	Info_AddChoice(stt_311_fisk_whistlerssword,"В другой раз.",stt_311_fisk_whistlerssword_back);
	Info_AddChoice(stt_311_fisk_whistlerssword,"А Уистлер говорил, что он стоит сотню...",stt_311_fisk_whistlerssword_fault);
	Info_AddChoice(stt_311_fisk_whistlerssword,"Хорошо, я покупаю его.",stt_311_fisk_whistlerssword_takeit);
};

func void stt_311_fisk_whistlerssword_back()
{
	AI_Output(other,self,"Org_826_Mordrag_WhistlersSword_BACK_15_00");	//В другой раз.
	Info_ClearChoices(stt_311_fisk_whistlerssword);
};

func void stt_311_fisk_whistlerssword_fault()
{
	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_Fault_15_00");	//А Уистлер говорил, что он стоит сотню...
	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_Fault_12_01");	//А! Погоди-ка... Правда, я что-то не то сказал. Он же стоит пять сотен.
	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_Fault_15_02");	//Пять сотен?
	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_Fault_12_03");	//Что, опять мало? Может, повысить до тысячи? Тоже неплохо. Но, знаешь, я подумал, что я не буду его продавать. Он мне самому пригодится!
	FISK_FORGETSWORD = TRUE;
	Info_ClearChoices(stt_311_fisk_whistlerssword);
};

func void stt_311_fisk_whistlerssword_takeit()
{
	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_TakeIt_15_00");	//Хорошо, я покупаю его.
	if(Npc_HasItems(other,itminugget) >= 110)
	{
		b_printtrademsg1("Отдано руды: 110");
		AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_01");	//Договорились!
		b_printtrademsg2("Получен меч Уистлера.");
		b_giveinvitems(other,self,itminugget,110);
		CreateInvItem(self,whistlers_schwert);
		b_giveinvitems(self,other,whistlers_schwert,1);
		Info_ClearChoices(stt_311_fisk_whistlerssword);
		FISK_SWORDSOLD = TRUE;
	}
	else
	{
		AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_02");	//Боюсь, у тебя не хватит руды. Я еще придержу его для тебя, но только недолго.
	};
};


instance STT_311_FISK_FORGETSWORD(C_INFO)
{
	npc = stt_311_fisk;
	nr = 800;
	condition = stt_311_fisk_forgetsword_condition;
	information = stt_311_fisk_forgetsword_info;
	permanent = 1;
	description = "Мы можем поговорить о мече Уистлера?";
};


func int stt_311_fisk_forgetsword_condition()
{
	if(FISK_FORGETSWORD == TRUE)
	{
		return 1;
	};
};

func void stt_311_fisk_forgetsword_info()
{
	AI_Output(other,self,"Stt_311_Fisk_ForgetSword_15_00");	//Мы можем поговорить о мече Уистлера?
	AI_Output(self,other,"Stt_311_Fisk_ForgetSword_12_01");	//Передай ему, что этого меча ему в жизни не видать!
};

instance STT_311_FISK_MORDRAGKO(C_INFO)
{
	npc = stt_311_fisk;
	nr = 800;
	condition = stt_311_fisk_mordragko_condition;
	information = stt_311_fisk_mordragko_info;
	permanent = 0;
	important = 1;
};


func int stt_311_fisk_mordragko_condition()
{
	if((Npc_IsDead(org_826_mordrag) || (MORDRAGKO_HAUAB == TRUE) || (MORDRAGKO_STAYATNC == TRUE)) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void stt_311_fisk_mordragko_info()
{
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_12_00");	//Эй, ты!
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_12_01");	//Мордраг был одним из моих лучших поставщиков! Ты мне все испортил!
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_12_02");	//Если вздумаешь присоединиться к нашему лагерю, я буду голосовать против!
	Info_ClearChoices(stt_311_fisk_mordragko);
	Info_AddChoice(stt_311_fisk_mordragko,"Ты продаешь товары, которые были украдены у Баронов...",stt_311_fisk_mordragko_petze);
	Info_AddChoice(stt_311_fisk_mordragko,"Успокойся! Быть может, я помогу тебе?",stt_311_fisk_mordragko_relax);
	Info_AddChoice(stt_311_fisk_mordragko,"А не пошел бы ты?..",stt_311_fisk_mordragko_fuckoff);
};

func void stt_311_fisk_mordragko_relax()
{
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Relax_15_00");	//Успокойся! Быть может, я помогу тебе?
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Relax_12_01");	//Каким это образом? Разве только ты найдешь мне другого поставщика из Нового лагеря. Но, думаю, ничего у тебя не выйдет.
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Relax_15_02");	//Как же мне найти такого человека?
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Relax_12_03");	//Я же сказал тебе, что у тебя ничего не выйдет. Нечего ко мне приставать!
	Log_CreateTopic(CH1_FISKNEWDEALER,LOG_MISSION);
	Log_SetTopicStatus(CH1_FISKNEWDEALER,LOG_RUNNING);
	b_logentry(CH1_FISKNEWDEALER,"Торговец Фиск из Старого лагеря хочет, чтобы я нашел ему нового поставщика вместо Мордрага.");
	FISK_GETNEWHEHLER = LOG_RUNNING;
	//Info_ClearChoices(stt_311_fisk_mordragko);
	AI_StopProcessInfos(self);
};

func void stt_311_fisk_mordragko_fuckoff()
{
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_FuckOff_15_00");	//А не пошел бы ты?..
	//Info_ClearChoices(stt_311_fisk_mordragko);
	AI_StopProcessInfos(self);
};

func void stt_311_fisk_mordragko_petze()
{
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Petze_15_00");	//Ты продаешь товары, которые были украдены у Баронов. Думаю, Торусу интересно будет узнать об этом...
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Petze_12_01");	//Не пытайся меня шантажировать!
};


instance STT_311_FISK_HEHLERSUCCESS(C_INFO)
{
	npc = stt_311_fisk;
	nr = 10;
	condition = stt_311_fisk_hehlersuccess_condition;
	information = stt_311_fisk_hehlersuccess_info;
	permanent = 0;
	description = "Я нашел человека. Он согласен быть твоим поставщиком.";
};


func int stt_311_fisk_hehlersuccess_condition()
{
	if((FISK_GETNEWHEHLER == LOG_RUNNING) && Npc_KnowsInfo(hero,org_843_sharky_fisk))
	{
		return 1;
	};
};

func void stt_311_fisk_hehlersuccess_info()
{
	AI_Output(other,self,"Stt_311_Fisk_HehlerSuccess_15_00");	//Я нашел человека из Нового лагеря. Он согласен быть твоим поставщиком.
	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_01");	//Что, правда? Кто бы мог подумать. Кажется, ты твердо намерен всем здесь понравиться...
	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_02");	//Так тебе это удалось? И кто же он?
	AI_Output(other,self,"Stt_311_Fisk_HehlerSuccess_15_03");	//Шарки, один из воров.
	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_04");	//Шарки? Да он же еще хуже, чем Мордраг.
	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_05");	//Что касается Диего: можешь больше не волноваться.
	FISK_GETNEWHEHLER = LOG_SUCCESS;
	b_givexp(XP_FISKDEALER);
	Log_SetTopicStatus(CH1_FISKNEWDEALER,LOG_SUCCESS);
	b_logentry(CH1_FISKNEWDEALER,"Фиск остался доволен тем, что Шарки согласился заменить Мордрага.");
};


var int fisk_armor_l_was_bought;
var int fisk_armor_m_was_bought;

instance STT_311_FISK_ARMOR(C_INFO)
{
	npc = stt_311_fisk;
	condition = stt_311_fisk_armor_condition;
	information = stt_311_fisk_armor_info;
	important = 0;
	permanent = 1;
	description = "Мне нужен какой-нибудь доспех.";
};


func int stt_311_fisk_armor_condition()
{
	if((KAPITEL < 2) && Npc_KnowsInfo(hero,stt_311_fisk_first) && ((FISK_ARMOR_L_WAS_BOUGHT != 1) || (FISK_ARMOR_M_WAS_BOUGHT != 1)))
	{
		return TRUE;
	};
};

func void stt_311_fisk_armor_info()
{
	AI_Output(other,self,"Stt_311_Fisk_ARMOR_Info_15_01");	//Мне нужен какой-нибудь доспех.
	AI_Output(self,other,"Stt_311_Fisk_ARMOR_Info_12_02");	//Ну, думаю, я смогу подобрать что-нибудь для тебя.
	Info_ClearChoices(stt_311_fisk_armor);
	Info_AddChoice(stt_311_fisk_armor,DIALOG_BACK,stt_311_fisk_armor_back);
	if(FISK_ARMOR_M_WAS_BOUGHT != 1)
	{
		Info_AddChoice(stt_311_fisk_armor,b_buildbuyarmorstring("Штаны рудокопа, защита: 15/0/5/0",VALUE_VLK_ARMOR_M),stt_311_fisk_armor_m);
	};
	if(FISK_ARMOR_L_WAS_BOUGHT != 1)
	{
		Info_AddChoice(stt_311_fisk_armor,b_buildbuyarmorstring("Простые штаны рудокопа, защита: 10/0/5/0",VALUE_VLK_ARMOR_L),stt_311_fisk_armor_l);
	};
};

func void stt_311_fisk_armor_back()
{
	Info_ClearChoices(stt_311_fisk_armor);
};

func void stt_311_fisk_armor_l()
{
	AI_Output(other,self,"Stt_311_Fisk_ARMOR_L_Info_15_01");	//Я возьму простые штаны рудокопа.
	if(Npc_HasItems(hero,itminugget) < VALUE_VLK_ARMOR_L)
	{
		AI_Output(self,other,"Stt_311_Fisk_ARMOR_L_Info_12_02");	//Ты не сможешь их купить, тебе не хватает руды!
	}
	else
	{
		b_printtrademsg1("Отдано руды: 250");
		b_giveinvitems(hero,self,itminugget,VALUE_VLK_ARMOR_L);
		AI_Output(self,other,"Stt_311_Fisk_ARMOR_L_Info_12_03");	//Хороший выбор.
		b_printtrademsg2("Получены простые штаны рудокопа.");
		CreateInvItem(self,vlk_armor_l);
		b_giveinvitems(self,hero,vlk_armor_l,1);
		AI_EquipArmor(hero,vlk_armor_l);
		FISK_ARMOR_L_WAS_BOUGHT = 1;
		if(FISK_ARMOR_M_WAS_BOUGHT == 1 && FISK_ARMOR_L_WAS_BOUGHT == 1)
		{
			Info_ClearChoices(stt_311_fisk_armor);
		};
	};
};

func void stt_311_fisk_armor_m()
{
	AI_Output(other,self,"Stt_311_Fisk_ARMOR_M_Info_15_01");	//Я возьму штаны рудокопа.
	if(Npc_HasItems(hero,itminugget) < VALUE_VLK_ARMOR_M)
	{
		AI_Output(self,other,"Stt_311_Fisk_ARMOR_M_Info_12_02");	//Ты не сможешь их купить, тебе не хватает руды!
	}
	else
	{
		b_printtrademsg1("Отдано руды: 500");
		b_giveinvitems(hero,self,itminugget,VALUE_VLK_ARMOR_M);
		AI_Output(self,other,"Stt_311_Fisk_ARMOR_M_Info_12_03");	//Хороший выбор.
		b_printtrademsg2("Получены штаны рудокопа.");
		CreateInvItem(self,vlk_armor_m);
		b_giveinvitems(self,hero,vlk_armor_m,1);
		AI_EquipArmor(hero,vlk_armor_m);
		FISK_ARMOR_M_WAS_BOUGHT = 1;
		if(FISK_ARMOR_M_WAS_BOUGHT == 1 && FISK_ARMOR_L_WAS_BOUGHT == 1)
		{
			Info_ClearChoices(stt_311_fisk_armor);
		};
	};
};

