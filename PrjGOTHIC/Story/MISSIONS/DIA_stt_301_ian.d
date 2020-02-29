
instance STT_301_IAN_EXIT(C_INFO)
{
	npc = stt_301_ian;
	nr = 999;
	condition = stt_301_ian_exit_condition;
	information = stt_301_ian_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int stt_301_ian_exit_condition()
{
	return 1;
};

func void stt_301_ian_exit_info()
{
	AI_Output(other,self,"STT_301_IAN_Exit_Info_15_01");	//Могу осмотреть шахту?
	AI_Output(self,other,"STT_301_IAN_Exit_Info_13_02");	//Только не создавай нам лишних проблем.
	AI_StopProcessInfos(self);
};


instance STT_301_IAN_HI(C_INFO)
{
	npc = stt_301_ian;
	condition = stt_301_ian_hi_condition;
	information = stt_301_ian_hi_info;
	important = 0;
	permanent = 0;
	description = "Ты Ян, главный человек в этой шахте?";
};


func int stt_301_ian_hi_condition()
{
	if(!Npc_KnowsInfo(hero,stt_301_ian_nest))
	{
		return TRUE;
	};
};

func void stt_301_ian_hi_info()
{
	AI_Output(other,self,"STT_301_IAN_HI_Info_15_01");	//Ты Ян, главный человек в этой шахте?
	AI_Output(self,other,"STT_301_IAN_HI_Info_13_02");	//Да, меня зовут Ян. Это моя шахта. Тебе лучше ничего здесь не трогать, и постарайся ничего не сломать.
};


instance STT_301_IAN_GOMEZ(C_INFO)
{
	npc = stt_301_ian;
	condition = stt_301_ian_gomez_condition;
	information = stt_301_ian_gomez_info;
	important = 0;
	permanent = 0;
	description = "Я думал, что эта шахта принадлежит Гомезу.";
};


func int stt_301_ian_gomez_condition()
{
	if(Npc_KnowsInfo(hero,stt_301_ian_hi))
	{
		return TRUE;
	};
};

func void stt_301_ian_gomez_info()
{
	AI_Output(other,self,"STT_301_IAN_GOMEZ_Info_15_01");	//Я думал, что эта шахта принадлежит Гомезу.
	AI_Output(self,other,"STT_301_IAN_GOMEZ_Info_13_02");	//Конечно, эта шахта принадлежит Старому лагерю, но здесь, внизу, вся власть принадлежит мне и больше никому.
};


instance STT_301_IAN_ORE(C_INFO)
{
	npc = stt_301_ian;
	condition = stt_301_ian_ore_condition;
	information = stt_301_ian_ore_info;
	important = 0;
	permanent = 0;
	description = "Ты можешь рассказать мне о добыче руды?";
};


func int stt_301_ian_ore_condition()
{
	if(Npc_KnowsInfo(hero,stt_301_ian_gomez))
	{
		return TRUE;
	};
};

func void stt_301_ian_ore_info()
{
	AI_Output(other,self,"STT_301_IAN_ORE_Info_15_01");	//Ты можешь рассказать мне о добыче руды?
	AI_Output(self,other,"STT_301_IAN_ORE_Info_13_02");	//Рудокопы добывают здесь руду днем и ночью. Наша выработка составляет 220 мешков руды, 20 из них идет на переплавку.
	AI_Output(self,other,"STT_301_IAN_ORE_Info_13_03");	//Из всей руды, которую мы поставляем королю, можно выковать не одну сотню клинков.
};


instance STT_301_IAN_MORE(C_INFO)
{
	npc = stt_301_ian;
	condition = stt_301_ian_more_condition;
	information = stt_301_ian_more_info;
	important = 0;
	permanent = 0;
	description = "Я слышал, что это не простая руда... Ты можешь рассказать о ней?";
};


func int stt_301_ian_more_condition()
{
	return Npc_KnowsInfo(hero,stt_301_ian_ore);
};

func void stt_301_ian_more_info()
{
	AI_Output(other,self,"STT_301_IAN_MORE_Info_15_01");	//Я слышал, что это не простая руда, а магическая. Ты можешь рассказать мне о ней?
	AI_Output(self,other,"STT_301_IAN_MORE_Info_13_02");	//Магическая руда обладает особыми свойствами. Оружие из нее никогда не ломается, а клинки выходят гораздо острее, чем из обычного железа.
	AI_Output(self,other,"STT_301_IAN_MORE_Info_13_03");	//Армия солдат с таким оружием имеет серьезное преимущество в любой битве.
};


instance STT_301_IAN_MAGIC(C_INFO)
{
	npc = stt_301_ian;
	condition = stt_301_ian_magic_condition;
	information = stt_301_ian_magic_info;
	important = 0;
	permanent = 0;
	description = "А ты знаешь о руде еще что-нибудь?";
};


func int stt_301_ian_magic_condition()
{
	return Npc_KnowsInfo(hero,stt_301_ian_more);
};

func void stt_301_ian_magic_info()
{
	AI_Output(other,self,"STT_301_IAN_MAGIC_Info_15_01");	//А ты знаешь о руде еще что-нибудь?
	AI_Output(self,other,"STT_301_IAN_MAGIC_Info_13_02");	//К сожалению, руда теряет магические свойства при переплавке. Только в плавильнях Нордмара знают правильный способ.
	AI_Output(self,other,"STT_301_IAN_MAGIC_Info_13_03");	//Но даже в этом случае оружие из нашей руды превосходит обычное оружие по многим параметрам и наносит больший урон врагу.
};


instance STT_301_IAN_MINE(C_INFO)
{
	npc = stt_301_ian;
	condition = stt_301_ian_mine_condition;
	information = stt_301_ian_mine_info;
	important = 0;
	permanent = 0;
	description = "Расскажи мне об этой шахте.";
};


func int stt_301_ian_mine_condition()
{
	if((KAPITEL < 3) && Npc_KnowsInfo(hero,stt_301_ian_hi))
	{
		return TRUE;
	};
};

func void stt_301_ian_mine_info()
{
	AI_Output(other,self,"STT_301_IAN_MINE_Info_15_01");	//Расскажи мне об этой шахте.
	AI_Output(self,other,"STT_301_IAN_MINE_Info_13_02");	//Если ты захочешь осмотреть шахту, тебе не следует далеко отходить от основного ствола. В дальних забоях обитает очень много ползунов.
	AI_Output(self,other,"STT_301_IAN_MINE_Info_13_03");	//И постарайся не отвлекать стражников. Большую часть времени они ничего не делают, но уж если поблизости окажется ползун, они смогут тебя защитить.
	AI_Output(other,self,"STT_301_IAN_MINE_Info_15_04");	//Хорошо, я это запомню.
	AI_Output(self,other,"STT_301_IAN_MINE_Info_13_05");	//Ладно, у меня еще много дел. Но помни, не мешай моим людям работать.
	AI_Output(other,self,"STT_301_IAN_MINE_Info_15_06");	//Я просто посмотрю шахту.
};


instance STT_301_IAN_WANTLIST(C_INFO)
{
	npc = stt_301_ian;
	condition = stt_301_ian_wantlist_condition;
	information = stt_301_ian_wantlist_info;
	important = 0;
	permanent = 0;
	description = "Мне нужно забрать список для лагеря.";
};


func int stt_301_ian_wantlist_condition()
{
	if((DIEGO_BRINGLIST == LOG_RUNNING) && !Npc_KnowsInfo(hero,info_diego_ianpassword))
	{
		return TRUE;
	};
};

func void stt_301_ian_wantlist_info()
{
	AI_Output(other,self,"STT_301_IAN_WANTLIST_Info_15_01");	//Мне нужно забрать список для лагеря.
	AI_Output(self,other,"STT_301_IAN_WANTLIST_Info_13_02");	//Так это каждый может сказать. Убирайся!
};


instance STT_301_IAN_GETLIST(C_INFO)
{
	npc = stt_301_ian;
	condition = stt_301_ian_getlist_condition;
	information = stt_301_ian_getlist_info;
	important = 0;
	permanent = 0;
	description = "Диего прислал меня сюда. Я должен забрать список.";
};


func int stt_301_ian_getlist_condition()
{
	if((DIEGO_BRINGLIST == LOG_RUNNING) && Npc_KnowsInfo(hero,info_diego_ianpassword))
	{
		return TRUE;
	};
};

func void stt_301_ian_getlist_info()
{
	AI_Output(other,self,"STT_301_IAN_GETLIST_Info_15_01");	//Диего прислал меня сюда. Я должен забрать список.
	AI_Output(self,other,"STT_301_IAN_GETLIST_Info_13_02");	//Понятно, вот тебе список. Они должны поторопиться с доставкой.
	b_logentry(CH1_BRINGLIST,"Ян без проблем передал мне список для Диего.");
	b_giveinvitems(self,hero,thelist,1);
};


instance STT_301_IAN_NEST(C_INFO)
{
	npc = stt_301_ian;
	condition = stt_301_ian_nest_condition;
	information = stt_301_ian_nest_info;
	important = 0;
	permanent = 0;
	description = "Где-то здесь должно быть логово ползунов.";
};


func int stt_301_ian_nest_condition()
{
	if((CORKALOM_BRINGMCQBALLS == LOG_RUNNING) && Npc_KnowsInfo(hero,stt_301_ian_hi))
	{
		return 1;
	};
};

func void stt_301_ian_nest_info()
{
	AI_Output(other,self,"STT_301_IAN_NEST_Info_15_01");	//Где-то в этой шахте есть гнездо или логово ползунов.
	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_02");	//Я думаю, в шахте очень много их гнезд.
	AI_Output(other,self,"STT_301_IAN_NEST_Info_15_03");	//Слушай, мне нужно найти одно из них...
	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_04");	//У меня сейчас нет на это времени. У нас пресс сломался. Пару часов назад сломалась шестеренка. Вся работа стоит.
	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_05");	//И я не знаю, где здесь можно найти новую.
	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_06");	//Но если ты поможешь починить пресс. Я помогу тебе.
	b_logentry(CH2_MCEGGS,"Ян не будет помогать мне искать логово ползунов. Сначала я должен найти ему новую шестеренку. Он сказал, что следует посмотреть в одной из заброшенных штолен. Где-то там должен стоять старый пресс.");
	IAN_GEARWHEEL = LOG_RUNNING;
};


instance STT_301_IAN_GEAR_RUN(C_INFO)
{
	npc = stt_301_ian;
	condition = stt_301_ian_gear_run_condition;
	information = stt_301_ian_gear_run_info;
	important = 0;
	permanent = 0;
	description = "А где я могу найти эту самую шестеренку?";
};


func int stt_301_ian_gear_run_condition()
{
	printdebugint(PD_MISSION,"Ian_gearwheel:",IAN_GEARWHEEL);
	if((IAN_GEARWHEEL == LOG_RUNNING) && !Npc_HasItems(hero,itmi_stuff_gearwheel_01))
	{
		return 1;
	};
};

func void stt_301_ian_gear_run_info()
{
	AI_Output(other,self,"STT_301_IAN_GEAR_RUN_Info_15_01");	//А где я могу найти эту самую шестеренку?
	AI_Output(self,other,"STT_301_IAN_GEAR_RUN_Info_13_02");	//Понятия не имею. Я знаю столько же, сколько и ты.
	AI_Output(self,other,"STT_301_IAN_GEAR_RUN_Info_13_03");	//Правда, по-моему, в одной из штолен есть старый сломанный пресс.
};


instance STT_301_IAN_GEAR_SUC(C_INFO)
{
	npc = stt_301_ian;
	condition = stt_301_ian_gear_suc_condition;
	information = stt_301_ian_gear_suc_info;
	important = 0;
	permanent = 0;
	description = "Я нашел шестеренку.";
};


func int stt_301_ian_gear_suc_condition()
{
	if(Npc_HasItems(hero,itmi_stuff_gearwheel_01) && (IAN_GEARWHEEL == LOG_RUNNING))
	{
		return 1;
	};
};

func void stt_301_ian_gear_suc_info()
{
	var C_NPC sklave;
	b_giveinvitems(hero,self,itmi_stuff_gearwheel_01,1);
	Npc_RemoveInvItem(self,itmi_stuff_gearwheel_01);
	IAN_GEARWHEEL = LOG_SUCCESS;
	b_givexp(XP_BRINGGEARWHEEL);
	sklave = Hlp_GetNpc(orc_2001_sklave);
	Npc_ExchangeRoutine(sklave,"Пресс");
	AI_Output(other,self,"STT_301_IAN_GEAR_SUC_Info_15_01");	//Я нашел шестеренку.
	AI_Output(self,other,"STT_301_IAN_GEAR_SUC_Info_13_02");	//О! Отличная работа! Думаю, она как раз подойдет. Что ж, вернемся к твоей проблеме. Ты искал логово ползунов, да? Хм...
	AI_Output(self,other,"STT_301_IAN_GEAR_SUC_Info_13_03");	//Сходи к Асгхану, он откроет тебе ворота. Возможно, то, что ты ищешь, находится именно там.
	AI_Output(self,other,"STT_301_IAN_GEAR_SUC_Info_13_04");	//Скажи ему: 'Все будет в порядке'. Так он узнает, что я дал свое согласие.
	b_logentry(CH2_MCEGGS,"Я принес Яну шестеренку, снятую со старого рудного пресса. Он сказал, что когда я буду говорить с Асгханом, я должен сообщить ему слова 'Все будет в порядке'. Тогда он откроет ворота в Заброшенную шахту.");
};


instance STT_301_IAN_GOTOASGHAN(C_INFO)
{
	npc = stt_301_ian;
	condition = stt_301_ian_gotoasghan_condition;
	information = stt_301_ian_gotoasghan_info;
	important = 0;
	permanent = 0;
	description = "Я все еще не нашел логово ползунов!";
};


func int stt_301_ian_gotoasghan_condition()
{
	if((IAN_GEARWHEEL == LOG_SUCCESS) && !Npc_KnowsInfo(hero,grd_263_asghan_nest))
	{
		return 1;
	};
};

func void stt_301_ian_gotoasghan_info()
{
	AI_Output(other,self,"STT_301_IAN_GOTOASGHAN_Info_15_01");	//Я все еще не нашел логово ползунов!
	AI_Output(self,other,"STT_301_IAN_GOTOASGHAN_Info_13_02");	//Я же сказал, пойди к Асгхану. Он возглавляет стражников. Ты найдешь его на нижнем горизонте.
	b_logentry(CH2_MCEGGS,"Если я хочу найти логово ползунов, я должен поговорить с Асгханом.");
};


instance STT_301_IAN_AFTERALL(C_INFO)
{
	npc = stt_301_ian;
	condition = stt_301_ian_afterall_condition;
	information = stt_301_ian_afterall_info;
	important = 0;
	permanent = 0;
	description = "Я нашел логово ползунов!";
};


func int stt_301_ian_afterall_condition()
{
	if(Npc_HasItems(hero,itat_crawlerqueen) >= 3)
	{
		return 1;
	};
};

func void stt_301_ian_afterall_info()
{
	AI_Output(other,self,"STT_301_IAN_AFTERALL_Info_15_01");	//Я нашел логово ползунов!
	AI_Output(self,other,"STT_301_IAN_AFTERALL_Info_13_02");	//В шахте снова будет тихо и спокойно!
	AI_Output(self,other,"STT_301_IAN_AFTERALL_Info_13_03");	//Ладно, не обижайся. Ты хорошо поработал!
	AI_Output(self,other,"STT_301_IAN_AFTERALL_Info_13_04");	//Вот, возьми себе этот ящик пива. Это твоя награда.
	CreateInvItems(self,itfo_om_beer_01,6);
	b_giveinvitems(self,hero,itfo_om_beer_01,6);
};


instance STT_301_IAN_NOTENOUGH(C_INFO)
{
	npc = stt_301_ian;
	condition = stt_301_ian_notenough_condition;
	information = stt_301_ian_notenough_info;
	important = 0;
	permanent = 0;
	description = "Я нашел логово ползунов. А еще в нем были вот эти яйца.";
};


func int stt_301_ian_notenough_condition()
{
	if((Npc_HasItems(hero,itat_crawlerqueen) > 1) && (Npc_HasItems(hero,itat_crawlerqueen) < 3))
	{
		return TRUE;
	};
};

func void stt_301_ian_notenough_info()
{
	AI_Output(other,self,"STT_301_IAN_NOTENOUGH_Info_15_01");	//Я нашел логово ползунов. А еще в нем были вот эти яйца.
	AI_Output(self,other,"STT_301_IAN_NOTENOUGH_Info_13_02");	//Что? Ты нашел так мало яиц? Ну, что ж, ты хотя бы доказал, что умеешь драться.
};

