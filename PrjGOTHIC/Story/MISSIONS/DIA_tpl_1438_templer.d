
instance TPL_1438_TEMPLER_EXIT(C_INFO)
{
	npc = tpl_1438_templer;
	nr = 999;
	condition = tpl_1438_templer_exit_condition;
	information = tpl_1438_templer_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int tpl_1438_templer_exit_condition()
{
	return 1;
};

func void tpl_1438_templer_exit_info()
{
	AI_Output(other,self,"Tpl_1438_Templer_Exit_Info_15_01");	//Увидимся.
	AI_Output(self,other,"Tpl_1438_Templer_Exit_Info_13_02");	//Да пробудится Спящий!
	AI_StopProcessInfos(self);
};


instance TPL_1438_TEMPLER_INFO(C_INFO)
{
	npc = tpl_1438_templer;
	condition = tpl_1438_templer_info_condition;
	information = tpl_1438_templer_info_info;
	important = 0;
	permanent = 0;
	description = "Что могут Стражи делать в этой шахте?";
};


func int tpl_1438_templer_info_condition()
{
	if(CORKALOM_BRINGMCQBALLS != LOG_RUNNING)
	{
		return TRUE;
	};
};

func void tpl_1438_templer_info_info()
{
	AI_Output(other,self,"Tpl_1438_Templer_INFO_Info_15_01");	//Что могут Стражи делать в этой шахте?
	AI_Output(self,other,"Tpl_1438_Templer_INFO_Info_13_02");	//Охотятся на ползунов. Тебе лучше бы идти в лагерь - жизнь целее будет.
};


instance TPL_1438_TEMPLER_WHY(C_INFO)
{
	npc = tpl_1438_templer;
	condition = tpl_1438_templer_why_condition;
	information = tpl_1438_templer_why_info;
	important = 0;
	permanent = 0;
	description = "А зачем вы охотитесь на ползунов?";
};


func int tpl_1438_templer_why_condition()
{
	if(Npc_KnowsInfo(hero,tpl_1438_templer_info))
	{
		return 1;
	};
};

func void tpl_1438_templer_why_info()
{
	AI_Output(other,self,"Tpl_1438_Templer_WHY_Info_15_01");	//А зачем вы охотитесь на ползунов?
	AI_Output(self,other,"Tpl_1438_Templer_WHY_Info_13_02");	//Челюсти - вот, что нам надо. В них содержится ценная слюна.
	AI_Output(other,self,"Tpl_1438_Templer_WHY_Info_15_03");	//Что она из себя представляет?
	AI_Output(self,other,"Tpl_1438_Templer_WHY_Info_13_04");	//Яд. Но Кор Галом знает, как из него приготовить эликсир.
};


instance TPL_1438_TEMPLER_KALOM(C_INFO)
{
	npc = tpl_1438_templer;
	condition = tpl_1438_templer_kalom_condition;
	information = tpl_1438_templer_kalom_info;
	important = 0;
	permanent = 0;
	description = "Кто такой Кор Галом?";
};


func int tpl_1438_templer_kalom_condition()
{
	if(Npc_KnowsInfo(hero,tpl_1438_templer_why))
	{
		return 1;
	};
};

func void tpl_1438_templer_kalom_info()
{
	AI_Output(other,self,"Tpl_1438_Templer_KALOM_Info_15_01");	//Кто такой Кор Галом?
	AI_Output(self,other,"Tpl_1438_Templer_KALOM_Info_13_02");	//Он один из самых влиятельных особ нашего Братства. Он знает многое, и даже как читать мысли людей.
	AI_Output(self,other,"Tpl_1438_Templer_KALOM_Info_13_03");	//Еще он алхимик. Приготовленные им эликсиры помогают душе говорить со Спящим. Да ты просто загляни в лагерь! У нас всегда рады новичкам!
	AI_Output(other,self,"Tpl_1438_Templer_KALOM_Info_15_04");	//Хорошо, может быть, загляну.
};


instance TPL_1438_TEMPLER_EGGSEARCH(C_INFO)
{
	npc = tpl_1438_templer;
	condition = tpl_1438_templer_eggsearch_condition;
	information = tpl_1438_templer_eggsearch_info;
	important = 0;
	permanent = 0;
	description = "Я ищу логово ползунов.";
};


func int tpl_1438_templer_eggsearch_condition()
{
	if(CORKALOM_BRINGMCQBALLS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void tpl_1438_templer_eggsearch_info()
{
	AI_Output(other,self,"Tpl_1438_Templer_EGGSEARCH_Info_15_01");	//Я ищу логово ползунов.
	AI_Output(self,other,"Tpl_1438_Templer_EGGSEARCH_Info_13_02");	//Думаю, Гор На Вид, Гор На Кош и Гор На Бар знают о ползунах куда больше, чем я. Поговори с ними.
	b_logentry(CH2_MCEGGS,"Я спросил Стража на входе в Старую шахту о логове ползунов. Он посоветовал мне обратиться к Гор На Виду, Гор На Кошу и Гор На Бару. Эти имена, которые они дают своим Стражам, скоро сведут меня с ума!");
};


instance TPL_1438_TEMPLER_ZANGEN(C_INFO)
{
	npc = tpl_1438_templer;
	condition = tpl_1438_templer_zangen_condition;
	information = tpl_1438_templer_zangen_info;
	important = 0;
	permanent = 0;
	description = "Как добывать слюну ползунов?";
};


func int tpl_1438_templer_zangen_condition()
{
	if((Npc_KnowsInfo(hero,tpl_1438_templer_why) || (CORKALOM_BRINGMCQBALLS == LOG_RUNNING)) && (KNOWS_GETMCMANDIBLES == FALSE))
	{
		return TRUE;
	};
};

func void tpl_1438_templer_zangen_info()
{
	AI_Output(other,self,"Tpl_1438_Templer_ZANGEN_Info_15_01");	//Как добывать слюну ползунов?
	AI_Output(self,other,"Tpl_1438_Templer_ZANGEN_Info_13_02");	//Это не такое уж легкое дело, но если хочешь, могу научить.
};


instance TPL_1438_TEMPLER_TEACHZANGEN(C_INFO)
{
	npc = tpl_1438_templer;
	condition = tpl_1438_templer_teachzangen_condition;
	information = tpl_1438_templer_teachzangen_info;
	important = 0;
	permanent = 1;
	description = "Добыча челюстей (1 очко обучения)";
};


func int tpl_1438_templer_teachzangen_condition()
{
	if(Npc_KnowsInfo(hero,tpl_1438_templer_zangen) && (KNOWS_GETMCMANDIBLES == FALSE))
	{
		return TRUE;
	};
};

func void tpl_1438_templer_teachzangen_info()
{
	AI_Output(other,self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_01");	//Ты можешь научить меня добывать слюну ползунов?
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_01");	//Для начала делается глубокий надрез. Но только аккуратно, чтобы не повредить железы, - слюна может попасть тебе на руки.
		AI_Output(other,self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_02");	//Это, наверное, очень опасно.
		AI_Output(self,other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_03");	//А ты как думал. Ты видел когда-нибудь Коргура Трехпалого, всем известного охотника на ползунов? А, погоди, это же было еще до того, как ты появился здесь. Ладно, тогда продолжим...
		AI_Output(self,other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_04");	//Нужно сделать надрез вокруг слюнных желез, оставляя довольно большой промежуток. Теперь ты можешь вынимать их вместе с челюстями. Если будешь делать, как я сказал, проблем не будет.
		KNOWS_GETMCMANDIBLES = TRUE;
		Log_CreateTopic(GE_ANIMALTROPHIES,LOG_NOTE);
		b_logentry(GE_ANIMALTROPHIES,"Навык добычи челюстей ползунов.");
		PrintScreen("Навык: добыча челюстей ползунов",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		PrintScreen("Недостаточно очков обучения!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		b_say(self,other,"$NOLEARNNOPOINTS");
	};
};

