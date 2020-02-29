
instance GRD_263_ASGHAN_EXIT(C_INFO)
{
	npc = grd_263_asghan;
	nr = 999;
	condition = grd_263_asghan_exit_condition;
	information = grd_263_asghan_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int grd_263_asghan_exit_condition()
{
	return 1;
};

func void grd_263_asghan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance GRD_263_ASGHAN_NEST(C_INFO)
{
	npc = grd_263_asghan;
	condition = grd_263_asghan_nest_condition;
	information = grd_263_asghan_nest_info;
	important = 0;
	permanent = 0;
	description = "Где-то здесь должно быть логово ползунов.";
};


func int grd_263_asghan_nest_condition()
{
	if(CORKALOM_BRINGMCQBALLS == LOG_RUNNING)
	{
		return 1;
	};
};

func void grd_263_asghan_nest_info()
{
	AI_Output(other,self,"Grd_263_Asghan_NEST_Info_15_01");	//Где-то здесь должно быть логово ползунов.
	AI_Output(self,other,"Grd_263_Asghan_NEST_Info_06_02");	//Да, эта гора и есть одно большое логово ползунов!
	AI_Output(other,self,"Grd_263_Asghan_NEST_Info_15_03");	//Почему эта шахта перекрыта?
	AI_Output(self,other,"Grd_263_Asghan_NEST_Info_06_04");	//Ползунов развелось слишком много, сколько бы мы их не били.
	AI_Output(other,self,"Grd_263_Asghan_NEST_Info_15_05");	//Кажется, логово должно быть где-то недалеко. Открой для меня эти ворота!
	AI_Output(self,other,"Grd_263_Asghan_NEST_Info_06_06");	//Нет! Их можно открыть только с разрешения Яна! Без его приказа я даже с места не сдвинусь.
	b_logentry(CH2_MCEGGS,"Асгхан, глава стражников шахты, отказывается открывать мне ворота. Он хочет, чтобы я спросил у Яна разрешение на это.");
};


instance GRD_263_ASGHAN_OPEN(C_INFO)
{
	npc = grd_263_asghan;
	condition = grd_263_asghan_open_condition;
	information = grd_263_asghan_open_info;
	important = 0;
	permanent = 0;
	description = "Эй, Асгхан, ты можешь открыть ворота!";
};


func int grd_263_asghan_open_condition()
{
	if(Npc_KnowsInfo(hero,grd_263_asghan_nest) && Npc_KnowsInfo(hero,stt_301_ian_gear_suc))
	{
		return TRUE;
	};
};

func void grd_263_asghan_open_info()
{
	AI_Output(other,self,"Grd_263_Asghan_OPEN_Info_15_01");	//Эй, Асгхан, ты можешь открыть ворота!
	AI_Output(self,other,"Grd_263_Asghan_OPEN_Info_06_02");	//Я уже сказал: только с разрешения Яна...
	AI_Output(other,self,"Grd_263_Asghan_OPEN_Info_15_03");	//Асгхан... Все будет в порядке... и привет тебе от Яна.
	AI_Output(self,other,"Grd_263_Asghan_OPEN_Info_06_04");	//Ну, если Ян согласен за это отвечать... Но есть одно условие!
	AI_Output(other,self,"Grd_263_Asghan_OPEN_Info_15_05");	//И что это за условие?
	AI_Output(self,other,"Grd_263_Asghan_OPEN_Info_06_06");	//Мне нужна помощь. Двух-трех стражей будет достаточно. А то не хочется приветствовать всех этих ползунов в одиночестве!
	b_logentry(CH2_MCEGGS,"Ян разрешил мне зайти в заброшенную часть шахты. Но мне нужно еще заручиться поддержкой нескольких Стражей. Тогда Асгхан откроет мне ворота.");
	AI_StopProcessInfos(self);
};


instance GRD_263_ASGHAN_OPEN_NOW(C_INFO)
{
	npc = grd_263_asghan;
	condition = grd_263_asghan_open_now_condition;
	information = grd_263_asghan_open_now_info;
	important = 0;
	permanent = 0;
	description = "Теперь все готово. Можно открыть ворота!";
};


func int grd_263_asghan_open_now_condition()
{
	if((Npc_KnowsInfo(hero,tpl_1400_gornabar_suggest) && Npc_KnowsInfo(hero,tpl_1401_gornakosh_suggest)) || (Npc_KnowsInfo(hero,tpl_1401_gornakosh_suggest) && Npc_KnowsInfo(hero,tpl_1433_gornavid_health_suc)) || (Npc_KnowsInfo(hero,tpl_1433_gornavid_health_suc) && Npc_KnowsInfo(hero,tpl_1400_gornabar_suggest)))
	{
		return TRUE;
	};
};

func void grd_263_asghan_open_now_info()
{
	var C_NPC sklave;
	AI_Output(other,self,"Grd_263_Asghan_OPEN_NOW_Info_15_01");	//Теперь все готово. Можно открыть ворота!
	AI_Output(self,other,"Grd_263_Asghan_OPEN_NOW_Info_06_02");	//Давай, открывай. Представление начинается!
	npc_setpermattitude(self,ATT_FRIENDLY);
	Npc_ExchangeRoutine(self,"opengate");
	b_givexp(XP_OPENASGHANSGATE);
	b_logentry(CH2_MCEGGS,"Я собрал нескольких Стражей у ворот в заброшенную часть шахты. Что ждет нас впереди?");
	sklave = Hlp_GetNpc(orc_2001_sklave);
	Npc_ExchangeRoutine(sklave,"STOMPER");
	AI_ContinueRoutine(sklave);
	AI_StopProcessInfos(self);
	Snd_Play("AMBIENTCRAWLERSCREAM");
};


instance GRD_263_ASGHAN_LAIRFOUND(C_INFO)
{
	npc = grd_263_asghan;
	condition = grd_263_asghan_lairfound_condition;
	information = grd_263_asghan_lairfound_info;
	important = 0;
	permanent = 0;
	description = "Ползуны больше не будут угрожать рудокопам!";
};


func int grd_263_asghan_lairfound_condition()
{
	MINECRAWLERQUEEN = Hlp_GetNpc(minecrawlerqueen);
	if((Npc_HasItems(hero,itat_crawlerqueen) >= 3) && (Npc_GetTrueGuild(hero) == GIL_STT) && Npc_IsDead(minecrawlerqueen))
	{
		return TRUE;
	};
};

func void grd_263_asghan_lairfound_info()
{
	AI_Output(other,self,"Grd_263_Asghan_LAIRFOUND_Info_15_01");	//Ползуны больше не будут угрожать рудокопам!
	AI_Output(self,other,"Grd_263_Asghan_LAIRFOUND_Info_06_02");	//Отличная новость. Надо сообщить это Торусу!
	AI_StopProcessInfos(self);
};


instance GRD_263_ASGHAN_SMALLTALK(C_INFO)
{
	npc = grd_263_asghan;
	condition = grd_263_asghan_smalltalk_condition;
	information = grd_263_asghan_smalltalk_info;
	important = 0;
	permanent = 0;
	description = "Эй, как дела?";
};


func int grd_263_asghan_smalltalk_condition()
{
	if(CORKALOM_BRINGMCQBALLS != LOG_RUNNING)
	{
		return TRUE;
	};
};

func void grd_263_asghan_smalltalk_info()
{
	AI_Output(other,self,"Grd_263_Asghan_SMALLTALK_Info_15_01");	//Эй, как дела?
	AI_Output(self,other,"Grd_263_Asghan_SMALLTALK_Info_06_02");	//Хорошо... пока никто не стремится выпустить ползунов и мне не надо никого калечить.
	AI_Output(other,self,"Grd_263_Asghan_SMALLTALK_Info_15_03");	//А что же скрывается за этими воротами?
	AI_Output(self,other,"Grd_263_Asghan_SMALLTALK_Info_06_04");	//Ползуны. Здоровые, мерзкие хищники. И их здесь очень, очень много.
};

