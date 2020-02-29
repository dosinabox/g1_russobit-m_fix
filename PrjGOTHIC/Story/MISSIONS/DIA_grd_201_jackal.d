
instance INFO_JACKAL_EXIT(C_INFO)
{
	npc = grd_201_jackal;
	nr = 999;
	condition = info_jackal_exit_condition;
	information = info_jackal_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_jackal_exit_condition()
{
	return 1;
};

func void info_jackal_exit_info()
{
	AI_StopProcessInfos(self);
};


var int jackal_protectionpaid;
var int jackal_payday;

instance INFO_JACKAL_HELLO(C_INFO)
{
	npc = grd_201_jackal;
	nr = 3;
	condition = info_jackal_hello_condition;
	information = info_jackal_hello_info;
	permanent = 0;
	important = 1;
};


func int info_jackal_hello_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NONE && KAPITEL < 4)
	{
		return 1;
	};
};

func void info_jackal_hello_info()
{
	AI_Output(self,other,"Info_Jackal_Hello_07_00");	//А! Новые лица!
	AI_Output(other,self,"Info_Jackal_Hello_15_01");	//Что тебе от меня нужно?
	AI_Output(self,other,"Info_Jackal_Hello_07_02");	//Хочу предложить тебе свою помощь. Ты здесь новенький, а такие часто попадают в неприятности... Я смогу избавить тебя от некоторых из них за небольшое вознаграждение.
	AI_Output(self,other,"Info_Jackal_Hello_07_03");	//Всего десять кусков руды. Это же совсем немного!
	Info_ClearChoices(info_jackal_hello);
	Info_AddChoice(info_jackal_hello,"А если я откажусь платить тебе?",info_jackal_hello_whatif);
	Info_AddChoice(info_jackal_hello,"И что будет, после того как я отдам ее тебе?",info_jackal_hello_whatdoiget);
	if(Npc_HasItems(other,itminugget) >= 10)
	{
		Info_AddChoice(info_jackal_hello,"Вот, возьми свои десять кусков. Твоя помощь может мне пригодиться.",info_jackal_hello_pay);
	}
	else
	{
		Info_AddChoice(info_jackal_hello,"Сейчас у меня нет десяти кусков.",info_jackal_hello_noore);
	};
};

func void info_jackal_hello_pay()
{
	AI_Output(other,self,"Info_Jackal_Hello_Pay_15_00");	//Вот, возьми свои десять кусков. Твоя помощь может мне пригодиться.
	b_printtrademsg1("Отдано руды: 10");
	AI_Output(self,other,"Info_Jackal_Hello_Pay_07_01");	//Если я буду неподалеку, ты можешь на меня рассчитывать. Ты всегда сможешь найти меня между рынком и южными воротами.
	AI_Output(self,other,"Info_Jackal_Hello_Pay_07_02");	//За порядком в других районах следят Флетчер и Бладвин.
	b_giveinvitems(other,self,itminugget,10);
	JACKAL_PROTECTIONPAID = TRUE;
	npc_setpermattitude(self,ATT_FRIENDLY);
	JACKAL_PAYDAY = b_setdaytolerance();
	Info_ClearChoices(info_jackal_hello);
};

func void info_jackal_hello_noore()
{
	AI_Output(other,self,"Info_Bloodwyn_Hello_NotNow_15_00");	//Сейчас у меня нет десяти кусков.
	AI_Output(self,other,"SVM_7_YouWannaFoolMe");	//Ты пытаешься меня обдурить, да?
	//AI_Output(self,other,"Info_Jackal_Schutz_07_02");	//Ты еще не заплатил десять кусков. Приходи, когда у тебя будет руда.
};

func void info_jackal_hello_whatdoiget()
{
	AI_Output(other,self,"Info_Jackal_Hello_WhatDoIGet_15_00");	//И что будет, после того как я отдам ее тебе?
	AI_Output(self,other,"Info_Jackal_Hello_WhatDoIGet_07_01");	//Пока ты будешь в моем районе, я буду приглядывать за тобой.
	AI_Output(self,other,"Info_Jackal_Hello_WhatDoIGet_07_02");	//Если на тебя нападет кто-нибудь из Нового лагеря, или ты поссоришься с каким-нибудь ненормальным из лагеря сектантов, я приду к тебе на помощь.
	AI_Output(self,other,"Info_Jackal_Hello_WhatDoIGet_07_03");	//Если ты поругаешься с кем-нибудь из рудокопов, мы поможем тому, кто нам платит за защиту.
	AI_Output(other,self,"Info_Jackal_Hello_WhatDoIGet_15_04");	//А если заплатят оба?
	AI_Output(self,other,"Info_Jackal_Hello_WhatDoIGet_07_05");	//Тогда мы понаблюдаем за дракой. Но такое зрелище здесь редко увидишь.
};

func void info_jackal_hello_whatif()
{
	AI_Output(other,self,"Info_Jackal_Hello_WhatIf_15_00");	//А если я откажусь платить тебе?
	AI_Output(self,other,"Info_Jackal_Hello_WhatIf_07_01");	//Эй, не стоит наживать себе неприятностей! Ты еще незнаком с нашими порядками. Подзаработай немного руды, и когда будешь готов, все равно заплатишь!
	AI_Output(self,other,"Info_Jackal_Hello_WhatIf_07_02");	//Это можно сделать в любое время. Вот только пока ты не заплатишь, не рассчитывай на мою помощь. Это понятно?
	Info_AddChoice(info_jackal_hello,"Мы еще увидимся.",info_jackal_hello_later);
};

func void info_jackal_hello_later()
{
	AI_Output(other,self,"Info_Jackal_Hello_Later_15_00");	//Мы еще увидимся.
	AI_Output(self,other,"Info_Jackal_Hello_Later_07_01");	//Постарайся не ввязываться в неприятности!
	JACKAL_PROTECTIONPAID = FALSE;
	npc_setpermattitude(self,ATT_NEUTRAL);
	JACKAL_PAYDAY = b_setdaytolerance();
	Info_ClearChoices(info_jackal_hello);
};


instance INFO_JACKAL_SCHUTZ(C_INFO)
{
	npc = grd_201_jackal;
	nr = 3;
	condition = info_jackal_schutz_condition;
	information = info_jackal_schutz_info;
	permanent = 1;
	description = "Я обдумал твое предложение. Вот тебе десять кусков.";
};


func int info_jackal_schutz_condition()
{
	if(Npc_KnowsInfo(hero,info_jackal_hello) && (JACKAL_PROTECTIONPAID == FALSE) && Npc_GetTrueGuild(hero) != GIL_GRD && Npc_GetTrueGuild(hero) != GIL_STT && Npc_GetTrueGuild(hero) != GIL_KDF && KAPITEL < 4)
	{
		return 1;
	};
};

func void info_jackal_schutz_info()
{
	AI_Output(other,self,"Info_Jackal_Schutz_15_00");	//Я обдумал твое предложение. Вот тебе десять кусков.
	if(Npc_HasItems(other,itminugget) >= 10)
	{
		b_printtrademsg1("Отдано руды: 10");
		AI_Output(self,other,"Info_Jackal_Schutz_07_01");	//Хорошее решение! Теперь я буду тебя защищать!
		b_giveinvitems(other,self,itminugget,10);
		JACKAL_PROTECTIONPAID = TRUE;
		npc_setpermattitude(self,ATT_FRIENDLY);
		JACKAL_PAYDAY = b_setdaytolerance();
	}
	else
	{
		AI_Output(self,other,"Info_Jackal_Schutz_NoOre_07_00");	//Эй, только попробуй меня обмануть! Приходи, когда у тебя будет руда!
	};
};


instance INFO_JACKAL_PERMPAID(C_INFO)
{
	npc = grd_201_jackal;
	nr = 3;
	condition = info_jackal_permpaid_condition;
	information = info_jackal_permpaid_info;
	permanent = 1;
	description = "Ну, как дела?";
};


func int info_jackal_permpaid_condition()
{
	if(JACKAL_PROTECTIONPAID == TRUE && KAPITEL < 4)
	{
		return 1;
	};
};

func void info_jackal_permpaid_info()
{
	AI_Output(other,self,"Info_Jackal_PermPaid_15_00");	//Ну, как дела?
	AI_Output(self,other,"Info_Jackal_PermPaid_07_01");	//Ты можешь рассчитывать на мою помощь!
};


instance GRD_201_JACKAL_WELCOME(C_INFO)
{
	npc = grd_201_jackal;
	condition = grd_201_jackal_welcome_condition;
	information = grd_201_jackal_welcome_info;
	important = 1;
	permanent = 0;
};


func int grd_201_jackal_welcome_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD && KAPITEL < 4)
	{
		return TRUE;
	};
};

func void grd_201_jackal_welcome_info()
{
	AI_Output(self,other,"GRD_201_Jackal_WELCOME_Info_07_01");	//Ты быстро делаешь успехи в нашем лагере! Так держать!
};


instance INFO_JACKAL_PAYDAY(C_INFO)
{
	npc = grd_201_jackal;
	condition = info_jackal_payday_condition;
	information = info_jackal_payday_info;
	permanent = 0;
	important = 1;
};


func int info_jackal_payday_condition()
{
	if(FMTAKEN)
	{
		return TRUE;
	};
};

func void info_jackal_payday_info()
{
	self.flags = 0;
	if(c_npcbelongstonewcamp(hero))
	{
		if((OLDHEROGUILD == GIL_GRD) || (OLDHEROGUILD == GIL_KDF) || (OLDHEROGUILD == GIL_STT))
		{
			AI_Output(self,other,"Info_Jackal_PAYDAY_07_01");	//Так, кто тут у нас? Предатель, который перешел в другой лагерь!
			AI_Output(self,other,"Info_Jackal_PAYDAY_07_02");	//Если бы ты не связался с этими неудачниками, ты бы все еще смог присоединиться к нам!
		}
		else
		{
			AI_Output(self,other,"Info_Jackal_PAYDAY_07_03");	//Посмотрите-ка на него! Это же тот тип из Нового лагеря, который постоянно действует нам на нервы!
			AI_Output(self,other,"Info_Jackal_PAYDAY_07_04");	//Если бы ты в свое время принял правильное решение, ты бы был один из нас - победителей!
		};
	}
	else if(c_npcbelongstopsicamp(hero))
	{
		AI_Output(self,other,"Info_Jackal_PAYDAY_07_05");	//Так, так, это еще кто? Один из сумасшедших из Болотного лагеря!
		AI_Output(self,other,"Info_Jackal_PAYDAY_07_06");	//Ты так долго с ними общался, что сам стал похож на этих безголовых!
	};
	if(JACKAL_PROTECTIONPAID)
	{
		AI_Output(self,other,"Info_Jackal_PAYDAY_07_07");	//Теперь та руда, которую ты мне заплатил, тебе не поможет.
	}
	else
	{
		AI_Output(self,other,"Info_Jackal_PAYDAY_07_08");	//Тебе стоило отдать мне руду тогда, когда у тебя была такая возможность.
	};
	AI_Output(other,self,"Info_Jackal_PAYDAY_15_09");	//Ты слишком далеко зашел! Зря ты напал на шахту!
	AI_Output(self,other,"Info_Jackal_PAYDAY_07_10");	//Но все получилось как нельзя лучше. И тебе уже ничего не удастся изменить. За это я ручаюсь!
	AI_Output(self,other,"Info_Jackal_PAYDAY_07_11");	//Эй, он не должен уйти от нас живым!
	b_story_jackalfight();
	AI_StopProcessInfos(self);
	OC_BANNED = TRUE;
	Wld_ExchangeGuildAttitudes("GIL_ATTITUDES_FMTAKEN");
	if(GETNEWGUY_STARTED == TRUE && OC_BANNED == FALSE)
	{
		b_logentry(CH1_RECRUITDUSTY,"Теперь я не смогу вывести кого-либо из Старого лагеря.");
		Log_SetTopicStatus(CH1_RECRUITDUSTY,LOG_FAILED);
		GETNEWGUY_STARTED = LOG_FAILED;
	};
	if(c_npcbelongstooldcamp(hero))
	{
		Npc_SetTrueGuild(hero,GIL_NONE);
		hero.guild = GIL_NONE;
		if(!Npc_KnowsInfo(hero,info_cutter_die) && !Npc_KnowsInfo(hero,info_grd238_die) && !Npc_KnowsInfo(hero,info_fletcher_die))
		{
			Log_CreateTopic(CH4_BANNEDFROMOC,LOG_MISSION);
			Log_SetTopicStatus(CH4_BANNEDFROMOC,LOG_RUNNING);
			b_logentry(CH4_BANNEDFROMOC,"Шакал, который охраняет захваченную Свободную шахту с группой стражников, назвал меня предателем и перебежчиком. Без дальнейших разговоров он напал на меня!");
			b_logentry(CH4_BANNEDFROMOC,"Кажется, это значит, что меня прогнали из Старого лагеря!");
		};
	};
	if(GORN_JOINEDFORFM)
	{
		var C_NPC gorn;
		gorn = Hlp_GetNpc(pc_fighter);
		AI_SetWalkMode(gorn,NPC_RUN);
		AI_Wait(gorn,3);
		AI_GotoWP(gorn,"FMC_PATH15");
		b_exchangeroutine(gorn,"WaitFM");
	};
};

