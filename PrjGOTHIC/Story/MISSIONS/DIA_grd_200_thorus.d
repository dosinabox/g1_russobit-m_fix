
func void b_thoruslearn()
{
	Info_ClearChoices(grd_200_thorus_teach);
	Info_AddChoice(grd_200_thorus_teach,DIALOG_BACK,grd_200_thorus_teach_back);
	if(hero.guild == GIL_STT || hero.guild == GIL_GRD || hero.guild == GIL_KDF)
	{
		Info_AddChoice(grd_200_thorus_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),grd_200_thorus_teach_str_5);
		Info_AddChoice(grd_200_thorus_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),grd_200_thorus_teach_str_1);
		Info_AddChoice(grd_200_thorus_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),grd_200_thorus_teach_dex_5);
		Info_AddChoice(grd_200_thorus_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),grd_200_thorus_teach_dex_1);
	}
	else
	{
		Info_AddChoice(grd_200_thorus_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,OTHERCAMPLEARNPAY * 5),grd_200_thorus_teach_str_5);
		Info_AddChoice(grd_200_thorus_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,OTHERCAMPLEARNPAY),grd_200_thorus_teach_str_1);
		Info_AddChoice(grd_200_thorus_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,OTHERCAMPLEARNPAY * 5),grd_200_thorus_teach_dex_5);
		Info_AddChoice(grd_200_thorus_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,OTHERCAMPLEARNPAY),grd_200_thorus_teach_dex_1);
	};
};

instance INFO_THORUS_EXIT(C_INFO)
{
	npc = grd_200_thorus;
	nr = 999;
	condition = info_thorus_exit_condition;
	information = info_thorus_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_thorus_exit_condition()
{
	return 1;
};

func void info_thorus_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_THORUS_ENTERCASTLE(C_INFO)
{
	npc = grd_200_thorus;
	nr = 3;
	condition = info_thorus_entercastle_condition;
	information = info_thorus_entercastle_info;
	permanent = 0;
	description = "Кажется, ты не пропускаешь в замок посторонних...";
};


func int info_thorus_entercastle_condition()
{
	if(!c_npcbelongstooldcamp(other) && (DIEGO_GOMEZAUDIENCE == FALSE) && (THORUS_PASSGATE == FALSE))
	{
		return 1;
	};
};

func void info_thorus_entercastle_info()
{
	AI_Output(other,self,"Info_EnterCastle_15_00");	//Кажется, ты не пропускаешь в замок посторонних...
	AI_Output(self,other,"Info_EnterCastle_09_01");	//Только люди Гомеза могут заходить в замок.
};


instance INFO_THORUS_WORKFORGOMEZ(C_INFO)
{
	npc = grd_200_thorus;
	nr = 3;
	condition = info_thorus_workforgomez_condition;
	information = info_thorus_workforgomez_info;
	permanent = 0;
	description = "Я хочу стать одним из людей Гомеза.";
};


func int info_thorus_workforgomez_condition()
{
	if((Npc_KnowsInfo(hero,info_diego_joinoldcamp) || Npc_KnowsInfo(hero,info_thorus_entercastle)) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void info_thorus_workforgomez_info()
{
	AI_Output(other,self,"Info_WorkForGomez_15_00");	//Я хочу стать одним из людей Гомеза.
	AI_Output(self,other,"Info_WorkForGomez_09_01");	//Да, что ты говоришь? И почему это ты думаешь, что можешь быть полезен Гомезу?
};


instance INFO_THORUS_DIEGOSENTME(C_INFO)
{
	npc = grd_200_thorus;
	nr = 1;
	condition = info_thorus_diegosentme_condition;
	information = info_thorus_diegosentme_info;
	permanent = 0;
	description = "Диего сказал, что это от тебя зависит.";
};


func int info_thorus_diegosentme_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_workforgomez) && Npc_KnowsInfo(hero,info_diego_joinoldcamp) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void info_thorus_diegosentme_info()
{
	AI_Output(other,self,"Info_Thorus_DiegoSentMe_15_00");	//Диего сказал, что это от тебя зависит.
	AI_Output(self,other,"Info_Thorus_DiegoSentMe_09_01");	//Хм... Если Диего думает, что ты можешь быть полезен, почему он сам не занимается тобой?
	AI_Output(self,other,"Info_Thorus_DiegoSentMe_09_02");	//Послушай, Диего должен проверить, испытать тебя. И если он решит, что ты подходишь, я пропущу тебя в замок, и ты сможешь встретиться с Гомезом.
	AI_Output(self,other,"Info_Thorus_DiegoSentMe_09_03");	//А там уже все зависит только от тебя, ясно?
	AI_Output(other,self,"Info_Thorus_DiegoSentMe_15_04");	//Я поговорю с Диего.
	b_logentry(CH1_JOINOC,"Торус сказал мне, что я должен поговорить с Диего, если я хочу, чтобы меня приняли в Старый лагерь. Диего даст мне задание.");
};


instance INFO_THORUS_TRYME(C_INFO)
{
	npc = grd_200_thorus;
	nr = 1;
	condition = info_thorus_tryme_condition;
	information = info_thorus_tryme_info;
	permanent = 0;
	description = "А почему ты сам не можешь меня испытать?";
};


func int info_thorus_tryme_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_workforgomez) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void info_thorus_tryme_info()
{
	AI_Output(other,self,"Info_Thorus_TryMe_15_00");	//А почему ты сам не можешь меня испытать?
	AI_Output(self,other,"Info_Thorus_TryMe_09_01");	//Малыш, не все так просто! У каждого новичка, который хочет чего-то здесь добиться, должен быть покровитель.
	AI_Output(self,other,"Info_Thorus_TryMe_09_02");	//Покровитель из людей Гомеза. И он сам тебя испытает.
	AI_Output(self,other,"Info_Thorus_TryMe_09_03");	//Ведь он будет в ответе за тебя и за все, что ты натворишь. Таков закон.
};


instance INFO_THORUS_TRYMEAGAIN(C_INFO)
{
	npc = grd_200_thorus;
	nr = 1;
	condition = info_thorus_trymeagain_condition;
	information = info_thorus_trymeagain_info;
	permanent = 0;
	description = "И я ничем не могу тебе помочь?";
};


func int info_thorus_trymeagain_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_tryme) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void info_thorus_trymeagain_info()
{
	AI_Output(other,self,"Info_Thorus_TryMeAgain_15_00");	//И я ничем не могу тебе помочь?
	AI_Output(self,other,"Info_Thorus_TryMeAgain_09_01");	//Нет. Ты, так сказать, немного маловат, чтобы быть нам чем-то полезен.
	AI_Output(self,other,"Info_Thorus_TryMeAgain_09_02");	//Лучше делай то, что твой покровитель тебе доверит.
};


instance INFO_THORUS_TRYMEICANDOIT(C_INFO)
{
	npc = grd_200_thorus;
	nr = 1;
	condition = info_thorus_trymeicandoit_condition;
	information = info_thorus_trymeicandoit_info;
	permanent = 0;
	description = "Но я смогу делать и то, что скажешь мне ты.";
};


func int info_thorus_trymeicandoit_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_trymeagain) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void info_thorus_trymeicandoit_info()
{
	AI_Output(other,self,"Info_Thorus_TryMeICanDoIt_15_00");	//Но я смогу делать и то, что скажешь мне ты.
	AI_Output(self,other,"Info_Thorus_TryMeICanDoIt_09_01");	//Да ну? Вижу, не терпится стать героем, да? Вообще-то есть одно дело - как раз для того, кто не засветился с Гомезом.
	AI_Output(self,other,"Info_Thorus_TryMeICanDoIt_09_02");	//Но смотри, провалишь дело - получишь море неприятностей.
};

instance INFO_THORUS_MORDRAGKO_OFFER(C_INFO)
{
	npc = grd_200_thorus;
	nr = 1;
	condition = info_thorus_mordragko_offer_condition;
	information = info_thorus_mordragko_offer_info;
	permanent = 0;
	description = "Я выполню твое задание.";
};


func int info_thorus_mordragko_offer_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_trymeicandoit) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void info_thorus_mordragko_offer_info()
{
	var C_NPC mordrag;
	AI_Output(other,self,"Info_Thorus_MordragKo_Offer_15_00");	//Я выполню твое задание.
	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_01");	//Все, что я тебе скажу, должно остаться между нами, ни слова другому. Понял?
	AI_Output(other,self,"Info_Thorus_MordragKo_Offer_15_02");	//Да.
	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_03");	//У нас здесь есть один проблемный парень из Нового лагеря - Мордраг. Он крадет у Баронов.
	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_04");	//Конечно, они почти все такие в Новом лагере. Но этот ворюга совсем обнаглел: крадет у нас и нам же продает!
	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_05");	//Он слишком много себе позволяет, потому что знает, что я ему ничего сделать не могу.
	AI_Output(other,self,"Info_Thorus_MordragKo_Offer_15_06");	//Почему?
	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_07");	//Да потому что сами Маги его защищают.
	Info_ClearChoices(info_thorus_mordragko_offer);
	Info_AddChoice(info_thorus_mordragko_offer,"Я займусь им.",info_thorus_mordragko_offer_back);
	Info_AddChoice(info_thorus_mordragko_offer,"Хочешь, чтобы я убил его?",info_thorus_mordragko_killhim);
	Info_AddChoice(info_thorus_mordragko_offer,"Где я могу найти Мордрага?",info_thorus_mordragko_where);
	Info_AddChoice(info_thorus_mordragko_offer,"А почему маги защищают Мордрага?",info_thorus_mordragko_magesprotect);
	Info_AddChoice(info_thorus_mordragko_offer,"Кажется, что маги тоже доставляют тебе хлопот...",info_thorus_mordragko_mageproblem);
	THORUS_MORDRAGKO = LOG_RUNNING;
	Log_CreateTopic(CH1_MORDRAGKO,LOG_MISSION);
	b_logentry(CH1_MORDRAGKO,"Торус хочет, чтобы я выгнал из лагеря вора Мордрага. Ему неважно, как я смогу это сделать. Никто не должен знать, что Торус поручил мне это дело.");
	Log_SetTopicStatus(CH1_MORDRAGKO,LOG_RUNNING);
	mordrag = Hlp_GetNpc(org_826_mordrag);
};

func void info_thorus_mordragko_offer_back()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_OFFER_BACK_15_00");	//Я займусь им.
	Info_ClearChoices(info_thorus_mordragko_offer);
};

func void info_thorus_mordragko_killhim()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_KillHim_15_00");	//Хочешь, чтобы я убил его?
	AI_Output(self,other,"Info_Thorus_MordragKo_KillHim_09_01");	//Мне все равно. Главное сделай так, чтобы я его больше не видел.
};

func void info_thorus_mordragko_where()
{
	var int log;
	AI_Output(other,self,"Info_Thorus_MordragKo_Where_15_00");	//Где я могу найти Мордрага?
	AI_Output(self,other,"Info_Thorus_MordragKo_Where_09_01");	//На другой стороне замка, возле южных ворот. Не осмеливается совсем заходить в лагерь.
	if(log == FALSE)
	{
		b_logentry(CH1_MORDRAGKO,"Мордрага я смогу найти у южных ворот, с противоположной стороны замка.");
		log = TRUE;
	};
};

func void info_thorus_mordragko_magesprotect()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_MagesProtect_15_00");	//А почему маги защищают Мордрага?
	AI_Output(self,other,"Info_Thorus_MordragKo_MagesProtect_09_01");	//Наши маги общаются с магами из Нового лагеря, и он их посыльный.
	AI_Output(self,other,"Info_Thorus_MordragKo_MagesProtect_09_02");	//Думаю, если я убью или вышвырну из лагеря одного из их гонцов, они рады не будут.
	AI_Output(other,self,"Info_Thorus_MordragKo_MagesProtect_15_03");	//А как же я? Что маги могут сделать со мной?
	AI_Output(self,other,"Info_Thorus_MordragKo_MagesProtect_09_04");	//Ты новенький, и тебя они не тронут. А вот я отвечаю головой за действия своих парней, а потому важно, чтобы ты держал свой рот на замке.
	THORUS_MORDRAGMAGEMESSENGER = TRUE;
};

func void info_thorus_mordragko_mageproblem()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_MageProblem_15_00");	//Кажется, что маги тоже доставляют тебе хлопот...
	AI_Output(self,other,"Info_Thorus_MordragKo_MageProblem_09_01");	//Да, и с ними не так просто сладить. Пару лет назад один из Призраков попытался убить Верховного Мага Круга Огня, пока тот спал.
	AI_Output(self,other,"Info_Thorus_MordragKo_MageProblem_09_02");	//Потом его нашли во Внешнем Кольце... вернее, его останки, разбросанные по всему Кольцу...
};


instance INFO_THORUS_MORDRAGKO_ANALYZE(C_INFO)
{
	npc = grd_200_thorus;
	nr = 1;
	condition = info_thorus_mordragko_analyze_condition;
	information = info_thorus_mordragko_analyze_info;
	permanent = 1;
	description = "Я по поводу Мордрага...";
};


func int info_thorus_mordragko_analyze_condition()
{
	if((THORUS_MORDRAGKO == LOG_RUNNING) && (MORDRAGKO_PLAYERCHOSETHORUS != TRUE))
	{
		return 1;
	};
};

func void info_thorus_mordragko_analyze_info()
{
	var C_NPC mordrag;
	Info_ClearChoices(info_thorus_mordragko_analyze);
	Info_AddChoice(info_thorus_mordragko_analyze,"Я позабочусь об этом.",info_thorus_mordragko_analyze_back);
	Info_AddChoice(info_thorus_mordragko_analyze,"Где я могу найти Мордрага?",info_thorus_mordragko_where);
	if(THORUS_MORDRAGMAGEMESSENGER == FALSE)
	{
		Info_AddChoice(info_thorus_mordragko_analyze,"А почему маги защищают Мордрага?",info_thorus_mordragko_magesprotect);
	};
	mordrag = Hlp_GetNpc(org_826_mordrag);
	if(Npc_IsDead(mordrag))
	{
		Info_AddChoice(info_thorus_mordragko_analyze,"Считай, что Мордраг совершил свою последнюю кражу!",info_thorus_mordragko_mordragdead);
	}
	else if((MORDRAGKO_HAUAB == TRUE) || (MORDRAGKO_STAYATNC == TRUE))
	{
		Info_AddChoice(info_thorus_mordragko_analyze,"Больше он не сунет сюда свой нос!",info_thorus_mordragko_mordraggone);
	};
};

func void info_thorus_mordragko_analyze_back()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_ANALYZE_BACK_15_00");	//Я позабочусь об этом.
	Info_ClearChoices(info_thorus_mordragko_analyze);
};

func void info_thorus_mordragko_mordragdead()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_MordragDead_15_00");	//Считай, что Мордраг совершил свою последнюю кражу!
	AI_Output(self,other,"Info_Thorus_MordragKo_MordragDead_09_01");	//Хочешь сказать, ты победил его? Неплохо, малыш!
	THORUS_MORDRAGKO = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MORDRAGKO,LOG_SUCCESS);
	b_logentry(CH1_MORDRAGKO,"Торус остался доволен тем, что Мордрага больше нет в Старом лагере.");
	b_givexp(XP_THORUSMORDRAGDEAD);
	Info_ClearChoices(info_thorus_mordragko_analyze);
};

func void info_thorus_mordragko_mordraggone()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_MordragGone_15_00");	//Больше он не сунет сюда свой нос!
	AI_Output(self,other,"Info_Thorus_MordragKo_MordragGone_09_01");	//Было бы лучше, если бы ты убил его.
	THORUS_MORDRAGKO = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MORDRAGKO,LOG_SUCCESS);
	b_logentry(CH1_MORDRAGKO,"Торус остался доволен тем, что Мордрага больше нет в Старом лагере.");
	b_givexp(XP_THORUSMORDRAGKO);
	Info_ClearChoices(info_thorus_mordragko_analyze);
};


instance INFO_THORUS_MORDRAGFAILED(C_INFO)
{
	npc = grd_200_thorus;
	nr = 1;
	condition = info_thorus_mordragfailed_condition;
	information = info_thorus_mordragfailed_info;
	permanent = 0;
	important = 1;
};


func int info_thorus_mordragfailed_condition()
{
	if(MORDRAGKO_PLAYERCHOSETHORUS == TRUE)
	{
		return 1;
	};
};

func void info_thorus_mordragfailed_info()
{
	AI_Output(self,other,"Info_Thorus_MordragFailed_09_00");	//Ты все испортил! Я же предупреждал тебя: не называть моего имени!
	AI_Output(self,other,"Info_Thorus_MordragFailed_09_01");	//Ты провалил все! Забудь все, что я тебе говорил и больше не смей лезть в это дело!
	THORUS_MORDRAGKO = LOG_FAILED;
	Log_SetTopicStatus(CH1_MORDRAGKO,LOG_FAILED);
	b_logentry(CH1_MORDRAGKO,"Я сказал Мордрагу, кто захотел выгнать его. Торусу это совсем не понравилось. Теперь мне лучше не попадаться у него на пути.");
	AI_StopProcessInfos(self);
};


instance INFO_THORUS_BRIBEGUARD(C_INFO)
{
	npc = grd_200_thorus;
	nr = 1;
	condition = info_thorus_bribeguard_condition;
	information = info_thorus_bribeguard_info;
	permanent = 0;
	description = "Ты сможешь впустить в замок, если я поделюсь своим запасом руды?";
};


func int info_thorus_bribeguard_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_entercastle) && (Npc_GetTrueGuild(other) != GIL_STT) && (Npc_GetTrueGuild(other) != GIL_GRD) && (THORUS_PASSGATE == FALSE))
	{
		return 1;
	};
};

func void info_thorus_bribeguard_info()
{
	AI_Output(other,self,"Info_Thorus_BribeGuard_15_00");	//А ты сможешь впустить меня в замок, если я поделюсь с тобой своим запасом руды?
	AI_Output(self,other,"Info_Thorus_BribeGuard_09_01");	//Своим запасом...
	AI_Output(other,self,"Info_Thorus_BribeGuard_15_02");	//Сколько?
	AI_Output(self,other,"Info_Thorus_BribeGuard_09_02");	//Ну... Пересчет этой руды должен занять много времени. Мы с парнями должны считать достаточно долго, чтобы ты успел проскочить.
	AI_Output(other,self,"Info_Thorus_BribeGuard_15_03");	//Ну, скажи сколько именно?
	AI_Output(self,other,"Info_Thorus_BribeGuard_09_03");	//Думаю, тысячи кусков будет в самый раз.
	AI_Output(other,self,"Info_Thorus_BribeGuard_15_04");	//Тысяча кусков?!
	AI_Output(self,other,"Info_Thorus_BribeGuard_09_04");	//Ну, можешь пройти бесплатно, когда будешь одним из людей Гомеза.
};


instance INFO_THORUS_GIVE1000ORE(C_INFO)
{
	npc = grd_200_thorus;
	nr = 1;
	condition = info_thorus_give1000ore_condition;
	information = info_thorus_give1000ore_info;
	permanent = 1;
	description = "У меня есть тысяча кусков руды. Пропусти меня!";
};


func int info_thorus_give1000ore_condition()
{
	var C_NPC wache212;
	wache212 = Hlp_GetNpc(grd_212_torwache);
	if(Npc_KnowsInfo(hero,info_thorus_bribeguard) && (wache212.aivar[AIV_PASSGATE] != TRUE) && (THORUS_PASSGATE == FALSE))
	{
		return 1;
	};
};

func void info_thorus_give1000ore_info()
{
	var C_NPC wache212;
	var C_NPC wache213;
	AI_Output(other,self,"Info_Thorus_Give1000Ore_15_00");	//У меня есть тысяча кусков руды. Пропусти меня!
	if(Npc_HasItems(other,itminugget) >= 1000)
	{
		b_printtrademsg1("Отдано руды: 1000");
		b_giveinvitems(other,self,itminugget,1000);
		AI_Output(self,other,"Info_Thorus_Give1000Ore_09_01");	//Ладно, проходи. Но не натвори там глупостей, понял?
		wache212 = Hlp_GetNpc(grd_212_torwache);
		wache213 = Hlp_GetNpc(grd_213_torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		THORUS_PASSGATE = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"Info_Thorus_Give1000Ore_09_02");	//Не пытайся надуть меня, малыш! У тебя нет тысячи кусков!
		AI_StopProcessInfos(self);
	};
};


instance INFO_THORUS_LETTERFORMAGES(C_INFO)
{
	npc = grd_200_thorus;
	nr = 1;
	condition = info_thorus_letterformages_condition;
	information = info_thorus_letterformages_info;
	permanent = 0;
	description = "Мне нужно попасть в замок. У меня есть письмо...";
};


func int info_thorus_letterformages_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_entercastle) && (Npc_HasItems(hero,itwr_fire_letter_01) || Npc_HasItems(hero,itwr_fire_letter_02)) && (THORUS_PASSGATE == FALSE))
	{
		return 1;
	};
};

func void info_thorus_letterformages_info()
{
	AI_Output(other,self,"Info_Thorus_LetterForMages_15_00");	//Мне нужно попасть в замок. У меня есть письмо для Верховного Мага Круга Огня.
	AI_Output(self,other,"Info_Thorus_LetterForMages_09_03");	//Хорошо, покажи мне это письмо.
	Info_ClearChoices(info_thorus_letterformages);
	Info_AddChoice(info_thorus_letterformages,"Вот оно.",info_thorus_letter_yes);
	Info_AddChoice(info_thorus_letterformages,"Думаешь, я позволю тебе прикарманить его? Забудь про него!",info_thorus_letter_no);
};

func void info_thorus_letter_yes()
{
	AI_Output(other,self,"DIA_Torrez_BriefTausch_15_04");	//Вот оно.
	AI_Output(self,other,"Info_Thorus_LetterForMages_09_01");	//И ты надеешься, что я просто пропущу тебя в замок, чтобы ты мог получить свою награду?
	AI_Output(other,self,"Info_Thorus_LetterForMages_15_02");	//Да.
	AI_Output(self,other,"SVM_9_GetOutOfHere");	//Пошел вон!
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
	AI_StopProcessInfos(self);
};

func void info_thorus_letter_no()
{
	AI_Output(other,self,"Info_Thorus_LetterForMages_15_04");	//Думаешь, я позволю тебе прикарманить его? Забудь про него!
	AI_Output(self,other,"Info_Thorus_LetterForMages_09_05");	//Хорошо, уже забыл.
	AI_Output(self,other,"Info_Thorus_KdWSiegel_09_02");	//Мне ничего от магов не надо, так что перестань надоедать мне, хорошо?
	Info_ClearChoices(info_thorus_letterformages);
};

instance INFO_THORUS_READYFORGOMEZ(C_INFO)
{
	npc = grd_200_thorus;
	nr = 1;
	condition = info_thorus_readyforgomez_condition;
	information = info_thorus_readyforgomez_info;
	permanent = 0;
	description = "Диего сказал, что мне можно увидеть Гомеза!";
};


func int info_thorus_readyforgomez_condition()
{
	if(DIEGO_GOMEZAUDIENCE == TRUE)
	{
		return 1;
	};
};

func void info_thorus_readyforgomez_info()
{
	var C_NPC wache212;
	var C_NPC wache213;
	var C_NPC wache218;
	AI_Output(other,self,"Info_Thorus_ReadyForGomez_15_00");	//Диего сказал, что мне можно увидеть Гомеза!
	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_01");	//Мне решать, что тебе можно!
	AI_Output(other,self,"Info_Thorus_ReadyForGomez_15_02");	//И что ты решил?
	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_03");	//Хм...
	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_04");	//Должен согласиться, до сих пор ты делал все как надо.
	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_05");	//Хорошо! Можешь встретиться с Гомезом. Ему одному решать - будешь ли ты один из нас или нет.
	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_06");	//Теперь все зависит только от тебя самого.
	wache212 = Hlp_GetNpc(grd_212_torwache);
	wache213 = Hlp_GetNpc(grd_213_torwache);
	wache218 = Hlp_GetNpc(grd_218_gardist);
	wache212.aivar[AIV_PASSGATE] = TRUE;
	wache213.aivar[AIV_PASSGATE] = TRUE;
	wache218.aivar[AIV_PASSGATE] = TRUE;
	THORUS_PASSGATE = TRUE;
	THORUS_KRAUTBOTE_PASS = TRUE;
	AI_StopProcessInfos(self);
};


instance INFO_THORUS_KRAUTBOTE(C_INFO)
{
	npc = grd_200_thorus;
	nr = 4;
	condition = info_thorus_krautbote_condition;
	information = info_thorus_krautbote_info;
	permanent = 1;
	description = "Кор Галом передал Гомезу болотник.";
};


func int info_thorus_krautbote_condition()
{
	if((KALOM_KRAUTBOTE == LOG_RUNNING) && (THORUS_KRAUTBOTE_PASS == FALSE))
	{
		return 1;
	};
};

func void info_thorus_krautbote_info()
{
	var C_NPC wache212;
	var C_NPC wache213;
	var C_NPC wache218;
	AI_Output(other,self,"Info_Thorus_Krautbote_15_00");	//Кор Галом передал Гомезу болотник.
	AI_Output(self,other,"Info_Thorus_Krautbote_09_01");	//Покажи!
	if(Npc_HasItems(other,itmijoint_3) >= 30)
	{
		AI_Output(other,self,"ORG_801_Lares_BringList_15_03");	//Вот он...
		AI_Output(self,other,"Info_Thorus_Krautbote_09_02");	//Хм...
		AI_Output(self,other,"Info_Thorus_Krautbote_09_03");	//Хорошо! Проходи. Отправляйся к дому Баронов. Бартоло встретит тебя там.
		wache212 = Hlp_GetNpc(grd_212_torwache);
		wache213 = Hlp_GetNpc(grd_213_torwache);
		wache218 = Hlp_GetNpc(grd_218_gardist);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		wache218.aivar[AIV_PASSGATE] = TRUE;
		THORUS_KRAUTBOTE_PASS = TRUE;
		THORUS_PASSGATE = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_01");	//Ну...
		AI_Output(self,other,"Info_Thorus_Krautbote_09_04");	//У тебя слишком мало болотника! Надеюсь, ты не продал его на сторону. Будет нормальный запас, тогда и приходи.
		AI_StopProcessInfos(self);
	};
};


var int thorus_amulettgezeigt;

instance INFO_THORUS_KDWSIEGEL(C_INFO)
{
	npc = grd_200_thorus;
	nr = 4;
	condition = info_thorus_kdwsiegel_condition;
	information = info_thorus_kdwsiegel_info;
	permanent = 1;
	description = "Меня прислали маги Воды. Мне нужно попасть в замок.";
};


func int info_thorus_kdwsiegel_condition()
{
	if((Npc_HasItems(other,kdw_amulett) >= 1) && (THORUS_AMULETTGEZEIGT == FALSE) && (THORUS_PASSGATE == FALSE))
	{
		return 1;
	};
};

func void info_thorus_kdwsiegel_info()
{
	var C_NPC wache212;
	var C_NPC wache213;
	AI_Output(other,self,"Info_Thorus_KdWSiegel_15_00");	//Меня прислали маги Воды. Мне нужно попасть в замок.
	AI_Output(self,other,"Info_Thorus_KdWSiegel_09_03");	//Конечно, конечно! А амулет у тебя для этого есть, а?
	AI_Output(self,other,"Info_Thorus_KdWSiegel_09_01");	//Ты можешь пройти мимо стражи, только если у тебя есть амулет.
	AI_Output(other,self,"ORG_801_Lares_BringList_15_03");	//Вот он...
	AI_Output(self,other,"Info_Thorus_Give1000Ore_09_01");	//Ладно, проходи. Но не натвори там глупостей, понял?
	wache212 = Hlp_GetNpc(grd_212_torwache);
	wache213 = Hlp_GetNpc(grd_213_torwache);
	wache212.aivar[AIV_PASSGATE] = TRUE;
	wache213.aivar[AIV_PASSGATE] = TRUE;
	THORUS_AMULETTGEZEIGT = TRUE;
	THORUS_PASSGATE = TRUE;
	AI_StopProcessInfos(self);
};


instance INFO_THORUS_STTGESCHAFFT(C_INFO)
{
	npc = grd_200_thorus;
	nr = 1;
	condition = info_thorus_sttgeschafft_condition;
	information = info_thorus_sttgeschafft_info;
	permanent = 0;
	description = "У меня все получилось. Наконец-то меня приняли в этот лагерь!";
};


func int info_thorus_sttgeschafft_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_STT)
	{
		return 1;
	};
};

func void info_thorus_sttgeschafft_info()
{
	AI_Output(other,self,"Info_Thorus_SttGeschafft_15_00");	//У меня все получилось. Наконец-то меня приняли в этот лагерь!
	AI_Output(self,other,"Info_Thorus_SttGeschafft_09_01");	//Мои поздравления, малыш! Совет на будущее - держись поближе к Диего.
	AI_Output(self,other,"Info_Thorus_SttGeschafft_09_02");	//Ты можешь обращаться к Гомезу и Равену только по очень важным делам.
};


instance INFO_THORUS_PERM2(C_INFO)
{
	npc = grd_200_thorus;
	nr = 1;
	condition = info_thorus_perm2_condition;
	information = info_thorus_perm2_info;
	permanent = 0;
	description = "Как дела?";
};


func int info_thorus_perm2_condition()
{
	if((Npc_GetTrueGuild(other) == GIL_STT) && (KAPITEL < 4))
	{
		return 1;
	};
};

func void info_thorus_perm2_info()
{
	AI_Output(other,self,"Info_Thorus_PERM2_15_00");	//Как дела?
	AI_Output(self,other,"Info_Thorus_PERM2_09_01");	//Неплохо. Новый лагерь нам не сильно мешает. А вот болотные придурки немного достают.
};


instance GRD_200_THORUS_GARDIST(C_INFO)
{
	npc = grd_200_thorus;
	condition = grd_200_thorus_gardist_condition;
	information = grd_200_thorus_gardist_info;
	important = 0;
	permanent = 0;
	description = "Ты хотел мне что-то сказать?";
};


func int grd_200_thorus_gardist_condition()
{
	if(((CORKALOM_BRINGMCQBALLS == LOG_SUCCESS) || Npc_KnowsInfo(hero,grd_214_torwache_seethorus) || Npc_KnowsInfo(hero,grd_216_torwache_seethorus)) && (Npc_GetTrueGuild(hero) == GIL_STT) && !Npc_KnowsInfo(hero,grd_200_thorus_wannabemage))
	{
		return TRUE;
	};
};

func void grd_200_thorus_gardist_info()
{
	var C_NPC kdfwache;
	kdfwache = Hlp_GetNpc(grd_245_gardist);
	kdfwache.aivar[AIV_PASSGATE] = TRUE;
	AI_Output(other,self,"GRD_200_Thorus_GARDIST_Info_15_01");	//Ты хотел мне что-то сказать?
	AI_Output(self,other,"GRD_200_Thorus_GARDIST_Info_09_02");	//Да. То, что ты сделал в шахте, еще раз доказывает твою смелость, а также твою силу и умение драться.
	AI_Output(self,other,"GRD_200_Thorus_GARDIST_Info_09_03");	//Я готов принять тебя в стражники.
	if(hero.level < 10)
	{
		AI_Output(self,other,"GRD_200_Thorus_GARDIST_Info_09_04");	//Но у тебя еще маловато для этого опыта. Подучись еще немного и приходи.
		AI_StopProcessInfos(self);
		b_printguildcondition(10);
	}
	else if(hero.level >= 10)
	{
		AI_Output(self,other,"GRD_200_Thorus_GARDIST_Info_09_05");	//Это твой шанс. Что скажешь?
	};
};


instance GRD_200_THORUS_AUFNAHME(C_INFO)
{
	npc = grd_200_thorus;
	condition = grd_200_thorus_aufnahme_condition;
	information = grd_200_thorus_aufnahme_info;
	permanent = 0;
	description = "Я хочу стать стражником.";
};


func int grd_200_thorus_aufnahme_condition()
{
	if(Npc_KnowsInfo(hero,grd_200_thorus_gardist) && (hero.level >= 10) && (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		return TRUE;
	};
};

func void grd_200_thorus_aufnahme_info()
{
	var C_NPC kdfwache;
	AI_Output(other,self,"GRD_200_Thorus_AUFNAHME_Info_15_01");	//Я хочу стать стражником.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_02");	//Приятно слышать это. Но сначала послушай, что должен знать любой новичок. Слушай внимательно, второй раз повторять не буду.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_03");	//Раньше ты был сам по себе, теперь пришло время забыть об этом. Мои люди горой стоят за своего товарища. Мы, стражники, охраняем жизнь Баронов, руду, шахту и лагерь.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_04");	//Рудокопы добывают руду, а наша задача следить, чтобы их не сожрали ползуны. И хотя с королем переговоры ведут Бароны, многое тоже зависит от нас.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_05");	//Днем и ночью мы находимся в шахте. Днем и ночью мы стоим на страже у ворот лагеря и следим за тем, чтобы его обитатели могли спать спокойно.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_06");	//Раньше мы были неорганизованной шайкой бандитов, но сейчас мы - сила, и с нами нужно считаться. Ради этого нам приходится много работать.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_07");	//От своих парней мне нужно одно - сплоченности. Только вместе мы сможем справиться с любыми проблемами.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_08");	//И остаться в живых.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_09");	//Потихоньку ты всему научишься. Будь готов, что кому-то может понадобиться твоя помощь и тебе надо будет сделать все, что для этого потребуется.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_10");	//Иди к Стоуну. Он даст тебе доспехи и меч.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_11");	//Ты найдешь его в оружейной лавке во Внутреннем Кольце.
	kdfwache = Hlp_GetNpc(grd_245_gardist);
	kdfwache.aivar[AIV_PASSGATE] = FALSE;
	Npc_SetTrueGuild(hero,GIL_GRD);
	hero.guild = GIL_GRD;
};


instance GRD_200_THORUS_NOCHWAS(C_INFO)
{
	npc = grd_200_thorus;
	condition = grd_200_thorus_nochwas_condition;
	information = grd_200_thorus_nochwas_info;
	important = 1;
	permanent = 0;
};


func int grd_200_thorus_nochwas_condition()
{
	if(Npc_KnowsInfo(hero,grd_200_thorus_aufnahme) && (Npc_GetTrueGuild(hero) == GIL_GRD))
	{
		return TRUE;
	};
};

func void grd_200_thorus_nochwas_info()
{
	AI_Output(self,other,"GRD_200_Thorus_NOCHWAS_Info_09_01");	//Да, и вот еще что...
	AI_Output(self,other,"GRD_200_Thorus_NOCHWAS_Info_09_02");	//Добро пожаловать в стражники!
	AI_StopProcessInfos(self);
	Log_CreateTopic(GE_BECOMEGUARD,LOG_NOTE);
	b_logentry(GE_BECOMEGUARD,"Сегодня Торус зачислил меня в ряды стражников. Я могу взять себе новый доспех у кузнеца Стоуна в замке.");
};


instance GRD_200_THORUS_WANNABEMAGE(C_INFO)
{
	npc = grd_200_thorus;
	condition = grd_200_thorus_wannabemage_condition;
	information = grd_200_thorus_wannabemage_info;
	permanent = 0;
	description = "Но мне по душе путь магии.";
};


func int grd_200_thorus_wannabemage_condition()
{
	if(Npc_KnowsInfo(hero,grd_200_thorus_gardist) && !Npc_KnowsInfo(hero,grd_200_thorus_aufnahme) && (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		return TRUE;
	};
};

func void grd_200_thorus_wannabemage_info()
{
	var C_NPC corristo;
	AI_Output(other,self,"GRD_200_Thorus_WANNABEMAGE_Info_15_01");	//Но мне по душе путь магии.
	AI_Output(self,other,"GRD_200_Thorus_WANNABEMAGE_Info_09_02");	//Тогда тебе дорога к Корристо. Он учил Мильтена. Вижу, ты настроен серьезно.
	corristo = Hlp_GetNpc(kdf_402_corristo);
	Npc_ExchangeRoutine(corristo,"WAITFORSC");
	AI_ContinueRoutine(corristo);
};


instance GRD_200_THORUS_TEACH(C_INFO)
{
	npc = grd_200_thorus;
	nr = 10;
	condition = grd_200_thorus_teach_condition;
	information = grd_200_thorus_teach_info;
	permanent = 1;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int grd_200_thorus_teach_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void grd_200_thorus_teach_info()
{
	AI_Output(other,self,"GRD_200_Thorus_Teach_15_00");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"GRD_200_Thorus_Teach_09_01");	//Я могу помочь тебе улучшить свои умения и стать сильнее.
	if(LOG_THORUSTRAIN == FALSE)
	{
		Log_CreateTopic(GE_TEACHEROC,LOG_NOTE);
		b_logentry(GE_TEACHEROC,"Торус может помочь мне увеличить силу и ловкость.");
		LOG_THORUSTRAIN = TRUE;
	};
	b_thoruslearn();
};

func void grd_200_thorus_teach_back()
{
	Info_ClearChoices(grd_200_thorus_teach);
};

func void grd_200_thorus_teach_str_1()
{
	if(hero.guild == GIL_STT || hero.guild == GIL_GRD || hero.guild == GIL_KDF)
	{
		b_buyattributepoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	}
	else if(Npc_HasItems(hero,itminugget) >= OTHERCAMPLEARNPAY)
	{
		if(hero.lp >= 1 && hero.attribute[ATR_STRENGTH] < 100)
		{
			b_printtrademsg1("Отдано руды: 10");
			b_giveinvitems(other,self,itminugget,OTHERCAMPLEARNPAY);
		};
		b_buyattributepoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"DIA_Wolf_SellArmor_M_09_02");	//Без руды ты ничего не сможешь купить.
	};
	b_thoruslearn();
};

func void grd_200_thorus_teach_str_5()
{
	if(hero.guild == GIL_STT || hero.guild == GIL_GRD || hero.guild == GIL_KDF)
	{
		b_buyattributepoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	}
	else if(Npc_HasItems(hero,itminugget) >= OTHERCAMPLEARNPAY * 5)
	{
		if(hero.lp >= 5 && hero.attribute[ATR_STRENGTH] < 96)
		{
			b_printtrademsg1("Отдано руды: 50");
			b_giveinvitems(other,self,itminugget,OTHERCAMPLEARNPAY * 5);
		};
		b_buyattributepoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"DIA_Wolf_SellArmor_M_09_02");	//Без руды ты ничего не сможешь купить.
	};
	b_thoruslearn();
};

func void grd_200_thorus_teach_dex_1()
{
	if(hero.guild == GIL_STT || hero.guild == GIL_GRD || hero.guild == GIL_KDF)
	{
		b_buyattributepoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else if(Npc_HasItems(hero,itminugget) >= OTHERCAMPLEARNPAY)
	{
		if(hero.lp >= 1 && hero.attribute[ATR_DEXTERITY] < 100)
		{
			b_printtrademsg1("Отдано руды: 10");
			b_giveinvitems(other,self,itminugget,OTHERCAMPLEARNPAY);
		};
		b_buyattributepoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"DIA_Wolf_SellArmor_M_09_02");	//Без руды ты ничего не сможешь купить.
	};
	b_thoruslearn();
};

func void grd_200_thorus_teach_dex_5()
{
	if(hero.guild == GIL_STT || hero.guild == GIL_GRD || hero.guild == GIL_KDF)
	{
		b_buyattributepoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else if(Npc_HasItems(hero,itminugget) >= OTHERCAMPLEARNPAY * 5)
	{
		if(hero.lp >= 5 && hero.attribute[ATR_DEXTERITY] < 96)
		{
			b_printtrademsg1("Отдано руды: 50");
			b_giveinvitems(other,self,itminugget,OTHERCAMPLEARNPAY * 5);
		};
		b_buyattributepoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"DIA_Wolf_SellArmor_M_09_02");	//Без руды ты ничего не сможешь купить.
	};
	b_thoruslearn();
};


instance GRD_200_THORUS_ZWEIHAND1(C_INFO)
{
	npc = grd_200_thorus;
	condition = grd_200_thorus_zweihand1_condition;
	information = grd_200_thorus_zweihand1_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARN2H_1,LPCOST_TALENT_2H_1,0);
};


func int grd_200_thorus_zweihand1_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_2H) < 1) && (Npc_GetTrueGuild(hero) == GIL_GRD))
	{
		return TRUE;
	};
};

func void grd_200_thorus_zweihand1_info()
{
	if(LOG_THORUSFIGHT == FALSE)
	{
		Log_CreateTopic(GE_TEACHEROC,LOG_NOTE);
		b_logentry(GE_TEACHEROC,"Торус может научить меня вести бой двуручным мечом, если я смогу обращаться с одноручным оружием.");
		LOG_THORUSFIGHT = TRUE;
	};
	AI_Output(other,self,"GRD_200_Thorus_ZWEIHAND1_Info_15_01");	//Научи меня владеть двуручным мечом.
	if(Npc_GetTalentSkill(hero,NPC_TALENT_1H) < 2)
	{
		AI_Output(self,other,"SVM_9_NoLearnNoPoints");	//Ты недостаточно опытен, чтобы я смог тебя учить.
		PrintScreen("Требуется мастерство одноручного оружия!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else if(b_giveskill(other,NPC_TALENT_2H,1,LPCOST_TALENT_2H_1))
	{
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_02");	//Хорошо, тогда давай начнем с легкого.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_03");	//Меч нужно держать горизонтально. Тебе придется хорошо замахнуться, чтобы атаковать противника тяжелым оружием.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_04");	//Подними руку и бей вертикально вниз. Обычно этого достаточно, чтобы избавиться от врага.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_05");	//Используй инерцию движения, чтобы вернуться в исходную позицию.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_06");	//Двуручный меч - это идеальное оружие для боковых ударов, когда тебе надо держать врага на расстоянии.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_07");	//В общем, можешь начать тренироваться.
		grd_200_thorus_zweihand1.permanent = 0;
	};
};


instance GRD_200_THORUS_ZWEIHAND2(C_INFO)
{
	npc = grd_200_thorus;
	condition = grd_200_thorus_zweihand2_condition;
	information = grd_200_thorus_zweihand2_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARN2H_2,LPCOST_TALENT_2H_2,0);
};


func int grd_200_thorus_zweihand2_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_2H) == 1) && (Npc_GetTrueGuild(hero) == GIL_GRD))
	{
		return TRUE;
	};
};

func void grd_200_thorus_zweihand2_info()
{
	AI_Output(other,self,"GRD_200_Thorus_ZWEIHAND2_Info_15_01");	//Я хочу научиться лучше владеть двуручным мечом.
	if(b_giveskill(other,NPC_TALENT_2H,2,LPCOST_TALENT_2H_2))
	{
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_02");	//Для начала тебе надо правильно встать. Держи меч вертикально, возьмись за рукоятку обеими руками и отведи его в сторону.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_03");	//Теперь руби вниз, вкладывай силу от самого плеча. И затем - резкий удар вправо!
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_04");	//У противника не будет ни единого шанса к тебе подобраться.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_05");	//Из этого же положения можно нанести резкий колющий удар вперед, чтобы отогнать врага.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_06");	//Развернись, чтобы придать мечу должный разгон, - и еще один рубящий удар!
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_07");	//Если этого окажется недостаточно, по инерции возвращайся в прежнее положение.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_08");	//Когда закончишь серию, защищайся и жди момента, чтобы атаковать снова.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_09");	//Секрет успеха кроется в чередовании ударов и своевременной защите.
		grd_200_thorus_zweihand2.permanent = 0;
	};
};

