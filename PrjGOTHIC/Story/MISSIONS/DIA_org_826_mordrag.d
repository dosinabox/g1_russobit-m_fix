
var int mordragko_playerchoseorebarons;
var int mordragko_playerchosethorus;
var int mordragko_hauab;
var int mordragko_stayatnc;

instance ORG_826_MORDRAG_EXIT(C_INFO)
{
	npc = org_826_mordrag;
	nr = 999;
	condition = org_826_mordrag_exit_condition;
	information = org_826_mordrag_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int org_826_mordrag_exit_condition()
{
	return 1;
};

func void org_826_mordrag_exit_info()
{
	AI_StopProcessInfos(self);
};


instance ORG_826_MORDRAG_GREET(C_INFO)
{
	npc = org_826_mordrag;
	nr = 1;
	condition = org_826_mordrag_greet_condition;
	information = org_826_mordrag_greet_info;
	permanent = 0;
	important = 1;
};


func int org_826_mordrag_greet_condition()
{
	return 1;
};

func void org_826_mordrag_greet_info()
{
	AI_Output(self,other,"Org_826_Mordrag_Greet_11_00");	//Эй, новенький! Я Мордраг. Запомни меня. Я продаю всевозможные товары по низкой цене.
};


instance ORG_826_MORDRAG_TRADE(C_INFO)
{
	npc = org_826_mordrag;
	nr = 800;
	condition = org_826_mordrag_trade_condition;
	information = org_826_mordrag_trade_info;
	permanent = 1;
	description = "Покажи мне свои товары.";
	trade = 1;
};


func int org_826_mordrag_trade_condition()
{
	if(Npc_KnowsInfo(hero,org_826_mordrag_greet) && (MORDRAGKO_HAUAB != TRUE))
	{
		return 1;
	};
};

func void org_826_mordrag_trade_info()
{
	AI_Output(other,self,"DIA_BaalKagan_TRADE_15_00");	//Покажи мне свои товары.
	AI_Output(self,other,"Org_826_Mordrag_Trade_11_01");	//Смотри...
	if(MORDRAG_TRADED == 0)
	{
		if(KAPITEL > 3 || Npc_KnowsInfo(hero,org_801_lares_gotokalom))
		{
			Log_CreateTopic(GE_TRADERNC,LOG_NOTE);
			b_logentry(GE_TRADERNC,"Вор Мордраг продает ворованный товар в баре на озере.");
		}
		else
		{
			Log_CreateTopic(GE_TRADEROC,LOG_NOTE);
			b_logentry(GE_TRADEROC,"Вор Мордраг продает на рыночной площади ворованный товар.");
		};
		MORDRAG_TRADED = 1;
	};
};


instance ORG_826_MORDRAG_COURIER(C_INFO)
{
	npc = org_826_mordrag;
	nr = 3;
	condition = org_826_mordrag_courier_condition;
	information = org_826_mordrag_courier_info;
	permanent = 0;
	description = "Ты действительно один из гонцов магов?";
};


func int org_826_mordrag_courier_condition()
{
	if(THORUS_MORDRAGMAGEMESSENGER)
	{
		return 1;
	};
};

func void org_826_mordrag_courier_info()
{
	AI_Output(other,self,"Org_826_Mordrag_Courier_15_00");	//Ты действительно один из гонцов магов?
	AI_Output(self,other,"Org_826_Mordrag_Courier_11_01");	//А что если так?
	//AI_Output(other,self,"Org_826_Mordrag_Courier_15_02");	//Я бы хотел поговорить с магами. Мне нужно попасть в замок.
	Info_ClearChoices(org_826_mordrag_courier);
	if(Npc_HasItems(hero,itwr_fire_letter_01) || Npc_HasItems(hero,itwr_fire_letter_02))
	{
		Info_AddChoice(org_826_mordrag_courier,"Мне нужно попасть в замок. У меня есть письмо...",org_826_mordrag_courier_letter);
	};
	Info_AddChoice(org_826_mordrag_courier,"Да я просто так спросил.",org_826_mordrag_courier_notletter);
	
};

func void org_826_mordrag_courier_letter()
{
	AI_Output(other,self,"Info_Thorus_LetterForMages_15_00");	//Мне нужно попасть в замок. У меня есть письмо для Верховного Мага Круга Огня.
	if(Npc_GetDistToWP(hero,"OCR_OUTSIDE_HUT_44") < 1500 || Npc_GetDistToWP(hero,"OCR_OUTSIDE_MCAMP_01") < 1500)
	{
		AI_Output(self,hero,"Info_Diego_OCWARN_11_01");	//Эй... Тихо!
		AI_PlayAni(self,"T_SEARCH");
		if(LETTER_TOLD == 0)
		{
			LETTER_TOLD = 1;
		}
		else if(LETTER_TOLD == 1)
		{
			LETTER_TOLD = 2;
			if(!Npc_IsDead(vlk_505_buddler))
			{
				b_exchangeroutine(vlk_505_buddler,"letterwait");
			};
			if(!Npc_IsDead(vlk_506_buddler))
			{
				b_exchangeroutine(vlk_506_buddler,"letterwait");
			};
		};
	};
	AI_Output(self,other,"Org_826_Mordrag_Courier_11_03");	//Посланники магов носят печать, которая служит пропуском. Ты сможешь получить ее, если станешь одним из нас.
	Info_ClearChoices(org_826_mordrag_courier);
};

func void org_826_mordrag_courier_notletter()
{
	AI_Output(other,self,"DIA_Jarvis_WoHaufen_15_03");	//Да я просто так спросил.
	AI_Output(self,other,"Org_826_Mordrag_Courier_11_03");	//Посланники магов носят печать, которая служит пропуском. Ты сможешь получить ее, если станешь одним из нас.
	Info_ClearChoices(org_826_mordrag_courier);
};

instance ORG_826_MORDRAG_PROBLEM(C_INFO)
{
	npc = org_826_mordrag;
	nr = 3;
	condition = org_826_mordrag_problem_condition;
	information = org_826_mordrag_problem_info;
	permanent = 0;
	description = "У тебя проблемы.";
};


func int org_826_mordrag_problem_condition()
{
	if(THORUS_MORDRAGKO == LOG_RUNNING)
	{
		return 1;
	};
};

func void org_826_mordrag_problem_info()
{
	AI_Output(other,self,"Org_826_Mordrag_Problem_15_00");	//У тебя проблемы.
	AI_Output(self,other,"Org_826_Mordrag_Problem_11_01");	//Правда? А у кого их нет?
	AI_Output(other,self,"Org_826_Mordrag_Problem_15_02");	//Есть люди, которым не нравится твое присутствие здесь. Они хотят избавиться от тебя.
	AI_Output(self,other,"Org_826_Mordrag_Problem_11_03");	//Да ты что? Тогда они должны будут подослать ко мне кого-нибудь, иначе ничего не выйдет!
	AI_Output(other,self,"Org_826_Mordrag_Problem_15_04");	//А почему ты уверен, что они никого не присылали? Например, они могли послать меня...
	AI_Output(self,other,"Org_826_Mordrag_Problem_11_05");	//Потому что мне кажется, что ты не похож на убийцу. Ты скоро узнаешь, что в колонии есть более интересные дела, чем работа на Гомеза.
	if((Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2))
	{
		AI_Output(self,other,"Org_826_Mordrag_Problem_11_06");	//У нас в Новом лагере тоже нужны способные люди. А еще там нет никого, кто будет указывать тебе, что можно, а что нельзя.
	};
};


instance ORG_826_MORDRAG_NCINFO(C_INFO)
{
	npc = org_826_mordrag;
	nr = 3;
	condition = org_826_mordrag_ncinfo_condition;
	information = org_826_mordrag_ncinfo_info;
	permanent = 0;
	description = "Расскажи мне что-нибудь о Новом лагере.";
};


func int org_826_mordrag_ncinfo_condition()
{
	if(Npc_KnowsInfo(hero,org_826_mordrag_problem) || (Npc_KnowsInfo(hero,org_826_mordrag_courier) && !c_npcbelongstonewcamp(hero) && (KAPITEL < 4) && (MORDRAGKO_HAUAB != TRUE)))
	{
		return 1;
	};
};

func void org_826_mordrag_ncinfo_info()
{
	AI_Output(other,self,"Org_826_Mordrag_NCInfo_15_00");	//Расскажи мне что-нибудь о Новом лагере.
	AI_Output(self,other,"Org_826_Mordrag_NCInfo_11_01");	//В нашем лагере живут свободные люди. Никаких Баронов или Гуру, никаких глупых приказов.
	AI_Output(self,other,"Org_826_Mordrag_NCInfo_11_02");	//У нас есть своя шахта. А еще мы не поставляем добытую руду королю!
	AI_Output(other,self,"Org_826_Mordrag_NCInfo_15_03");	//А зачем она вам нужна?
	AI_Output(self,other,"Org_826_Mordrag_NCInfo_11_04");	//Наши маги ищут способ разрушения Барьера. Вот для этого мы и собираем нашу руду.
	AI_Output(self,other,"Org_826_Mordrag_NCInfo_11_05");	//Пока Гомез и его люди слоняются без дела, мы стараемся изо всех сил, чтобы в конце концов получить свободу.
};


instance ORG_826_MORDRAG_JOINNEWCAMP(C_INFO)
{
	npc = org_826_mordrag;
	nr = 3;
	condition = org_826_mordrag_joinnewcamp_condition;
	information = org_826_mordrag_joinnewcamp_info;
	permanent = 0;
	description = "А если я захочу присоединиться к Новому лагерю... ты поможешь мне?";
};


func int org_826_mordrag_joinnewcamp_condition()
{
	if((Npc_KnowsInfo(hero,org_826_mordrag_problem) || Npc_KnowsInfo(hero,org_826_mordrag_courier)) && (Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2) && (MORDRAGKO_HAUAB != TRUE))
	{
		return 1;
	};
};

func void org_826_mordrag_joinnewcamp_info()
{
	AI_Output(other,self,"Org_826_Mordrag_JoinNewcamp_15_00");	//А если я захочу присоединиться к Новому лагерю... ты поможешь мне?
	AI_Output(self,other,"Org_826_Mordrag_JoinNewcamp_11_01");	//Если ты этого действительно хочешь, мы можем пойти туда прямо сейчас. Я отведу тебя к Ларсу. Он глава нашей шайки.
	AI_Output(self,other,"Org_826_Mordrag_JoinNewcamp_11_02");	//Но если ты просто хочешь выкинуть меня из лагеря, пожалуйста, попробуй!
};


instance ORG_826_MORDRAG_GOTONEWCAMP(C_INFO)
{
	npc = org_826_mordrag;
	nr = 3;
	condition = org_826_mordrag_gotonewcamp_condition;
	information = org_826_mordrag_gotonewcamp_info;
	permanent = 0;
	description = "Давай пойдем в Новый лагерь!";
};


func int org_826_mordrag_gotonewcamp_condition()
{
	if(Npc_KnowsInfo(hero,org_826_mordrag_joinnewcamp) && (Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2) && (MORDRAGKO_HAUAB != TRUE))
	{
		return 1;
	};
};

func void org_826_mordrag_gotonewcamp_info()
{
	AI_Output(other,self,"Org_826_Mordrag_GotoNewcamp_15_00");	//Давай пойдем в Новый лагерь!
	AI_Output(self,other,"Org_826_Mordrag_GotoNewcamp_11_01");	//Хорошо! Иди за мной.
	MORDRAG_GOTONC_DAY = Wld_GetDay();
	AI_StopProcessInfos(self);
	npc_setpermattitude(self,ATT_FRIENDLY);
	self.flags = NPC_FLAG_IMMORTAL;
	if((Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2))
	{
		Log_CreateTopic(CH1_JOINNC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JOINNC,LOG_RUNNING);
		b_logentry(CH1_JOINNC,"Мордраг согласился показать мне дорогу в Новый лагерь. Надеюсь, он не подстроит мне ловушку!");
	};
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GUIDE");
};


instance ORG_826_MORDRAG_ATNEWCAMP(C_INFO)
{
	npc = org_826_mordrag;
	nr = 3;
	condition = org_826_mordrag_atnewcamp_condition;
	information = org_826_mordrag_atnewcamp_info;
	permanent = 0;
	important = 1;
};


func int org_826_mordrag_atnewcamp_condition()
{
	if(Npc_KnowsInfo(hero,org_826_mordrag_gotonewcamp) && Hlp_StrCmp(Npc_GetNearestWP(self),"OW_PATH_07_21"))
	{
		self.flags = 0;
		return 1;
	};
};

func void org_826_mordrag_atnewcamp_info()
{
	var C_NPC lares;
	if(MORDRAG_GOTONC_DAY > (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_00");	//Вот мы и на месте.
	}
	else
	{
		AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_LATE_11_00");	//Я думал, что ты уже никогда не придешь. Это уже неважно, мы пришли.
	};
	AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_01");	//Если пройдешь через эти ворота, то попадешь прямо в Новый лагерь. Поговори с Ларсом. Он поможет тебе. Вот тебе кольцо.
	b_printtrademsg1("Получено кольцо Мордрага.");
	AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_02");	//Оно будет твоим пропуском к нему. Ларс не станет говорить с первым встречным.
	AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_03");	//Я все обдумал и решил остаться здесь ненадолго. Я достаточно заработал. К тому же, обстановка в Старом лагере понемногу накаляется.
	AI_Output(self,other,"Org_826_Mordrag_AtNewcamp_11_04");	//Если захочешь меня найти, зайди в бар. Он находится на озере. Увидимся. До встречи!
	AI_Output(other,self,"Org_826_Mordrag_AtNewcamp_15_05");	//Еще увидимся!
	CreateInvItems(self,mordragsring,1);
	b_giveinvitems(self,other,mordragsring,1);
	b_givexp(XP_ARRIVEDWITHMORDRAG);
	b_logentry(CH1_JOINNC,"Мы стоим перед воротами в Новый лагерь. Мордраг дал мне кольцо, которое нужно отнести Ларсу, главарю воров. Сам же он ненадолго останется здесь, в лагере.");
	lares = Hlp_GetNpc(org_801_lares);
	lares.aivar[AIV_FINDABLE] = TRUE;
	MORDRAGKO_STAYATNC = TRUE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance ORG_826_MORDRAG_FIGHT(C_INFO)
{
	npc = org_826_mordrag;
	nr = 3;
	condition = org_826_mordrag_fight_condition;
	information = org_826_mordrag_fight_info;
	permanent = 0;
	description = "В этом лагере останется только один из нас!";
};


func int org_826_mordrag_fight_condition()
{
	if((THORUS_MORDRAGKO == LOG_RUNNING) && !Npc_KnowsInfo(hero,org_826_mordrag_gotonewcamp))
	{
		return 1;
	};
};

func void org_826_mordrag_fight_info()
{
	AI_Output(other,self,"Org_826_Mordrag_Fight_15_00");	//В этом лагере останется только один из нас!
	AI_Output(self,other,"Org_826_Mordrag_Fight_11_01");	//Прости, но я не расслышал...
	Info_ClearChoices(org_826_mordrag_fight);
	Info_AddChoice(org_826_mordrag_fight,"Уходи из этого лагеря!",info_mordrag_fight_getaway);
	Info_AddChoice(org_826_mordrag_fight,"Здесь не место для тех, кто ворует вещи Баронов!",info_mordrag_fight_orebarons);
	Info_AddChoice(org_826_mordrag_fight,"Меня прислал Торус. Он больше не хочет тебя здесь видеть.",info_mordrag_fight_thorus);
};

func void info_mordrag_fight_getaway()
{
	AI_Output(other,self,"Info_Mordrag_Fight_GetAway_15_00");	//Уходи из этого лагеря!
	AI_Output(self,other,"Info_Mordrag_Fight_GetAway_11_01");	//Слишком большие слова для такого человечка, как ты...
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
};

func void info_mordrag_fight_orebarons()
{
	AI_Output(other,self,"Info_Mordrag_Fight_OreBarons_15_00");	//Здесь не место для тех, кто ворует вещи Баронов!
	AI_Output(self,other,"Info_Mordrag_Fight_OreBarons_11_01");	//А, вот ты о чем! Так бы сразу и сказал...
	MORDRAGKO_PLAYERCHOSEOREBARONS = TRUE;
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
};

func void info_mordrag_fight_thorus()
{
	AI_Output(other,self,"Info_Mordrag_Fight_Thorus_15_00");	//Меня прислал Торус. Он больше не хочет тебя здесь видеть.
	AI_Output(self,other,"Info_Mordrag_Fight_Thorus_11_01");	//Да? Торус? Что ж, ты сказал все, что мне было нужно...
	MORDRAGKO_PLAYERCHOSETHORUS = TRUE;
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
};


instance ORG_826_MORDRAG_HAUAB(C_INFO)
{
	npc = org_826_mordrag;
	nr = 3;
	condition = org_826_mordrag_hauab_condition;
	information = org_826_mordrag_hauab_info;
	permanent = 0;
	important = 1;
};


func int org_826_mordrag_hauab_condition()
{
	var C_NPC mordrag;
	mordrag = Hlp_GetNpc(org_826_mordrag);
	if((mordrag.aivar[AIV_WASDEFEATEDBYSC] >= 1) && (THORUS_MORDRAGKO == LOG_RUNNING))
	{
		return 1;
	};
};

func void org_826_mordrag_hauab_info()
{
	AI_Output(other,self,"Org_826_HauAb_GotoNewcamp_15_00");	//Уходи...
	AI_StopProcessInfos(self);
	MORDRAGKO_HAUAB = TRUE;
	b_logentry(CH1_MORDRAGKO,"Я избил Мордрага и сказал ему, что он не должен возвращаться в Старый лагерь.");
	Npc_ExchangeRoutine(self,"Start");
};


instance ORG_826_MORDRAG_GOTOKALOM(C_INFO)
{
	npc = org_826_mordrag;
	nr = 2;
	condition = org_826_mordrag_gotokalom_condition;
	information = org_826_mordrag_gotokalom_info;
	permanent = 0;
	description = "Ларс передал тебе послание.";
};


func int org_826_mordrag_gotokalom_condition()
{
	if((Npc_GetTrueGuild(other) != GIL_ORG) && (LARES_INFORMMORDRAG == LOG_RUNNING))
	{
		return 1;
	};
};

func void org_826_mordrag_gotokalom_info()
{
	AI_Output(other,self,"Org_826_Mordrag_GotoKalom_15_00");	//Ларс передал тебе послание.
	AI_Output(self,other,"Org_826_Mordrag_GotoKalom_11_01");	//Ну-ка, послушаем.
	AI_Output(other,self,"Org_826_Mordrag_GotoKalom_15_02");	//Он хочет знать, что делается в Лагере сектантов.
	AI_Output(self,other,"Org_826_Mordrag_GotoKalom_11_03");	//У меня такое чувство, что все это решится само собой...
	b_logentry(CH1_JOINNC,"Я передал Мордрагу то, что сказал мне Ларс. Он что-то говорил о том, что дело будет улажено само. Не знаю, что он имел в виду!");
};


var int mordrag_gotokalom;

instance ORG_826_MORDRAG_GOTOKALOMNOW(C_INFO)
{
	npc = org_826_mordrag;
	nr = 2;
	condition = org_826_mordrag_gotokalomnow_condition;
	information = org_826_mordrag_gotokalomnow_info;
	permanent = 0;
	description = "Ларс сказал, чтобы я помог тебе с сектантами.";
};


func int org_826_mordrag_gotokalomnow_condition()
{
	if((Npc_GetTrueGuild(other) == GIL_ORG) && Npc_KnowsInfo(hero,org_801_lares_gotokalom))
	{
		return TRUE;
	};
};

func void org_826_mordrag_gotokalomnow_info()
{
	AI_Output(other,self,"Org_826_Mordrag_GotoKalomNOW_15_00");	//Ларс сказал, чтобы я помог тебе с сектантами.
	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_11_01");	//Вот видишь... Я знал, что мне не придется идти туда самому.
	AI_Output(other,self,"Org_826_Mordrag_GotoKalomNOW_15_02");	//Так я должен буду делать все сам?
	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_11_03");	//Думаю, у тебя все получится. Слушай внимательно: тебе нужно узнать, кого они там хотят пробудить.
	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_11_04");	//Я знаю, что эти сектанты хотят провести какую-то церемонию. Лично я не верю ни в какого Спящего, но одно я знаю точно:
	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_11_05");	//Гуру очень хорошие маги. И было бы лучше, если бы мы знали, что у них происходит. Тебе все понятно?
	b_logentry(CH1_GOTOPSICAMP,"Мордраг послал меня в Болотный лагерь разбираться с заданием. Гуру готовят какую-то церемонию, но что это будет, придется выяснить на месте.");
	b_givexp(XP_ASSISTMORDRAG);
	LARES_INFORMMORDRAG = LOG_SUCCESS;
	MORDRAG_GOTOKALOM = LOG_RUNNING;
	Info_ClearChoices(org_826_mordrag_gotokalomnow);
	Info_AddChoice(org_826_mordrag_gotokalomnow,"Ты можешь говорить яснее?",org_826_mordrag_gotokalomnow_precise);
	Info_AddChoice(org_826_mordrag_gotokalomnow,"Я посмотрю, что тут можно сделать.",org_826_mordrag_gotokalomnow_doit);
};

func void org_826_mordrag_gotokalomnow_precise()
{
	AI_Output(other,self,"Org_826_Mordrag_GotoKalomNOW_Precise_15_00");	//Ты можешь говорить яснее?
	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_Precise_11_01");	//Поговори с Лестером. Я некоторое время жил в Лагере сектантов, и он помогал мне тогда. Он хороший человек.
	b_logentry(CH1_GOTOPSICAMP,"В лагере Братства я должен поговорить с послушником по имени Лестер. По словам Мордрага он помогал ему, когда тот жил в Болотном лагере. Кажется, ему можно доверять.");
};

func void org_826_mordrag_gotokalomnow_doit()
{
	AI_Output(other,self,"Org_826_Mordrag_GotoKalomNOW_DoIt_15_00");	//Я посмотрю, что тут можно сделать.
	AI_Output(self,other,"Org_826_Mordrag_GotoKalomNOW_DoIt_11_01");	//Как только ты узнаешь что-нибудь ценное, возвращайся к нам.
	Info_ClearChoices(org_826_mordrag_gotokalomnow);
	AI_StopProcessInfos(self);
};


instance ORG_826_MORDRAG_RUNNING(C_INFO)
{
	npc = org_826_mordrag;
	nr = 2;
	condition = org_826_mordrag_running_condition;
	information = org_826_mordrag_running_info;
	permanent = 1;
	description = "Я узнал кое-что о сектантах...";
};


func int org_826_mordrag_running_condition()
{
	if(MORDRAG_GOTOKALOM == LOG_RUNNING)
	{
		return 1;
	};
};

func void org_826_mordrag_running_info()
{
	AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_00");	//Я узнал кое-что о сектантах...
	AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_01");	//Ну, узнал что-нибудь?
	if(CORKALOM_BRINGMCQBALLS == LOG_SUCCESS)
	{
		if(KAPITEL >= 3)
		{
			AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_04");	//Они провели Великую Церемонию.
			AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_09");	//Не может быть! Ты был там вместе с этими помешанными?
		}
		else
		{
			AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_06");	//Да. Они увеличили свою духовную силу с помощью одного зелья, приготовленного из яиц ползунов, и попытались призвать Спящего.
			AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_07");	//Смешнее я еще ничего не слышал! Так они во все это верят, да?
		};
		AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_10");	//Хотелось бы посмотреть, что из этого выйдет.
		AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_11");	//Мне тоже. Расскажешь, когда эти хваленые Гуру вконец опозорятся.
		MORDRAG_GOTOKALOM = LOG_SUCCESS;
		b_givexp(XP_REPORTTOMORDRAG);
		Log_SetTopicStatus(CH1_GOTOPSICAMP,LOG_SUCCESS);
		b_logentry(CH1_GOTOPSICAMP,"Мордраг смеялся как никогда, слушая мои приключения с ползунами из шахты. Кажется, его больше не интересуют дела Братства. Я сказал, что выполнил свое задание!");
	}
	else
	{
		AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_02");	//Я пока не смог ничего разузнать.
		AI_Output(self,other,"Org_826_Mordrag_RUNNING_11_03");	//Так займись делом...
	};
};

