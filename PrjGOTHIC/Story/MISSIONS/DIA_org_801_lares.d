
instance ORG_801_LARES_EXIT(C_INFO)
{
	npc = org_801_lares;
	nr = 999;
	condition = org_801_lares_exit_condition;
	information = org_801_lares_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int org_801_lares_exit_condition()
{
	return 1;
};

func void org_801_lares_exit_info()
{
	AI_StopProcessInfos(self);
};


var int lares_vorbeigemogelt;

instance ORG_801_LARES_YOUHERE(C_INFO)
{
	npc = org_801_lares;
	nr = 1;
	condition = org_801_lares_youhere_condition;
	information = org_801_lares_youhere_info;
	permanent = 1;
	important = 1;
};


func int org_801_lares_youhere_condition()
{
	var C_NPC roscoe;
	roscoe = Hlp_GetNpc(org_840_roscoe);
	if(roscoe.aivar[AIV_PASSGATE] == FALSE)
	{
		return 1;
	};
};

func void org_801_lares_youhere_info()
{
	var C_NPC roscoe;
	roscoe = Hlp_GetNpc(org_840_roscoe);
	if(Npc_IsInState(roscoe,zs_magicsleep) || (npc_gettempattitude(roscoe,other) == ATT_FRIENDLY))
	{
		AI_Output(self,other,"ORG_801_Lares_YouHere_11_00");	//Как ты попал сюда, и что случилось с Роско?
		AI_Output(other,self,"ORG_801_Lares_YouHere_15_01");	//Он не захотел меня останавливать.
		AI_Output(self,other,"ORG_801_Lares_YouHere_11_02");	//Что тебе от меня нужно?
		roscoe.aivar[AIV_PASSGATE] = TRUE;
		LARES_VORBEIGEMOGELT = TRUE;
		b_givexp(XP_CHEATEDINTOLARESHUT);
	}
	else
	{
		Npc_SetTempAttitude(self,ATT_HOSTILE);
		AI_StopProcessInfos(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,zs_attack,1,"");
	};
};


instance ORG_801_LARES_WANNAJOIN(C_INFO)
{
	npc = org_801_lares;
	nr = 1;
	condition = org_801_lares_wannajoin_condition;
	information = org_801_lares_wannajoin_info;
	permanent = 0;
	description = "Я хочу стать одним из вас.";
};


func int org_801_lares_wannajoin_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2))
	{
		return 1;
	};
};

func void org_801_lares_wannajoin_info()
{
	AI_Output(other,self,"ORG_801_Lares_WannaJoin_15_00");	//Я хочу стать одним из вас.
	AI_Output(self,other,"ORG_801_Lares_WannaJoin_11_01");	//Да? А кто ты вообще такой?
};


var int lares_bringlistback;

instance ORG_801_LARES_BRINGLIST(C_INFO)
{
	npc = org_801_lares;
	nr = 2;
	condition = org_801_lares_bringlist_condition;
	information = org_801_lares_bringlist_info;
	permanent = 0;
	description = "У меня есть список припасов для Старой шахты.";
};


func int org_801_lares_bringlist_condition()
{
	if(Npc_KnowsInfo(hero,org_801_lares_wannajoin) && Npc_HasItems(hero,thelist))
	{
		return 1;
	};
};

func void org_801_lares_bringlist_info()
{
	AI_Output(other,self,"ORG_801_Lares_BringList_15_00");	//У меня есть список припасов для Старой шахты.
	AI_Output(self,other,"ORG_801_Lares_BringList_11_01");	//Да ты что? Невероятно! А ты смелый парень, как я погляжу.
	AI_Output(self,other,"ORG_801_Lares_BringList_11_02");	//Покажи его мне!
	AI_Output(other,self,"ORG_801_Lares_BringList_15_03");	//Вот он...
	b_usefakescroll();
	AI_Output(self,other,"ORG_801_Lares_BringList_11_04");	//Так, так. Знаешь, что мы сейчас сделаем? Мы его немного подправим, а потом ты отнесешь его в Старый лагерь.
	AI_Output(self,other,"ORG_801_Lares_BringList_11_05");	//А потом, когда они доставят товар в шахту, мы просто заберем его себе! Ну, вот, сейчас мы все сделаем... Есть! Вот и списочек. Ты знаешь, что делать.
	POINTS_NC = POINTS_NC + 10;
	LARES_BRINGLISTBACK = LOG_RUNNING;
	Npc_RemoveInvItem(hero,thelist);
	CreateInvItem(hero,thelistnc);
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic(CH1_JOINNC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JOINNC,LOG_RUNNING);
	};
	b_logentry(CH1_JOINNC,"Ларс, главарь шайки воров, был сильно удивлен, когда я принес ему список. Он дополнил его и велел отнести Диего.");
	b_givexp(XP_GIVELISTTOLARES);
};


instance ORG_801_LARES_BRINGLISTBACK(C_INFO)
{
	npc = org_801_lares;
	nr = 2;
	condition = org_801_lares_bringlistback_condition;
	information = org_801_lares_bringlistback_info;
	permanent = 0;
	description = "Я передал список Диего.";
};


func int org_801_lares_bringlistback_condition()
{
	if((LARES_BRINGLISTBACK == LOG_RUNNING) && (DIEGO_BRINGLIST == LOG_SUCCESS))
	{
		return 1;
	};
};

func void org_801_lares_bringlistback_info()
{
	AI_Output(other,self,"ORG_801_Lares_BringListBack_15_00");	//Я передал список Диего.
	AI_Output(self,other,"ORG_801_Lares_BringListBack_11_01");	//Хорошо! Я как раз направил своих людей к Старой шахте. Стражники Торуса должны сейчас лежать себе спокойно в лесу.
	POINTS_NC = POINTS_NC + 10;
	LARES_BRINGLISTBACK = LOG_SUCCESS;
	b_logentry(CH1_JOINNC,"Ларс со своей шайкой напал на конвой с грузом для Старой шахты. Конечно, он не захотел ждать моего возвращения.");
	b_givexp(XP_REPORTLISTDELIVERYTOLARES);
};


instance ORG_801_LARES_BRINGLISTANTEIL(C_INFO)
{
	npc = org_801_lares;
	nr = 2;
	condition = org_801_lares_bringlistanteil_condition;
	information = org_801_lares_bringlistanteil_info;
	permanent = 0;
	description = "Так груз из Старого лагеря уже захвачен? А как же моя доля?";
};


func int org_801_lares_bringlistanteil_condition()
{
	if(Npc_KnowsInfo(hero,org_801_lares_bringlistback))
	{
		return 1;
	};
};

func void org_801_lares_bringlistanteil_info()
{
	var C_NPC gorn;
	AI_Output(other,self,"ORG_801_Lares_BringListAnteil_15_00");	//Так груз из Старого лагеря уже захвачен? А как же моя доля?
	AI_Output(self,other,"ORG_801_Lares_BringListAnteil_11_01");	//Иди к Горну. Он отдаст тебе твою долю.
	gorn = Hlp_GetNpc(pc_fighter);
	if(gorn.aivar[AIV_FINDABLE] == TRUE)
	{
		AI_Output(other,self,"ORG_801_Lares_BringListAnteil_15_02");	//Я знаю Горна. Он один из наемников, которые охраняют магов.
		AI_Output(self,other,"ORG_801_Lares_BringListAnteil_11_03");	//Да, так и есть.
		AI_Output(other,self,"ORG_801_Lares_BringListAnteil_15_04");	//Так он тоже в этом участвовал?
		AI_Output(self,other,"ORG_801_Lares_BringListAnteil_11_05");	//Ты слишком любопытен. Тебе это знать не положено. Просто иди к нему и возьми свою долю.
	};
	b_logentry(CH1_JOINNC,"Наемник Горн каким-то образом участвовал в нападении на груз из Старого лагеря. Я могу взять свою долю у него.");
	gorn.aivar[AIV_FINDABLE] == TRUE;
};


instance ORG_801_LARES_MORDRAGSENTME(C_INFO)
{
	npc = org_801_lares;
	nr = 2;
	condition = org_801_lares_mordragsentme_condition;
	information = org_801_lares_mordragsentme_info;
	permanent = 0;
	description = "Меня прислал Мордраг. Он передал тебе это кольцо.";
};


func int org_801_lares_mordragsentme_condition()
{
	if(Npc_KnowsInfo(hero,org_801_lares_wannajoin) && Npc_HasItems(hero,mordragsring) && (KAPITEL < 2))
	{
		return 1;
	};
};

func void org_801_lares_mordragsentme_info()
{
	b_giveinvitems(other,self,mordragsring,1);
	AI_Output(other,self,"ORG_801_Lares_MordragSentMe_15_00");	//Меня прислал Мордраг. Он передал тебе это кольцо.
	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_01");	//Хорошая вещица! У нас так принято: взял что-то, поделись с главарем шайки.
	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_02");	//Но то, что он доверил это кольцо тебе, говорит в твою пользу.
	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_03");	//Я хочу, чтобы ты сходил к нему и передал ему кое-что от меня.
	AI_Output(self,other,"ORG_801_Lares_MordragSentMe_11_04");	//Скажи ему, что нам нужно заслать в Лагерь сектантов своего человека. Я хочу знать, что они там затевают.
	LARES_INFORMMORDRAG = LOG_RUNNING;
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic(CH1_JOINNC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JOINNC,LOG_RUNNING);
	};
	b_logentry(CH1_JOINNC,"Ларс послал меня к Мордрагу. Я должен сказать ему, что в Лагерь сектантов нужно послать шпиона. Необходимо разузнать, что готовят братья.");
	b_givexp(XP_GIVERINGTOLARES);
	POINTS_NC = POINTS_NC + 10;
};


instance ORG_801_LARES_VORBEIGEMOGELT(C_INFO)
{
	npc = org_801_lares;
	nr = 2;
	condition = org_801_lares_vorbeigemogelt_condition;
	information = org_801_lares_vorbeigemogelt_info;
	permanent = 0;
	description = "Но я же смог пройти мимо твоих охранников.";
};


func int org_801_lares_vorbeigemogelt_condition()
{
	if(Npc_KnowsInfo(hero,org_801_lares_wannajoin) && (LARES_VORBEIGEMOGELT == TRUE))
	{
		return 1;
	};
};

func void org_801_lares_vorbeigemogelt_info()
{
	AI_Output(other,self,"ORG_801_Lares_Vorbeigemogelt_15_00");	//Но я же смог пройти мимо твоих охранников.
	AI_Output(self,other,"ORG_801_Lares_Vorbeigemogelt_11_01");	//Ты прав. Но этого недостаточно.
	POINTS_NC = POINTS_NC + 10;
};


var int lares_get400ore;

instance ORG_801_LARES_GETKRAUT(C_INFO)
{
	npc = org_801_lares;
	nr = 10;
	condition = org_801_lares_getkraut_condition;
	information = org_801_lares_getkraut_info;
	permanent = 0;
	description = "А что еще нужно сделать?";
};


func int org_801_lares_getkraut_condition()
{
	if(Npc_KnowsInfo(hero,org_801_lares_bringlist) || Npc_KnowsInfo(hero,org_801_lares_mordragsentme) || Npc_KnowsInfo(hero,org_801_lares_vorbeigemogelt))
	{
		return 1;
	};
};

func void org_801_lares_getkraut_info()
{
	AI_Output(other,self,"ORG_801_Lares_GetKraut_15_00");	//А что еще нужно сделать?
	AI_Output(self,other,"ORG_801_Lares_GetKraut_11_01");	//У Идола Исидро из лагеря сектантов есть трава на четыреста кусков руды. Я хочу, чтобы ты забрал у него эту траву. Мне неважно, каким образом.
	if((BAALISIDRO_DEALERJOB == LOG_RUNNING) || (BAALISIDRO_DEALERJOB == LOG_SUCCESS))
	{
		AI_Output(other,self,"ORG_801_Lares_GetKraut_15_02");	//Вообще-то, у меня уже есть та куча болотника, о которой ты говоришь.
		AI_Output(self,other,"ORG_801_Lares_GetKraut_11_03");	//Да, умный ты парень!
	};
	AI_Output(self,other,"ORG_801_Lares_GetKraut_11_04");	//Если так, то продай и принеси мне четыреста кусков руды.
	AI_Output(self,other,"ORG_801_Lares_GetKraut_11_05");	//Тогда можно будет поговорить о твоем приеме в нашу шайку.
	LARES_GET400ORE = LOG_RUNNING;
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic(CH1_JOINNC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JOINNC,LOG_RUNNING);
	};
	b_logentry(CH1_JOINNC,"Я должен взять болотник у Идола Исидро и продать его за 400 кусков руды, которые нужно принести Ларсу.");
};


instance ORG_801_LARES_400ORE(C_INFO)
{
	npc = org_801_lares;
	nr = 2;
	condition = org_801_lares_400ore_condition;
	information = org_801_lares_400ore_info;
	permanent = 1;
	description = "У меня есть четыреста кусков руды.";
};


func int org_801_lares_400ore_condition()
{
	if((LARES_GET400ORE == LOG_RUNNING) && ((BAALISIDRO_DEALERJOB == LOG_RUNNING) || (BAALISIDRO_DEALERJOB == LOG_SUCCESS)))
	{
		return 1;
	};
};

func void org_801_lares_400ore_info()
{
	AI_Output(other,self,"ORG_801_Lares_400Ore_15_00");	//У меня есть четыреста кусков руды.
	if(Npc_HasItems(other,itminugget) >= 400)
	{
		AI_Output(self,other,"ORG_801_Lares_400Ore_11_01");	//Отлично! Конечно, это более чем достаточно.
		LARES_GET400ORE = LOG_SUCCESS;
		POINTS_NC = POINTS_NC + 10;
		b_giveinvitems(other,self,itminugget,400);
		b_logentry(CH1_JOINNC,"Ларс был очень доволен тем, что я принес ему 400 кусков руды, вырученные за болотник Идола Исидро.");
		b_givexp(XP_BAALISIDROPAYLARES);
	}
	else
	{
		AI_Output(self,other,"ORG_801_Lares_400Ore_NOORE_11_00");	//Пересчитай-ка еще раз, вся ли руда не месте. 
	};
};


instance ORG_801_LARES_REICHT(C_INFO)
{
	npc = org_801_lares;
	nr = 5;
	condition = org_801_lares_reicht_condition;
	information = org_801_lares_reicht_info;
	permanent = 1;
	description = "Этого достаточно, чтобы меня приняли в шайку?";
};


func int org_801_lares_reicht_condition()
{
	if(Npc_KnowsInfo(hero,org_801_lares_wannajoin) && (Npc_KnowsInfo(hero,org_801_lares_mordragsentme) || Npc_KnowsInfo(hero,org_801_lares_bringlist)) && (Npc_GetTrueGuild(other) == GIL_NONE) && (KAPITEL < 2))
	{
		return 1;
	};
};

func void org_801_lares_reicht_info()
{
	AI_Output(other,self,"ORG_801_Lares_Reicht_15_00");	//Этого достаточно, чтобы меня приняли в шайку?
	if((POINTS_NC >= 30) && (hero.level >= 5))
	{
		AI_Output(self,other,"ORG_801_Lares_Reicht_AUFNAHME_11_00");	//Думаю, да.
		AI_Output(self,other,"ORG_801_Lares_Reicht_AUFNAHME_11_01");	//Я даже приготовил тебе подарок - доспех, если быть точным. Подарок, конечно, небольшой, но заслуженный.
		hero.guild = GIL_ORG;
		Npc_SetTrueGuild(hero,GIL_ORG);
		CreateInvItem(hero,org_armor_l);
		CreateInvItem(self,itamarrow);
		b_giveinvitems(self,hero,itamarrow,1);
		Npc_RemoveInvItem(hero,itamarrow);
		AI_EquipBestArmor(hero);
		b_givexp(XP_BECOMEBANDIT);
		b_logentry(CH1_JOINNC,"Ларс принял меня в свою шайку. Отныне Новый лагерь будет моим домом!");
		Log_SetTopicStatus(CH1_JOINNC,LOG_SUCCESS);
		Log_CreateTopic(CH1_JOINOC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JOINOC,LOG_FAILED);
		b_logentry(CH1_JOINOC,"Как один из людей Ларса я не могу быть принят в Старый лагерь.");
		Log_CreateTopic(CH1_JOINPSI,LOG_MISSION);
		Log_SetTopicStatus(CH1_JOINPSI,LOG_FAILED);
		b_logentry(CH1_JOINPSI,"Братство не примет меня, так как я уже стал членом Нового лагеря.");
		Log_SetTopicStatus(CH1_LOSTNEK,LOG_FAILED);
		Log_SetTopicStatus(CH1_FISKNEWDEALER,LOG_FAILED);
		Log_SetTopicStatus(CH1_KALOMSRECIPE,LOG_FAILED);
		Log_SetTopicStatus(CH1_BRINGLIST,LOG_FAILED);
		Log_SetTopicStatus(CH1_MORDRAGKO,LOG_FAILED);
	}
	else
	{
		if(Npc_KnowsInfo(hero,org_801_lares_mordragsentme))
		{
			AI_Output(self,other,"ORG_801_Lares_Reicht_11_02");	//Мордраг рассказал мне о тебе.
		};
		if(Npc_KnowsInfo(hero,org_801_lares_bringlist))
		{
			AI_Output(self,other,"ORG_801_Lares_Reicht_11_03");	//Ты доказал свою преданность нам, когда принес список.
		};
		AI_Output(self,other,"ORG_801_Lares_Reicht_11_04");	//Но ты еще не готов. Иди, выполняй другие поручения.
		b_printguildcondition(5);
	};
};


instance ORG_801_LARES_GOTOKALOM(C_INFO)
{
	npc = org_801_lares;
	nr = 10;
	condition = org_801_lares_gotokalom_condition;
	information = org_801_lares_gotokalom_info;
	permanent = 0;
	description = "И что же мне теперь делать?";
};


func int org_801_lares_gotokalom_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_ORG)
	{
		return 1;
	};
};

func void org_801_lares_gotokalom_info()
{
	var C_NPC mordrag;
	AI_Output(other,self,"ORG_801_Lares_GotoKalom_15_00");	//И что же мне теперь делать?
	AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_01");	//Теперь ты один из нас. При этом мы не посягаем на твою свободу. Делай все, что захочешь.
	Log_CreateTopic(CH1_GOTOPSICAMP,LOG_MISSION);
	Log_SetTopicStatus(CH1_GOTOPSICAMP,LOG_RUNNING);
	b_logentry(CH1_GOTOPSICAMP,"Братья из Болотного лагеря к чему-то готовятся. Ларс, главарь банды воров, хочет знать, что именно.");
	if(LARES_INFORMMORDRAG == LOG_RUNNING)
	{
		AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_02");	//Если ты действительно хочешь быть нам полезен, иди к Мордрагу и помоги ему справиться с делом сектантов.
		b_logentry(CH1_GOTOPSICAMP,"Я должен помочь Мордрагу разузнать, что там происходит!");
	}
	else
	{
		mordrag = Hlp_GetNpc(org_826_mordrag);
		if(Npc_IsDead(mordrag))
		{
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_03");	//Один из наших людей из Старого лагеря, Мордраг, был убит. Перед смертью он направил нам послание. В Лагере сектантов затевается что-то серьезное.
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_04");	//Сходи в лагерь Братства и выясни, что они замышляют.
			b_logentry(CH1_GOTOPSICAMP,"Он направил меня прямо в лагерь Братства.");
		}
		else
		{
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_05");	//Мордраг, один из наших людей в Старом лагере, вернулся недавно.
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_06");	//Иди и поговори с ним. Скажи ему, что у нас уже есть свой человек в Лагере сектантов. Братство затевает что-то серьезное. Я хочу знать, что именно.
			AI_Output(self,other,"ORG_801_Lares_GotoKalom_11_07");	//Помоги ему.
			b_logentry(CH1_GOTOPSICAMP,"Это дело было возложено на вора по имени Мордраг. Я могу найти его в баре на озере, в Новом лагере.");
			b_exchangeroutine(org_826_mordrag,"START");
			LARES_INFORMMORDRAG = LOG_RUNNING;
		};
	};
};


instance ORG_801_LARES_WHERELEARN(C_INFO)
{
	npc = org_801_lares;
	nr = 20;
	condition = org_801_lares_wherelearn_condition;
	information = org_801_lares_wherelearn_info;
	permanent = 0;
	description = "Кто здесь может меня чему-нибудь научить?";
};


func int org_801_lares_wherelearn_condition()
{
	return TRUE;
};

func void org_801_lares_wherelearn_info()
{
	AI_Output(other,self,"ORG_801_Lares_WhereLearn_Info_15_01");	//Кто здесь может меня чему-нибудь научить?
	AI_Output(self,other,"ORG_801_Lares_WhereLearn_Info_11_02");	//Я могу научить тебя, как стать более сильным и ловким.
	Log_CreateTopic(GE_TEACHERNC,LOG_NOTE);
	b_logentry(GE_TEACHERNC,"Ларс может помочь мне увеличить силу и ловкость.");
};


instance ORG_801_LARES_TEACH(C_INFO)
{
	npc = org_801_lares;
	nr = 20;
	condition = org_801_lares_teach_condition;
	information = org_801_lares_teach_info;
	permanent = 1;
	description = "Я хочу улучшить свои навыки.";
};


func int org_801_lares_teach_condition()
{
	if(Npc_KnowsInfo(hero,org_801_lares_wherelearn))
	{
		return TRUE;
	};
};

func void org_801_lares_teach_info()
{
	AI_Output(other,self,"ORG_801_Lares_Teach_15_00");	//Я хочу улучшить свои навыки.
	Info_ClearChoices(org_801_lares_teach);
	Info_AddChoice(org_801_lares_teach,DIALOG_BACK,org_801_lares_teach_back);
	Info_AddChoice(org_801_lares_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),org_801_lares_teach_str_5);
	Info_AddChoice(org_801_lares_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),org_801_lares_teach_str_1);
	Info_AddChoice(org_801_lares_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),org_801_lares_teach_dex_5);
	Info_AddChoice(org_801_lares_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),org_801_lares_teach_dex_1);
};

func void org_801_lares_teach_back()
{
	Info_ClearChoices(org_801_lares_teach);
};

func void org_801_lares_teach_str_1()
{
	b_buyattributepoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(org_801_lares_teach);
	Info_AddChoice(org_801_lares_teach,DIALOG_BACK,org_801_lares_teach_back);
	Info_AddChoice(org_801_lares_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),org_801_lares_teach_str_5);
	Info_AddChoice(org_801_lares_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),org_801_lares_teach_str_1);
	Info_AddChoice(org_801_lares_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),org_801_lares_teach_dex_5);
	Info_AddChoice(org_801_lares_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),org_801_lares_teach_dex_1);
};

func void org_801_lares_teach_str_5()
{
	b_buyattributepoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(org_801_lares_teach);
	Info_AddChoice(org_801_lares_teach,DIALOG_BACK,org_801_lares_teach_back);
	Info_AddChoice(org_801_lares_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),org_801_lares_teach_str_5);
	Info_AddChoice(org_801_lares_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),org_801_lares_teach_str_1);
	Info_AddChoice(org_801_lares_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),org_801_lares_teach_dex_5);
	Info_AddChoice(org_801_lares_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),org_801_lares_teach_dex_1);
};

func void org_801_lares_teach_dex_1()
{
	b_buyattributepoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(org_801_lares_teach);
	Info_AddChoice(org_801_lares_teach,DIALOG_BACK,org_801_lares_teach_back);
	Info_AddChoice(org_801_lares_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),org_801_lares_teach_str_5);
	Info_AddChoice(org_801_lares_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),org_801_lares_teach_str_1);
	Info_AddChoice(org_801_lares_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),org_801_lares_teach_dex_5);
	Info_AddChoice(org_801_lares_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),org_801_lares_teach_dex_1);
};

func void org_801_lares_teach_dex_5()
{
	b_buyattributepoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(org_801_lares_teach);
	Info_AddChoice(org_801_lares_teach,DIALOG_BACK,org_801_lares_teach_back);
	Info_AddChoice(org_801_lares_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),org_801_lares_teach_str_5);
	Info_AddChoice(org_801_lares_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),org_801_lares_teach_str_1);
	Info_AddChoice(org_801_lares_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),org_801_lares_teach_dex_5);
	Info_AddChoice(org_801_lares_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),org_801_lares_teach_dex_1);
};

