
instance DIA_WHISTLER_EXIT(C_INFO)
{
	npc = stt_309_whistler;
	nr = 999;
	condition = dia_whistler_exit_condition;
	information = dia_whistler_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_whistler_exit_condition()
{
	return 1;
};

func void dia_whistler_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WHISTLER_IAMNEW(C_INFO)
{
	npc = stt_309_whistler;
	nr = 1;
	condition = dia_whistler_iamnew_condition;
	information = dia_whistler_iamnew_info;
	permanent = 0;
	description = "Привет! Я здесь новый!";
};


func int dia_whistler_iamnew_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void dia_whistler_iamnew_info()
{
	AI_Output(other,self,"DIA_Whistler_IAmNew_15_00");	//Привет! Я здесь новый!
	AI_Output(self,other,"DIA_Whistler_IAmNew_11_01");	//Что тебе от меня нужно?
	AI_Output(other,self,"DIA_Whistler_IAmNew_15_02");	//Я хочу стать одним из вас, хочу присоединиться к этому лагерю.
	AI_Output(self,other,"DIA_Whistler_IAmNew_11_03");	//Ищешь того, кто смог бы тебя поддержать?
	AI_Output(self,other,"DIA_Whistler_IAmNew_11_04");	//Если ты хочешь, чтобы я порекомендовал тебя Диего, ты должен будешь оказать мне одну услугу.
};


var int whistler_buymysword;
var int whistler_buymysword_day;

instance DIA_WHISTLER_FAVOUR(C_INFO)
{
	npc = stt_309_whistler;
	nr = 1;
	condition = dia_whistler_favour_condition;
	information = dia_whistler_favour_info;
	permanent = 0;
	description = "Чем я могу тебе помочь?";
};


func int dia_whistler_favour_condition()
{
	if(Npc_KnowsInfo(hero,dia_whistler_iamnew))
	{
		return 1;
	};
};

func void dia_whistler_favour_info()
{
	AI_Output(other,self,"DIA_Whistler_Favour_15_00");	//Чем я могу тебе помочь?
	AI_Output(self,other,"DIA_Whistler_Favour_11_01");	//Мне нужен меч, который продает Фиск. Он торговец на рыночной площади.
	AI_Output(self,other,"DIA_Whistler_Favour_11_02");	//Это отличный палаш, украшенный резьбой и гравировкой. Только он мне его не продает.
	AI_Output(self,other,"DIA_Whistler_Favour_11_03");	//Я тебе дам сто кусков руды, а ты купишь его для меня. Только не говори ему, что ты пришел от меня.
	Info_ClearChoices(dia_whistler_favour);
	Info_AddChoice(dia_whistler_favour,"Хорошо, давай сто кусков. Я достану тебе меч.",dia_whistler_favour_ok);
	Info_AddChoice(dia_whistler_favour,"И ты мне веришь? А может, я возьму эту руду и сбегу?",dia_whistler_favour_oreaway);
	Info_AddChoice(dia_whistler_favour,"Почему же он не хочет продать тебе этот меч?",dia_whistler_favour_whynotsell);
};

func void dia_whistler_favour_ok()
{
	var C_NPC fisk;
	AI_Output(other,self,"DIA_Whistler_Favour_Ok_15_00");	//Хорошо, давай сто кусков. Я достану тебе меч.
	AI_Output(self,other,"DIA_Whistler_Favour_Ok_11_01");	//Вот руда. Как только достанешь меч, приходи ко мне.
	WHISTLER_BUYMYSWORD = LOG_RUNNING;
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic(CH1_JOINOC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JOINOC,LOG_RUNNING);
	};
	b_logentry(CH1_JOINOC,"Уистлер поддержит меня, если я куплю для него меч у Фиска. Для этого он дал мне 100 кусков руды.");
	fisk = Hlp_GetNpc(stt_311_fisk);
	CreateInvItems(self,itminugget,100);
	b_giveinvitems(self,hero,itminugget,100);
	WHISTLER_BUYMYSWORD_DAY = Wld_GetDay();
	Info_ClearChoices(dia_whistler_favour);
};

func void dia_whistler_favour_oreaway()
{
	AI_Output(other,self,"DIA_Whistler_Favour_OreAway_15_00");	//И ты мне веришь? А может, я возьму эту руду и сбегу?
	AI_Output(self,other,"DIA_Whistler_Favour_OreAway_11_01");	//Не забывай: колония маленькая. Не вздумай уйти с моей рудой, все равно найду!
};

func void dia_whistler_favour_whynotsell()
{
	AI_Output(other,self,"DIA_Whistler_Favour_WhyNotSell_15_00");	//Почему же он не хочет продать тебе этот меч?
	AI_Output(self,other,"DIA_Whistler_Favour_WhyNotSell_11_01");	//Ну, мы с ним немного поссорились.
	AI_Output(other,self,"DIA_Whistler_Favour_WhyNotSell_15_02");	//И что?
	AI_Output(self,other,"DIA_Whistler_Favour_WhyNotSell_11_03");	//И то, что тебе это знать совсем необязательно!
};


instance DIA_WHISTLER_RUNNING110(C_INFO)
{
	npc = stt_309_whistler;
	nr = 4;
	condition = dia_whistler_running110_condition;
	information = dia_whistler_running110_info;
	permanent = 0;
	description = "Фиск повысил цену. Меч стоит сто десять кусков.";
};


func int dia_whistler_running110_condition()
{
	if((WHISTLER_BUYMYSWORD == LOG_RUNNING) && (FISK_SCKNOWS110 == TRUE))
	{
		return 1;
	};
};

func void dia_whistler_running110_info()
{
	AI_Output(other,self,"DIA_Whistler_Running110_15_00");	//Фиск повысил цену. Меч стоит сто десять кусков.
	AI_Output(self,other,"DIA_Whistler_Running110_11_01");	//И теперь ты хочешь, чтобы я добавил тебе еще десять кусков?
	AI_Output(other,self,"DIA_Whistler_Running110_15_02");	//А я-то думал, тебе этот меч действительно нужен.
	AI_Output(self,other,"DIA_Whistler_Running110_11_03");	//Вот, забери и поторопись!
	CreateInvItems(self,itminugget,10);
	b_giveinvitems(self,hero,itminugget,10);
};


instance DIA_WHISTLER_RUNNINGPAYBACK(C_INFO)
{
	npc = stt_309_whistler;
	nr = 5;
	condition = dia_whistler_runningpayback_condition;
	information = dia_whistler_runningpayback_info;
	permanent = 1;
	description = "Я не смог купить меч. Вот тебе твоя сотня кусков.";
};


func int dia_whistler_runningpayback_condition()
{
	if(WHISTLER_BUYMYSWORD == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_whistler_runningpayback_info()
{
	AI_Output(other,self,"DIA_Whistler_RunningPayBack_15_00");	//Я не смог купить меч. Вот тебе твоя сотня кусков.
	if(Npc_HasItems(other,itminugget) >= 100)
	{
		AI_Output(self,other,"DIA_Whistler_RunningPayBack_11_01");	//Идиот! Таких у нас и без тебя хватает! Убирайся!
		b_giveinvitems(hero,self,itminugget,100);
		WHISTLER_BUYMYSWORD = LOG_OBSOLETE;
		b_logentry(CH1_JOINOC,"Я все испортил. Теперь Уистлеру никогда не видать своего меча.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Whistler_RunningPayBack_11_02");	//Где ты здесь видишь сто кусков? Отдавай мою руду, иначе у тебя будут неприятности!
		AI_StopProcessInfos(self);
	};
};


instance DIA_WHISTLER_MYSWORD_TOOLATE(C_INFO)
{
	npc = stt_309_whistler;
	nr = 1;
	condition = dia_whistler_mysword_toolate_condition;
	information = dia_whistler_mysword_toolate_info;
	permanent = 0;
	important = 1;
};


func int dia_whistler_mysword_toolate_condition()
{
	if((WHISTLER_BUYMYSWORD == LOG_RUNNING) && (WHISTLER_BUYMYSWORD_DAY <= (Wld_GetDay() - 2)))
	{
		return 1;
	};
};

func void dia_whistler_mysword_toolate_info()
{
	AI_Output(self,other,"DIA_Whistler_MySword_TooLate_11_00");	//А, вот ты где! Хотел украсть мою руду, да? Ну-ка, иди сюда!
	WHISTLER_BUYMYSWORD = LOG_FAILED;
	b_logentry(CH1_JOINOC,"Я все испортил. Уистлер рассержен на меня.");
	AI_StopProcessInfos(self);
	npc_setpermattitude(self,ATT_ANGRY);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
};


instance DIA_WHISTLER_MYSWORD_SUCCESS(C_INFO)
{
	npc = stt_309_whistler;
	nr = 800;
	condition = dia_whistler_mysword_success_condition;
	information = dia_whistler_mysword_success_info;
	permanent = 1;
	description = "Я достал твой меч...";
};


func int dia_whistler_mysword_success_condition()
{
	if((WHISTLER_BUYMYSWORD == LOG_RUNNING) && (WHISTLER_BUYMYSWORD_DAY > (Wld_GetDay() - 2)) && (Npc_HasItems(other,whistlers_schwert) >= 1))
	{
		return 1;
	};
};

func void dia_whistler_mysword_success_info()
{
	AI_Output(other,self,"DIA_Whistler_MySword_Success_15_00");	//Я достал твой меч...
	b_giveinvitems(other,self,whistlers_schwert,1);
	AI_Output(self,other,"DIA_Whistler_MySword_Success_11_01");	//Ну, ведь это было совсем несложно, да? Ладно, как я и говорил, я помогу тебе.
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Whistler_MySword_Success_11_02");	//Если Диего спросит меня о тебе, я скажу, что тебе можно доверять. До встречи!
		b_logentry(CH1_JOINOC,"Я достал меч для Уистлера. Он остался доволен. Теперь он поддержит меня, если я захочу вступить в лагерь.");
	}
	else
	{
		b_logentry(CH1_JOINOC,"Уистлер был доволен тем, что я достал ему меч. Жаль, но мне его помощь не пригодится. Я больше не могу стать Призраком.");
	};
	WHISTLER_BUYMYSWORD = LOG_SUCCESS;
	b_givexp(XP_WHISTLERSSWORD);
	AI_StopProcessInfos(self);
};


instance DIA_WHISTLER_STANDARDKAP1(C_INFO)
{
	npc = stt_309_whistler;
	nr = 800;
	condition = dia_whistler_standardkap1_condition;
	information = dia_whistler_standardkap1_info;
	permanent = 1;
	description = "Как дела?";
};


func int dia_whistler_standardkap1_condition()
{
	if(WHISTLER_BUYMYSWORD == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_whistler_standardkap1_info()
{
	AI_Output(other,self,"DIA_Whistler_StandardKap1_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Whistler_StandardKap1_11_01");	//Хорошо! Ты помог мне - я помогу тебе. Я скажу Диего, что тебе можно доверять.
};

