
instance TPL_1401_GORNAKOSH_EXIT(C_INFO)
{
	npc = tpl_1401_gornakosh;
	nr = 999;
	condition = tpl_1401_gornakosh_exit_condition;
	information = tpl_1401_gornakosh_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int tpl_1401_gornakosh_exit_condition()
{
	return 1;
};

func void tpl_1401_gornakosh_exit_info()
{
	AI_Output(self,other,"Tpl_1401_GorNaKosh_Exit_Info_13_02");	//Да пробудится Спящий!
	AI_StopProcessInfos(self);
};


instance TPL_1401_GORNAKOSH_SUGGEST(C_INFO)
{
	npc = tpl_1401_gornakosh;
	condition = tpl_1401_gornakosh_suggest_condition;
	information = tpl_1401_gornakosh_suggest_info;
	important = 0;
	permanent = 0;
	description = "Я знаю, где находится логово ползунов...";
};


func int tpl_1401_gornakosh_suggest_condition()
{
	if(Npc_KnowsInfo(hero,grd_263_asghan_open) && !Npc_KnowsInfo(hero,grd_263_asghan_open_now))
	{
		return TRUE;
	};
};

func void tpl_1401_gornakosh_suggest_info()
{
	AI_Output(other,self,"Tpl_1401_GorNaKosh_SUGGEST_Info_15_01");	//Я знаю, где находится логово ползунов, и собираюсь пойти туда, чтобы добыть их слюну для зелья Кор Галома.
	AI_Output(self,other,"Tpl_1401_GorNaKosh_SUGGEST_Info_13_02");	//Мой меч к твоим услугам. Я пойду с тобой.
	AI_Output(other,self,"Tpl_1401_GorNaKosh_SUGGEST_Info_15_03");	//Хорошо. Встретимся у большого прохода.
	Npc_ExchangeRoutine(self,"GATE");
	npc_setpermattitude(self,ATT_FRIENDLY);
	b_givexp(XP_HIREGORNAKOSH);
	b_logentry(CH2_MCEGGS,"Я смог уговорить Стража Гор На Коша защищать ворота вместе с Асгханом. Он будет ждать меня у ворот.");
	AI_StopProcessInfos(self);
};


instance TPL_1401_GORNAKOSH_INFO(C_INFO)
{
	npc = tpl_1401_gornakosh;
	condition = tpl_1401_gornakosh_info_condition;
	information = tpl_1401_gornakosh_info_info;
	important = 0;
	permanent = 1;
	description = "Что ты здесь делаешь?";
};


func int tpl_1401_gornakosh_info_condition()
{
	if(!Npc_KnowsInfo(hero,grd_263_asghan_nest))
	{
		return 1;
	};
};

func void tpl_1401_gornakosh_info_info()
{
	AI_Output(other,self,"Tpl_1401_GorNaKosh_INFO_Info_15_01");	//Что ты здесь делаешь?
	AI_Output(self,other,"Tpl_1401_GorNaKosh_INFO_Info_13_02");	//Я охочусь на ползунов.
	AI_Output(other,self,"Tpl_1401_GorNaKosh_INFO_Info_15_03");	//Ты можешь рассказать мне, как охотиться на ползунов?
	AI_Output(self,other,"Tpl_1401_GorNaKosh_INFO_Info_13_04");	//Что ж, здесь есть только одно правило. Когда ты видишь перед собой ползуна, атакуй его первым так быстро, как только сможешь.
	AI_Output(self,other,"Tpl_1401_GorNaKosh_INFO_Info_13_05");	//Твое бесстрашие и отвага сослужат тебе хорошую службу.
	AI_StopProcessInfos(self);
};


instance TPL_1401_GORNAKOSH_CRAWLER(C_INFO)
{
	npc = tpl_1401_gornakosh;
	condition = tpl_1401_gornakosh_crawler_condition;
	information = tpl_1401_gornakosh_crawler_info;
	important = 0;
	permanent = 1;
	description = "Ты можешь рассказать о ползунах еще что-нибудь?";
};


func int tpl_1401_gornakosh_crawler_condition()
{
	if(Npc_KnowsInfo(hero,tpl_1401_gornakosh_info))
	{
		return 1;
	};
};

func void tpl_1401_gornakosh_crawler_info()
{
	AI_Output(other,self,"Tpl_1401_GorNaKosh_CRAWLER_Info_15_01");	//Ты можешь рассказать о ползунах еще что-нибудь?
	AI_Output(self,other,"Tpl_1401_GorNaKosh_CRAWLER_Info_13_02");	//Их природа - убивать все! Все что движется, - все, что не похоже на них самих.
	AI_Output(self,other,"Tpl_1401_GorNaKosh_CRAWLER_Info_13_03");	//Запомни мои слова, они тебе еще пригодятся.
};


instance TPL_1401_GORNAKOSH_VICTORY(C_INFO)
{
	npc = tpl_1401_gornakosh;
	condition = tpl_1401_gornakosh_victory_condition;
	information = tpl_1401_gornakosh_victory_info;
	important = 0;
	permanent = 0;
	description = "Я нашел логово ползунов!";
};


func int tpl_1401_gornakosh_victory_condition()
{
	if(Npc_HasItems(hero,itat_crawlerqueen) > 3)
	{
		return TRUE;
	};
};

func void tpl_1401_gornakosh_victory_info()
{
	AI_Output(other,self,"Tpl_1401_GorNaKosh_VICTORY_Info_15_01");	//Я нашел логово ползунов!
	AI_Output(self,other,"Tpl_1401_GorNaKosh_VICTORY_Info_13_02");	//Отлично! Теперь иди в лагерь и расскажи об окончании своей миссии. Кор Галом ждет тебя.
	b_logentry(CH2_MCEGGS,"Я должен отнести Кор Галому яйца ползунов. Он уже давно ждет моего возвращения.");
};

