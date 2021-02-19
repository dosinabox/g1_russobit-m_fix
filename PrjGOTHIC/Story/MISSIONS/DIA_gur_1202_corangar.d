
func void b_corangarlearn()
{
	Info_ClearChoices(gur_1202_corangar_teach);
	Info_AddChoice(gur_1202_corangar_teach,DIALOG_BACK,gur_1202_corangar_teach_back);
	if(DIFF_HARD == TRUE)
	{
		Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,OTHERCAMPLEARNPAY * 5),gur_1202_corangar_teach_str_5);
		Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,OTHERCAMPLEARNPAY),gur_1202_corangar_teach_str_1);
		Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,OTHERCAMPLEARNPAY * 5),gur_1202_corangar_teach_dex_5);
		Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,OTHERCAMPLEARNPAY),gur_1202_corangar_teach_dex_1);
	}
	else
	{
		Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),gur_1202_corangar_teach_str_5);
		Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),gur_1202_corangar_teach_str_1);
		Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),gur_1202_corangar_teach_dex_5);
		Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),gur_1202_corangar_teach_dex_1);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) < 1)
	{
		Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARN2H_1,LPCOST_TALENT_2H_1,0),gur_1202_corangar_zweihand1);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) == 1)
	{
		Info_AddChoice(gur_1202_corangar_teach,b_buildlearnstring(NAME_LEARN2H_2,LPCOST_TALENT_2H_2,0),gur_1202_corangar_zweihand2);
	};
};

instance DIA_GUR_1202_CORANGAR_EXIT(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 999;
	condition = dia_gur_1202_corangar_exit_condition;
	information = dia_gur_1202_corangar_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_gur_1202_corangar_exit_condition()
{
	return TRUE;
};

func void dia_gur_1202_corangar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CORANGAR_LATERTRAINER(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 6;
	condition = dia_corangar_latertrainer_condition;
	information = dia_corangar_latertrainer_info;
	permanent = 0;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int dia_corangar_latertrainer_condition()
{
	if(Npc_GetTrueGuild(hero) != GIL_TPL)
	{
		return 1;
	};
};

func void dia_corangar_latertrainer_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01");	//Хочешь стать хорошим воином? Да, тебе действительно нужно найти опытного учителя.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_02");	//Хорошо. Но, к сожалению, я не тот, кто сможет помочь тебе.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_03");	//Я обучаю лишь тех, кто входит в священный круг Стражей.
};

instance DIA_CORANGAR_LATERTRAINER2(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 6;
	condition = dia_corangar_latertrainer2_condition;
	information = dia_corangar_latertrainer2_info;
	permanent = 0;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int dia_corangar_latertrainer2_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_TPL)
	{
		return 1;
	};
};

func void dia_corangar_latertrainer2_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01");	//Хочешь стать хорошим воином? Да, тебе действительно нужно найти опытного учителя.
	AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_02");	//Чтобы овладеть техникой боя с двуручным мечом, нужна определенная сила и ловкость.
	AI_Output(self,other,"GUR_1202_CorAngar_Teach_08_01");	//Ловкость и сила - очень важные характеристики воина.
	Log_CreateTopic(GE_TEACHERPSI,LOG_NOTE);
	b_logentry(GE_TEACHERPSI,"Кор Ангар может помочь мне увеличить силу и ловкость. Я смогу найти его на тренировочной площадке Стражей, на втором уровне.");
	b_logentry(GE_TEACHERPSI,"Кор Ангар может научить меня обращаться с двуручным мечом. Но это произойдет после того, как я освою бой с одноручным оружием.");
};

instance DIA_CORANGAR_WIETEMPLER(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 7;
	condition = dia_corangar_wietempler_condition;
	information = dia_corangar_wietempler_info;
	permanent = 1;
	description = "Как мне стать одним из Стражей?";
};


func int dia_corangar_wietempler_condition()
{
	if(Npc_KnowsInfo(hero,dia_corangar_latertrainer) && (Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2))
	{
		return 1;
	};
};

func void dia_corangar_wietempler_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WieTempler_15_00");	//Как мне стать одним из Стражей?
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_01");	//Для этого тебе нужно доказать веру в Спящего и преданность ему, став послушником.
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_02");	//После этого приходи ко мне, и я буду учить тебя.
	AI_StopProcessInfos(self);
};


instance GUR_1202_CORANGAR_TEACH(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 10;
	condition = gur_1202_corangar_teach_condition;
	information = gur_1202_corangar_teach_info;
	permanent = 1;
	description = "Как я могу увеличить силу и ловкость?";
};


func int gur_1202_corangar_teach_condition()
{
	if(Npc_KnowsInfo(hero,dia_corangar_latertrainer2) && Npc_GetTrueGuild(hero) == GIL_TPL)
	{
		return TRUE;
	};
};

func void gur_1202_corangar_teach_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_Teach_15_00");	//Как я могу увеличить силу и ловкость?
	b_corangarlearn();
};

func void gur_1202_corangar_teach_back()
{
	Info_ClearChoices(gur_1202_corangar_teach);
};

func void gur_1202_corangar_teach_str_1()
{
	if(DIFF_HARD == FALSE)
	{
		b_buyattributepoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	}
	else if(Npc_HasItems(hero,itminugget) >= OTHERCAMPLEARNPAY)
	{
		if(hero.lp >= 1 && hero.attribute[ATR_STRENGTH] < 100)
		{
			b_printtrademsg1("Отдано руды: 10");
			b_giveinvitems(other,self,itminugget,OTHERCAMPLEARNPAY);
		};
		b_buyattributepoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"SVM_8_WeWillMeetAgain");	//Мы еще встретимся!
	};
	b_corangarlearn();
};

func void gur_1202_corangar_teach_str_5()
{
	if(DIFF_HARD == FALSE)
	{
		b_buyattributepoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	}
	else if(Npc_HasItems(hero,itminugget) >= OTHERCAMPLEARNPAY * 5)
	{
		if(hero.lp >= 5 && hero.attribute[ATR_STRENGTH] < 96)
		{
			b_printtrademsg1("Отдано руды: 50");
			b_giveinvitems(other,self,itminugget,OTHERCAMPLEARNPAY * 5);
		};
		b_buyattributepoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"SVM_8_WeWillMeetAgain");	//Мы еще встретимся!
	};
	b_corangarlearn();
};

func void gur_1202_corangar_teach_dex_1()
{
	if(DIFF_HARD == FALSE)
	{
		b_buyattributepoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else if(Npc_HasItems(hero,itminugget) >= OTHERCAMPLEARNPAY)
	{
		if(hero.lp >= 1 && hero.attribute[ATR_DEXTERITY] < 100)
		{
			b_printtrademsg1("Отдано руды: 10");
			b_giveinvitems(other,self,itminugget,OTHERCAMPLEARNPAY);
		};
		b_buyattributepoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"SVM_8_WeWillMeetAgain");	//Мы еще встретимся!
	};
	b_corangarlearn();
};

func void gur_1202_corangar_teach_dex_5()
{
	if(DIFF_HARD == FALSE)
	{
		b_buyattributepoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else if(Npc_HasItems(hero,itminugget) >= OTHERCAMPLEARNPAY * 5)
	{
		if(hero.lp >= 5 && hero.attribute[ATR_DEXTERITY] < 96)
		{
			b_printtrademsg1("Отдано руды: 50");
			b_giveinvitems(other,self,itminugget,OTHERCAMPLEARNPAY * 5);
		};
		b_buyattributepoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	}
	else
	{
		AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
		AI_Output(self,other,"SVM_8_WeWillMeetAgain");	//Мы еще встретимся!
	};
	b_corangarlearn();
};

func void gur_1202_corangar_zweihand1()
{
	AI_Output(other,self,"GUR_1202_CorAngar_ZWEIHAND1_Info_15_01");	//Научи меня вести бой двуручным мечом.
	if(Npc_GetTalentSkill(hero,NPC_TALENT_1H) < 2)
	{
		AI_Output(self,other,"SVM_8_NoLearnYouAlreadyKnow");	//Сначала ты должен изучить основы и только потом переходить к более сложным вещам.
		PrintScreen("Требуется мастерство одноручного оружия!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else if(b_giveskill(other,NPC_TALENT_2H,1,LPCOST_TALENT_2H_1))
	{
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_03");	//Ты справишься с таким оружием только тогда, когда сможешь управлять не только своим телом, но и духом.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_04");	//Пройдя эту ступень подготовки, закалив свое тело и дух, ты сможешь справиться с мечом.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_05");	//Ключ к этому - умение сосредоточиться. В нем тело и дух становятся единым целым.
	};
	b_corangarlearn();
};

func void gur_1202_corangar_zweihand2()
{
	AI_Output(other,self,"GUR_1202_CorAngar_ZWEIHAND2_Info_15_01");	//Я хочу научиться еще лучше обращаться с двуручным мечом.
	if(b_giveskill(other,NPC_TALENT_2H,2,LPCOST_TALENT_2H_2))
	{
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_02");	//Ты уже освоил основы владения этим оружием. Теперь я научу тебя приемам, достойным мастера.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_03");	//Сила твоего духа поможет тебе предугадывать движения противника до того, как он нанесет удар.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_04");	//Если ты знаешь тактику противника, то победа уже наполовину в твоих руках.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_05");	//Скорость - твое преимущество. Старайся, чтобы движения были плавными и неожиданными, а удары - точными и сильными.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_06");	//Учись не обращать внимания на боль. Исход битвы будет зависеть от твоей силы воли.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_07");	//Сохраняй спокойствие духа. Ты сможешь победить противника, если будешь идти в бой спокойным и сосредоточенным.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_08");	//Используй свою силу осторожно и помни: тебя легче убить, если ты сам стал причиной поединка.
	};
	b_corangarlearn();
};

instance GUR_1202_CORANGAR_WANNABETPL(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 5;
	condition = gur_1202_corangar_wannabetpl_condition;
	information = gur_1202_corangar_wannabetpl_info;
	important = 0;
	permanent = 1;
	description = "Я хочу стать Стражем!";
};


func int gur_1202_corangar_wannabetpl_condition()
{
	if((Npc_KnowsInfo(hero,tpl_1400_gornabar_victory) || Npc_KnowsInfo(hero,tpl_1415_torwache_templeraufnahme) || (CORKALOM_BRINGMCQBALLS == LOG_SUCCESS)) && (Npc_GetTrueGuild(hero) == GIL_NOV))
	{
		return TRUE;
	};
};

func void gur_1202_corangar_wannabetpl_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WANNABETPL_Info_15_01");	//Я хочу стать Стражем!
	if(CORKALOM_BRINGMCQBALLS != LOG_SUCCESS)
	{
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02");	//Ты еще к этому не готов. Я смогу принять только тогда, когда у тебя будет больше опыта.
	}
	else if(hero.level < 10)
	{
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02");	//Ты еще к этому не готов. Я смогу принять только тогда, когда у тебя будет больше опыта.
		b_printguildcondition(10);
	}
	else if(hero.level >= 10)
	{
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_03");	//Твое время пришло, ты можешь присоединиться к нам.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_04");	//Ты должен знать, что Страж не просто защитник лагеря и хороший воин. Мы избранные Стражи Спящего, Стражи духа.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_05");	//Мы в равной мере используем силу тела и силу духа. Настоящим Стражем может стать только тот, чье тело и дух пребывают в гармонии.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_06");	//Я рад, что ты добился таких хороших результатов, затратив на это так мало времени. Ты готов быть принятым в круг Стражей.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07");	//Запомни, когда твой дух силен и тело закалено, ты можешь отразить любую угрозу.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_08");	//Сходи к Гор На Тофу на тренировочную площадку. Он даст тебе твои новые доспехи.
		Npc_SetTrueGuild(hero,GIL_TPL);
		hero.guild = GIL_TPL;
		Log_CreateTopic(GE_BECOMETEMPLAR,LOG_NOTE);
		b_logentry(GE_BECOMETEMPLAR,"Сегодня Кор Ангар назначил меня Стражем. Я смогу взять свой новый доспех у Гор На Тофа. Обычно он стоит на тренировочной площадке.");
	};
};

instance GUR_1202_CORANGAR_SENDS(C_INFO)
{
	npc = gur_1202_corangar;
	condition = gur_1202_corangar_sends_condition;
	information = gur_1202_corangar_sends_info;
	important = 0;
	permanent = 0;
	description = "Что же нам теперь делать?";
};


func int gur_1202_corangar_sends_condition()
{
	if((KAPITEL == 3) && (CORANGAR_GOTOOGY == FALSE))
	{
		return 1;
	};
};

func void gur_1202_corangar_sends_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_Info_15_01");	//Что же нам теперь делать?
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_02");	//Наше видение было очень неясным. Оно принесло нам больше вопросов, чем ответов.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_03");	//Но одно стало ясно: мы видели орка в темной пещере. Недалеко отсюда есть заброшенный храм орков.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_04");	//Раньше орки хоронили там умерших, поэтому это место называлось у них кладбищем орков.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_05");	//Гуру Идол Люкор взял с собой нескольких Стражей и направился туда. Может быть, там мы найдем то, что послужит ответом на наши вопросы.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_06");	//Мне нужен человек, который сможет пойти к ним, а затем вернуться ко мне и рассказать о том, что увидит.
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_Info_15_07");	//Почему ты не можешь пойти туда сам? Ты же предводитель Стражей!
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_08");	//Моя задача - защищать Просвещенного. Я останусь здесь с Юберионом и буду охранять его.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_09");	//Ты уже хорошо послужил нашему лагерю. Я доверяю тебе больше, чем кому бы-то ни было.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_10");	//Поэтому я прошу тебя, отправляйся на кладбище орков и расскажи мне, что удалось найти нашим Стражам.
	Info_ClearChoices(gur_1202_corangar_sends);
	Info_AddChoice(gur_1202_corangar_sends,"А что я за это получу?",gur_1202_corangar_sends_earn);
	Info_AddChoice(gur_1202_corangar_sends,"Я сейчас же пойду туда!",gur_1202_corangar_sends_know);
};

func void gur_1202_corangar_sends_earn()
{
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_EARN_Info_15_01");	//А что я за это получу?
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_EARN_Info_08_02");	//Тебе нужна руда? Наверное, я ошибся в тебе. Но мне все равно нужна твоя помощь. Вот сто кусков руды. Больше у меня нет!
	b_printtrademsg1("Получено руды: 100");
	CreateInvItems(self,itminugget,100);
	b_giveinvitems(self,hero,itminugget,100);
};

func void gur_1202_corangar_sends_know()
{
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_KNOW_Info_15_01");	//Я сейчас же пойду туда!
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_KNOW_Info_08_02");	//Возьми вот это кольцо. Оно сможет защитить тебя в битве!
	b_printtrademsg1("Получено кольцо деревянной кожи.");
	b_story_gotoorcgraveyard();
	CreateInvItem(self,schutzring_geschosse1);
	b_giveinvitems(self,hero,schutzring_geschosse1,1);
	Info_ClearChoices(gur_1202_corangar_sends);
};


instance GUR_1202_CORANGAR_WHERE(C_INFO)
{
	npc = gur_1202_corangar;
	condition = gur_1202_corangar_where_condition;
	information = gur_1202_corangar_where_info;
	important = 0;
	permanent = 0;
	description = "Где находится кладбище орков?";
};


func int gur_1202_corangar_where_condition()
{
	if(Npc_KnowsInfo(hero,gur_1202_corangar_sends) && (BAALLUKOR_BRINGPARCHMENT == 0))
	{
		return 1;
	};
};

func void gur_1202_corangar_where_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WHERE_Info_15_01");	//Где находится кладбище орков?
	AI_Output(self,other,"GUR_1202_CorAngar_WHERE_Info_08_02");	//Это недалеко. Послушник Талас знает дорогу. Ты сможешь найти его на площади перед Храмом. Он укажет тебе путь.
	b_logentry(CH3_ORCGRAVEYARD,"Послушник Талас сможет показать мне дорогу на кладбище орков. Он ждет меня на площади перед Храмом.");
};


instance GUR_1202_CORANGAR_AFTER(C_INFO)
{
	npc = gur_1202_corangar;
	condition = gur_1202_corangar_after_condition;
	information = gur_1202_corangar_after_info;
	important = 0;
	permanent = 0;
	description = "Я был на кладбище орков. Мы не смогли там ничего найти...";
};


func int gur_1202_corangar_after_condition()
{
	if(BAALLUKOR_BRINGPARCHMENT == 4)
	{
		return 1;
	};
};

func void gur_1202_corangar_after_info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_01");	//Я был на кладбище орков. Мы не смогли там ничего найти. Никаких знаков, указывающих на Спящего.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_02");	//А что с Идолом Люкором и Стражами?
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_03");	//Они все мертвы.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_04");	//Мертвы? Но почему, кто смел убить их?
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_05");	//В пещерах очень много орков. Это они убили всех Стражей.
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_06");	//Идол Люкор смог спастись от них, но, к несчастью, он сошел с ума.
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_07");	//Он стал кричать, что Спящий приказал ему убить меня, и попытался выполнить этот приказ.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_08");	//Наверное, его ум помутился из-за большого разочарования. Он так хотел найти что-нибудь там.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_09");	//Я не верю, что его поступок был вызван волей Спящего.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_10");	//Такого не может... невозможно... Неважно!
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_11");	//Главное, что Идол Люкор не смог осуществить свое намерение.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_12");	//Теперь вся наша надежда на Юбериона.
	b_givexp(XP_REPORTTOCORANGAR);
	b_story_backfromorcgraveyard();
};

var int yberion_day;

instance INFO_CORANGAR_FINDHERB(C_INFO)
{
	npc = gur_1202_corangar;
	condition = info_corangar_findherb_condition;
	information = info_corangar_findherb_info;
	permanent = 0;
	important = 0;
	description = "Как дела у Юбериона?";
};


func int info_corangar_findherb_condition()
{
	if(Npc_KnowsInfo(hero,gur_1202_corangar_after))
	{
		return 1;
	};
};

func void info_corangar_findherb_info()
{
	AI_Output(other,self,"Mis_3_NC_CorAngar_FindHerb_15_01");	//Как дела у Юбериона?
	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_02");	//Сам он не сможет проснуться. Он быстро слабеет. Я знаю, что может его разбудить, но для этого мне нужна твоя помощь.
	AI_Output(other,self,"Mis_3_NC_CorAngar_FindHerb_15_03");	//Как я могу ему помочь?
	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_04");	//Найди мне болотные целебные травы. Принеси мне пять самых действенных из них.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Running_08_02");	//Может быть, Фортуно сможет тебе помочь? Он же травник.
	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_05");	//И, пожалуйста, поторопись!
	AI_StopProcessInfos(self);
	CORANGAR_FINDHERB = LOG_RUNNING;
	Log_CreateTopic(CH3_FINDHERBS,LOG_MISSION);
	Log_SetTopicStatus(CH3_FINDHERBS,LOG_RUNNING);
	b_logentry(CH3_FINDHERBS,"Юберион все еще без сознания. Кор Ангар попросил меня найти для него пять кустов самых сильных лечебных трав. Но поможет ли это..?");
	YBERION_DAY = Wld_GetDay();
};


instance INFO_CORANGAR_FINDHERB_WHERE(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 1;
	condition = info_corangar_findherb_where_condition;
	information = info_corangar_findherb_where_info;
	permanent = 0;
	important = 0;
	description = "А где растут эти травы?";
};


func int info_corangar_findherb_where_condition()
{
	if((CORANGAR_FINDHERB == LOG_RUNNING) && (Npc_HasItems(other,itfo_plants_herb_03) < 5))
	{
		return 1;
	};
};

func void info_corangar_findherb_where_info()
{
	AI_Output(other,self,"Info_CorAngar_FindHerb_WHERE_15_01");	//А где растут эти травы?
	AI_Output(self,other,"Info_CorAngar_FindHerb_WHERE_08_02");	//Поищи в болотах за лагерем. Они растут достаточно далеко отсюда, но будь осторожен, там тебя могут поджидать болотожоры.
	AI_Output(self,other,"Info_CorAngar_FindHerb_WHERE_08_03");	//Не стоит терять времени. Иди же!
	AI_StopProcessInfos(self);
	b_logentry(CH3_FINDHERBS,"Эти травы я смогу найти далеко на болотах за лагерем Братства. Там обитают опасные болотожоры. Я должен быть очень осторожен.");
};


instance INFO_CORANGAR_FINDHERB_LOOK(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 1;
	condition = info_corangar_findherb_look_condition;
	information = info_corangar_findherb_look_info;
	permanent = 0;
	important = 0;
	description = "Как мне узнать те травы, которые помогут Юбериону?";
};


func int info_corangar_findherb_look_condition()
{
	if((CORANGAR_FINDHERB == LOG_RUNNING) && (Npc_HasItems(other,itfo_plants_herb_03) < 5))
	{
		return 1;
	};
};

func void info_corangar_findherb_look_info()
{
	AI_Output(other,self,"Info_CorAngar_FindHerb_LOOK_15_01");	//Как мне узнать те травы, которые помогут Юбериону?
	AI_Output(self,other,"Info_CorAngar_FindHerb_LOOK_08_02");	//Они похожи на звезды из восьми зеленых и оранжевых лучей-листьев.
	AI_Output(self,other,"Info_CorAngar_FindHerb_LOOK_08_03");	//А теперь иди.
	AI_StopProcessInfos(self);
	b_logentry(CH3_FINDHERBS,"Лечебные травы похожи на звезды из четырех зеленых и четырех оранжевых листьев.");
};


instance INFO_CORANGAR_FINDHERB_RUNNING(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 1;
	condition = info_corangar_findherb_running_condition;
	information = info_corangar_findherb_running_info;
	permanent = 1;
	important = 0;
	description = "Тех трав, которые я нашел, будет недостаточно.";
};


func int info_corangar_findherb_running_condition()
{
	if((CORANGAR_FINDHERB == LOG_RUNNING) && (Npc_HasItems(other,itfo_plants_herb_03) < 5) && (Npc_HasItems(other,itfo_plants_herb_03) > 0) && Npc_KnowsInfo(hero,info_corangar_findherb_where) && Npc_KnowsInfo(hero,info_corangar_findherb_look))
	{
		return 1;
	};
};

func void info_corangar_findherb_running_info()
{
	var C_NPC fortuno;
	AI_Output(other,self,"Info_CorAngar_FindHerb_Running_15_01");	//Тех трав, которые я нашел, будет недостаточно.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Running_08_02");	//Может быть, Фортуно сможет тебе помочь? Он же травник.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Running_08_03");	//Тебе нужно торопиться. Принеси пять кустов. Юберион не может ждать ни минуты.
	AI_StopProcessInfos(self);
	if(!FORTUNO_HASYBERIONHERBS)
	{
		fortuno = Hlp_GetNpc(nov_1357_fortuno);
		CreateInvItems(fortuno,itfo_plants_herb_03,5);
		FORTUNO_HASYBERIONHERBS = TRUE;
		b_logentry(CH3_FINDHERBS,"Такие травы могут быть припасены у Фортуно.");
	};
};


instance INFO_CORANGAR_FINDHERB_SUCCESS(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 1;
	condition = info_corangar_findherb_success_condition;
	information = info_corangar_findherb_success_info;
	permanent = 0;
	important = 0;
	description = "(отдать целебные травы)";
};


func int info_corangar_findherb_success_condition()
{
	if(Npc_HasItems(other,itfo_plants_herb_03) >= 5 && (CORANGAR_FINDHERB == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void info_corangar_findherb_success_info()
{
	var C_NPC yberion;
	var C_NPC angar;
	yberion = Hlp_GetNpc(gur_1200_yberion);
	angar = Hlp_GetNpc(gur_1202_corangar);
	b_giveinvitems(other,self,itfo_plants_herb_03,5);
	AI_Output(other,self,"Info_CorAngar_FindHerb_Success_15_01");	//Я добыл целебные травы для Юбериона.
	b_printtrademsg1("Отдано 5 целебных корней.");
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_02");	//Отлично. Когда ты уходил, Юберион очнулся ненадолго.
	AI_Output(other,self,"Info_CorAngar_FindHerb_Success_15_03");	//Он что-нибудь сказал?
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_04");	//Да, он сказал, что Спящий на самом деле не является тем, что мы о нем думаем. Мы не должны пытаться разбудить его.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_05");	//Теперь нам остается надеяться на то, что Юбериона можно вылечить.
	YBERION_DEAD = LOG_RUNNING;
	b_givexp(XP_FINDHERBS);
	//CORANGAR_FINDHERB = LOG_SUCCESS;
	//b_logentry(CH3_FINDHERBS,"Я передал Кор Ангару лечебные травы. Теперь можно только надеяться на то, что еще не слишком поздно.");
	//Log_SetTopicStatus(CH3_FINDHERBS,LOG_SUCCESS);
	b_logentry(CH3_FINDHERBS,"Я передал Кор Ангару лечебные травы, но они не помогли Юбериону... Глава Братства умер...");
	CORANGAR_FINDHERB = LOG_FAILED;
	Log_SetTopicStatus(CH3_FINDHERBS,LOG_FAILED);
	YBERION_DIED = TRUE;
	AI_Wait(self,0.5);
	AI_GotoWP(self,"PSI_TEMPLE_ROOMS_IN_02");
	AI_SetWalkMode(self,NPC_RUN);
	AI_UseMob(self,"BOOK",-1);
	AI_TurnToNPC(self,yberion);
	yberion.flags = 0;
	Npc_ChangeAttribute(yberion,ATR_HITPOINTS,-yberion.attribute[ATR_HITPOINTS_MAX]);
	AI_UseItemToState(self,itfo_plants_herb_03,0);
	AI_PlayAni(self,"T_PLUNDER");
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_00");	//Юберион умер. Наш духовный учитель оставил нас!
	AI_UseItemToState(self,itfo_plants_herb_03,-1);
	AI_TurnToNPC(self,other);
	AI_TurnToNPC(other,self);
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_01");	//Даже твоя помощь не смогла отвратить от него смерть!
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_02");	//Что же теперь будет, Кор Ангар?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_03");	//Я всегда доверял Юбериону. Перед смертью он сказал мне, что теперь нам остается надеяться только на магов Воды.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_04");	//Значит, нам нужно помочь магам Воды.
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_05");	//Да, им нужен будет юнитор и альманах. И то, и другое находится у Кор Галома.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_06");	//А где сейчас Кор Галом?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_07");	//После слов Юбериона он ужасно рассердился и отправился сам искать путь к Спящему, взяв с собой нескольких Стражей.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_08");	//Как же мы теперь сможем забрать юнитор?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_09");	//Я думаю, он оставил юнитор и книгу в своей лаборатории. Вот тебе ключ от его сундука.
	b_printtrademsg2("Получен ключ из лаборатории.");
	CreateInvItem(self,itarrune_5_7_pyrokinesis);
	CreateInvItem(self,stab_des_lichts);
	if(YBERION_KEY_STOLEN == FALSE)
	{
		CreateInvItem(self,itke_yberion);
	};
	CreateInvItem(self,itke_psi_kalom_01);
	b_giveinvitems(self,other,itke_psi_kalom_01,1);
	Log_CreateTopic(CH3_ESCAPEPLANNC,LOG_MISSION);
	Log_SetTopicStatus(CH3_ESCAPEPLANNC,LOG_RUNNING);
	if(c_npcbelongstopsicamp(hero))
	{
		b_logentry(CH3_ESCAPEPLANNC,"Умер Юберион, духовный отец Братства! Да упокоится он с миром! Перед смертью он выразил свою волю: братья должны помочь магам Воды осуществить их план. Кор Ангар передал мне ключ от сундука из лаборатории Кор Галома. В нем находятся альманах и юнитор, которые я раздобыл для Братства. По мнению Кор Ангара, эти предметы могут пригодиться магам Воды.");
	}
	else
	{
		b_logentry(CH3_ESCAPEPLANNC,"Я окончательно решил пойти в Новый лагерь, чтобы помочь магам Воды разрушить Барьер. Кор Ангар передал мне ключ от сундука из лаборатории Кор Галома. В нем находятся альманах и юнитор, которые я раздобыл для Братства. По мнению Кор Ангара эти предметы могут пригодиться магам Воды. ");
	};
	if(BAALORUN_FETCHWEED == LOG_RUNNING)
	{
		BAALORUN_FETCHWEED = LOG_FAILED;
		b_logentry(CH1_DELIVERWEED,"Кор Галом покинул лагерь, я не успел отдать ему урожай болотника.");
		Log_SetTopicStatus(CH1_DELIVERWEED,LOG_FAILED);
	};
	if(KALOM_KRAUTBOTE == LOG_RUNNING)
	{
		KALOM_KRAUTBOTE = LOG_FAILED;
		b_logentry(CH1_KRAUTBOTE,"Кор Галом пропал, теперь я не смогу отдать ему руду за болотник.");
		Log_SetTopicStatus(CH1_KRAUTBOTE,LOG_FAILED);
	};
	if(KALOM_DRUGMONOPOL == LOG_RUNNING)
	{
		KALOM_DRUGMONOPOL = LOG_FAILED;
		b_logentry(CH1_DRUGMONOPOL,"Я не смогу получить награду за устранение конкурентов, Кор Галом ушел из лагеря.");
		Log_SetTopicStatus(CH1_DRUGMONOPOL,LOG_FAILED);
	};
	CORANGAR_SENDTONC = TRUE;
};

instance INFO_CORANGAR_TELEPORT(C_INFO)
{
	npc = gur_1202_corangar;
	condition = info_corangar_teleport_condition;
	information = info_corangar_teleport_info;
	permanent = 0;
	important = 1;
};


func int info_corangar_teleport_condition()
{
	if(Npc_KnowsInfo(hero,info_corangar_findherb_success) || Npc_KnowsInfo(hero,info_corangar_yberion_died) || Npc_KnowsInfo(hero,info_corangar_healthwater))
	{
		return TRUE;
	};
};

func void info_corangar_teleport_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_01");	//Подожди!
	AI_Output(hero,self,"Info_CorAngar_TELEPORT_15_02");	//В чем дело?
	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_03");	//Возьми эту руну в знак нашей благодарности за твою помощь.
	b_printtrademsg1("Получена руна телепортации в Болотный лагерь.");
	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_04");	//Она даст тебе возможность быстро перенестись на площадь перед нашим Храмом.
	AI_Output(hero,self,"Info_CorAngar_TELEPORT_15_05");	//Спасибо тебе!
	if(YBERION_DIED == TRUE)
	{
		Npc_ExchangeRoutine(self,"AFTER");
		b_exchangeroutine(gur_1207_natalia,"AFTER");
		b_exchangeroutine(gur_1205_chani,"AFTER");
	}
	else if(YBERION_HEALED == TRUE)
	{
		Npc_ExchangeRoutine(self,"guru");
	};
	b_story_senttonc();
};

instance CORANGAR_STEALKEY(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 990;
	condition = corangar_stealkey_condition;
	information = corangar_stealkey_info;
	important = 0;
	permanent = 0;
	description = "(украсть ключ)";
};


func int corangar_stealkey_condition()
{
	if(Npc_HasItems(self,itke_yberion) && Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 2 && Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 1)
	{
		return TRUE;
	};
};

func void corangar_stealkey_info()
{
	AI_GotoNpc(other,self);
	AI_Output(other,self,"GUR_1201_CorKalom_CRAWLER_Info_15_01");	//Есть какие-нибудь верные приемы охоты на ползунов?
	AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07");	//Запомни, когда твой дух силен и тело закалено, ты можешь отразить любую угрозу.
	AI_DrawWeapon(self);
	AI_PlayAni(other,"T_STAND_2_IGET");
	AI_PlayAni(other,"T_IGET_2_STAND");
	AI_PlayAni(self,"T_1HSFREE");
	AI_RemoveWeapon(self);
	PrintScreen("Украден ключ.",-1,_YPOS_MESSAGE_TAKEN,"FONT_OLD_10_WHITE.TGA",_TIME_MESSAGE_TAKEN);
	CreateInvItem(hero,itke_yberion);
	Npc_RemoveInvItem(self,itke_yberion);
	AI_StopProcessInfos(self);
};

instance INFO_CORANGAR_YBERION_DIED(C_INFO)
{
	npc = gur_1202_corangar;
	condition = info_corangar_yberion_died_condition;
	information = info_corangar_yberion_died_info;
	permanent = 0;
	important = 1;
};


func int info_corangar_yberion_died_condition()
{
	if((YBERION_DAY <= (Wld_GetDay() - 2)) && CORANGAR_FINDHERB == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void info_corangar_yberion_died_info()
{
	var C_NPC yberion;
	yberion = Hlp_GetNpc(gur_1200_yberion);
	yberion.flags = 0;
	Npc_ChangeAttribute(yberion,ATR_HITPOINTS,-yberion.attribute[ATR_HITPOINTS_MAX]);
	CreateInvItem(self,itarrune_5_7_pyrokinesis);
	CreateInvItem(self,stab_des_lichts);
	CreateInvItem(self,itke_yberion);
	CreateInvItem(self,itke_psi_kalom_01);
	b_giveinvitems(self,other,itke_psi_kalom_01,1);
	Log_CreateTopic(CH3_ESCAPEPLANNC,LOG_MISSION);
	Log_SetTopicStatus(CH3_ESCAPEPLANNC,LOG_RUNNING);
	if(c_npcbelongstopsicamp(hero))
	{
		b_logentry(CH3_ESCAPEPLANNC,"Умер Юберион, духовный отец Братства! Да упокоится он с миром! Перед смертью он выразил свою волю: братья должны помочь магам Воды осуществить их план. Кор Ангар передал мне ключ от сундука из лаборатории Кор Галома. В нем находятся альманах и юнитор, которые я раздобыл для Братства. По мнению Кор Ангара, эти предметы могут пригодиться магам Воды.");
	}
	else
	{
		b_logentry(CH3_ESCAPEPLANNC,"Я окончательно решил пойти в Новый лагерь, чтобы помочь магам Воды разрушить Барьер. Кор Ангар передал мне ключ от сундука из лаборатории Кор Галома. В нем находятся альманах и юнитор, которые я раздобыл для Братства. По мнению Кор Ангара эти предметы могут пригодиться магам Воды. ");
	};
	if(BAALORUN_FETCHWEED == LOG_RUNNING)
	{
		BAALORUN_FETCHWEED = LOG_FAILED;
		b_logentry(CH1_DELIVERWEED,"Кор Галом покинул лагерь, я не успел отдать ему урожай болотника.");
		Log_SetTopicStatus(CH1_DELIVERWEED,LOG_FAILED);
	};
	if(KALOM_KRAUTBOTE == LOG_RUNNING)
	{
		KALOM_KRAUTBOTE = LOG_FAILED;
		b_logentry(CH1_KRAUTBOTE,"Кор Галом пропал, теперь я не смогу отдать ему руду за болотник.");
		Log_SetTopicStatus(CH1_KRAUTBOTE,LOG_FAILED);
	};
	if(KALOM_DRUGMONOPOL == LOG_RUNNING)
	{
		KALOM_DRUGMONOPOL = LOG_FAILED;
		b_logentry(CH1_DRUGMONOPOL,"Я не смогу получить награду за устранение конкурентов, Кор Галом ушел из лагеря.");
		Log_SetTopicStatus(CH1_DRUGMONOPOL,LOG_FAILED);
	};
	CORANGAR_SENDTONC = TRUE;
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_00");	//Юберион умер. Наш духовный учитель оставил нас!
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_02");	//Что же теперь будет, Кор Ангар?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_03");	//Я всегда доверял Юбериону. Перед смертью он сказал мне, что теперь нам остается надеяться только на магов Воды.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_04");	//Значит, нам нужно помочь магам Воды.
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_05");	//Да, им нужен будет юнитор и альманах. И то, и другое находится у Кор Галома.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_06");	//А где сейчас Кор Галом?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_07_New");	//Отправился сам искать путь к Спящему, взяв с собой нескольких Стражей.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_08");	//Как же мы теперь сможем забрать юнитор?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_09");	//Я думаю, он оставил юнитор и книгу в своей лаборатории. Вот тебе ключ от его сундука.
	b_printtrademsg1("Получен ключ из лаборатории.");
	b_logentry(CH3_FINDHERBS,"Я не успел принести Юбериону лечебные травы... Глава Братства умер...");
	CORANGAR_FINDHERB = LOG_FAILED;
	Log_SetTopicStatus(CH3_FINDHERBS,LOG_FAILED);
	YBERION_DIED = TRUE;
	AI_StopProcessInfos(self);
};

instance INFO_CORANGAR_HEALTHWATER(C_INFO)
{
	npc = gur_1202_corangar;
	nr = 2;
	condition = info_corangar_healthwater_condition;
	information = info_corangar_healthwater_info;
	permanent = 0;
	important = 0;
	description = "(отдать зелье Фортуно)";
};


func int info_corangar_healthwater_condition()
{
	if((CORANGAR_FINDHERB == LOG_RUNNING) && Npc_HasItems(other,healthwater))
	{
		return 1;
	};
};

func void info_corangar_healthwater_info()
{
	var C_NPC yberion;
	yberion = Hlp_GetNpc(gur_1200_yberion);
	CreateInvItem(self,itarrune_5_7_pyrokinesis);
	CreateInvItem(self,stab_des_lichts);
	CreateInvItem(self,itke_yberion);
	CreateInvItem(self,itke_psi_kalom_01);
	b_giveinvitems(self,other,itke_psi_kalom_01,1);
	b_giveinvitems(other,self,healthwater,1);
	Log_CreateTopic(CH3_ESCAPEPLANNC,LOG_MISSION);
	Log_SetTopicStatus(CH3_ESCAPEPLANNC,LOG_RUNNING);
	b_givexp(2000);
	if(c_npcbelongstopsicamp(hero))
	{
		b_logentry(CH3_ESCAPEPLANNC,"Юберион ненадолго очнулся и выразил свою волю: братья должны помочь магам Воды осуществить их план. Кор Ангар передал мне ключ от сундука из лаборатории Кор Галома. В нем находятся альманах и юнитор, которые я раздобыл для Братства. По мнению Кор Ангара, эти предметы могут пригодиться магам Воды.");
	}
	else
	{
		b_logentry(CH3_ESCAPEPLANNC,"Я окончательно решил пойти в Новый лагерь, чтобы помочь магам Воды разрушить Барьер. Кор Ангар передал мне ключ от сундука из лаборатории Кор Галома. В нем находятся альманах и юнитор, которые я раздобыл для Братства. По мнению Кор Ангара, эти предметы могут пригодиться магам Воды.");
	};
	if(BAALORUN_FETCHWEED == LOG_RUNNING)
	{
		BAALORUN_FETCHWEED = LOG_FAILED;
		b_logentry(CH1_DELIVERWEED,"Кор Галом покинул лагерь, я не успел отдать ему урожай болотника.");
		Log_SetTopicStatus(CH1_DELIVERWEED,LOG_FAILED);
	};
	if(KALOM_KRAUTBOTE == LOG_RUNNING)
	{
		KALOM_KRAUTBOTE = LOG_FAILED;
		b_logentry(CH1_KRAUTBOTE,"Кор Галом пропал, теперь я не смогу отдать ему руду за болотник.");
		Log_SetTopicStatus(CH1_KRAUTBOTE,LOG_FAILED);
	};
	if(KALOM_DRUGMONOPOL == LOG_RUNNING)
	{
		KALOM_DRUGMONOPOL = LOG_FAILED;
		b_logentry(CH1_DRUGMONOPOL,"Я не смогу получить награду за устранение конкурентов, Кор Галом ушел из лагеря.");
		Log_SetTopicStatus(CH1_DRUGMONOPOL,LOG_FAILED);
	};
	CORANGAR_SENDTONC = TRUE;
	AI_Output(other,self,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_15_01_New");	//Вот, может быть, это поможет.
	b_printtrademsg1("Отдано лечебное зелье Фортуно.");
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_05");	//Теперь нам остается надеяться на то, что Юбериона можно вылечить.
	AI_Wait(self,0.5);
	AI_GotoWP(self,"PSI_TEMPLE_ROOMS_IN_02");
	AI_SetWalkMode(self,NPC_RUN);
	AI_UseMob(self,"BOOK",-1);
	AI_TurnToNPC(self,yberion);
	AI_UseItemToState(self,healthwater,0);
	AI_PlayAni(self,"T_PLUNDER");
	AI_Wait(self,3);
	AI_UseItemToState(self,healthwater,-1);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_02_New");	//Отлично. Юберион очнулся ненадолго.
	AI_TurnToNPC(other,self);
	AI_Output(other,self,"Info_CorAngar_FindHerb_Success_15_03");	//Он что-нибудь сказал?
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_04");	//Да, он сказал, что Спящий на самом деле не является тем, что мы о нем думаем. Мы не должны пытаться разбудить его.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_02");	//Что же теперь будет, Кор Ангар?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_03_New");	//Я всегда доверял Юбериону. Он сказал мне, что теперь нам остается надеяться только на магов Воды.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_04");	//Значит, нам нужно помочь магам Воды.
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_05");	//Да, им нужен будет юнитор и альманах. И то, и другое находится у Кор Галома.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_06");	//А где сейчас Кор Галом?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_07_New");	//Отправился сам искать путь к Спящему, взяв с собой нескольких Стражей.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_08");	//Как же мы теперь сможем забрать юнитор?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_09");	//Я думаю, он оставил юнитор и книгу в своей лаборатории. Вот тебе ключ от его сундука.
	b_printtrademsg2("Получен ключ из лаборатории.");
	b_logentry(CH3_FINDHERBS,"Зелье Фортуно сработало! Юберион пришел в себя и успел немного поговорить с Кор Ангаром, прежде чем потерял сознание. Он все еще слаб, но уже не при смерти. Надеюсь, он поправится.");
	CORANGAR_FINDHERB = LOG_SUCCESS;
	Log_SetTopicStatus(CH3_FINDHERBS,LOG_SUCCESS);
	YBERION_HEALED = TRUE;
	AI_StopProcessInfos(self);
};

