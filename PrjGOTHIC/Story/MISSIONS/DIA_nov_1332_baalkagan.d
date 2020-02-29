
instance DIA_BAALKAGAN_EXIT(C_INFO)
{
	npc = nov_1332_baalkagan;
	nr = 999;
	condition = dia_baalkagan_exit_condition;
	information = dia_baalkagan_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_baalkagan_exit_condition()
{
	return 1;
};

func void dia_baalkagan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAALKAGAN_HELLO(C_INFO)
{
	npc = nov_1332_baalkagan;
	nr = 1;
	condition = dia_baalkagan_hello_condition;
	information = dia_baalkagan_hello_info;
	permanent = 0;
	description = "Ты пришел из Лагеря Сектантов?";
};


func int dia_baalkagan_hello_condition()
{
	if(!c_npcbelongstopsicamp(hero))
	{
		return 1;
	};
};

func void dia_baalkagan_hello_info()
{
	AI_Output(other,self,"DIA_BaalKagan_Hello_15_00");	//Ты пришел из Лагеря сектантов?
	AI_Output(self,other,"DIA_BaalKagan_Hello_13_01");	//Мы называем его лагерем Братства.
	AI_Output(self,other,"DIA_BaalKagan_Hello_13_02");	//Меня зовут Идол Каган. Да пребудет с тобой Спящий!
};


instance DIA_BAALKAGAN_HELLO_2(C_INFO)
{
	npc = nov_1332_baalkagan;
	nr = 1;
	condition = dia_baalkagan_hello_2_condition;
	information = dia_baalkagan_hello_2_info;
	permanent = 0;
	description = "Привет!";
};


func int dia_baalkagan_hello_2_condition()
{
	if(c_npcbelongstopsicamp(hero) && !Npc_KnowsInfo(hero,dia_baalkagan_hello))
	{
		return 1;
	};
};

func void dia_baalkagan_hello_2_info()
{
	AI_Output(other,self,"DIA_Grd_217_First_15_00");	//Привет!
	AI_Output(other,self,"DIA_Raven_Who_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_BaalKagan_Hello_13_02");	//Меня зовут Идол Каган. Да пребудет с тобой Спящий!
};


instance DIA_BAALKAGAN_WHYHERE(C_INFO)
{
	npc = nov_1332_baalkagan;
	nr = 1;
	condition = dia_baalkagan_whyhere_condition;
	information = dia_baalkagan_whyhere_info;
	permanent = 0;
	description = "А что ты здесь делаешь?";
};


func int dia_baalkagan_whyhere_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalkagan_hello))
	{
		return 1;
	};
};

func void dia_baalkagan_whyhere_info()
{
	AI_Output(other,self,"DIA_BaalKagan_WhyHere_15_00");	//А что ты здесь делаешь?
	AI_Output(self,other,"DIA_BaalKagan_WhyHere_13_01");	//Гуру прислали меня проповедовать учение Спящего среди неверных.
	AI_Output(self,other,"DIA_BaalKagan_WhyHere_13_02");	//Но эти люди ничего не хотят знать о духовном просветлении. Поэтому сейчас я просто продаю болотник.
	AI_Output(self,other,"DIA_BaalKagan_WhyHere_13_03");	//Уж его-то здесь раскупают быстро. Так быстро, что моего болотника здесь всегда не хватает.
	Log_CreateTopic(GE_TRADERNC,LOG_NOTE);
	b_logentry(GE_TRADERNC,"Идол Каган продает болотник ворам и наемникам из Нового лагеря.");
};


instance DIA_BAALKAGAN_TRADE(C_INFO)
{
	npc = nov_1332_baalkagan;
	nr = 800;
	condition = dia_baalkagan_trade_condition;
	information = dia_baalkagan_trade_info;
	permanent = 1;
	description = "Покажи мне свои товары.";
	trade = 1;
};


func int dia_baalkagan_trade_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalkagan_whyhere))
	{
		return 1;
	};
};

func void dia_baalkagan_trade_info()
{
	AI_Output(other,self,"DIA_BaalKagan_TRADE_15_00");	//Покажи мне свои товары.
	AI_Output(self,other,"DIA_BaalKagan_TRADE_13_01");	//Как пожелаешь!
};


instance DIA_BAALKAGAN_ORDERHELP(C_INFO)
{
	npc = nov_1332_baalkagan;
	nr = 2;
	condition = dia_baalkagan_orderhelp_condition;
	information = dia_baalkagan_orderhelp_info;
	permanent = 0;
	description = "Почему бы им не послать сюда кого-нибудь еще?";
};


func int dia_baalkagan_orderhelp_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalkagan_whyhere) && KAPITEL < 3)
	{
		return 1;
	};
};

func void dia_baalkagan_orderhelp_info()
{
	AI_Output(other,self,"DIA_BaalKagan_OrderHelp_15_00");	//Почему бы им не послать сюда кого-нибудь еще?
	AI_Output(self,other,"DIA_BaalKagan_OrderHelp_13_01");	//У меня есть здесь помощник. Идол Исидро. Но он целыми днями пропадает в баре на озере, где пропивает весь свой болотник.
	AI_Output(self,other,"DIA_BaalKagan_OrderHelp_13_02");	//Его больше привлекает шнапс, чем служение Спящему. От него мне никакой помощи.
	AI_Output(other,self,"DIA_BaalKagan_WannaHelp_15_04");	//Думаю, теперь у тебя никак не получится справиться с этим.
	AI_Output(self,other,"DIA_BaalKagan_WannaHelp_13_05");	//Наши братья позаботятся об Идоле Исидро. Я уже отправил сообщение Кор Галому.
	if(LARES_GET400ORE == LOG_RUNNING)
	{
		Log_CreateTopic(CH1_DEALERJOB,LOG_MISSION);
		Log_SetTopicStatus(CH1_DEALERJOB,LOG_RUNNING);
		b_logentry(CH1_DEALERJOB,"Идол Каган жалуется, что Идол Исидро весь день сидит в баре на озере и пьянствует.");
	};
};


instance DIA_BAALKAGAN_WANNAHELP(C_INFO)
{
	npc = nov_1332_baalkagan;
	nr = 3;
	condition = dia_baalkagan_wannahelp_condition;
	information = dia_baalkagan_wannahelp_info;
	permanent = 0;
	description = "Я могу помочь тебе продавать здесь болотник.";
};


func int dia_baalkagan_wannahelp_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalkagan_whyhere))
	{
		return 1;
	};
};

func void dia_baalkagan_wannahelp_info()
{
	AI_Output(other,self,"DIA_BaalKagan_WannaHelp_15_00");	//Я могу помочь тебе продавать здесь болотник.
	AI_Output(self,other,"DIA_BaalKagan_WannaHelp_13_01");	//Я не могу доверить это важное дело незнакомому человеку. Только одному из наших последователей могу позволить это.
	AI_Output(self,other,"DIA_BaalKagan_WannaHelp_13_02");	//Но и твоя помощь может мне пригодиться.
	AI_Output(self,other,"DIA_BaalKagan_WannaHelp_13_03");	//В этом лагере не все еще знают о болотнике. Попробовав его один раз, они будут приходить ко мне еще и еще. Спрос на него повысится.
};


instance DIA_BAALKAGAN_WASDRIN(C_INFO)
{
	npc = nov_1332_baalkagan;
	nr = 3;
	condition = dia_baalkagan_wasdrin_condition;
	information = dia_baalkagan_wasdrin_info;
	permanent = 0;
	description = "А что я получу, если раздам твой болотник?";
};


func int dia_baalkagan_wasdrin_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalkagan_wannahelp))
	{
		return 1;
	};
};

func void dia_baalkagan_wasdrin_info()
{
	AI_Output(other,self,"DIA_BaalKagan_WasDrin_15_00");	//А что я получу, если раздам твой болотник?
	AI_Output(self,other,"DIA_BaalKagan_WasDrin_13_01");	//Я сумею щедро наградить тебя.
	AI_Output(self,other,"DIA_BaalKagan_WasDrin_13_02");	//Ты можешь взять у меня свитки, хранящие тайную магию Спящего.
	if((Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2))
	{
		AI_Output(self,other,"DIA_BaalKagan_WasDrin_13_03");	//Еще я могу помочь тебе вступить в наше Братство, если ты этого пожелаешь. У меня хорошие отношения с Кор Галомом и Идолом Тионом, которые отвечают за прием послушников.
		AI_Output(self,other,"DIA_BaalKagan_WasDrin_13_04");	//Юберион прислушивается к их советам.
	};
	AI_Output(self,other,"DIA_BaalKagan_WasDrin_13_05");	//Если все это тебе не по нраву, ты можешь выбрать руду. Тогда я заплачу тебе 100 кусков за твои старания.
};


var int baalkagan_verteilkraut;

instance DIA_BAALKAGAN_GIMMEKRAUT(C_INFO)
{
	npc = nov_1332_baalkagan;
	nr = 3;
	condition = dia_baalkagan_gimmekraut_condition;
	information = dia_baalkagan_gimmekraut_info;
	permanent = 0;
	description = "Хорошо. Давай болотник. Кому его нужно раздать?";
};


func int dia_baalkagan_gimmekraut_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalkagan_wasdrin))
	{
		return 1;
	};
};

func void dia_baalkagan_gimmekraut_info()
{
	AI_Output(other,self,"DIA_BaalKagan_GimmeKraut_15_00");	//Хорошо. Давай болотник. Кому его нужно раздать?
	b_printtrademsg1("Получено 10 'Новичков'.");
	AI_Output(self,other,"DIA_BaalKagan_GimmeKraut_13_01");	//Думаю, тебе легко удастся найти тех, кто возьмет у тебя болотник. Но каждый из них может получить только одну сигарету, не больше.
	AI_Output(self,other,"DIA_BaalKagan_GimmeKraut_13_02");	//И еще: если кто-то заберет у тебя этот болотник или ты сам его используешь, то можешь считать, что мы ни о чем не договаривались.
	AI_Output(other,self,"DIA_BaalKagan_GimmeKraut_15_03");	//Конечно.
	BAALKAGAN_VERTEILKRAUT = LOG_RUNNING;
	Log_CreateTopic(CH1_SPREADJOINTS,LOG_MISSION);
	Log_SetTopicStatus(CH1_SPREADJOINTS,LOG_RUNNING);
	b_logentry(CH1_SPREADJOINTS,"Послушник Идол Каган дал мне десять порций болотника, чтобы я раздал его людям в лагере.");
	CreateInvItems(self,itmijoint_1,10);
	b_giveinvitems(self,hero,itmijoint_1,10);
};


instance DIA_BAALKAGAN_SUCCESS(C_INFO)
{
	npc = nov_1332_baalkagan;
	nr = 3;
	condition = dia_baalkagan_success_condition;
	information = dia_baalkagan_success_info;
	permanent = 1;
	description = "Я раздал весь болотник.";
};


func int dia_baalkagan_success_condition()
{
	if(BAALKAGAN_VERTEILKRAUT == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_baalkagan_success_info()
{
	AI_Output(other,self,"DIA_BaalKagan_SUCCESS_15_00");	//Я раздал весь болотник.
	if(NC_JOINTS_VERTEILT >= 8)
	{
		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_13_01");	//У меня уже побывали новые покупатели, ты хорошо справился со своей задачей.
		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_13_02");	//Как я могу отблагодарить тебя?
		Info_ClearChoices(dia_baalkagan_success);
		Info_AddChoice(dia_baalkagan_success,"Дай мне сто кусков руды.",dia_baalkagan_success_erz);
		if((Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2))
		{
			Info_AddChoice(dia_baalkagan_success,"Помоги мне присоединиться к Братству.",dia_baalkagan_success_join);
		};
		Info_AddChoice(dia_baalkagan_success,"Ты говорил что-то о магических свитках. Расскажи о них.",dia_baalkagan_success_whatspells);
		BAALKAGAN_VERTEILKRAUT = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_SPREADJOINTS,LOG_SUCCESS);
		b_logentry(CH1_SPREADJOINTS,"У Идола Кагана появились новые покупатели, а я получил свою награду.");
		b_givexp(XP_DISTRIBUTEDWEEDFORKAGAN);
	}
	else
	{
		AI_Output(self,other,"DIA_BaalKagan_NO_SUCCESS_13_00");	//Я еще не видел новых покупателей. Кажется, ты раздал не все.
	};
};

func void dia_baalkagan_success_whatspells()
{
	AI_Output(other,self,"DIA_BaalKagan_SUCCESS_WhatSpells_15_00");	//Ты говорил что-то о магических свитках. Расскажи о них поподробнее.
	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_WhatSpells_13_01");	//Кулак ветра, Чары, Телекинез, Пирокинез и Сон. Ты можешь выбрать три свитка.
	Info_AddChoice(dia_baalkagan_success,"Я возьму магические свитки.",dia_baalkagan_success_takescrolls);
};

func void dia_baalkagan_success_join()
{
	Info_ClearChoices(dia_baalkagan_success);
	AI_Output(other,self,"DIA_BaalKagan_SUCCESS_Join_15_00");	//Помоги мне присоединиться к Братству.
	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_Join_13_01");	//Твоя скромность похвальна. Я помогу тебе, слушай же. Идол Тион является одним из младших Гуру нашего Братства.
	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_Join_13_02");	//Недавно Юберион назначил его своим советником. Но от этого его поведение только ухудшилось.
	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_Join_13_03");	//Теперь он гордится собой, как никогда, и поэтому не разговаривает ни с кем, кроме своих учеников.
	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_Join_13_04");	//Если ты передашь ему эту вещь, он сделает для тебя исключение.
	b_printtrademsg1("Получен улучшенный 'Зов мечты'.");
	CreateInvItem(self,specialjoint);
	b_giveinvitems(self,other,specialjoint,1);
	Log_CreateTopic(CH1_JOINPSI,LOG_MISSION);
	Log_SetTopicStatus(CH1_JOINPSI,LOG_RUNNING);
	b_logentry(CH1_JOINPSI,"Идол Каган дал мне для Идола Тиона улучшенный 'Зов мечты'. Это поможет мне вступить в Братство Спящего.");
};

func void dia_baalkagan_success_erz()
{
	AI_Output(other,self,"DIA_BaalKagan_SUCCESS_Erz_15_00");	//Дай мне сто кусков руды.
	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_Erz_13_01");	//Ты сделал выбор. Бери.
	b_printtrademsg1("Получено руды: 100");
	CreateInvItems(self,itminugget,100);
	b_giveinvitems(self,other,itminugget,100);
	Info_ClearChoices(dia_baalkagan_success);
};

func void dia_baalkagan_success_takescrolls()
{
	AI_Output(other,self,"DIA_BaalKagan_SUCCESS_TakeScrolls_15_00");	//Я возьму магические свитки.
	AI_Output(self,other,"DIA_BaalKagan_SUCCESS_TakeScrolls_13_01");	//Ты принял хорошее решение. Выбирай три свитка.
	Info_ClearChoices(dia_baalkagan_success);
	Info_AddChoice(dia_baalkagan_success,"Кулак ветра",dia_baalkagan_success_takescrolls_windfaust);
	Info_AddChoice(dia_baalkagan_success,"Телекинез",dia_baalkagan_success_takescrolls_telekinese);
	Info_AddChoice(dia_baalkagan_success,"Пирокинез",dia_baalkagan_success_takescrolls_pyrokinese);
	Info_AddChoice(dia_baalkagan_success,"Сон",dia_baalkagan_success_takescrolls_schlaf);
	Info_AddChoice(dia_baalkagan_success,"Чары",dia_baalkagan_success_takescrolls_charme);
};


var int baalkagan_drei;

func void dia_baalkagan_success_takescrolls_windfaust()
{
	b_printtrademsg1("Получен свиток кулака ветра.");
	CreateInvItem(self,itarscrollwindfist);
	b_giveinvitems(self,hero,itarscrollwindfist,1);
	BAALKAGAN_DREI = BAALKAGAN_DREI + 1;
	if(BAALKAGAN_DREI >= 3)
	{
		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00");	//Ты взял три свитка. Используй их с умом.
		Info_ClearChoices(dia_baalkagan_success);
	};
};

func void dia_baalkagan_success_takescrolls_telekinese()
{
	b_printtrademsg1("Получен свиток телекинеза.");
	CreateInvItem(self,itarscrolltelekinesis);
	b_giveinvitems(self,hero,itarscrolltelekinesis,1);
	BAALKAGAN_DREI = BAALKAGAN_DREI + 1;
	if(BAALKAGAN_DREI >= 3)
	{
		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00");	//Ты взял три свитка. Используй их с умом.
		Info_ClearChoices(dia_baalkagan_success);
	};
};

func void dia_baalkagan_success_takescrolls_pyrokinese()
{
	b_printtrademsg1("Получен свиток пирокинеза.");
	CreateInvItem(self,itarscrollpyrokinesis);
	b_giveinvitems(self,hero,itarscrollpyrokinesis,1);
	BAALKAGAN_DREI = BAALKAGAN_DREI + 1;
	if(BAALKAGAN_DREI >= 3)
	{
		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00");	//Ты взял три свитка. Используй их с умом.
		Info_ClearChoices(dia_baalkagan_success);
	};
};

func void dia_baalkagan_success_takescrolls_schlaf()
{
	b_printtrademsg1("Получен свиток сна.");
	CreateInvItem(self,itarscrollsleep);
	b_giveinvitems(self,hero,itarscrollsleep,1);
	BAALKAGAN_DREI = BAALKAGAN_DREI + 1;
	if(BAALKAGAN_DREI >= 3)
	{
		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00");	//Ты взял три свитка. Используй их с умом.
		Info_ClearChoices(dia_baalkagan_success);
	};
};

func void dia_baalkagan_success_takescrolls_charme()
{
	b_printtrademsg1("Получен свиток чар.");
	CreateInvItem(self,itarscrollcharm);
	b_giveinvitems(self,hero,itarscrollcharm,1);
	BAALKAGAN_DREI = BAALKAGAN_DREI + 1;
	if(BAALKAGAN_DREI >= 3)
	{
		AI_Output(self,other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00");	//Ты взял три свитка. Используй их с умом.
		Info_ClearChoices(dia_baalkagan_success);
	};
};

