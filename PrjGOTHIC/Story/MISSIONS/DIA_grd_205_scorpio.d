
instance DIA_SCORPIO_EXIT(C_INFO)
{
	npc = grd_205_scorpio;
	nr = 999;
	condition = dia_scorpio_exit_condition;
	information = dia_scorpio_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_scorpio_exit_condition()
{
	return 1;
};

func void dia_scorpio_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SCORPIO_HELLO(C_INFO)
{
	npc = grd_205_scorpio;
	nr = 1;
	condition = dia_scorpio_hello_condition;
	information = dia_scorpio_hello_info;
	permanent = 0;
	important = 1;
};


func int dia_scorpio_hello_condition()
{
	if(!c_npcbelongstooldcamp(other) && (KAPITEL < 4))
	{
		return 1;
	};
};

func void dia_scorpio_hello_info()
{
	AI_Output(self,other,"DIA_Scorpio_Hello_13_00");	//Кто пропустил тебя?
	if(THORUS_PASSGATE == TRUE)
	{
		AI_Output(other,self,"DIA_Scorpio_Hello_15_01");	//Торус.
	}
	else
	{
		AI_Output(other,self,"DIA_BaalCadar_SleepSpell_15_02");	//Никто. Это было не слишком сложно.
	};
	AI_Output(self,other,"DIA_Scorpio_Hello_13_02");	//И что тебе здесь нужно?
	Info_ClearChoices(dia_scorpio_hello);
	Info_AddChoice(dia_scorpio_hello,"Просто захотелось посмотреть.",dia_scorpio_hello_justlooking);
	if(Npc_HasItems(hero,cronos_brief))
	{
		Info_AddChoice(dia_scorpio_hello,"У меня есть письмо от магов Воды.",dia_scorpio_hello_cronosbrief);
	};
	if(Npc_HasItems(hero,itwr_fire_letter_01) || Npc_HasItems(hero,itwr_fire_letter_02))
	{
		Info_AddChoice(dia_scorpio_hello,"У меня есть послание для магов.",dia_scorpio_hello_mages);
	};
	if(KALOM_KRAUTBOTE == LOG_RUNNING)
	{
		Info_AddChoice(dia_scorpio_hello,"Я принес болотник для Гомеза.",dia_scorpio_hello_kraut);
	};
	if(Npc_KnowsInfo(hero,info_thorus_readyforgomez))
	{
		Info_AddChoice(dia_scorpio_hello,"Я хочу встретиться с Гомезом. Я собираюсь присоединиться к вам.",dia_scorpio_hello_join);
	};
};

func void dia_scorpio_hello_cronosbrief()
{
	AI_Output(other,self,"DIA_Milten_NochEinBrief_15_00");	//У меня есть письмо от магов Воды.
	AI_Output(self,other,"DIA_Scorpio_Hello_Mages_13_01");	//Ты работаешь на магов? До них мне нет никакого дела...
	Info_ClearChoices(dia_scorpio_hello);
};

func void dia_scorpio_hello_justlooking()
{
	AI_Output(other,self,"DIA_Scorpio_Hello_JustLooking_15_00");	//Просто захотелось посмотреть.
	AI_Output(self,other,"DIA_Scorpio_Hello_JustLooking_13_01");	//Интересно.
	Info_ClearChoices(dia_scorpio_hello);
};

func void dia_scorpio_hello_mages()
{
	AI_Output(other,self,"DIA_Scorpio_Hello_Mages_15_00");	//У меня есть послание для магов.
	AI_Output(self,other,"DIA_Scorpio_Hello_Mages_13_01");	//Ты работаешь на магов? До них мне нет никакого дела...
	if(LETTER_TOLD == 0)
	{
		LETTER_TOLD = 1;
	}
	else if(LETTER_TOLD == 1)
	{
		LETTER_TOLD = 2;
		if(!Npc_IsDead(vlk_505_buddler))
		{
			b_exchangeroutine(vlk_505_buddler,"letterwait");
		};
		if(!Npc_IsDead(vlk_506_buddler))
		{
			b_exchangeroutine(vlk_506_buddler,"letterwait");
		};
	};
	Info_ClearChoices(dia_scorpio_hello);
};

func void dia_scorpio_hello_kraut()
{
	AI_Output(other,self,"DIA_Scorpio_Hello_Kraut_15_00");	//Я принес болотник для Гомеза.
	AI_Output(self,other,"DIA_Scorpio_Hello_Kraut_13_01");	//Тогда отнеси его в дом, который охраняется двумя стражниками.
	Info_ClearChoices(dia_scorpio_hello);
};

func void dia_scorpio_hello_join()
{
	AI_Output(other,self,"DIA_Scorpio_Hello_Join_15_00");	//Я хочу встретиться с Гомезом. Я собираюсь присоединиться к вам.
	AI_Output(self,other,"DIA_Scorpio_Hello_Join_13_01");	//Ты? А ты уже доказал, что достоин к нам присоединиться?
	AI_Output(other,self,"DIA_Scorpio_Hello_Join_15_02");	//Призраки мной довольны...
	AI_Output(self,other,"DIA_Scorpio_Hello_Join_13_03");	//Призраки здесь ничего не решают. Здесь только наши слова имеют вес.
	Info_ClearChoices(dia_scorpio_hello);
};


instance DIA_SCORPIO_REFUSETRAIN(C_INFO)
{
	npc = grd_205_scorpio;
	nr = 1;
	condition = dia_scorpio_refusetrain_condition;
	information = dia_scorpio_refusetrain_info;
	permanent = 1;
	description = "Ты можешь научить меня сражаться?";
};


func int dia_scorpio_refusetrain_condition()
{
	if(Npc_KnowsInfo(hero,dia_scorpio_hello) && (Npc_GetTrueGuild(hero) != GIL_GRD) && (KAPITEL < 4))
	{
		return 1;
	};
};

func void dia_scorpio_refusetrain_info()
{
	AI_Output(other,self,"DIA_Scorpio_REFUSETRAIN_15_00");	//Ты можешь научить меня сражаться?
	AI_Output(self,other,"DIA_Scorpio_REFUSETRAIN_13_01");	//Я тренирую только стражников. Ты сможешь тренироваться у меня только тогда, когда Торус назначит тебя стражником.
};


instance GRD_205_SCORPIO_WELCOME(C_INFO)
{
	npc = grd_205_scorpio;
	condition = grd_205_scorpio_welcome_condition;
	information = grd_205_scorpio_welcome_info;
	important = 1;
	permanent = 0;
};


func int grd_205_scorpio_welcome_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void grd_205_scorpio_welcome_info()
{
	AI_Output(self,other,"GRD_205_Scorpio_WELCOME_Info_13_01");	//Ты сделал хороший выбор, когда захотел присоединиться к нам.
	AI_StopProcessInfos(self);
};


instance GRD_205_SCORPIO_CROSSBOW(C_INFO)
{
	npc = grd_205_scorpio;
	condition = grd_205_scorpio_crossbow_condition;
	information = grd_205_scorpio_crossbow_info;
	important = 0;
	permanent = 1;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int grd_205_scorpio_crossbow_condition()
{
	if(((KAPITEL >= 4) || (Npc_GetTrueGuild(hero) == GIL_GRD)) && (Npc_GetTalentSkill(hero,NPC_TALENT_CROSSBOW) == 0))
	{
		return TRUE;
	};
};

func void grd_205_scorpio_crossbow_info()
{
	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW_Info_15_01");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_Info_13_02");	//Если у тебя есть руда, то я могу научить тебя стрелять из арбалета. Это будет стоить 200 кусков.
	if((LOG_SCORPIOCROSSBOW == FALSE) && (KAPITEL < 4))
	{
		Log_CreateTopic(GE_TEACHEROC,LOG_NOTE);
		b_logentry(GE_TEACHEROC,"Скорпио может научить меня стрелять из арбалета.");
		LOG_SCORPIOCROSSBOW = TRUE;
	}
	else if((LOG_SCORPIOCROSSBOW == FALSE) && (KAPITEL >= 4))
	{
		Log_CreateTopic(GE_TEACHEROW,LOG_NOTE);
		b_logentry(GE_TEACHEROW,"Скорпио может научить меня стрелять из арбалета.");
		LOG_SCORPIOCROSSBOW = TRUE;
	};
	Info_ClearChoices(grd_205_scorpio_crossbow);
	Info_AddChoice(grd_205_scorpio_crossbow,DIALOG_BACK,grd_205_scorpio_crossbow_back);
	Info_AddChoice(grd_205_scorpio_crossbow,b_buildlearnstring(NAME_LEARNCROSSBOW_1,LPCOST_TALENT_CROSSBOW_1,200),grd_205_scorpio_crossbow_ok);
};

func void grd_205_scorpio_crossbow_back()
{
	Info_ClearChoices(grd_205_scorpio_crossbow);
};

func void grd_205_scorpio_crossbow_ok()
{
	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW_OK_15_01");	//Как скажешь. Научи меня стрелять из арбалета.
	if(Npc_HasItems(hero,itminugget) >= 200)
	{
		if(b_giveskill(other,NPC_TALENT_CROSSBOW,1,LPCOST_TALENT_CROSSBOW_1))
		{
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_02");	//Хорошо, начнем прямо сейчас.
			b_printtrademsg1("Отдано руды: 200");
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_03");	//Возьми рукоятку арбалета. Ее необходимо упереть в плечо, что поможет тебе точнее прицелиться.
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_04");	//Сначала твое плечо будет сильно уставать и болеть.
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_05");	//Но через неделю тренировок ты его даже не узнаешь!
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_06");	//Прицелься и нажимай на курок. Болт летит гораздо быстрее, чем стрела, и наносит большее повреждение врагу!
			b_giveinvitems(other,self,itminugget,200);
			grd_205_scorpio_crossbow.permanent = 0;
		};
	}
	else
	{
		AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW_OK_13_07");	//Две сотни кусков и ни куском меньше. Если ты мне не заплатишь, я ничему тебя не научу.
	};
};


instance GRD_205_SCORPIO_CROSSBOW2(C_INFO)
{
	npc = grd_205_scorpio;
	condition = grd_205_scorpio_crossbow2_condition;
	information = grd_205_scorpio_crossbow2_info;
	important = 0;
	permanent = 1;
	description = "Я хочу научиться еще лучше стрелять из арбалета.";
};


func int grd_205_scorpio_crossbow2_condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_CROSSBOW) == 1)
	{
		return TRUE;
	};
};

func void grd_205_scorpio_crossbow2_info()
{
	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW2_Info_15_01");	//Я хочу научиться еще лучше стрелять из арбалета.
	AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_Info_13_02");	//Это будет стоить 300 кусков руды.
	if((LOG_SCORPIOCROSSBOW == FALSE) && (KAPITEL < 4))
	{
		Log_CreateTopic(GE_TEACHEROC,LOG_NOTE);
		b_logentry(GE_TEACHEROC,"Скорпио может научить меня стрелять из арбалета.");
		LOG_SCORPIOCROSSBOW = TRUE;
	}
	else if((LOG_SCORPIOCROSSBOW == FALSE) && (KAPITEL >= 4))
	{
		Log_CreateTopic(GE_TEACHEROW,LOG_NOTE);
		b_logentry(GE_TEACHEROW,"Скорпио может научить меня стрелять из арбалета.");
		LOG_SCORPIOCROSSBOW = TRUE;
	};
	Info_ClearChoices(grd_205_scorpio_crossbow2);
	Info_AddChoice(grd_205_scorpio_crossbow2,DIALOG_BACK,grd_205_scorpio_crossbow2_back);
	Info_AddChoice(grd_205_scorpio_crossbow2,b_buildlearnstring(NAME_LEARNCROSSBOW_2,LPCOST_TALENT_CROSSBOW_2,300),grd_205_scorpio_crossbow2_ok);
};

func void grd_205_scorpio_crossbow2_back()
{
	Info_ClearChoices(grd_205_scorpio_crossbow2);
};

func void grd_205_scorpio_crossbow2_ok()
{
	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW2_OK_15_01");	//Начнем прямо сейчас.
	if(Npc_HasItems(hero,itminugget) >= 300)
	{
		if(b_giveskill(other,NPC_TALENT_CROSSBOW,2,LPCOST_TALENT_CROSSBOW_2))
		{
			b_printtrademsg1("Отдано руды: 300");
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_02");	//Преимущество арбалета состоит в том, что точность стрельбы повышается при выстреле с колена.
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_03");	//Но тебе также предстоит научиться оценивать скорость противника.
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_04");	//Выстрел должен быть направлен по ходу его движения, тогда ты сможешь в него попасть.
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_05");	//Если у тебя несколько целей, не пропускай ни одной из них, но веди по ним прицельный огонь по очереди.
			AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_06");	//Я научил тебя всему, что знаю сам.
			b_giveinvitems(other,self,itminugget,300);
			grd_205_scorpio_crossbow2.permanent = 0;
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"GRD_205_Scorpio_CROSSBOW2_OK_13_07");	//Найди мне сначала триста кусков руды.
	};
};


instance GRD_205_SCORPIO_HEYPC(C_INFO)
{
	npc = grd_205_scorpio;
	condition = grd_205_scorpio_heypc_condition;
	information = grd_205_scorpio_heypc_info;
	important = 1;
	permanent = 0;
};


func int grd_205_scorpio_heypc_condition()
{
	if((KAPITEL >= 4) && (Npc_GetDistToNpc(hero,self) < 1000))
	{
		return TRUE;
	};
};

func void grd_205_scorpio_heypc_info()
{
	AI_Output(self,other,"GRD_205_Scorpio_HeyPC_Info_13_01");	//Эй, не бойся, подойди ко мне!
};


instance GRD_205_SCORPIO_BANISHED(C_INFO)
{
	npc = grd_205_scorpio;
	condition = grd_205_scorpio_banished_condition;
	information = grd_205_scorpio_banished_info;
	important = 0;
	permanent = 0;
	description = "У тебя все в порядке?";
};


func int grd_205_scorpio_banished_condition()
{
	if(Npc_KnowsInfo(hero,grd_205_scorpio_heypc))
	{
		return TRUE;
	};
};

func void grd_205_scorpio_banished_info()
{
	AI_Output(other,self,"GRD_205_Scorpio_BANISHED_Info_15_01");	//У тебя все в порядке?
	AI_Output(self,other,"GRD_205_Scorpio_BANISHED_Info_13_02");	//Здесь меня трудно будет найти. Меня не интересует хлам, который растаскивают стражники.
	AI_Output(self,other,"GRD_205_Scorpio_BANISHED_Info_13_03");	//Но я успел захватить кое-что из арсенала. Если тебе нужно хорошее оружие, только скажи.
	if(SCORPIO_EXILE == FALSE)
	{
		Log_CreateTopic(GE_TRADEROW,LOG_NOTE);
		b_logentry(GE_TRADEROW,"Скорпио покинул Старый лагерь из-за того, что там произошло. Теперь он живет в доме вместе с Кавалорном, на дороге между Старым и Новым лагерями.");
		SCORPIO_EXILE = TRUE;
	};
};


instance GRD_205_SCORPIO_TRADE(C_INFO)
{
	npc = grd_205_scorpio;
	condition = grd_205_scorpio_trade_condition;
	information = grd_205_scorpio_trade_info;
	important = 0;
	permanent = 1;
	description = "Покажи мне свои товары.";
	trade = 1;
};


func int grd_205_scorpio_trade_condition()
{
	if(Npc_KnowsInfo(hero,grd_205_scorpio_banished))
	{
		return TRUE;
	};
};

func void grd_205_scorpio_trade_info()
{
	AI_Output(other,self,"GRD_205_Scorpio_TRADE_Info_15_01");	//Покажи мне свои товары.
};

