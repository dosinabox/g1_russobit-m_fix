
instance INFO_SATURAS_EXIT(C_INFO)
{
	npc = kdw_600_saturas;
	nr = 999;
	condition = info_saturas_exit_condition;
	information = info_saturas_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_saturas_exit_condition()
{
	return 1;
};

func void info_saturas_exit_info()
{
	AI_Output(self,other,"Info_Saturas_EXIT_14_01");	//Надеюсь, у тебя все получится!
	AI_StopProcessInfos(self);
};


instance INFO_SATURAS_INTRUDER(C_INFO)
{
	npc = kdw_600_saturas;
	nr = 1;
	condition = info_saturas_intruder_condition;
	information = info_saturas_intruder_info;
	permanent = 1;
	important = 1;
};


func int info_saturas_intruder_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KAPITEL < 3))
	{
		return 1;
	};
};

func void info_saturas_intruder_info()
{
	AI_Output(self,other,"Info_Saturas_Intruder_14_00");	//Что ты здесь делаешь? Тебе сюда нельзя! Уходи!
	AI_StopProcessInfos(self);
};


instance INFO_SATURAS_NEWS(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_news_condition;
	information = info_saturas_news_info;
	permanent = 0;
	important = 0;
	description = "У меня есть важные новости из лагеря Братства!";
};


func int info_saturas_news_condition()
{
	if((CORANGAR_SENDTONC == TRUE) && Npc_KnowsInfo(hero,info_cronos_sleeper))
	{
		return TRUE;
	};
};

func void info_saturas_news_info()
{
	AI_Output(other,self,"Info_Saturas_NEWS_15_01");	//У меня есть важные новости из лагеря Братства!
	AI_Output(self,other,"Info_Saturas_NEWS_14_02");	//Если тебе сам Кронос дал разрешение на встречу со мной, значит, случилось что-то действительно важное!
};


instance INFO_SATURAS_YBERION(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_yberion_condition;
	information = info_saturas_yberion_info;
	permanent = 0;
	important = 0;
	description = "Юберион умер! Это случилось после Церемонии вызова Спящего!";
};


func int info_saturas_yberion_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_news))
	{
		return TRUE;
	};
};

func void info_saturas_yberion_info()
{
	AI_Output(other,self,"Info_Saturas_YBERION_15_01");	//Юберион умер! Это случилось после великой Церемонии вызова Спящего!
	AI_Output(self,other,"Info_Saturas_YBERION_14_02");	//Это худшая новость из всех возможных.
	AI_Output(self,other,"Info_Saturas_YBERION_14_03");	//Кто же возглавил братство? Не этот ли безумный властолюбец Кор Галом?
	AI_Output(other,self,"Info_Saturas_YBERION_15_04");	//Нет! Кор Галом отвернулся от Братства. Он взял с собой нескольких Стражей и ушел неизвестно куда.
	AI_Output(self,other,"Info_Saturas_YBERION_14_05");	//Как странно! Он же должен был стать преемником Юбериона!
	AI_Output(other,self,"Info_Saturas_YBERION_15_06");	//Эти события убедили Гуру в том, что они ошиблись, избрав Спящего своим богом. Он оказался злым демоном.
	AI_Output(other,self,"Info_Saturas_YBERION_15_07");	//Один из Гуру попытался убить меня, подпав под влияние Спящего, хотя перед этим я спас ему жизнь.
	AI_Output(other,self,"Info_Saturas_YBERION_15_08");	//Кор Галом был единственным Гуру, который не отказался от своей веры в Спящего, несмотря на его истинную природу. Поэтому он покинул Болотный лагерь.
	AI_Output(self,other,"Info_Saturas_YBERION_14_09");	//Все ясно! Что ж, я думаю, это к лучшему. Кор Ангар хороший человек, строгий, но честный.
	AI_Output(self,other,"Info_Saturas_YBERION_14_10");	//Если кому-нибудь и удастся наладить ситуацию в Братстве после такой духовной катастрофы, то только ему.
	b_logentry(CH3_ESCAPEPLANNC,"Я сообщил Сатурасу о событиях в Болотном лагере. Он обрадовался тому, что теперь Братство будет возглавлять Кор Ангар, а не Кор Галом.");
};


instance INFO_SATURAS_BOOK(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_book_condition;
	information = info_saturas_book_info;
	permanent = 0;
	important = 0;
	description = "У меня есть альманах...";
};


func int info_saturas_book_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_yberion) && Npc_HasItems(hero,itwrfokusbuch))
	{
		return TRUE;
	};
};

func void info_saturas_book_info()
{
	AI_Output(other,self,"Info_Saturas_BOOK_15_01");	//У меня есть альманах...
	AI_Output(other,self,"Info_Saturas_BOOK_15_02");	//Юберион использовал его для того, чтобы зарядить юнитор.
	AI_Output(self,other,"Info_Saturas_BOOK_14_03");	//Очень хорошо. Нам понадобится эта книга, чтобы зарядить все пять камней-юниторов.
	AI_Output(self,other,"Info_Saturas_BOOK_14_04");	//Я возьму ее!
	b_giveinvitems(hero,self,itwrfokusbuch,1);
	Npc_RemoveInvItem(self,itwrfokusbuch);
	b_givexp(XP_DELIVERBOOKTOSATURAS);
};


instance INFO_SATURAS_FOCUS(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_focus_condition;
	information = info_saturas_focus_info;
	permanent = 0;
	important = 0;
	description = "У меня есть один юнитор...";
};


func int info_saturas_focus_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_yberion) && Npc_HasItems(hero,focus_1))
	{
		return TRUE;
	};
};

func void info_saturas_focus_info()
{
	AI_Output(other,self,"Info_Saturas_FOCUS_15_01");	//У меня есть один юнитор...
	AI_Output(self,other,"Info_Saturas_FOCUS_14_02");	//У тебя есть ключ, с помощью которого мы разрушим наши оковы.
	AI_Output(self,other,"Info_Saturas_FOCUS_14_03");	//Это один из камней-юниторов, который помог создать магический Барьер.
	AI_Output(self,other,"Info_Saturas_FOCUS_14_04");	//Если объединить все пять камней, то мы сможем пробить эту магическую стену.
	AI_Output(other,self,"Info_Saturas_FOCUS_15_05");	//Но для этого нам понадобится вся наша магическая сила!
	AI_Output(self,other,"Info_Saturas_FOCUS_14_06");	//Ты прав. Именно с этой целью мы собирали руду, а не отдавали ее королю в обмен на какие-то безделушки.
	AI_Output(self,other,"Info_Saturas_FOCUS_14_07");	//Как ты уже знаешь, каждый кусок руды содержит немного магической энергии. Всей энергии этой горы должно хватить на то, чтобы разрушить Барьер.
	AI_Output(other,self,"Info_Saturas_FOCUS_15_08");	//Кажется, это будет опасно.
	AI_Output(self,other,"Info_Saturas_FOCUS_14_09");	//Это будет не обычный взрыв, а магический. Он изменит только то, что имеет магическую природу. Для людей он не представляет никакой угрозы.
	AI_Output(other,self,"Info_Saturas_FOCUS_15_10");	//Вот, возьми юнитор. Надеюсь, он поможет нам выйти на свободу.
	b_giveinvitems(hero,self,focus_1,1);
	Npc_RemoveInvItem(self,focus_1);
	b_givexp(XP_DELIVERFOCUSTOSATURAS);
};


instance INFO_SATURAS_WHATNOW(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_whatnow_condition;
	information = info_saturas_whatnow_info;
	permanent = 0;
	important = 0;
	description = "Ты используешь юнитор и альманах прямо сейчас?";
};


func int info_saturas_whatnow_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_focus) && Npc_KnowsInfo(hero,info_saturas_book))
	{
		return TRUE;
	};
};

func void info_saturas_whatnow_info()
{
	AI_Output(other,self,"Info_Saturas_WHATNOW_15_01");	//Ты используешь юнитор и альманах прямо сейчас?
	AI_Output(self,other,"Info_Saturas_WHATNOW_14_03");	//До этого еще далеко. Мне нужны остальные камни-юниторы.
	AI_Output(self,other,"Info_Saturas_WHATNOW_14_04");	//К сожалению, их у нас еще нет.
};


instance INFO_SATURAS_OFFER(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_offer_condition;
	information = info_saturas_offer_info;
	permanent = 0;
	important = 0;
	description = "Я помогу тебе найти эти четыре камня.";
};


func int info_saturas_offer_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_whatnow))
	{
		return TRUE;
	};
};

func void info_saturas_offer_info()
{
	AI_Output(other,self,"Info_Saturas_OFFER_15_01");	//Я помогу тебе найти эти четыре камня.
	AI_Output(other,self,"Info_Saturas_OFFER_15_02");	//Ведь я и сам хочу выбраться отсюда.
	AI_Output(self,other,"Info_Saturas_OFFER_14_03");	//Ты должен знать, что эти поиски будут и трудными, и опасными.
	AI_Output(self,other,"Info_Saturas_OFFER_14_04");	//А так как наши отношения со Старым лагерем сейчас ухудшились, я не смогу дать тебе в помощь ни одного человека.
	AI_Output(self,other,"Info_Saturas_OFFER_14_05");	//Тебе придется положиться только на свои силы.
	AI_Output(other,self,"Info_Saturas_OFFER_15_06");	//Что ж... переживу. Я уже привык делать все сам.
	AI_Output(self,other,"Info_Saturas_OFFER_14_07");	//Твоя уверенность похвальна, но кое-что тебе все же может пригодиться.
	AI_Output(self,other,"Info_Saturas_OFFER_14_08");	//Возьми это карту. Она довольно старая, поэтому на ней можно найти места, в которых располагались юниторы до того, как мы создали этот Барьер.
	AI_Output(self,other,"Info_Saturas_OFFER_14_09");	//Тебе понадобится это заклинание, оно поможет быстрее вернуться в лагерь.
	AI_Output(self,other,"Info_Saturas_OFFER_14_10");	//И еще: поговори с Риорданом. Он готовит для нас зелья.
	AI_Output(self,other,"Info_Saturas_OFFER_14_11");	//Его дом ты найдешь на верхнем уровне.
	b_story_bringfoci();
};

func void b_deliverfocus()
{
	if(SATURAS_BRINGFOCI == 1)
	{
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_01");	//Хм, хорошее начало! Не ожидал.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_02");	//Но нужно найти еще три камня.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_03");	//Иди и попытайся их раздобыть.
		SATURAS_BRINGFOCI = 2;
		b_givexp(XP_DELIVERSECONDFOCUS);
	}
	else if(SATURAS_BRINGFOCI == 2)
	{
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_04");	//Хорошо, это уже второй камень. 
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_05");	//Скоро мы сможем осуществить наш план.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_06");	//Смело иди вперед и достань нам еще два камня.
		SATURAS_BRINGFOCI = 3;
		b_givexp(XP_DELIVERTHIRDFOCUS);
	}
	else if(SATURAS_BRINGFOCI == 3)
	{
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_07");	//Невероятно! У нас есть целых четыре камня!
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_08");	//Нам не хватает всего одного. Когда их будет пять, мы сможем приступить к делу.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_09");	//Ты оказал нам неоценимую услугу. Но найди нам последний камень, и мы сможем освободиться из этой тюрьмы.
		SATURAS_BRINGFOCI = 4;
		b_givexp(XP_DELIVERFOURTHFOCUS);
	}
	else if(SATURAS_BRINGFOCI == 4)
	{
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_10");	//Отлично! У нас есть все пять камней!
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_11");	//Наш лагерь в неоплатном долгу перед тобой. Ты заслуживаешь мою вечную благодарность.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_12");	//Сходи к Риордану. Конечно, его награда будет мала по сравнению с тем, что ты сделал для нас, но она того стоит.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_13");	//Кронос тоже хотел тебя видеть. Он приготовил тебе небольшой подарок.
		SATURAS_BRINGFOCI = 5;
		b_givexp(XP_DELIVERFIFTHFOCUS);
		b_logentry(CH3_BRINGFOCI,"Мне удалось найти все четыре юнитора. Сатурас доволен, как никогда. Ну, на этот раз мне удалось сделать что-то действительно полезное...");
		b_logentry(CH3_BRINGFOCI,"У Кроноса и Риордана есть для меня небольшие подарки за то, что я нашел юниторы. Мне стоит встретиться с ними.");
		Log_SetTopicStatus(CH3_MONASTERYRUIN,LOG_SUCCESS);
		Log_SetTopicStatus(CH3_STONEHENGE,LOG_SUCCESS);
		Log_SetTopicStatus(CH3_FORTRESS,LOG_SUCCESS);
		Log_SetTopicStatus(CH3_TROLLCANYON,LOG_SUCCESS);
	};
	if(!Npc_HasItems(hero,itarscrollteleport2) && (SATURAS_BRINGFOCI < 5))
	{
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_14");	//Ты прочитал заклинание телепортации, как я вижу. Возьми еще одно, вдруг пригодится.
		CreateInvItem(self,itarscrollteleport2);
		b_giveinvitems(self,other,itarscrollteleport2,1);
	};
};


instance INFO_SATURAS_BRINGFOCUS2(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_bringfocus2_condition;
	information = info_saturas_bringfocus2_info;
	permanent = 0;
	important = 0;
	description = "Я нашел юнитор в ущелье троллей!";
};


func int info_saturas_bringfocus2_condition()
{
	if(Npc_HasItems(hero,focus_2) && (SATURAS_BRINGFOCI > 0))
	{
		return TRUE;
	};
};

func void info_saturas_bringfocus2_info()
{
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS2_15_01");	//Я нашел юнитор в ущелье троллей!
	b_logentry(CH3_TROLLCANYON,"Я отдал Сатурасу юнитор из ущелья тролля.");
	Log_SetTopicStatus(CH3_TROLLCANYON,LOG_SUCCESS);
	b_giveinvitems(hero,self,focus_2,1);
	Npc_RemoveInvItem(self,focus_2);
	b_deliverfocus();
};


instance INFO_SATURAS_BRINGFOCUS3(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_bringfocus3_condition;
	information = info_saturas_bringfocus3_info;
	permanent = 0;
	important = 0;
	description = "В горном форте я нашел один из юниторов.";
};


func int info_saturas_bringfocus3_condition()
{
	if(Npc_HasItems(hero,focus_3) && (SATURAS_BRINGFOCI > 0))
	{
		return TRUE;
	};
};

func void info_saturas_bringfocus3_info()
{
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS3_15_01");	//В горном форте я нашел один из юниторов.
	b_logentry(CH3_FORTRESS,"Теперь у Сатураса есть юнитор из горного форта.");
	Log_SetTopicStatus(CH3_FORTRESS,LOG_SUCCESS);
	b_giveinvitems(hero,self,focus_3,1);
	Npc_RemoveInvItem(hero,focus_3);
	b_deliverfocus();
};


instance INFO_SATURAS_BRINGFOCUS4(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_bringfocus4_condition;
	information = info_saturas_bringfocus4_info;
	permanent = 0;
	important = 0;
	description = "Я нашел один из юниторов в разрушенном монастыре!";
};


func int info_saturas_bringfocus4_condition()
{
	if(Npc_HasItems(hero,focus_4) && (SATURAS_BRINGFOCI > 0))
	{
		return TRUE;
	};
};

func void info_saturas_bringfocus4_info()
{
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS4_15_01");	//Я нашел один из юниторов в разрушенном монастыре!
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS4_15_02");	//Там я встретил наемника Горна, и он помог мне в поисках.
	b_logentry(CH3_MONASTERYRUIN,"Мне удалось принести Сатурасу юнитор из развалин монастыря.");
	Log_SetTopicStatus(CH3_MONASTERYRUIN,LOG_SUCCESS);
	b_giveinvitems(hero,self,focus_4,1);
	Npc_RemoveInvItem(hero,focus_4);
	b_deliverfocus();
};


instance INFO_SATURAS_BRINGFOCUS5(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_bringfocus5_condition;
	information = info_saturas_bringfocus5_info;
	permanent = 0;
	important = 0;
	description = "Я нашел юнитор в гробнице под каменным кольцом!";
};


func int info_saturas_bringfocus5_condition()
{
	if(Npc_HasItems(hero,focus_5) && (SATURAS_BRINGFOCI > 0))
	{
		return TRUE;
	};
};

func void info_saturas_bringfocus5_info()
{
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS5_15_01");	//Я нашел юнитор в гробнице под каменным кольцом!
	b_logentry(CH3_STONEHENGE,"Я принес Сатурасу юнитор из склепа под кругом камней.");
	Log_SetTopicStatus(CH3_STONEHENGE,LOG_SUCCESS);
	b_giveinvitems(hero,self,focus_5,1);
	Npc_RemoveInvItem(hero,focus_5);
	b_deliverfocus();
};


instance INFO_SATURAS_ALLFOCI(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_allfoci_condition;
	information = info_saturas_allfoci_info;
	permanent = 0;
	important = 0;
	description = "Теперь мы можем взорвать рудную гору?";
};


func int info_saturas_allfoci_condition()
{
	if((SATURAS_BRINGFOCI == 5) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void info_saturas_allfoci_info()
{
	AI_Output(other,self,"Info_Saturas_ALLFOCI_15_01");	//Теперь мы можем взорвать рудную гору?
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_02");	//Теперь у нас есть все необходимое, чтобы осуществить задуманное.
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_03");	//Только вот Барьер был сотворен двенадцатью магами.
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_04");	//Чтобы направить эту огромную энергию туда, куда нужно, магов Круга Воды недостаточно.
	AI_Output(other,self,"Info_Saturas_ALLFOCI_15_05");	//Что же здесь можно сделать?
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_06");	//Ты уже сделал для нас очень много, и мы в долгу перед тобой...
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_07");	//... но если ты согласишься на мое предложение, ты спасешь всех жителей этой колонии.
};


instance INFO_SATURAS_FAVOR(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_favor_condition;
	information = info_saturas_favor_info;
	permanent = 0;
	important = 0;
	description = "На какое предложение?";
};


func int info_saturas_favor_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_allfoci))
	{
		return TRUE;
	};
};

func void info_saturas_favor_info()
{
	AI_Output(other,self,"Info_Saturas_FAVOR_15_01");	//На какое предложение?
	AI_Output(self,other,"Info_Saturas_FAVOR_14_02");	//Сходи в Старый лагерь и попытайся уговорить некоторых магов Круга Огня помочь нам.
	AI_Output(other,self,"Info_Saturas_FAVOR_15_03");	//Магов Круга Огня? Не думаю, что они согласятся с твоим предложением.
	AI_Output(other,self,"Info_Saturas_FAVOR_15_04");	//Если Барьер будет разрушен, они лишатся всей своей власти.
	AI_Output(self,other,"Info_Saturas_FAVOR_14_05");	//Именно по этой причине я предлагаю тебе выполнить эту работу. У тебя есть знакомые во всех лагерях.
	AI_Output(self,other,"Info_Saturas_FAVOR_14_06");	//Скажи магам Огня, что мы все еще помним те старые добрые времена, когда мы вместе изучали магическое искусство.
};


instance INFO_SATURAS_ACCEPT(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_accept_condition;
	information = info_saturas_accept_info;
	permanent = 0;
	important = 0;
	description = "Что ж, я попытаюсь уговорить магов Огня.";
};


func int info_saturas_accept_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_favor))
	{
		return TRUE;
	};
};

func void info_saturas_accept_info()
{
	AI_Output(other,self,"Info_Saturas_ACCEPT_15_01");	//Что ж, я попытаюсь уговорить магов Огня.
	AI_Output(other,self,"Info_Saturas_ACCEPT_15_02");	//Но я ничего не обещаю. По-моему, это почти невозможно.
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_03");	//Все же попробуй. Если тебе не удастся это сделать, то останется еще одно...
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_04");	//Лишь одно...
	AI_Output(other,self,"Info_Saturas_ACCEPT_15_05");	//... одно что?
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_06");	//Неважно! Ты должен уговорить их.
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_07");	//Возьми эту руну. Передай ее Корристо, верховному магу Круга Огня. Это знак нашего доверия.
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_08");	//Руна поможет ему перенестись ко мне, минуя стражу.
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_09");	//Думаю, это будет хорошим доказательством нашей дружбы.
	b_kapitelwechsel(4);
};


instance INFO_SATURAS_AMBUSH(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_ambush_condition;
	information = info_saturas_ambush_info;
	permanent = 0;
	important = 1;
};


func int info_saturas_ambush_condition()
{
	if(FMTAKEN && !FINDXARDAS)
	{
		return TRUE;
	};
};

func void info_saturas_ambush_info()
{
	var C_NPC gorn;
	gorn = Hlp_GetNpc(pc_fighter);
	AI_TurnToNPC(gorn,hero);
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_01");	//Хорошо, что ты вернулся. Нас постигло большое несчастье!
	AI_Output(hero,self,"Info_Saturas_AMBUSH_15_02");	//Ну-ка, я попробую угадать, что случилось. Свободная шахта была захвачена стражниками Старого лагеря. Никто не видел, как они подошли к лагерю...
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_03");	//Подожди... а откуда... ну, конечно... ты узнал это еще в Старом лагере!
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_04");	//Прямо перед тобой сюда пришел Горн.
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_05");	//Почему Гомез решился на этот шаг? Почему он захотел выместить на нас всю свою злобу?
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_06");	//Он же должен понимать, что его поступок может вызвать войну в колонии!
};


instance INFO_SATURAS_COLLAPSE(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_collapse_condition;
	information = info_saturas_collapse_info;
	permanent = 0;
	important = 0;
	description = "Старая шахта обрушилась, после того как ее залила вода!";
};


func int info_saturas_collapse_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_ambush))
	{
		return TRUE;
	};
};

func void info_saturas_collapse_info()
{
	AI_Output(hero,self,"Info_Saturas_COLLAPSE_15_01");	//Старая шахта обрушилась, после того как ее залила вода!
	AI_Output(self,hero,"Info_Saturas_COLLAPSE_14_02");	//... Обрушилась... конечно... тогда все понятно.
	AI_Output(self,hero,"Info_Saturas_COLLAPSE_14_03");	//Гомез лишился свой шахты и стал гораздо опаснее. Ему уже терять нечего, так что теперь он способен на все.
};


instance INFO_SATURAS_MURDER(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_murder_condition;
	information = info_saturas_murder_info;
	permanent = 0;
	important = 0;
	description = "Гомез убил всех магов Круга Огня!";
};


func int info_saturas_murder_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_ambush))
	{
		return TRUE;
	};
};

func void info_saturas_murder_info()
{
	AI_Output(hero,self,"Info_Saturas_MURDER_15_01");	//Гомез убил всех магов Круга Огня!
	AI_Output(self,hero,"Info_Saturas_MURDER_14_02");	//Убил всех?! Но зачем? Зачем он это сделал?
	AI_Output(hero,self,"Info_Saturas_MURDER_15_03");	//Они не покорились Гомезу и выступили против нападения на Свободную шахту.
	AI_Output(self,hero,"Info_Saturas_MURDER_14_04");	//Значит, мы обречены. Направлять энергию рудной горы можно только в кругу из двенадцати магов. А нас всего шесть.
	AI_Output(self,hero,"Info_Saturas_MURDER_14_05");	//Несмотря на то, что ты принес эту печальную весть, я благодарю тебя.
	b_givexp(XP_REPORTTOSATURAS);
	b_logentry(CH4_FIREMAGES,"Сатурас был расстроен моим сообщением о последних событиях в Старом лагере. Что будет дальше с его планом разрушения Барьера... Что ж, ему больше не придется рассчитывать на помощью магов Огня.");
	Log_SetTopicStatus(CH4_FIREMAGES,LOG_SUCCESS);
};


instance KDW_600_SATURAS_NOMOREOC(C_INFO)
{
	npc = kdw_600_saturas;
	condition = kdw_600_saturas_nomoreoc_condition;
	information = kdw_600_saturas_nomoreoc_info;
	important = 0;
	permanent = 0;
	description = "Меня изгнали из Старого лагеря за то, что я помог вам!";
};


func int kdw_600_saturas_nomoreoc_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_murder) && ((OLDHEROGUILD == GIL_GRD) || (OLDHEROGUILD == GIL_KDF)))
	{
		return TRUE;
	};
};

func void kdw_600_saturas_nomoreoc_info()
{
	AI_Output(other,self,"KDW_600_Saturas_NOMOREOC_Info_15_01");	//Меня изгнали из Старого лагеря за то, что я помог вам!
	AI_Output(self,other,"KDW_600_Saturas_NOMOREOC_Info_14_02");	//Изгнали из Старого лагеря, говоришь?
	AI_Output(self,other,"KDW_600_Saturas_NOMOREOC_Info_14_03");	//Мы с радостью примем тебя!
	Log_CreateTopic(CH4_BANNEDFROMOC,LOG_MISSION);
	Log_SetTopicStatus(CH4_BANNEDFROMOC,LOG_RUNNING);
	b_logentry(CH4_BANNEDFROMOC,"После того как меня прогнали из Старого лагеря, Сатурас пригласил меня присоединиться к Новому лагерю.");
};


instance KDW_600_SATURAS_GOTOLEE(C_INFO)
{
	npc = kdw_600_saturas;
	condition = kdw_600_saturas_gotolee_condition;
	information = kdw_600_saturas_gotolee_info;
	important = 0;
	permanent = 0;
	description = "Значит ли это, что вы примите меня в наемники?";
};


func int kdw_600_saturas_gotolee_condition()
{
	if((OLDHEROGUILD == GIL_GRD) && Npc_KnowsInfo(hero,kdw_600_saturas_nomoreoc))
	{
		return TRUE;
	};
};

func void kdw_600_saturas_gotolee_info()
{
	AI_Output(other,self,"KDW_600_Saturas_GOTOLEE_Info_15_01");	//Значит ли это, что вы примите меня в наемники?
	AI_Output(self,other,"KDW_600_Saturas_GOTOLEE_Info_14_02");	//Об этом лучше поговорить с Ли. Приходи ко мне, когда этот вопрос будет решен.
	b_logentry(CH4_BANNEDFROMOC,"Ли, лидер наемников, хочет поговорить со мной. После разговора с ним я должен вернуться к Сатурасу.");
};


instance KDW_600_SATURAS_OATH(C_INFO)
{
	npc = kdw_600_saturas;
	condition = kdw_600_saturas_oath_condition;
	information = kdw_600_saturas_oath_info;
	important = 0;
	permanent = 0;
	description = "Значит ли это, что я буду принят в гильдию магов Круга Воды?";
};


func int kdw_600_saturas_oath_condition()
{
	if((OLDHEROGUILD == GIL_KDF) && Npc_KnowsInfo(hero,kdw_600_saturas_nomoreoc))
	{
		return TRUE;
	};
};

func void kdw_600_saturas_oath_info()
{
	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_01");	//Значит ли это, что я буду принят в гильдию магов Круга Воды?
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_02");	//Нет. Сначала ты должен принести клятву воды.
	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_03");	//Но я уже поклялся служить Огню!
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_04");	//Хм...
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_05");	//Твоя клятва Огню не будет нарушена!
	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_06");	//Но... я не понимаю...
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_07");	//К прежней клятве ты принесешь новую и станешь магом двух стихий!
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_08");	//Сила Огня и Знания Воды будут подвластны тебе!
	b_logentry(CH4_BANNEDFROMOC,"Сатурас предложил мне вступить в Круг магов Воды. При этом моя клятва Огню не будет нарушена.");
};


instance KDW_600_SATURAS_KDWAUFNAHME(C_INFO)
{
	npc = kdw_600_saturas;
	condition = kdw_600_saturas_kdwaufnahme_condition;
	information = kdw_600_saturas_kdwaufnahme_info;
	important = 0;
	permanent = 0;
	description = "Я готов принести клятву.";
};


func int kdw_600_saturas_kdwaufnahme_condition()
{
	if(Npc_KnowsInfo(hero,kdw_600_saturas_oath))
	{
		return TRUE;
	};
};

func void kdw_600_saturas_kdwaufnahme_info()
{
	AI_GotoNpc(hero,self);
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01");	//Я готов принести клятву.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_02");	//Служитель Огня, приготовься получить благословение Воды!
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03");	//Повторяй за мной слова клятвы:
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04");	//Клянусь могуществом богов...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05");	//Клянусь могуществом богов...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06");	//... и силой священной Воды...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07");	//... и силой священной Воды...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08");	//...что знания и действия мои будут служить Воде отныне и до скончания веков...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09");	//...что знания и действа мои будут служить Воде отныне и до скончания веков...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10");	//...до тех пор, пока мое бренное тело не обретет покой в чертогах Белиара и не иссякнет источник моей жизни.
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11");	//...до тех пор, пока мое бренное тело не обретет покой в чертогах Белиара и не иссякнет источник моей жизни.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_12");	//Эта клятва соединила в тебе силу Огня и благословение Воды.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_13");	//Соединила то, что до тебя было несоединимым. Отныне твоя жизнь будет знаком объединения стихий.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14");	//Возьми это одеяние и носи его в знак союза со священной Водой и с Аданосом. 
	CreateInvItem(self,kdw_armor_l);
	b_giveinvitems(self,other,kdw_armor_l,1);
	AI_EquipBestArmor(hero);
	Snd_Play("MFX_Heal_Cast");
	Npc_SetTrueGuild(hero,GIL_KDW);
	hero.guild = GIL_KDW;
	b_logentry(CH4_BANNEDFROMOC,"Он принял меня в Круг магов Воды. Теперь я принадлежу двум магическим школам одновременно.");
	Log_SetTopicStatus(CH4_BANNEDFROMOC,LOG_SUCCESS);
	AI_StopProcessInfos(self);
};


instance KDW_600_SATURAS_LESSON(C_INFO)
{
	npc = kdw_600_saturas;
	nr = 100;
	condition = kdw_600_saturas_lesson_condition;
	information = kdw_600_saturas_lesson_info;
	important = 0;
	permanent = 0;
	description = "Ты можешь стать моим учителем?";
};


func int kdw_600_saturas_lesson_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDW)
	{
		return TRUE;
	};
};

func void kdw_600_saturas_lesson_info()
{
	AI_Output(other,self,"KDW_600_Saturas_LESSON_Info_15_01");	//Ты можешь стать моим учителем?
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) <= 3)
	{
		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_02");	//Тебе еще многому нужно научиться. Приходи ко мне, когда будешь готов.
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
	{
		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_03");	//Я могу посвятить тебя в тот Круг магии, который тебе еще неизвестен, но только тогда, когда ты будешь готов.
	}
	else
	{
		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_04");	//Ты уже посвящен в Пятый Круг магии! Наши знания равны.
		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_05");	//Я не смогу ничему научить тебя.
	};
	Log_CreateTopic(GE_TEACHERNC,LOG_NOTE);
	b_logentry(GE_TEACHERNC,"Сатурас, глава магов Воды, может посвятить меня в тайны Кругов магии. Я смогу найти его у пентаграммы на втором уровне Нового лагеря.");
};


instance KDW_600_SATURAS_KREIS1(C_INFO)
{
	npc = kdw_600_saturas;
	nr = 100;
	condition = kdw_600_saturas_kreis1_condition;
	information = kdw_600_saturas_kreis1_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARNMAGE_1,LPCOST_TALENT_MAGE_1,0);
};


func int kdw_600_saturas_kreis1_condition()
{
	if(Npc_KnowsInfo(hero,kdw_600_saturas_lesson) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 0) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void kdw_600_saturas_kreis1_info()
{
	AI_Output(other,self,"KDW_600_Saturas_KREIS1_Info_15_01");	//Я готов вступить в Первый Круг.
	if(b_giveskill(other,NPC_TALENT_MAGE,1,LPCOST_TALENT_MAGE_1))
	{
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_02");	//Вступление в Первый Круг магии даст тебе умение использовать магические руны.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_03");	//Каждая руна содержит в себе одно магическое заклинание.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_04");	//Используя свою магическую силу, ты сможешь прочитать это заклинание.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_05");	//Но в отличие от магических свитков, которые теряют свою силу после первого прочтения, заклинание руны можно читать снова и снова, и оно не иссякнет. 
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_06");	//Каждая руна является источником магической силы, которая может быть задействована в любое время.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_07");	//Как я уже сказал, при прочтении заклинания руны или свитка будет расходоваться твоя магическая сила.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_08");	//Знания каждого нового Круга помогут тебе читать более сложные заклинания рун.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_09");	//Используя силу рун, ты сможешь узнать, какой силой обладаешь сам.
		kdw_600_saturas_kreis1.permanent = 0;
	};
};


instance KDW_600_SATURAS_KREIS2(C_INFO)
{
	npc = kdw_600_saturas;
	nr = 100;
	condition = kdw_600_saturas_kreis2_condition;
	information = kdw_600_saturas_kreis2_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARNMAGE_2,LPCOST_TALENT_MAGE_2,0);
};


func int kdw_600_saturas_kreis2_condition()
{
	if(Npc_KnowsInfo(hero,kdw_600_saturas_lesson) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void kdw_600_saturas_kreis2_info()
{
	AI_Output(other,self,"KDW_600_Saturas_KREIS2_Info_15_01");	//Я готов к посвящению во Второй Круг.
	if(b_giveskill(other,NPC_TALENT_MAGE,2,LPCOST_TALENT_MAGE_2))
	{
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_02");	//Ты уже научился читать заклинания рун. Пришло время углубить твои знания.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_03");	//Второй Круг магии даст тебе возможность читать сильные боевые заклинания, но самое главное, ты сможешь исцелять болезни.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_04");	//Но тебе предстоит еще многому научиться, чтобы познать истинные тайны магии.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_05");	//Ты уже знаешь, что можешь использовать любую руну, пока на это хватит твоей личной силы.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_06");	//Но это крайний случай, и он не всегда оправдан. Тебе дана сила, которая может приносить смерть и разрушение.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_07");	//Истинный маг использует ее лишь тогда, когда это действительно необходимо.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_08");	//Внимательно следи за тем, что происходит вокруг, и тогда ты сможешь познать силу рун.
		kdw_600_saturas_kreis2.permanent = 0;
	};
};


instance KDW_600_SATURAS_KREIS3(C_INFO)
{
	npc = kdw_600_saturas;
	nr = 100;
	condition = kdw_600_saturas_kreis3_condition;
	information = kdw_600_saturas_kreis3_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARNMAGE_3,LPCOST_TALENT_MAGE_3,0);
};


func int kdw_600_saturas_kreis3_condition()
{
	if(Npc_KnowsInfo(hero,kdw_600_saturas_lesson) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void kdw_600_saturas_kreis3_info()
{
	AI_Output(other,self,"KDW_600_Saturas_KREIS3_Info_15_01");	//Я готов получить знания Третьего Круга.
	if(b_giveskill(other,NPC_TALENT_MAGE,3,LPCOST_TALENT_MAGE_3))
	{
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_02");	//Третий Круг - очень важная часть пути, который проходит каждый маг. Его постижением завершается твой поиск.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_03");	//Ты уже на середине пути познания магии. Ты уже умеешь читать заклинания рун.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_04");	//Это знание станет основой для дальнейшего совершенствования. Подумай, прежде чем использовать ту или иную руну.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_05");	//Ты можешь читать ее или не читать, но твой выбор должен быть осознан.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_06");	//Если ты сделал выбор, ты должен следовать ему не раздумывая.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_07");	//Познай свой путь, и ты познаешь силу своих решений.
		kdw_600_saturas_kreis3.permanent = 0;
	};
};


instance KDW_600_SATURAS_KREIS4(C_INFO)
{
	npc = kdw_600_saturas;
	nr = 100;
	condition = kdw_600_saturas_kreis4_condition;
	information = kdw_600_saturas_kreis4_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARNMAGE_4,LPCOST_TALENT_MAGE_4,0);
};


func int kdw_600_saturas_kreis4_condition()
{
	if(Npc_KnowsInfo(hero,kdw_600_saturas_lesson) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void kdw_600_saturas_kreis4_info()
{
	AI_Output(other,self,"KDW_600_Saturas_KREIS4_Info_15_01");	//Я готов вступить в Четвертый Круг.
	if(b_giveskill(other,NPC_TALENT_MAGE,4,LPCOST_TALENT_MAGE_4))
	{
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_02");	//Тебе уже открыты знания трех Кругов магии. Пришло время познать ее тайны.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_03");	//Магия руны сокрыта в камне. Камень этот получают при шлифовке магической руды.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_04");	//Такой руды, которую добывают в здешних шахтах. Камень наделяется магической энергией в особых храмах. Так он становится орудием нашей силы.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_05");	//Все руны, которые ты можешь использовать, открывают тебе доступ к знаниям и могуществу наших храмов.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_07");	//Познай магию, и ты познаешь тайну своей силы.
		kdw_600_saturas_kreis4.permanent = 0;
	};
};


instance KDW_600_SATURAS_KREIS5(C_INFO)
{
	npc = kdw_600_saturas;
	nr = 100;
	condition = kdw_600_saturas_kreis5_condition;
	information = kdw_600_saturas_kreis5_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARNMAGE_5,LPCOST_TALENT_MAGE_5,0);
};


func int kdw_600_saturas_kreis5_condition()
{
	if(Npc_KnowsInfo(hero,kdw_600_saturas_lesson) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void kdw_600_saturas_kreis5_info()
{
	AI_Output(other,self,"KDW_600_Saturas_KREIS5_Info_15_01");	//Я готов вступить в Пятый Круг.
	if(b_giveskill(other,NPC_TALENT_MAGE,5,LPCOST_TALENT_MAGE_5))
	{
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_02");	//Да будет так. Я открою тебе истинный смысл Пятого круга.
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_03");	//Посвященный в знания Пятого Круга может читать заклинания рун Огненный Шторм, Ледяная Волна и Истребление Нежити.
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_04");	//Но самым сильным заклинанием Пятого Круга является Волна Смерти. Если ты найдешь эту руну, в твоих руках окажется источник ужасных разрушительных сил.
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_05");	//Используй ее только в случае смертельной опасности, ведь она была дана богом Тьмы.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_06");	//Теперь ты выучил все, что знаю я сам.
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_06");	//Узнай пределы возможного, и ты познаешь свою истинную силу.
		kdw_600_saturas_kreis5.permanent = 0;
	};
};


instance KDW_600_SATURAS_HEAVYARMOR(C_INFO)
{
	npc = kdw_600_saturas;
	nr = 100;
	condition = kdw_600_saturas_heavyarmor_condition;
	information = kdw_600_saturas_heavyarmor_info;
	important = 0;
	permanent = 1;
	description = b_buildbuyarmorstring("Одеяние верховного мага",VALUE_KDW_ARMOR_H);
};


func int kdw_600_saturas_heavyarmor_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDW)
	{
		return TRUE;
	};
};

func void kdw_600_saturas_heavyarmor_info()
{
	AI_Output(other,self,"KDW_600_Saturas_HEAVYARMOR_Info_15_01");	//Я хочу носить одеяние верховных магов Воды.
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) < 4) && (KAPITEL < 5))
	{
		AI_Output(self,other,"KDW_600_Saturas_HEAVYARMOR_Info_14_02");	//Ты еще не можешь носить такое облачение. Время еще не пришло.
	}
	else if(Npc_HasItems(hero,itminugget) < VALUE_KDW_ARMOR_H)
	{
		AI_Output(self,other,"KDW_600_Saturas_HEAVYARMOR_Info_14_03");	//Тебе не хватает руды.
	}
	else
	{
		AI_Output(self,other,"KDW_600_Saturas_HEAVYARMOR_Info_14_04");	//Я вижу, что ты уже достоин носить облачение верховного мага Круга Воды.
		kdw_600_saturas_heavyarmor.permanent = 0;
		b_giveinvitems(hero,self,itminugget,VALUE_KDW_ARMOR_H);
		CreateInvItem(hero,kdw_armor_h);
		CreateInvItem(self,itamarrow);
		b_giveinvitems(self,hero,itamarrow,1);
		Npc_RemoveInvItem(hero,itamarrow);
		AI_EquipBestArmor(hero);
	};
};


instance INFO_SATURAS_NOWSLD(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_nowsld_condition;
	information = info_saturas_nowsld_info;
	permanent = 0;
	important = 0;
	description = "Ли принял меня в наемники.";
};


func int info_saturas_nowsld_condition()
{
	if(Npc_KnowsInfo(hero,sld_700_lee_changeside))
	{
		return TRUE;
	};
};

func void info_saturas_nowsld_info()
{
	AI_Output(hero,self,"Info_Saturas_NOWSLD_15_01");	//Ли принял меня в наемники.
	AI_Output(self,hero,"Info_Saturas_NOWSLD_14_02");	//Хорошо. Теперь ты один из нас, ты принадлежишь нашему лагерю.
	AI_Output(self,hero,"Info_Saturas_NOWSLD_14_03");	//Добро пожаловать!
	b_logentry(CH4_BANNEDFROMOC,"Сатурас поздравил меня с тем, что я стал наемником.");
	Log_SetTopicStatus(CH4_BANNEDFROMOC,LOG_SUCCESS);
};


instance INFO_SATURAS_XARDAS(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_xardas_condition;
	information = info_saturas_xardas_info;
	permanent = 0;
	important = 0;
	description = "Отправляя меня к магам Огня, ты сказал, что есть одно... что-то.";
};


func int info_saturas_xardas_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_collapse) && Npc_KnowsInfo(hero,info_saturas_murder))
	{
		if((Npc_GetTrueGuild(hero) != GIL_GRD) && (Npc_GetTrueGuild(hero) != GIL_KDF))
		{
			return TRUE;
		};
	};
};

func void info_saturas_xardas_info()
{
	AI_Output(hero,self,"Info_Saturas_XARDAS_15_01");	//Когда ты отправил меня к магам Огня, ты сказал, что есть еще одно... что-то.
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_02");	//Да, я надеялся, что нам не придется идти на эту меру... обращаться к нему... но все складывается так...
	AI_Output(hero,self,"Info_Saturas_XARDAS_15_03");	//К кому обращаться?
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_04");	//Хорошо, я скажу тебе!
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_05");	//Много лет назад...
	AI_Output(hero,self,"Info_Saturas_XARDAS_15_06");	//Пожалуйста, без предыстории!
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_07");	//Не торопи меня! Все мы, двенадцать магов, вместе создавали Барьер, но наши силы объединял и направлял тринадцатый маг.
	AI_Output(hero,self,"Info_Saturas_XARDAS_15_08");	//Тринадцатый? Я всегда думал, что вас было только двенадцать!
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_09");	//Большинство людей, пришедших в колонию после создания Барьера, думают точно также.
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_10");	//Тот тринадцатый маг был нашим предводителем. Это было еще до того, как мы разделились на магов Огня и Воды.
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_11");	//Но однажды он покинул Старый лагерь, который тогда был единственным в колонии.
};


instance INFO_SATURAS_XARDASWHO(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_xardaswho_condition;
	information = info_saturas_xardaswho_info;
	permanent = 0;
	important = 0;
	description = "А как звали этого тринадцатого мага?";
};


func int info_saturas_xardaswho_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_xardas))
	{
		return TRUE;
	};
};

func void info_saturas_xardaswho_info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASWHO_15_01");	//А как звали этого тринадцатого мага?
	AI_Output(self,hero,"Info_Saturas_XARDASWHO_14_02");	//Его звали Ксардас. Сейчас уже мало кто помнит, что это был за человек.
	AI_Output(self,hero,"Info_Saturas_XARDASWHO_14_03");	//А те, кто помнит, называют его повелителем демонов, некромантом!
};


instance INFO_SATURAS_XARDASWHY(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_xardaswhy_condition;
	information = info_saturas_xardaswhy_info;
	permanent = 0;
	important = 0;
	description = "Почему он ушел из Старого лагеря?";
};


func int info_saturas_xardaswhy_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_xardas))
	{
		return TRUE;
	};
};

func void info_saturas_xardaswhy_info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASWHY_15_01");	//Почему он ушел из Старого лагеря?
	AI_Output(self,hero,"Info_Saturas_XARDASWHY_14_02");	//Он стал изучать заклинания, призывающие нежить и дающие власть над магическими существами.
	AI_Output(self,hero,"Info_Saturas_XARDASWHY_14_03");	//Его опыты не понравились Гомезу, и не только ему. Многие маги отвернулись от него и больше не признавали за ним власти.
	AI_Output(hero,self,"Info_Saturas_XARDASWHY_15_04");	//А что было потом?
	AI_Output(self,hero,"Info_Saturas_XARDASWHY_14_05");	//В отличие от Гомеза Ксардас не был грубым мясником и ушел из лагеря, чтобы избежать конфликта.
};


instance INFO_SATURAS_XARDASWHERE(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_xardaswhere_condition;
	information = info_saturas_xardaswhere_info;
	permanent = 0;
	important = 0;
	description = "А где он живет сейчас?";
};


func int info_saturas_xardaswhere_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_xardas))
	{
		return TRUE;
	};
};

func void info_saturas_xardaswhere_info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASWHERE_15_01");	//А где он живет сейчас?
	AI_Output(self,hero,"Info_Saturas_XARDASWHERE_14_02");	//Он живет в уединении в башне, стоящей на земле орков.
	AI_Output(self,hero,"Info_Saturas_XARDASWHERE_14_03");	//Их город находится на юге колонии.
};


instance INFO_SATURAS_XARDASHELP(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_xardashelp_condition;
	information = info_saturas_xardashelp_info;
	permanent = 0;
	important = 0;
	description = "Я найду Ксардаса и попрошу его о помощи!";
};


func int info_saturas_xardashelp_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_xardaswho) && Npc_KnowsInfo(hero,info_saturas_xardaswhy) && Npc_KnowsInfo(hero,info_saturas_xardaswhere))
	{
		return TRUE;
	};
};

func void info_saturas_xardashelp_info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASHELP_15_01");	//Я найду Ксардаса и попрошу его о помощи!
	AI_Output(self,hero,"Info_Saturas_XARDASHELP_14_02");	//Теперь только он сможет помочь нам.
	AI_Output(self,hero,"Info_Saturas_XARDASHELP_14_03");	//Но если он не знает, как это сделать, или просто не захочет...
	AI_Output(hero,self,"Info_Saturas_XARDASHELP_15_04");	//Захочет!
	AI_Output(self,hero,"Info_Saturas_XARDASHELP_14_05");	//Но есть еще одна проблема...
	b_story_findxardas();
};


instance INFO_SATURAS_XARDASPROBLEM(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_xardasproblem_condition;
	information = info_saturas_xardasproblem_info;
	permanent = 0;
	important = 0;
	description = "Проблема?";
};


func int info_saturas_xardasproblem_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_xardashelp))
	{
		return TRUE;
	};
};

func void info_saturas_xardasproblem_info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASPROBLEM_15_01");	//Проблема?
	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_02");	//Да. Мы много раз пытались связаться с Ксардасом, но нам это ни разу не удалось.
	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_03");	//Нам кажется, что он хочет, чтобы его оставили в покое.
	AI_Output(hero,self,"Info_Saturas_XARDASPROBLEM_15_04");	//Что ты имеешь в виду?
	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_05");	//Никто из наших гонцов не вернулся из его башни.
	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_06");	//Ты должен узнать, как можно пройти мимо его ужасных созданий.
	AI_Output(hero,self,"Info_Saturas_XARDASPROBLEM_15_07");	//Все интереснее и интереснее!
	b_logentry(CH4_FINDXARDAS,"Сатурас сказал мне, что Ксардаса охраняют магические существа.");
};


instance INFO_SATURAS_XARDASGO(C_INFO)
{
	npc = kdw_600_saturas;
	condition = info_saturas_xardasgo_condition;
	information = info_saturas_xardasgo_info;
	permanent = 0;
	important = 0;
	description = "И как же мне пройти мимо них?";
};


func int info_saturas_xardasgo_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_xardasproblem))
	{
		return TRUE;
	};
};

func void info_saturas_xardasgo_info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASGO_15_01");	//И как же мне пройти мимо них?
	AI_Output(self,hero,"Info_Saturas_XARDASGO_14_02");	//Я бы сказал тебе, если бы сам знал!
	AI_Output(self,hero,"Info_Saturas_XARDASGO_14_03");	//Мой совет, поищи ответ на это в нашей библиотеке.
	AI_Output(self,hero,"Info_Saturas_XARDASGO_14_04");	//Может быть, в старых книгах есть что-то о силе и слабостях существ, порожденных магией.
	AI_Output(hero,self,"Info_Saturas_XARDASGO_15_05");	//Я просмотрю всю библиотеку. И не волнуйся...
	AI_Output(hero,self,"Info_Saturas_XARDASGO_15_06");	//Я еще вернусь!
	b_logentry(CH4_FINDXARDAS,"В библиотеке магов Воды есть пергаменты, в которых описываются магические существа. Мне следует ознакомиться с ними.");
};


instance KDW_600_SATURAS_TIMESUP(C_INFO)
{
	npc = kdw_600_saturas;
	condition = kdw_600_saturas_timesup_condition;
	information = kdw_600_saturas_timesup_info;
	important = 1;
	permanent = 0;
};


func int kdw_600_saturas_timesup_condition()
{
	if((FINDORCSHAMAN == LOG_RUNNING) || (FINDORCSHAMAN == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void kdw_600_saturas_timesup_info()
{
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_00");	//Ты говорил с Ксардасом?
	Info_ClearChoices(kdw_600_saturas_timesup);
	Info_AddChoice(kdw_600_saturas_timesup,"Ну...",kdw_600_saturas_timesup_ja1);
	Info_AddChoice(kdw_600_saturas_timesup,"Нет...",kdw_600_saturas_timesup_ja2);
	Info_AddChoice(kdw_600_saturas_timesup,"Все совсем не так, как ты думаешь...",kdw_600_saturas_timesup_ja3);
};

func void kdw_600_saturas_timesup_ja1()
{
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_01");	//Ну...
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_02");	//Ну?.. Ну что?
};

func void kdw_600_saturas_timesup_ja2()
{
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_05");	//Нет...
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_06");	//Почему?
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_07");	//Я пока не смог найти его башню...
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_08");	//Тебе надо найти его и спросить совета!
	b_story_cancelfindxardas();
	AI_StopProcessInfos(self);
};

func void kdw_600_saturas_timesup_ja3()
{
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_09");	//Все совсем не так, как ты думаешь...
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_10");	//Что ты имеешь в виду? Он должен найти способ взорвать эту железную гору.
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_11");	//Рудная гора... э... она уже очень высокая!
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_12");	//Найди Ксардаса, он должен помочь нам!
	b_story_cancelfindxardas();
	AI_StopProcessInfos(self);
};


instance KDW_600_SATURAS_HOGEAUFNAHME(C_INFO)
{
	npc = kdw_600_saturas;
	nr = 10;
	condition = kdw_600_saturas_hogeaufnahme_condition;
	information = kdw_600_saturas_hogeaufnahme_info;
	permanent = 0;
	description = "Нефариус сказал, что я уже готов носить одеяние мага Воды.";
};


func int kdw_600_saturas_hogeaufnahme_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_murder) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return 1;
	};
};

func void kdw_600_saturas_hogeaufnahme_info()
{
	AI_Output(other,self,"KDW_600_Saturas_HogeAUFNAHME_15_00");	//Нефариус сказал, что я уже готов носить одеяние мага Воды.
	AI_Output(self,other,"KDW_600_Saturas_NOMOREOC_Info_14_03");	//Мы с радостью примем тебя!
	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_01");	//Значит ли это, что я буду принят в гильдию магов Круга Воды?
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_02");	//Нет. Сначала ты должен принести клятву воды.
};


instance KDW_600_SATURAS_HOGEAUFNAHMETEIL2(C_INFO)
{
	npc = kdw_600_saturas;
	nr = 10;
	condition = kdw_600_saturas_hogeaufnahmeteil2_condition;
	information = kdw_600_saturas_hogeaufnahmeteil2_info;
	permanent = 0;
	description = "Я готов принести клятву.";
};


func int kdw_600_saturas_hogeaufnahmeteil2_condition()
{
	if(Npc_KnowsInfo(hero,kdw_600_saturas_hogeaufnahme) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return 1;
	};
};

func void kdw_600_saturas_hogeaufnahmeteil2_info()
{
	AI_GotoNpc(hero,self);
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01");	//Я готов принести клятву.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03");	//Повторяй за мной слова клятвы:
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04");	//Клянусь могуществом богов...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05");	//Клянусь могуществом богов...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06");	//... и силой священной Воды...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07");	//... и силой священной Воды...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08");	//...что знания и действия мои будут служить Воде отныне и до скончания веков...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09");	//...что знания и действа мои будут служить Воде отныне и до скончания веков...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10");	//...до тех пор, пока мое бренное тело не обретет покой в чертогах Белиара и не иссякнет источник моей жизни.
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11");	//...до тех пор, пока мое бренное тело не обретет покой в чертогах Белиара и не иссякнет источник моей жизни.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14");	//Возьми это одеяние и носи его в знак союза со священной Водой и с Аданосом. 
	CreateInvItem(self,kdw_armor_l);
	b_giveinvitems(self,other,kdw_armor_l,1);
	AI_EquipBestArmor(hero);
	Snd_Play("MFX_Heal_Cast");
	Npc_SetTrueGuild(hero,GIL_KDW);
	hero.guild = GIL_KDW;
	Log_CreateTopic(CH4_SLDTOKDW,LOG_NOTE);
	b_logentry(CH4_SLDTOKDW,"Сатурас принял меня в Круг магов Воды.");
	AI_StopProcessInfos(self);
};

