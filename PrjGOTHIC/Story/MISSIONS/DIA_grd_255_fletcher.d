
instance DIA_FLETCHER_EXIT(C_INFO)
{
	npc = grd_255_fletcher;
	nr = 999;
	condition = dia_fletcher_exit_condition;
	information = dia_fletcher_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_fletcher_exit_condition()
{
	return 1;
};

func void dia_fletcher_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_FLETCHER_FIRST(C_INFO)
{
	npc = grd_255_fletcher;
	nr = 1;
	condition = dia_fletcher_first_condition;
	information = dia_fletcher_first_info;
	permanent = 0;
	important = 1;
};


func int dia_fletcher_first_condition()
{
	if(Wld_IsTime(0,0,6,0) && KAPITEL < 4)
	{
		return 1;
	};
};

func void dia_fletcher_first_info()
{
	AI_Output(self,other,"DIA_Fletcher_First_06_00");	//Эй, ты!
	AI_Output(other,self,"DIA_Fletcher_First_15_01");	//Ты меня зовешь?
	AI_Output(self,other,"DIA_Fletcher_First_06_02");	//Сам знаешь кого я зову!
	AI_Output(self,other,"DIA_Fletcher_First_06_03");	//Парень, послушай, что я тебе скажу: это мой район. И мне неприятности не нужны!
	AI_Output(self,other,"DIA_Fletcher_First_06_04");	//Но от новичков типа тебя всегда одни проблемы, особенно когда шныряют тут по ночам.
	AI_Output(self,other,"DIA_Fletcher_First_06_05");	//Думаю, тебе стоит отправиться домой и больше не показываться мне на глаза. Кажется, возле арены есть пустующий дом с навесом. Так что иди лучше спать.
	AI_Output(self,other,"DIA_Fletcher_First_06_06");	//Но если я поймаю тебя в чужом доме, будь уверен я позабочусь, чтобы ты об этом пожалел.
	AI_StopProcessInfos(self);
};


var int fletcher_whytalk;

instance DIA_FLETCHER_HELLO(C_INFO)
{
	npc = grd_255_fletcher;
	nr = 2;
	condition = dia_fletcher_hello_condition;
	information = dia_fletcher_hello_info;
	permanent = 0;
	important = 1;
};


func int dia_fletcher_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && KAPITEL < 4)
	{
		return 1;
	};
};

func void dia_fletcher_hello_info()
{
	AI_Output(other,self,"DIA_Fletcher_Hello_15_00");	//Эй, ты!
	AI_Output(self,other,"DIA_Fletcher_Hello_06_01");	//Если хочешь заплатить за защиту, то сегодня не лучший для этого день.
	AI_Output(other,self,"DIA_Fletcher_Hello_15_02");	//Да? Это почему?
	AI_Output(self,other,"DIA_Fletcher_Hello_06_03");	//Потому что меня здесь нет.
	Info_ClearChoices(dia_fletcher_hello);
	Info_AddChoice(dia_fletcher_hello,"Все понятно.",dia_fletcher_hello_isee);
	Info_AddChoice(dia_fletcher_hello,"Почему же я, по-твоему, с тобой здесь разговариваю?",dia_fletcher_hello_whytalk);
	Info_AddChoice(dia_fletcher_hello,"А где ты есть?",dia_fletcher_hello_whereelse);
};

func void dia_fletcher_hello_whereelse()
{
	AI_Output(other,self,"DIA_Fletcher_Hello_WhereElse_15_00");	//А где ты есть?
	AI_Output(self,other,"DIA_Fletcher_Hello_WhereElse_06_01");	//На самом деле я в замке у большого костра, и в руке у меня кубок с пивом.
};

func void dia_fletcher_hello_whytalk()
{
	AI_Output(other,self,"DIA_Fletcher_Hello_WhyTalk_15_00");	//Почему же я, по-твоему, с тобой здесь разговариваю?
	AI_Output(self,other,"DIA_Fletcher_Hello_WhyTalk_06_01");	//Потому что Нек пропал, а он ответственен за этот район.
	AI_Output(self,other,"DIA_Fletcher_Hello_WhyTalk_06_02");	//Торус приказал мне стоять на страже, пока он не объявится.
	FLETCHER_WHYTALK = TRUE;
	Info_ClearChoices(dia_fletcher_hello);
};

func void dia_fletcher_hello_isee()
{
	AI_Output(other,self,"DIA_Fletcher_Hello_ISee_15_00");	//Все понятно.
	Info_ClearChoices(dia_fletcher_hello);
};


instance DIA_FLETCHER_WONEK(C_INFO)
{
	npc = grd_255_fletcher;
	nr = 1;
	condition = dia_fletcher_wonek_condition;
	information = dia_fletcher_wonek_info;
	permanent = 0;
	description = "Ты знаешь, где сейчас может быть Нек?";
};


func int dia_fletcher_wonek_condition()
{
	if((Npc_KnowsInfo(hero,dia_stt_315_lostnek) || FLETCHER_WHYTALK == TRUE) && SLY_LOSTNEK != LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_fletcher_wonek_info()
{
	AI_Output(other,self,"DIA_Fletcher_WoNek_15_00");	//Ты знаешь, где сейчас может быть Нек?
	AI_Output(self,other,"DIA_Fletcher_WoNek_06_01");	//Нет, да и где узнать можно не знаю.
	AI_Output(self,other,"DIA_Fletcher_WoNek_06_02");	//Так или иначе, местные рудокопы должны что-нибудь знать, да только со стражником они говорить не будут.
	AI_Output(self,other,"DIA_Fletcher_WoNek_06_03");	//Тем более, сейчас. Они знают, как я ненавижу свою работу и уверен, они смеются у меня за спиной!
	if((SLY_LOSTNEK != LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		Log_CreateTopic(CH1_LOSTNEK,LOG_MISSION);
		Log_SetTopicStatus(CH1_LOSTNEK,LOG_RUNNING);
		b_logentry(CH1_LOSTNEK,"Говорят, что рудокопы возле арены могут знать, куда делся Нек.");
	};
};


instance DIA_FLETCHER_TROSCHU(C_INFO)
{
	npc = grd_255_fletcher;
	nr = 1;
	condition = dia_fletcher_troschu_condition;
	information = dia_fletcher_troschu_info;
	permanent = 0;
	description = "Так почему бы тебе просто не забрать у них еще руду за защиту?";
};


func int dia_fletcher_troschu_condition()
{
	if(Npc_KnowsInfo(hero,dia_fletcher_hello))
	{
		return 1;
	};
};

func void dia_fletcher_troschu_info()
{
	AI_Output(other,self,"DIA_Fletcher_TroSchu_15_00");	//Так почему бы тебе просто не забрать у них еще руду за защиту?
	AI_Output(self,other,"DIA_Fletcher_TroSchu_06_01");	//Нек собрал плату перед тем как пропал. Так что сейчас с них нечего брать.
};


var int fletcher_foundnek;

instance DIA_FLETCHER_WEGENNEK(C_INFO)
{
	npc = grd_255_fletcher;
	nr = 1;
	condition = dia_fletcher_wegennek_condition;
	information = dia_fletcher_wegennek_info;
	permanent = 1;
	description = "Я по поводу Нека...";
};


func int dia_fletcher_wegennek_condition()
{
	if((Npc_KnowsInfo(hero,dia_fletcher_wonek) || (SLY_LOSTNEK == LOG_SUCCESS && FLETCHER_WHYTALK == TRUE)) && (FLETCHER_FOUNDNEK == FALSE))
	{
		return 1;
	};
};

func void dia_fletcher_wegennek_info()
{
	var C_NPC nek;
	AI_Output(other,self,"DIA_Fletcher_WegenNek_15_00");	//Я по поводу Нека...
	AI_Output(self,other,"DIA_Fletcher_WegenNek_06_01");	//Да?
	nek = Hlp_GetNpc(grd_282_nek);
	if((SLY_LOSTNEK == LOG_SUCCESS) || !Hlp_IsValidNpc(nek))
	{
		AI_Output(other,self,"DIA_Fletcher_WegenNek_15_02");	//По-моему, я нашел его.
		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_03");	//Что? И где он сейчас?
		AI_Output(other,self,"DIA_Fletcher_WegenNek_15_04");	//Стал кормом для крыс...
		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_05");	//О, нет! Черт! Теперь я точно останусь здесь навсегда. А я так надеялся на его возвращение.
		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_06");	//Теперь я точно вляпался.
		FLETCHER_FOUNDNEK = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Fletcher_WegenNek_15_07");	//Ничего нового.
		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_08");	//Если что узнаешь, сразу говори.
	};
};


instance DIA_FLETCHER_PROBLEM(C_INFO)
{
	npc = grd_255_fletcher;
	nr = 1;
	condition = dia_fletcher_problem_condition;
	information = dia_fletcher_problem_info;
	permanent = 0;
	description = "А в чем проблема?";
};


func int dia_fletcher_problem_condition()
{
	if(FLETCHER_FOUNDNEK == TRUE)
	{
		return 1;
	};
};

func void dia_fletcher_problem_info()
{
	AI_Output(other,self,"DIA_Fletcher_Problem_15_00");	//А в чем проблема?
	AI_Output(self,other,"DIA_Fletcher_Problem_06_01");	//Я серьезно задолжал Скатти. Теперь он узнает, что я вместо Нека, и будет каждый день ко мне приходить...
};


instance GRD_255_FLETCHER_WELCOME(C_INFO)
{
	npc = grd_255_fletcher;
	condition = grd_255_fletcher_welcome_condition;
	information = grd_255_fletcher_welcome_info;
	important = 1;
	permanent = 0;
};


func int grd_255_fletcher_welcome_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD && KAPITEL < 4)
	{
		return TRUE;
	};
};

func void grd_255_fletcher_welcome_info()
{
	AI_Output(self,other,"Grd_255_Fletcher_WELCOME_Info_06_01");	//Ты быстро освоился, молодчина. Добро пожаловать в Стражники!
};


instance INFO_FLETCHER_DIE(C_INFO)
{
	npc = grd_255_fletcher;
	condition = info_fletcher_die_condition;
	information = info_fletcher_die_info;
	permanent = 0;
	important = 1;
};


func int info_fletcher_die_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void info_fletcher_die_info()
{
	AI_GotoNpc(self,hero);
	if((OLDHEROGUILD == GIL_STT) || (OLDHEROGUILD == GIL_GRD) || (OLDHEROGUILD == GIL_KDF))
	{
		if(OLDHEROGUILD == GIL_GRD)
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_01");	//Предатель! Мы поверили тебе, позволили стать стражником!
		}
		else if(OLDHEROGUILD == GIL_KDF)
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_02");	//Это один из предателей, служащий магам Огня!
		}
		else
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_03");	//Привет, предатель! Хоть ты и Призрак Гомеза, тебе это все равно не поможет!
		};
		AI_Output(hero,self,"Info_Fletcher_DIE_15_04");	//Флетчер, о чем ты говоришь?
		AI_Output(self,hero,"Info_Fletcher_DIE_06_05");	//Ты ведь за одно с этим мошенником из Нового лагеря, да?
		AI_Output(hero,self,"Info_Fletcher_DIE_15_06");	//Постой...
		AI_Output(self,hero,"Info_Fletcher_DIE_06_07");	//Что? Думал, никто и не догадается, а?
		AI_Output(hero,self,"Info_Fletcher_DIE_15_08");	//Тебе следовало бы попридержать свой язык!
		AI_Output(self,hero,"Info_Fletcher_DIE_06_09");	//Нет. Это тебе попридержать... попридержать свою голову, потому что скоро ее у тебя не будет.
		AI_Output(self,hero,"Info_Fletcher_DIE_06_10");	//Умри, предатель!
		if(Npc_KnowsInfo(hero,info_cutter_die))
		{
			b_logentry(CH4_BANNEDFROMOC,"Флетчер, который сейчас охраняет ворота, повел себя точно так же, как и Палач. Он что-то знает о том, что я ищу юниторы для Нового лагеря.");
		}
		else if(!Npc_KnowsInfo(hero,info_jackal_payday) && !Npc_KnowsInfo(hero,info_cutter_die) && !Npc_KnowsInfo(hero,info_grd238_die))
		{
			Log_CreateTopic(CH4_BANNEDFROMOC,LOG_MISSION);
			Log_SetTopicStatus(CH4_BANNEDFROMOC,LOG_RUNNING);
			b_logentry(CH4_BANNEDFROMOC,"Флетчер, который теперь вместе с группой стражников охраняет главные ворота, назвал меня предателем и перебежчиком. Без дальнейших разговоров он напал на меня!");
			b_logentry(CH4_BANNEDFROMOC,"Кажется, это значит, что меня прогнали из Старого лагеря!");
		};
	}
	else
	{
		if(c_npcbelongstonewcamp(hero))
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_11");	//Посмотри-ка. Паренек из Нового лагеря!
			AI_Output(hero,self,"Info_Fletcher_DIE_15_13");	//Ну и что? Какое тебе до этого дело?
			AI_Output(self,hero,"Info_Fletcher_DIE_06_14");	//Скоро ваша шахта также будет принадлежать нам.
			AI_Output(hero,self,"Info_Fletcher_DIE_15_15");	//Да, да, мечтать не вредно.
			AI_Output(self,hero,"Info_Fletcher_DIE_06_16");	//Извини, но я не могу позволить тебе об этом всем разбалтывать повсюду.
		}
		else
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_12");	//Посмотри-ка. Паренек из Болотного лагеря!
		};
		AI_Output(hero,self,"Info_Fletcher_DIE_15_17");	//Подожди, я не хотел неприятностей.
		AI_Output(self,hero,"Info_Fletcher_DIE_06_18");	//Надо было думать раньше, когда шел сюда!
		AI_Output(hero,self,"Info_Fletcher_DIE_15_19");	//Эй, что за...
		AI_Output(self,hero,"Info_Fletcher_DIE_06_20");	//Давай, парни, взять его!
	};
	Npc_ExchangeRoutine(self,"FMTaken2");
	b_exchangeroutine(grd_252_gardist,"FMTaken2");
	b_exchangeroutine(grd_253_gardist,"FMTaken2");
	b_exchangeroutine(grd_244_gardist,"FMTaken2");
	b_exchangeroutine(grd_214_torwache,"FMTaken2");
	b_exchangeroutine(grd_215_torwache,"FMTaken2");
	if(c_npcbelongstooldcamp(hero))
	{
		Npc_SetTrueGuild(hero,GIL_NONE);
		hero.guild = GIL_NONE;
	};
	if(GETNEWGUY_STARTED == TRUE && OC_BANNED == FALSE)
	{
		b_logentry(CH1_RECRUITDUSTY,"Теперь я не смогу вывести кого-либо из Старого лагеря.");
		Log_SetTopicStatus(CH1_RECRUITDUSTY,LOG_FAILED);
		GETNEWGUY_STARTED = LOG_FAILED;
	};
	b_setpermattitude(grd_255_fletcher,ATT_HOSTILE);
	b_setpermattitude(grd_252_gardist,ATT_HOSTILE);
	b_setpermattitude(grd_253_gardist,ATT_HOSTILE);
	b_setpermattitude(grd_244_gardist,ATT_HOSTILE);
	b_setpermattitude(grd_214_torwache,ATT_HOSTILE);
	b_setpermattitude(grd_215_torwache,ATT_HOSTILE);
	Wld_ExchangeGuildAttitudes("GIL_ATTITUDES_FMTAKEN");
	if(!Npc_KnowsInfo(hero,info_cutter_die) && !Npc_KnowsInfo(hero,info_grd238_die))
	{
		b_logentry(CH4_FIREMAGES,"Ворота в Старый лагерь закрыты и охраняются стражниками. Они нападают на любого, кто окажется слишком неосторожен, чтобы подойти к ним.");
	};
	AI_StopProcessInfos(self);
	OC_BANNED = TRUE;
	FREELEARN_OC = FALSE;
};

