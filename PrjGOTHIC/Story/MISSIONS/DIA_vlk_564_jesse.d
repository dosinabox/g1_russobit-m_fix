
instance DIA_JESSE_EXIT(C_INFO)
{
	npc = vlk_564_jesse;
	nr = 999;
	condition = dia_jesse_exit_condition;
	information = dia_jesse_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_jesse_exit_condition()
{
	return 1;
};

func void dia_jesse_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JESSE_HALLO(C_INFO)
{
	npc = vlk_564_jesse;
	nr = 1;
	condition = dia_jesse_hallo_condition;
	information = dia_jesse_hallo_info;
	permanent = 0;
	description = "Как дела?";
};


func int dia_jesse_hallo_condition()
{
	if(!Npc_KnowsInfo(hero,dia_herek_bully))
	{
		return 1;
	};
};

func void dia_jesse_hallo_info()
{
	AI_Output(other,self,"DIA_Jesse_Hallo_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Jesse_Hallo_03_01");	//Ты здесь недавно? Запомни сразу: со стражниками лучше не ссорится.
	AI_Output(self,other,"DIA_Jesse_Hallo_03_02");	//Если они потребуют от тебя плату за защиту, лучше им заплатить, иначе половина лагеря будет настроено против тебя.
};


instance DIA_JESSE_WARN(C_INFO)
{
	npc = vlk_564_jesse;
	nr = 1;
	condition = dia_jesse_warn_condition;
	information = dia_jesse_warn_info;
	permanent = 0;
	important = 1;
};


func int dia_jesse_warn_condition()
{
	if(Npc_KnowsInfo(hero,dia_herek_bully) && (HEREK_PROTECTIONBULLY == TRUE))
	{
		return 1;
	};
};

func void dia_jesse_warn_info()
{
	AI_Output(self,other,"DIA_Jesse_Warn_03_00");	//Эй, ты! Ты отказался платить Бладвину за защиту, да?
	AI_Output(other,self,"DIA_Jesse_Warn_15_01");	//Ну и что?
	AI_Output(self,other,"DIA_Jesse_Warn_03_02");	//Я подумал, что лучше предупредить тебя. Он нанял местных головорезов, чтобы отомстить тебе.
	AI_Output(self,other,"DIA_Jesse_Warn_03_03");	//Ну, я слышал его разговор с Хереком. Быть может, он нанял и кого-нибудь еще.
	AI_Output(other,self,"DIA_Jesse_Warn_15_04");	//Твое предупреждение о Хереке немного запоздало.
	AI_Output(self,other,"DIA_Jesse_Warn_03_05");	//Возможно, он подговорил сразу нескольких человек. Будь осторожен.
};


instance DIA_JESSE_MISSION(C_INFO)
{
	npc = vlk_564_jesse;
	nr = 1;
	condition = dia_jesse_mission_condition;
	information = dia_jesse_mission_info;
	permanent = 0;
	description = "Почему ты рассказал мне о Бладвине?";
};


func int dia_jesse_mission_condition()
{
	if(Npc_KnowsInfo(hero,dia_jesse_mission))
	{
		return 1;
	};
};

func void dia_jesse_mission_info()
{
	AI_Output(other,self,"DIA_Jesse_Mission_15_00");	//Почему ты рассказал мне о Бладвине?
	AI_Output(self,other,"DIA_Jesse_Mission_03_01");	//Потому что просто так ничего не бывает. Мне показалось, что тебе не нужно будет это объяснять.
	AI_Output(self,other,"DIA_Jesse_Mission_03_02");	//А так как я помог тебе, я дам тебе возможность помочь мне.
	Info_ClearChoices(dia_jesse_mission);
	Info_AddChoice(dia_jesse_mission,"Я тебе ничего не должен!",dia_jesse_mission_forgetit);
	Info_AddChoice(dia_jesse_mission,"И что же ты от меня хочешь?",dia_jesse_mission_what);
};

func void dia_jesse_mission_forgetit()
{
	AI_Output(other,self,"DIA_Jesse_Mission_ForgetIt_15_00");	//Я тебе ничего не должен!
	AI_Output(self,other,"DIA_Jesse_Mission_ForgetIt_03_01");	// Тогда забудь об этом и убирайся!
	npc_setpermattitude(self,ATT_ANGRY);
	Info_ClearChoices(dia_jesse_mission);
	AI_StopProcessInfos(self);
};

func void dia_jesse_mission_what()
{
	AI_Output(other,self,"DIA_Jesse_Mission_What_15_00");	//И что же ты от меня хочешь?
	AI_Output(self,other,"DIA_Jesse_Mission_What_03_01");	//У меня совсем не осталось руды. Бладвин забрал у меня все до последнего кусочка.
	AI_Output(self,other,"DIA_Jesse_Mission_What_03_02");	//И ему все равно не хватило. Я должен ему 10 кусков. Ты можешь отдать ему руду и сказать, что она от меня.
	Npc_SetTrueGuild(self,GIL_NONE);
	Info_AddChoice(dia_jesse_mission,"Платить за тебя? Я не стану этого делать!",dia_jesse_mission_no);
	Info_AddChoice(dia_jesse_mission,"Я посмотрю, что тут можно сделать...",dia_jesse_mission_yes);
};

func void dia_jesse_mission_yes()
{
	AI_Output(other,self,"DIA_Jesse_Mission_YES_15_00");	//Я посмотрю, что тут можно сделать...
	AI_Output(self,other,"DIA_Jesse_Mission_YES_03_01");	//Спасибо! Ты спасаешь меня! Скажешь, когда эта проблема будет решена, хорошо?
	JESSE_PAYFORME = LOG_RUNNING;
	Info_ClearChoices(dia_jesse_mission);
};

func void dia_jesse_mission_no()
{
	AI_Output(other,self,"DIA_Jesse_Mission_NO_15_00");	//Платить за тебя? Я не стану этого делать!
	AI_Output(self,other,"DIA_Jesse_Mission_NO_03_01");	//Как я так мог ошибиться в тебе. Больше на мою помощь не рассчитывай.
	npc_setpermattitude(self,ATT_ANGRY);
	Info_ClearChoices(dia_jesse_mission);
};


instance DIA_JESSE_MISSUCCESS(C_INFO)
{
	npc = vlk_564_jesse;
	nr = 1;
	condition = dia_jesse_missuccess_condition;
	information = dia_jesse_missuccess_info;
	permanent = 0;
	description = "Я отдал руду Бладвину!";
};


func int dia_jesse_missuccess_condition()
{
	if(JESSE_PAYFORME == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_jesse_missuccess_info()
{
	AI_Output(other,self,"DIA_Jesse_MisSuccess_15_00");	//Я отдал руду Бладвину!
	AI_Output(self,other,"DIA_Jesse_MisSuccess_03_01");	//Да? Отлично! Теперь мы в расчете.
	Npc_SetTrueGuild(self,GIL_VLK);
	Info_ClearChoices(dia_jesse_missuccess);
	Info_AddChoice(dia_jesse_missuccess,"Что? И ради этого я заплатил десять кусков?",dia_jesse_missuccess_waaas);
	Info_AddChoice(dia_jesse_missuccess,"Да. Ты мне - я тебе. Как всегда.",dia_jesse_missuccess_ok);
};

func void dia_jesse_missuccess_waaas()
{
	AI_Output(other,self,"DIA_Jesse_MisSuccess_Waaas_15_00");	//Что? И ради этого я заплатил десять кусков?
	AI_Output(self,other,"DIA_Jesse_MisSuccess_Waaas_03_01");	//Кажется, да.
};

func void dia_jesse_missuccess_ok()
{
	AI_Output(other,self,"DIA_Jesse_MisSuccess_Ok_15_00");	//Да. Ты мне - я тебе. Как всегда.
};

