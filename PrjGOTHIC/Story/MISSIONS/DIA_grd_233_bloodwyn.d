
instance INFO_BLOODWYN_EXIT_SCHUTZGELD(C_INFO)
{
	npc = grd_233_bloodwyn;
	nr = 999;
	condition = info_bloodwyn_exit_schutzgeld_condition;
	information = info_bloodwyn_exit_schutzgeld_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_bloodwyn_exit_schutzgeld_condition()
{
	return 1;
};

func void info_bloodwyn_exit_schutzgeld_info()
{
	AI_Output(other,self,"Info_Bloodwyn_EXIT_Schutzgeld_15_00");	//До встречи!
	if(BLOODWYN_PROTECTIONPAID == FALSE)
	{
		AI_Output(self,other,"Info_Bloodwyn_EXIT_Schutzgeld_08_01");	//Будь осторожен здесь!
	}
	else
	{
		AI_Output(self,other,"Info_Bloodwyn_EXIT_Schutzgeld_08_02");	//Ни о чем не беспокойся. Мы позаботимся о твоей безопасности.
	};
	AI_StopProcessInfos(self);
};


instance INFO_BLOODWYN_HELLO(C_INFO)
{
	npc = grd_233_bloodwyn;
	nr = 3;
	condition = info_bloodwyn_hello_condition;
	information = info_bloodwyn_hello_info;
	permanent = 0;
	important = 1;
};


func int info_bloodwyn_hello_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void info_bloodwyn_hello_info()
{
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_00");	//Эй, ты!
	AI_Output(other,self,"Info_Bloodwyn_Hello_15_01");	//Ты хочешь поговорить?
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_02");	//Хочу предупредить тебя! Постарайся не делать глупостей, хорошо?
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_03");	//Большинство тех, кто сюда попадает, бандиты и убийцы.
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_04");	//Они думают, что им все позволено. Но мы стараемся пресечь своеволие.
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_05");	//Гомeз хочет, чтобы в лагере было спокойно, и мы следим за этим. Но эта работа не из легких.
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_06");	//Вот поэтому я предлагаю тебе поделиться по-дружески рудой в награду за наши труды. Ты поможешь нам - мы поможем тебе, если у тебя возникнут проблемы.
	Info_ClearChoices(info_bloodwyn_hello);
	Info_AddChoice(info_bloodwyn_hello,"Почему бы и нет? Сколько руды тебе нужно?",info_bloodwyn_hello_howmuch);
	Info_AddChoice(info_bloodwyn_hello,"Я должен платить деньги за защиту? Нет уж...",info_bloodwyn_hello_forgetit);
	Info_AddChoice(info_bloodwyn_hello,"Ты мне угрожаешь?",info_bloodwyn_hello_solldrohungsein);
};

func void info_bloodwyn_hello_forgetit()
{
	AI_Output(other,self,"Info_Bloodwyn_ForgetIt_15_00");	//Я должен платить деньги за защиту? Нет уж, спасибо, я и сам о себе позабочусь!
	AI_Output(self,other,"Info_Bloodwyn_ForgetIt_08_01");	//Как хочешь. Быть может, ты еще пожалеешь, что отказался от моего дружеского предложения.
	BLOODWYN_PROTECTIONPAID = FALSE;
	HEREK_PROTECTIONBULLY = TRUE;
	GRIM_PROTECTIONBULLY = TRUE;
	BLOODWYN_PAYDAY = b_setdaytolerance();
	Info_ClearChoices(info_bloodwyn_hello);
};

func void info_bloodwyn_hello_solldrohungsein()
{
	AI_Output(other,self,"Info_Bloodwyn_SollDrohungSein_15_00");	//Ты мне угрожаешь?
	AI_Output(self,other,"Info_Bloodwyn_SollDrohungSein_08_01");	//Наоборот! Я предлагаю тебе дружбу!
};

func void info_bloodwyn_hello_howmuch()
{
	AI_Output(other,self,"Info_Bloodwyn_Hello_HowMuch_15_01");	//Почему бы и нет? Сколько руды тебе нужно?
	AI_Output(self,other,"Info_Bloodwyn_Hello_HowMuch_08_02");	//Не так много. Всего десять кусков.
	Info_ClearChoices(info_bloodwyn_hello);
	Info_AddChoice(info_bloodwyn_hello,"Сейчас у меня нет десяти кусков.",info_bloodwyn_hello_notnow);
	if(Npc_HasItems(other,itminugget) >= 10)
	{
		Info_AddChoice(info_bloodwyn_hello,"Вот тебе руда. Друг всегда может пригодиться.",info_bloodwyn_hello_oktakeit);
	};
};

func void info_bloodwyn_hello_oktakeit()
{
	AI_Output(other,self,"Info_Bloodwyn_Hello_OkTakeIt_15_00");	//Вот тебе руда. Друг всегда может пригодиться.
	AI_Output(self,other,"Info_Bloodwyn_Hello_OkTakeIt_08_01");	//А ты умный парень. Теперь ты можешь на меня положиться. Я буду защищать тебя.
	AI_Output(self,other,"Info_Bloodwyn_Hello_OkTakeIt_08_02");	//Но это еще не значит, что тебе здесь будет все позволено, это понятно?
	b_giveinvitems(other,self,itminugget,10);
	BLOODWYN_PROTECTIONPAID = TRUE;
	HEREK_PROTECTIONBULLY = FALSE;
	GRIM_PROTECTIONBULLY = FALSE;
	npc_setpermattitude(self,ATT_FRIENDLY);
	BLOODWYN_PAYDAY = b_setdaytolerance();
	Info_ClearChoices(info_bloodwyn_hello);
};

func void info_bloodwyn_hello_notnow()
{
	AI_Output(other,self,"Info_Bloodwyn_Hello_NotNow_15_00");	//Сейчас у меня нет десяти кусков.
	AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_08_01");	//Ну, тогда я возьму у тебя те, что есть. Остальное отдашь в следующий раз.
	AI_GotoNpc(self,other);
	AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_08_02");	//Ну-ка, посмотрим...
	if(Npc_HasItems(other,itminugget) > 0)
	{
		if(Npc_HasItems(other,itminugget) > 9)
		{
			AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_00");	//Что у нас тут есть? Здесь кто-то не умеет считать до десяти, да?
			AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_01");	//Я просто возьму все, что у тебя есть. Тогда я забуду, что ты пытался меня обмануть.
			b_giveinvitems(other,self,itminugget,Npc_HasItems(other,itminugget));
		}
		else
		{
			AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_00");	//Ну, у тебя мало руды, но мне хватит и этого. Главное, ты согласился платить. Спасибо.
			AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_01");	//Теперь я буду приглядывать за тобой, пока ты будешь в лагере.
			b_giveinvitems(other,self,itminugget,Npc_HasItems(other,itminugget));
		};
	}
	else
	{
		AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_NoOre_08_00");	//У тебя совсем ничего нет... Ну, как я сказал, заплатишь в следующий раз...
	};
	BLOODWYN_PROTECTIONPAID = TRUE;
	HEREK_PROTECTIONBULLY = FALSE;
	GRIM_PROTECTIONBULLY = FALSE;
	npc_setpermattitude(self,ATT_FRIENDLY);
	BLOODWYN_PAYDAY = b_setdaytolerance();
	Info_ClearChoices(info_bloodwyn_hello);
};


instance INFO_BLOODWYN_PAYDAY(C_INFO)
{
	npc = grd_233_bloodwyn;
	nr = 3;
	condition = info_bloodwyn_payday_condition;
	information = info_bloodwyn_payday_info;
	permanent = 1;
	important = 1;
};


func int info_bloodwyn_payday_condition()
{
	if((KAPITEL <= 2) && (BLOODWYN_PAYDAY <= (Wld_GetDay() - 1)) && (Npc_HasItems(other,itminugget) >= 10) && Npc_GetTrueGuild(hero) != GIL_GRD && Npc_GetTrueGuild(hero) != GIL_STT && Npc_GetTrueGuild(hero) != GIL_KDF)
	{
		return 1;
	};
};

func void info_bloodwyn_payday_info()
{
	if(BLOODWYN_PROTECTIONPAID == TRUE)
	{
		AI_Output(self,other,"Info_Bloodwyn_PayDay_08_00");	//Хорошо, что я тебя встретил!
		AI_Output(self,other,"Info_Bloodwyn_PayDay_08_01");	//Ты должен мне десять кусков за защиту - дневную плату. Ты будешь платить?
		Info_ClearChoices(info_bloodwyn_payday);
		Info_AddChoice(info_bloodwyn_payday,"Вот, возьми десять кусков. Для друга не жалко.",info_bloodwyn_payday_payagain);
		Info_AddChoice(info_bloodwyn_payday,"Я больше не буду платить. Ты и так получил с меня слишком много.",info_bloodwyn_payday_paynomore);
	}
	else if(BLOODWYN_PROTECTIONPAID == FALSE)
	{
		AI_Output(self,other,"Info_Bloodwyn_PayDay_Den_08_00");	//Эй, ты!
		AI_Output(other,self,"Info_Bloodwyn_PayDay_Den_15_01");	//Что еще тебе от меня нужно?
		AI_Output(self,other,"Info_Bloodwyn_PayDay_Den_08_02");	//У тебя есть возможность доказать, что мы друзья.
		AI_Output(self,other,"Info_Bloodwyn_PayDay_Den_08_03");	//Всего-то десять кусков руды, ты согласен?
	};
	BLOODWYN_PAYDAY = b_setdaytolerance();
};

func void info_bloodwyn_payday_payagain()
{
	AI_Output(other,self,"Info_Bloodwyn_PayDay_PayAgain_15_00");	//Вот, возьми десять кусков. Для друга не жалко.
	AI_Output(self,other,"Info_Bloodwyn_PayDay_PayAgain_08_01");	//Я тоже так думаю.
	b_giveinvitems(other,self,itminugget,10);
	BLOODWYN_PROTECTIONPAID = TRUE;
	HEREK_PROTECTIONBULLY = FALSE;
	GRIM_PROTECTIONBULLY = FALSE;
	npc_setpermattitude(self,ATT_FRIENDLY);
	Info_ClearChoices(info_bloodwyn_payday);
};

func void info_bloodwyn_payday_paynomore()
{
	AI_Output(other,self,"Info_Bloodwyn_PayDay_PayNoMore_15_00");	//Я больше не буду платить. Ты и так получил с меня слишком много.
	AI_Output(self,other,"Info_Bloodwyn_PayDay_PayNoMore_08_01");	//Ты меня разочаровал. С нашей дружбой покончено. Теперь тебе самому придется защищать себя от тех, кто захочет ограбить или убить тебя.
	AI_Output(other,self,"Info_Bloodwyn_PayDay_PayNoMore_15_02");	//Я и сам смогу защитить себя.
	AI_Output(self,other,"Info_Bloodwyn_PayDay_PayNoMore_08_03");	//Это мы посмотрим...
	BLOODWYN_PROTECTIONPAID = FALSE;
	HEREK_PROTECTIONBULLY = TRUE;
	GRIM_PROTECTIONBULLY = TRUE;
	npc_setpermattitude(self,ATT_ANGRY);
	Info_ClearChoices(info_bloodwyn_payday);
};


instance INFO_BLOODWYN_DOCH(C_INFO)
{
	npc = grd_233_bloodwyn;
	nr = 3;
	condition = info_bloodwyn_doch_condition;
	information = info_bloodwyn_doch_info;
	permanent = 1;
	description = "Я передумал. Я заплачу тебе десять кусков руды.";
};


func int info_bloodwyn_doch_condition()
{
	if(BLOODWYN_PROTECTIONPAID == FALSE && Npc_GetTrueGuild(hero) != GIL_GRD && Npc_GetTrueGuild(hero) != GIL_STT && Npc_GetTrueGuild(hero) != GIL_KDF)
	{
		return 1;
	};
};

func void info_bloodwyn_doch_info()
{
	AI_Output(other,self,"Info_Bloodwyn_Doch_15_00");	//Я передумал. Я заплачу тебе десять кусков руды.
	if(Npc_HasItems(other,itminugget) >= 10)
	{
		AI_Output(self,other,"Info_Bloodwyn_Doch_08_01");	//Вот видишь! Ты все-таки можешь принимать правильные решения.
		AI_Output(self,other,"Info_Bloodwyn_Doch_08_02");	//И теперь ты будешь платить мне за защиту каждый день, да?
		b_giveinvitems(other,self,itminugget,10);
		BLOODWYN_PROTECTIONPAID = TRUE;
		HEREK_PROTECTIONBULLY = FALSE;
		GRIM_PROTECTIONBULLY = FALSE;
		npc_setpermattitude(self,ATT_FRIENDLY);
		BLOODWYN_PAYDAY = b_setdaytolerance();
	}
	else
	{
		AI_Output(self,other,"Info_Bloodwyn_Doch_NoOre_08_00");	//Так приходи, когда наступит время платить еще.
		AI_StopProcessInfos(self);
	};
};


instance INFO_BLOODWYN_PAYFORJESSE(C_INFO)
{
	npc = grd_233_bloodwyn;
	nr = 5;
	condition = info_bloodwyn_payforjesse_condition;
	information = info_bloodwyn_payforjesse_info;
	permanent = 1;
	description = "Джесс просил меня заплатить за него десять кусков руды.";
};


func int info_bloodwyn_payforjesse_condition()
{
	if(JESSE_PAYFORME == LOG_RUNNING)
	{
		return 1;
	};
};

func void info_bloodwyn_payforjesse_info()
{
	AI_Output(other,self,"Info_Bloodwyn_PayForJesse_15_00");	//Джесс просил меня заплатить за него десять кусков руды.
	if(BLOODWYN_PROTECTIONPAID == FALSE)
	{
		AI_Output(self,other,"Info_Bloodwyn_PayForJesse_08_01");	//Ты бы лучше сначала за себя заплатил.
	};
	AI_Output(self,other,"Info_Bloodwyn_PayForJesse_08_02");	//Забудь об этом Джессе. Он же конченый человек, неудачник.
	if(Npc_HasItems(other,itminugget) >= 10)
	{
		AI_Output(other,self,"Info_Bloodwyn_PayForJesse_15_03");	//Нет, я все же заплачу за него. Вот тебе десять кусков и оставь его в покое.
		AI_Output(self,other,"Info_Bloodwyn_PayForJesse_08_04");	//Как хочешь, дело твое.
		b_giveinvitems(other,self,itminugget,10);
		JESSE_PAYFORME = LOG_SUCCESS;
	}
	else
	{
		AI_Output(other,self,"Info_Bloodwyn_PayForJesse_15_05");	//О! Кажется, моей руды не хватит.
		AI_Output(self,other,"Info_Bloodwyn_PayForJesse_08_06");	//Да, тебе дали второй шанс. Подумай хорошенько, зачем тебе тратить руду на какого-то неудачника?
	};
};


instance GRD_233_BLOODWYN_WELCOME(C_INFO)
{
	npc = grd_233_bloodwyn;
	condition = grd_233_bloodwyn_welcome_condition;
	information = grd_233_bloodwyn_welcome_info;
	important = 1;
	permanent = 0;
};


func int grd_233_bloodwyn_welcome_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void grd_233_bloodwyn_welcome_info()
{
	AI_Output(self,other,"GRD_233_Bloodwyn_WELCOME_Info_08_01");	//Теперь ты один из нас. Отлично. Нам нужны такие люди как ты.
};


instance INFO_BLOODWYN_DIE(C_INFO)
{
	//npc = grd_233_bloodwyn;
	condition = info_bloodwyn_die_condition;
	information = info_bloodwyn_die_info;
	permanent = 0;
	important = 1;
};


func int info_bloodwyn_die_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void info_bloodwyn_die_info()
{
	AI_GotoNpc(self,hero);
	if((OLDHEROGUILD == GIL_STT) || (OLDHEROGUILD == GIL_GRD) || (OLDHEROGUILD == GIL_KDF))
	{
		if(OLDHEROGUILD == GIL_GRD)
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_01");	//Среди нас появился предатель! И мы еще называли тебя стражником!
		}
		else if(OLDHEROGUILD == GIL_KDF)
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_02");	//Похоже, одного их мятежных магов Огня мы пропустили!
		}
		else
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_03");	//Один из Призраков оказался предателем!
		};
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_04");	//Погоди. Бладвин, о чем ты говоришь?
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_05");	//Ты ведешь какие-то дела с Новым лагерем, да?
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_06");	//Постой, но я все еще...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_07");	//А ты думал, что так будет продолжаться вечно?
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_08");	//Прекрати нести весь этот вздор...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_09");	//Предателей обычно убивают.
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_10");	//Так умри, предатель!
		if(Npc_KnowsInfo(hero,info_fletcher_die))
		{
			b_logentry(CH4_BANNEDFROMOC,"Флетчер, который сейчас охраняет главные ворота, повел себя точно так же, как и Бладвин. Он что-то знает о том, что я ищу юниторы для Нового лагеря.");
		}
		else if(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic(CH4_BANNEDFROMOC,LOG_MISSION);
			Log_SetTopicStatus(CH4_BANNEDFROMOC,LOG_RUNNING);
			b_logentry(CH4_BANNEDFROMOC,"Бладвин, который теперь вместе с группой стражников охраняет северные ворота, назвал меня предателем и перебежчиком. Без дальнейших разговоров он напал на меня!");
			b_logentry(CH4_BANNEDFROMOC,"Кажется, меня прогнали из Старого лагеря!");
		};
	}
	else
	{
		if(c_npcbelongstonewcamp(hero))
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_11");	//И как это ты осмелился выйти из Нового лагеря? Неразумный поступок!
		}
		else
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_12");	//И ты решился выйти из своего Болотного лагеря? Как глупо с твоей стороны!
		};
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_13");	//Что такое? О чем ты говоришь?
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_14");	//Так ты ничего не слышал о нападении на Новую шахту, да?
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_15");	//О чем ты...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_16");	//Прости, но мы не можем позволить тебе разгуливать здесь. Ты знаешь слишком много!
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_17");	//Эй, я не хочу драться с тобой...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_18");	//Об этом раньше нужно было думать!
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_19");	//Все, с меня хватит...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_20");	//И правда, хватит! Убить его!
	};
	Npc_ExchangeRoutine(self,"FMTaken2");
	b_exchangeroutine(grd_232_gardist,"FMTaken2");
	b_exchangeroutine(grd_229_gardist,"FMTaken2");
	b_exchangeroutine(grd_216_torwache,"FMTaken2");
	b_exchangeroutine(grd_217_torwache,"FMTaken2");
	b_setpermattitude(grd_233_bloodwyn,ATT_HOSTILE);
	b_setpermattitude(grd_232_gardist,ATT_HOSTILE);
	b_setpermattitude(grd_229_gardist,ATT_HOSTILE);
	b_setpermattitude(grd_216_torwache,ATT_HOSTILE);
	b_setpermattitude(grd_217_torwache,ATT_HOSTILE);
	Wld_ExchangeGuildAttitudes("GIL_ATTITUDES_FMTAKEN");
	if(!Npc_KnowsInfo(hero,info_fletcher_die))
	{
		b_logentry(CH4_FIREMAGES,"Ворота в Старый лагерь закрыты и охраняются стражниками. Они нападают на любого, кто окажется слишком неосторожен, чтобы подойти к ним.");
	};
	AI_StopProcessInfos(self);
};

