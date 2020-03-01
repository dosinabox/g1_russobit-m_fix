
instance DIA_TPL_1415_TORWACHE_EXIT(C_INFO)
{
	npc = tpl_1415_templer;
	nr = 999;
	condition = dia_tpl_1415_torwache_exit_condition;
	information = dia_tpl_1415_torwache_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_tpl_1415_torwache_exit_condition()
{
	return 1;
};

func void dia_tpl_1415_torwache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TPL_1415_TORWACHE_FIRST(C_INFO)
{
	npc = tpl_1415_templer;
	nr = 2;
	condition = dia_tpl_1415_torwache_first_condition;
	information = dia_tpl_1415_torwache_first_info;
	permanent = 0;
	important = 1;
};


func int dia_tpl_1415_torwache_first_condition()
{
	return 1;
};

func void dia_tpl_1415_torwache_first_info()
{
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_13_00");	//Рад видеть тебя, незнакомец!
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_13_01");	//Ты ступил на святую землю - Братство Спящего.
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_13_02");	//Какими судьбами ты здесь?
	Info_ClearChoices(dia_tpl_1415_torwache_first);
	if(KAPITEL == 1)
	{
		Info_AddChoice(dia_tpl_1415_torwache_first,"Я здесь недавно. Могу я осмотреть лагерь?",dia_tpl_1415_torwache_first_justlooking);
	}
	else
	{
		Info_AddChoice(dia_tpl_1415_torwache_first,"Я просто хотел посмотреть лагерь.",dia_tpl_1415_torwache_first_justlooking);
	};
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Info_AddChoice(dia_tpl_1415_torwache_first,"Я собираюсь присоединиться к вам.",dia_tpl_1415_torwache_first_join);
	};
};

func void dia_tpl_1415_torwache_first_join()
{
	AI_Output(other,self,"DIA_Tpl_1415_Torwache_First_Join_15_00");	//Мне сказали, что вам нужны люди. Я хочу присоединиться к вам.
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_Join_13_01");	//Тогда я рад видеть тебя! Наше братство открыто для всех, кто душою стремится к Спящему.
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_Join_13_02");	//Если твое стремление серьезно, то иди к Идолу Намибу. Он во дворе за воротами. Может, он и уделит тебе внимание.
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_Join_13_04");	//Но ты не сможешь с ним поговорить, пока он сам этого не захочет.
	Info_ClearChoices(dia_tpl_1415_torwache_first);
};

func void dia_tpl_1415_torwache_first_justlooking()
{
	if(KAPITEL == 1)
	{
		AI_Output(other,self,"DIA_Tpl_1415_Torwache_First_JustLooking_15_00");	//Я здесь недавно. Могу я осмотреть лагерь?
		AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_JustLooking_13_01");	//Мы всегда рады новым людям.
	}
	else
	{
		AI_Output(other,self,"DIA_SLD_761_Soeldner_UMSEHEN_INFO_15_01");	//Я просто хотел посмотреть лагерь.
	};
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_JustLooking_13_02");	//Но только пока ты соблюдаешь наши правила. Есть места недозволенные таким как ты.
	Info_ClearChoices(dia_tpl_1415_torwache_first);
};


instance DIA_TPL_1415_TORWACHE_SIT(C_INFO)
{
	npc = tpl_1415_templer;
	nr = 2;
	condition = dia_tpl_1415_torwache_sit_condition;
	information = dia_tpl_1415_torwache_sit_info;
	permanent = 1;
	description = "Как идут дела?";
};


func int dia_tpl_1415_torwache_sit_condition()
{
	return 1;
};

func void dia_tpl_1415_torwache_sit_info()
{
	AI_Output(other,self,"DIA_Tpl_1415_Torwache_Sit_15_00");	//Как идут дела?
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_Sit_13_01");	//Тишина. Заходи.
};


instance TPL_1415_TORWACHE_TEMPLERAUFNAHME(C_INFO)
{
	npc = tpl_1415_templer;
	condition = tpl_1415_torwache_templeraufnahme_condition;
	information = tpl_1415_torwache_templeraufnahme_info;
	important = 1;
	permanent = 0;
};


func int tpl_1415_torwache_templeraufnahme_condition()
{
	if(((Npc_HasItems(hero,itat_crawlerqueen) >= 1) || (CORKALOM_BRINGMCQBALLS == LOG_SUCCESS)) && (Npc_GetTrueGuild(hero) == GIL_NOV) && (Npc_GetDistToNpc(hero,self) < 1000))
	{
		return TRUE;
	};
};

func void tpl_1415_torwache_templeraufnahme_info()
{
	AI_GotoNpc(hero,self);
	AI_Output(self,other,"Tpl_1415_Torwache_IMPORTANT_Info_13_01");	//Эй, я знаю, что случилось в шахте. Молодчина! Ты достоин быть одним из Стражей.
	AI_Output(self,other,"Tpl_1415_Torwache_IMPORTANT_Info_13_02");	//Просто поговори с Кор Ангаром!
	if(!Npc_KnowsInfo(hero,tpl_1400_gornabar_victory))
	{
		Log_CreateTopic(GE_BECOMETEMPLAR,LOG_NOTE);
		b_logentry(GE_BECOMETEMPLAR,"Мне нужно поговорить с Кор Ангаром. Может быть, он зачислит меня в ряды Стражей.");
	};
};


instance TPL_1415_TEMPLER_ROCK(C_INFO)
{
	npc = tpl_1415_templer;
	condition = tpl_1415_templer_rock_condition;
	information = tpl_1415_templer_rock_info;
	important = 0;
	permanent = 1;
	description = "Мне нужен какой-нибудь доспех.";
};


func int tpl_1415_templer_rock_condition()
{
	if(KAPITEL < 2 && GOT_NOV_L_ARMOR == FALSE)
	{
		return TRUE;
	};
};

func void tpl_1415_templer_rock_info()
{
	AI_Output(other,self,"Tpl_1415_Templer_ROCK_Info_15_01");	//Мне нужен какой-нибудь доспех.
	AI_Output(self,other,"Tpl_1415_Templer_ROCK_Info_13_02");	//Доспехи Стража нужно еще заслужить. А пока могу одолжить тебе набедренную повязку послушника.
	AI_Output(other,self,"Tpl_1415_Templer_ROCK_Info_15_03");	//Все же лучше, чем ничего...
	AI_Output(self,other,"Tpl_1415_Templer_ROCK_Info_13_04");	//Только не подумай, что это бесплатно!
	Info_ClearChoices(tpl_1415_templer_rock);
	Info_AddChoice(tpl_1415_templer_rock,DIALOG_BACK,tpl_1415_templer_rock_back);
	Info_AddChoice(tpl_1415_templer_rock,b_buildbuyarmorstring("Повязка послушника, защита: 15/0/10/0",VALUE_NOV_ARMOR_L),tpl_1415_templer_rock_buy);
};

func void tpl_1415_templer_rock_back()
{
	Info_ClearChoices(tpl_1415_templer_rock);
};

func void tpl_1415_templer_rock_buy()
{
	AI_Output(other,self,"Tpl_1415_Templer_ROCK_BUY_15_01");	//Хорошо, я возьму у тебя повязку.
	if(Npc_HasItems(hero,itminugget) < VALUE_NOV_ARMOR_L)
	{
		AI_Output(self,other,"Tpl_1415_Templer_ROCK_BUY_13_02");	//Приходи тогда, когда у тебя будет достаточно руды!
	}
	else
	{
		b_printtrademsg1("Отдано руды: 500");
		AI_Output(self,other,"Tpl_1415_Templer_ROCK_BUY_13_03");	//Эта нехитрая одежда может спасти тебе жизнь!
		b_printtrademsg2("Получена повязка послушника.");
		b_giveinvitems(hero,self,itminugget,VALUE_NOV_ARMOR_L);
		CreateInvItem(self,nov_armor_l);
		b_giveinvitems(self,hero,nov_armor_l,1);
//		AI_EquipArmor(hero,nov_armor_l);
		GOT_NOV_L_ARMOR = TRUE;
	};
};

