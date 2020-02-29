
instance DIA_BAALORUN_EXIT(C_INFO)
{
	npc = gur_1209_baalorun;
	nr = 999;
	condition = dia_baalorun_exit_condition;
	information = dia_baalorun_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_baalorun_exit_condition()
{
	return 1;
};

func void dia_baalorun_exit_info()
{
	AI_StopProcessInfos(self);
};


var int baalorun_ansprechbar;
var int baalorun_sakrileg;

instance DIA_BAALORUN_NOTALK(C_INFO)
{
	npc = gur_1209_baalorun;
	nr = 2;
	condition = dia_baalorun_notalk_condition;
	information = dia_baalorun_notalk_info;
	permanent = 1;
	important = 1;
};


func int dia_baalorun_notalk_condition()
{
	if(Npc_IsInState(self,zs_talk) && (BAALORUN_ANSPRECHBAR == FALSE) && (Npc_GetPermAttitude(self,other) != ATT_FRIENDLY))
	{
		return 1;
	};
};

func void dia_baalorun_notalk_info()
{
	Info_ClearChoices(dia_baalorun_notalk);
	Info_AddChoice(dia_baalorun_notalk,DIALOG_ENDE,dia_baalorun_notalk_ende);
	Info_AddChoice(dia_baalorun_notalk,"С тобой все нормально, приятель?",dia_baalorun_notalk_imp);
	Info_AddChoice(dia_baalorun_notalk,"Да пребудет с тобой Спящий!",dia_baalorun_notalk_sleeper);
	Info_AddChoice(dia_baalorun_notalk,"Привет! Я здесь новенький!",dia_baalorun_notalk_hi);
};

func void dia_baalorun_notalk_hi()
{
	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Hi_15_00");	//Привет! Я здесь новенький!
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Hi_12_01");	//
	BAALORUN_SAKRILEG = TRUE;
};

func void dia_baalorun_notalk_sleeper()
{
	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Sleeper_15_00");	//Да пребудет с тобой Спящий!
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Sleeper_12_01");	//
	BAALORUN_SAKRILEG = TRUE;
};

func void dia_baalorun_notalk_imp()
{
	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Imp_15_00");	//С тобой все нормально, приятель?
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Imp_12_01");	//
	BAALORUN_SAKRILEG = TRUE;
};

func void dia_baalorun_notalk_ende()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAALORUN_FIRSTTALK(C_INFO)
{
	npc = gur_1209_baalorun;
	nr = 1;
	condition = dia_baalorun_firsttalk_condition;
	information = dia_baalorun_firsttalk_info;
	permanent = 0;
	important = 1;
};


func int dia_baalorun_firsttalk_condition()
{
	if(GHORIM_KICKHARLOK == LOG_SUCCESS)
	{
		BAALORUN_ANSPRECHBAR = TRUE;
		return 1;
	};
};

func void dia_baalorun_firsttalk_info()
{
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_00");	//Горим сказал мне, что ты очень помог братьям нашим - это мудрый поступок.
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_01");	//Именно поэтому тебя выбрали для выполнения особого задания.
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_02");	//Кор Галом постоянно экспериментирует и ему нужен болотник.
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_03");	//Наши сборщики трудятся не покладая рук. Иди к ним и принеси в лабораторию Галома весь их дневной сбор.
	b_givexp(XP_BAALORUNTALKS);
	b_logentry(CH1_GHORIMSRELIEF,"Харлок сменил Горима. Да, бывают в жизни чудеса...");
	Log_SetTopicStatus(CH1_GHORIMSRELIEF,LOG_SUCCESS);
	Log_CreateTopic(CH1_DELIVERWEED,LOG_MISSION);
	Log_SetTopicStatus(CH1_DELIVERWEED,LOG_RUNNING);
	b_logentry(CH1_DELIVERWEED,"Я сумел уговорить Харлока, и это произвело хорошее впечатление на Идола Орана. Теперь я должен отнести весь урожай болотника Кор Галому.");
	BAALORUN_FETCHWEED = LOG_RUNNING;
	Info_ClearChoices(dia_baalorun_firsttalk);
	Info_AddChoice(dia_baalorun_firsttalk,"Ничего не говорить.",dia_baalorun_firsttalk_muteende);
	Info_AddChoice(dia_baalorun_firsttalk,"Где я могу найти этих сборщиков?",dia_baalorun_firsttalk_where);
};

func void dia_baalorun_firsttalk_where()
{
	AI_Output(other,self,"DIA_BaalOrun_FirstTalk_Where_15_00");	//Где я могу найти этих сборщиков?
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_Where_12_01");	//Я еще не позволял тебе задавать вопросы!
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_Where_12_02");	//Молись Спящему, дабы он простил твой святотатственный поступок! И ступай. Твоя миссия очень важна для всех нас.
	Info_ClearChoices(dia_baalorun_firsttalk);
	AI_StopProcessInfos(self);
	BAALORUN_ANSPRECHBAR = FALSE;
};

func void dia_baalorun_firsttalk_muteende()
{
	Info_ClearChoices(dia_baalorun_firsttalk);
	AI_StopProcessInfos(self);
	BAALORUN_ANSPRECHBAR = FALSE;
};


instance DIA_BAALORUN_GOTWEED(C_INFO)
{
	npc = gur_1209_baalorun;
	nr = 1;
	condition = dia_baalorun_gotweed_condition;
	information = dia_baalorun_gotweed_info;
	permanent = 0;
	important = 1;
};


func int dia_baalorun_gotweed_condition()
{
	if(VIRAN_BLOODFLIES == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_baalorun_gotweed_info()
{
	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_00");	//Ты спас наших сборщиков...
	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_01");	//Это не просто любопытство к нам, это проявление веры в Спящего.
	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_02");	//Я вижу, ты достоин носить робу послушника.
	BAALORUN_ANSPRECHBAR = TRUE;
	Log_CreateTopic(CH1_JOINPSI,LOG_MISSION);
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_SetTopicStatus(CH1_JOINPSI,LOG_RUNNING);
	};
	b_logentry(CH1_JOINPSI,"Идол Оран назвал меня верным последователем Спящего, так как я смог избавить сборщиков болотника от шершней.");
	b_givexp(XP_IMPRESSEDBAALORUN);
};


instance DIA_BAALORUN_WEEDATKALOMS(C_INFO)
{
	npc = gur_1209_baalorun;
	nr = 1;
	condition = dia_baalorun_weedatkaloms_condition;
	information = dia_baalorun_weedatkaloms_info;
	permanent = 0;
	description = "Я доставил болотник Кор Галому.";
};


func int dia_baalorun_weedatkaloms_condition()
{
	if(BAALORUN_FETCHWEED == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_baalorun_weedatkaloms_info()
{
	AI_Output(other,self,"DIA_BaalOrun_WeedAtKaloms_15_00");	//Я доставил болотник Кор Галому.
	AI_Output(self,other,"DIA_BaalOrun_WeedAtKaloms_12_01");	//Неплохо поработал. Вот тебе за это небольшая награда.
	AI_Output(self,other,"DIA_BaalOrun_WeedAtKaloms_12_02");	//Это магическое Заклинание Сна. Ты сможешь воспользоваться им только один раз, но я надеюсь, что оно сослужит тебе хорошую службу.
	BAALORUN_ANSPRECHBAR = TRUE;
	b_givexp(XP_REPORTTOBAALORUN);
	CreateInvItem(self,itarscrollsleep);
	b_giveinvitems(self,other,itarscrollsleep,1);
};


instance DIA_BAALORUN_PERM(C_INFO)
{
	npc = gur_1209_baalorun;
	nr = 2;
	condition = dia_baalorun_perm_condition;
	information = dia_baalorun_perm_info;
	permanent = 1;
	description = "Как идет сбор урожая?";
};


func int dia_baalorun_perm_condition()
{
	if(BAALORUN_FETCHWEED == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_baalorun_perm_info()
{
	AI_Output(other,self,"DIA_BaalOrun_Perm_15_00");	//Как идет сбор урожая?
	AI_Output(self,other,"DIA_BaalOrun_Perm_12_01");	//Мы со всем усердием трудимся день и ночь, поэтому у нас много болотника. И себе хватает и на продажу в другие лагеря.
	AI_Output(self,other,"DIA_BaalOrun_Perm_12_02");	//Это жертва, которую наши послушники с готовностью приносят Спящему.
};

