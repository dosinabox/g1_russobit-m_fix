
instance DIA_DEXTER_EXIT(C_INFO)
{
	npc = stt_329_dexter;
	nr = 999;
	condition = dia_dexter_exit_condition;
	information = dia_dexter_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_dexter_exit_condition()
{
	return 1;
};

func void dia_dexter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DEXTER_FIRST(C_INFO)
{
	npc = stt_329_dexter;
	nr = 1;
	condition = dia_dexter_first_condition;
	information = dia_dexter_first_info;
	permanent = 0;
	important = 1;
};


func int dia_dexter_first_condition()
{
	return 1;
};

func void dia_dexter_first_info()
{
	AI_Output(self,other,"DIA_Dexter_IAmNew_10_00");	//Эй, ты! Я продаю болотник и эликсиры из Лагеря сектантов. Что-нибудь хочешь купить?
};


instance DIA_DEXTER_KRAUT(C_INFO)
{
	npc = stt_329_dexter;
	nr = 1;
	condition = dia_dexter_kraut_condition;
	information = dia_dexter_kraut_info;
	permanent = 0;
	description = "Что такое болотник?";
};


func int dia_dexter_kraut_condition()
{
	return 1;
};

func void dia_dexter_kraut_info()
{
	AI_Output(other,self,"DIA_Dexter_Kraut_15_00");	//Что такое болотник?
	AI_Output(self,other,"DIA_Dexter_Kraut_10_01");	//Новенький, да? Большинство из нас курят болотник, чтобы расслабиться.
};


instance DIA_DEXTER_TRADE(C_INFO)
{
	npc = stt_329_dexter;
	nr = 800;
	condition = dia_dexter_trade_condition;
	information = dia_dexter_trade_info;
	permanent = 1;
	description = "Покажи мне свои товары.";
	trade = 1;
};


func int dia_dexter_trade_condition()
{
	return 1;
};

func void dia_dexter_trade_info()
{
	AI_Output(other,self,"DIA_BaalKagan_TRADE_15_00");	//Покажи мне свои товары.
	AI_Output(self,other,"DIA_Dexter_Trade_10_01");	//У меня все самое лучшее...
	if(DEXTER_TRADED == FALSE)
	{
		Log_CreateTopic(GE_TRADEROC,LOG_NOTE);
		b_logentry(GE_TRADEROC,"Призрак Декстер на рыночной площади продает болотник и зелья из лагеря Сектантов.");
		DEXTER_TRADED = TRUE;
	};
};

instance DIA_DEXTER_JOINOC(C_INFO)
{
	npc = stt_329_dexter;
	nr = 1;
	condition = dia_dexter_joinoc_condition;
	information = dia_dexter_joinoc_info;
	permanent = 0;
	description = "Я хочу присоединиться к лагерю. Хочу стать Призраком.";
};


func int dia_dexter_joinoc_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void dia_dexter_joinoc_info()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_15_00");	//Я хочу присоединиться к лагерю. Хочу стать Призраком.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_01");	//Да? Хочешь показать, что ты чего-то стоишь?
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_02");	//Ну, хорошо. Можешь помочь мне. Если сделаешь все как надо, я поговорю с Диего.
	AI_Output(other,self,"DIA_Dexter_JoinOC_15_03");	//Что ты хочешь от меня?
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_04");	//В Лагере сектантов есть один тип - Галом. Важный парень - один из Гуру.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_05");	//Он алхимик. И у него есть рецепт очень эффективного целебного эликсира.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_06");	//Если у меня будет этот рецепт, я смогу готовить такой же эликсир.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_07");	//Но к Галому просто так не подобраться.
	AI_Output(other,self,"DIA_Dexter_JoinOC_15_08");	//И что я должен сделать?
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_09");	//Болотным придуркам постоянно нужны новые люди. Ты здесь новенький и тебе будет легко притвориться, что ты хочешь присоединиться к ним.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_10");	//Галом - один из Гуру, и именно он испытывает новичков. Когда встретишься с ним, попробуй получить рецепт.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_11");	//Как ты его добудешь мне все равно. Можешь купить его или украсть.
	Info_ClearChoices(dia_dexter_joinoc);
	Info_AddChoice(dia_dexter_joinoc,"Ладно, я попробую его достать.",dia_dexter_joinoc_ok);
	Info_AddChoice(dia_dexter_joinoc,"Мне кажется, это не так уж просто. Что я за это получу?",dia_dexter_joinoc_howmuch);
};

func void dia_dexter_joinoc_ok()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_Ok_15_00");	//Ладно, я попробую его достать.
	DEXTER_GETKALOMSRECIPE = LOG_RUNNING;
	Log_CreateTopic(CH1_KALOMSRECIPE,LOG_MISSION);
	Log_SetTopicStatus(CH1_KALOMSRECIPE,LOG_RUNNING);
	b_logentry(CH1_KALOMSRECIPE,"Призрак Декстер с рыночной площади заказал мне достать рецепт Гуру Кор Галома из лагеря Сектантов.");
	b_logentry(CH1_KALOMSRECIPE,"Декстер посоветовал мне сделать вид, будто я хочу присоединиться к ним.");
	Info_ClearChoices(dia_dexter_joinoc);
};

func void dia_dexter_joinoc_howmuch()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_HowMuch_15_00");	//Мне кажется, это не так уж просто. Что я за это получу?
	AI_Output(self,other,"DIA_Dexter_JoinOC_HowMuch_10_01");	//Когда ты захочешь присоединиться к лагерю, Диего спросит о тебе. Угадай, что я ему скажу?
	Info_AddChoice(dia_dexter_joinoc,"Может быть, придется заплатить за рецепт. Ты дашь 50 кусков руды.",dia_dexter_joinoc_advance);
};

func void dia_dexter_joinoc_advance()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_Advance_15_00");	//Может быть, мне придется заплатить за этот рецепт. Ты можешь дать мне 50 кусков руды.
	AI_Output(self,other,"DIA_Dexter_JoinOC_Advance_10_01");	//Даже не думай об этом.
	Info_AddChoice(dia_dexter_joinoc,"Нет руды - нет рецепта!",dia_dexter_joinoc_threat);
};

func void dia_dexter_joinoc_threat()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_Threat_15_00");	//Нет руды - нет рецепта!
	AI_Output(self,other,"DIA_Dexter_JoinOC_Threat_10_01");	//Ладно! Хорошо! Когда рецепт будет у тебя, тогда и поговорим о руде.
	Info_AddChoice(dia_dexter_joinoc,"Нет! Я хочу получить руду сейчас, или ты пойдешь за ним сам.",dia_dexter_joinoc_orenoworelse);
};

func void dia_dexter_joinoc_orenoworelse()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_OreNowOrElse_15_00");	//Нет! Я хочу получить руду сейчас, или ты пойдешь за ним сам.
	AI_Output(self,other,"DIA_Dexter_JoinOC_OreNowOrElse_10_01");	//Слушай, здесь много и других новеньких. Так что... поручу я эту работу кому-нибудь другому...
	Info_AddChoice(dia_dexter_joinoc,"Ладно! Давай просто забудем об этом.",dia_dexter_joinoc_forgetit);
};

func void dia_dexter_joinoc_forgetit()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_ForgetIt_15_00");	//Ладно! Давай просто забудем об этом.
	AI_Output(self,other,"DIA_Dexter_JoinOC_ForgetIt_10_01");	//Погоди! Не так быстро! Я всего лишь прощупывал почву... 50 кусков - это же хорошая сумма для новенького.
	AI_Output(other,self,"DIA_Dexter_JoinOC_ForgetIt_15_02");	//Звучит гораздо лучше.
	AI_Output(self,other,"DIA_Dexter_JoinOC_ForgetIt_10_03");	//Да, да, хорошо! У меня найдется лишних 50 кусков для тебя. Только не подведи меня, паренек!
	DEXTER_GETKALOMSRECIPE = LOG_RUNNING;
	Log_CreateTopic(CH1_KALOMSRECIPE,LOG_MISSION);
	Log_SetTopicStatus(CH1_KALOMSRECIPE,LOG_RUNNING);
	b_logentry(CH1_KALOMSRECIPE,"Призрак Декстер с рыночной площади заказал мне достать рецепт Гуру Кор Галома из лагеря Сектантов.");
	b_logentry(CH1_KALOMSRECIPE,"Декстер хочет, чтобы я пошел в Лагерь сектантов и сделал вид, будто хочу присоединиться к ним.");
	CreateInvItems(self,itminugget,50);
	b_giveinvitems(self,other,itminugget,50);
	DEXTER_ORE_PREPAID = 1;
	Info_ClearChoices(dia_dexter_joinoc);
};


var int dexter_psicamp;

instance DIA_DEXTER_WHEREST(C_INFO)
{
	npc = stt_329_dexter;
	nr = 800;
	condition = dia_dexter_wherest_condition;
	information = dia_dexter_wherest_info;
	permanent = 0;
	description = "Где находится Лагерь сектантов?";
};


func int dia_dexter_wherest_condition()
{
	if(DEXTER_GETKALOMSRECIPE == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_dexter_wherest_info()
{
	AI_Output(other,self,"DIA_Dexter_WhereST_15_00");	//Где находится Лагерь сектантов?
	AI_Output(self,other,"DIA_Dexter_WhereST_10_01");	//Выходишь из Лагеря через южные ворота и идешь на восток. Тебе не помешала бы карта.
	if(Npc_HasItems(self,itwrworldmap) > 0)
	{
		AI_Output(self,other,"DIA_Dexter_WhereST_10_02");	//Хочешь? Можешь купить ее у меня всего за 50 кусков руды...
	};
	AI_Output(other,self,"DIA_Dexter_WhereST_15_02");	//Южные ворота - это там, где разрушенная башня?
	AI_Output(self,other,"DIA_Dexter_WhereST_10_03");	//Точно.
	if(!DEXTER_PSICAMP)
	{
		b_logentry(CH1_KALOMSRECIPE,"Лагерь сектантов находится к востоку от Старого лагеря.");
		DEXTER_PSICAMP = TRUE;
	};
};


instance DIA_DEXTER_KALOMSRECIPESUCCESS(C_INFO)
{
	npc = stt_329_dexter;
	nr = 800;
	condition = dia_dexter_kalomsrecipesuccess_condition;
	information = dia_dexter_kalomsrecipesuccess_info;
	permanent = 1;
	description = "У меня есть рецепт, который ты просил!";
};


func int dia_dexter_kalomsrecipesuccess_condition()
{
	if((DEXTER_GETKALOMSRECIPE == LOG_RUNNING) && (Npc_HasItems(other,kalomsrecipe) > 0))
	{
		return 1;
	};
};

func void dia_dexter_kalomsrecipesuccess_info()
{
	AI_Output(other,self,"DIA_Dexter_KalomsRecipeSuccess_15_00");	//У меня есть рецепт, который ты просил!
	AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_01");	//Отлично! Покажи его мне!
	b_usefakescroll();
	AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_02");	//Теперь я сам смогу готовить такой эликсир.
	AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_03");	//Ты парень что надо! Я скажу об этом Диего!
	if(DEXTER_ORE_PREPAID != 1)
	{
		AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_04");	//Вот, это тебе... за помощь...
		CreateInvItems(other,itminugget,50);
		b_giveinvitems(self,other,itminugget,50);
	};
	b_giveinvitems(other,self,kalomsrecipe,1);
	Npc_RemoveInvItem(self,kalomsrecipe);
	DEXTER_GETKALOMSRECIPE = LOG_SUCCESS;
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_SetTopicStatus(CH1_KALOMSRECIPE,LOG_SUCCESS);
		b_logentry(CH1_KALOMSRECIPE,"Декстер был удивлен. Теперь я могу быть уверен в его поддержке.");
	}
	else
	{
		Log_SetTopicStatus(CH1_KALOMSRECIPE,LOG_SUCCESS);
		b_logentry(CH1_KALOMSRECIPE,"Декстер был удивлен. Но его помощь мне уже не требуется.");
	};
	b_givexp(XP_DEXTERKALOM);
};

