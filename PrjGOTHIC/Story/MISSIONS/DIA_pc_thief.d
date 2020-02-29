
func void b_diegolearn()
{
	Info_ClearChoices(info_diego_teach);
	Info_AddChoice(info_diego_teach,DIALOG_BACK,info_diego_teach_back);
	if(hero.guild == GIL_STT || hero.guild == GIL_GRD || hero.guild == GIL_KDF || KAPITEL > 3)
	{
		Info_AddChoice(info_diego_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),info_diego_teach_str_5);
		Info_AddChoice(info_diego_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),info_diego_teach_str_1);
		Info_AddChoice(info_diego_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),info_diego_teach_dex_5);
		Info_AddChoice(info_diego_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),info_diego_teach_dex_1);
	}
	else
	{
		Info_AddChoice(info_diego_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,OTHERCAMPLEARNPAY * 5),info_diego_teach_str_5);
		Info_AddChoice(info_diego_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,OTHERCAMPLEARNPAY),info_diego_teach_str_1);
		Info_AddChoice(info_diego_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,OTHERCAMPLEARNPAY * 5),info_diego_teach_dex_5);
		Info_AddChoice(info_diego_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,OTHERCAMPLEARNPAY),info_diego_teach_dex_1);
	};
};

var int diego_after_gamestart;

instance INFO_DIEGO_GAMESTART(C_INFO)
{
	npc = pc_thief;
	nr = 1;
	condition = info_diego_gamestart_condition;
	information = info_diego_gamestart_info;
	permanent = 0;
	important = 1;
};


func int info_diego_gamestart_condition()
{
	if(KAPITEL < 2)
	{
		return TRUE;
	};
};

func void info_diego_gamestart_info()
{
	AI_Output(self,hero,"Info_Diego_Gamestart_11_00");	//Меня зовут Диего.
	AI_Output(hero,self,"Info_Diego_Gamestart_15_01");	//А меня...
	AI_Output(self,hero,"Info_Diego_Gamestart_11_02");	//Я не хочу знать, кто ты такой. Ты только что появился здесь, а я присматриваю за новичками. Для начала хватит и этого.
	AI_Output(self,hero,"Info_Diego_Gamestart_11_03");	//Если ты хочешь остаться в живых в этом гиблом месте, тебе придется поговорить со мной. Впрочем, умереть ты можешь в любое время, и кто я такой, чтобы помешать тебе? Ну, так что ты думаешь?
	Npc_ExchangeRoutine(cs_eskorte1,"flee");
	Npc_ExchangeRoutine(cs_eskorte2,"flee");
	b_kapitelwechsel(1);
};


instance INFO_DIEGO_EXIT_GAMESTART(C_INFO)
{
	npc = pc_thief;
	nr = 999;
	condition = info_diego_exit_gamestart_condition;
	information = info_diego_exit_gamestart_info;
	permanent = 0;
	description = DIALOG_ENDE;
};


func int info_diego_exit_gamestart_condition()
{
	return 1;
};

func void info_diego_exit_gamestart_info()
{
	AI_Output(hero,self,"Info_Diego_EXIT_Gamestart_15_00");	//Спасибо за помощь.
	if(!Npc_KnowsInfo(hero,info_diego_kolonie))
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_01");	//Ну, ты сделал свой выбор. Рад был познакомиться.
	}
	else
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_02");	//Встретимся в Старом лагере.
	};
	AI_StopProcessInfos(self);
	if(KAPITEL < 2)
	{
		Npc_ExchangeRoutine(self,"Start");
		DIEGO_AFTER_GAMESTART = TRUE;
	};
};


instance INFO_DIEGO_EXIT_LATER(C_INFO)
{
	npc = pc_thief;
	nr = 999;
	condition = info_diego_exit_later_condition;
	information = info_diego_exit_later_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_diego_exit_later_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_exit_gamestart))
	{
		return 1;
	};
};

func void info_diego_exit_later_info()
{
	if(self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output(self,hero,"Info_Diego_EXIT_11_01");	//Пойдем.
	}
	else if(Npc_KnowsInfo(hero,org_801_lares_bringlistback) && SATURAS_BRINGFOCI == 0)
	{
		AI_Output(self,hero,"SVM_11_YouKilledOCfolk");	//В Старом лагере кто-то убит. Говорят, что ты в этом замешан...
		AI_Output(self,hero,"SVM_11_RunCoward");	//Больше здесь не появляйся!
	}
	else
	{
		AI_Output(hero,self,"Info_Diego_EXIT_15_00");	//До встречи!
	};
	AI_StopProcessInfos(self);
};


instance INFO_DIEGO_BRIEF(C_INFO)
{
	npc = pc_thief;
	nr = 10;
	condition = info_diego_brief_condition;
	information = info_diego_brief_info;
	permanent = 0;
	description = "У меня есть послание для Верховного Мага Круга Огня.";
};


func int info_diego_brief_condition()
{
	if(KAPITEL < 3 && ((Npc_HasItems(other,itwr_fire_letter_01) >= 1) || (Npc_HasItems(other,itwr_fire_letter_02) >= 1)))
	{
		return TRUE;
	};
};

func void info_diego_brief_info()
{
	AI_Output(hero,self,"Info_Diego_Brief_15_00");	//У меня есть послание для Верховного Мага Круга Огня.
	if(Npc_GetDistToWP(hero,"OCR_OUTSIDE_HUT_1") < 1500)
	{
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
	};
	AI_Output(self,hero,"Info_Diego_Brief_11_01");	//Да ну?!
	AI_Output(hero,self,"Info_Diego_Brief_15_02");	//Мне дал его какой-то маг, перед тем как меня сбросили сюда.
	AI_Output(self,hero,"Info_Diego_Brief_11_03");	//Твое счастье, что я последнее время не в ладах с магами. Любой другой мигом перерезал бы тебе глотку за это письмо.
	AI_Output(self,hero,"Info_Diego_Brief_11_04");	//Маги хорошо платят гонцам, а здесь большинство людей не имеет за душой и гроша.
	AI_Output(self,hero,"Info_Diego_Brief_11_05");	//На твоем месте я бы держал рот на замке до тех пор, пока не встретил кого-нибудь из магов. Правда, тебе на это не стоит рассчитывать.
	AI_Output(hero,self,"Info_Diego_Brief_15_06");	//Почему?
	AI_Output(self,hero,"Info_Diego_Brief_11_07");	//Маги живут в замке Старого лагеря, но только люди Гомеза могут входить туда.
	Log_CreateTopic(KDFLETTER,LOG_MISSION);
	Log_SetTopicStatus(KDFLETTER,LOG_RUNNING);
	b_logentry(KDFLETTER,"Перед отправкой за Барьер какой-то седой маг выдал мне письмо, которое необходимо отнести магам Огня. Диего рассказал, что эти маги живут в центре Старого лагеря, но к ним довольно сложно попасть.");
	PYROCAR_MESSENGER = LOG_RUNNING;
};


instance INFO_DIEGO_WARUMGEHOLFEN(C_INFO)
{
	npc = pc_thief;
	nr = 5;
	condition = info_diego_warumgeholfen_condition;
	information = info_diego_warumgeholfen_info;
	permanent = 0;
	description = "Почему ты мне помогаешь?";
};


func int info_diego_warumgeholfen_condition()
{
	if(!DIEGO_AFTER_GAMESTART && (KAPITEL < 2))
	{
		return 1;
	};
};

func void info_diego_warumgeholfen_info()
{
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_00");	//Почему ты мне помогаешь?
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_01");	//Потому что тебе нужна была помощь. Буллит не стал бы долго возиться с тобой. Ему нравится убивать таких, как ты.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_02");	//А я не хотел просто стоять в стороне и смотреть. Я же не просто так пришел сюда. У меня есть для тебя одно предложение.
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_03");	//Предложение?
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_04");	//Да. Я думаю, после знакомства с шайкой Буллита ты понял, что тебе нужна защита.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_05");	//Каждый, кто попадает сюда, должен сделать свой выбор. В колонии есть три лагеря, и ты должен будешь присоединиться к одному из них.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_06");	//Я здесь для того, чтобы показать новичкам, что Старый лагерь - лучшее место для них.
};


instance INFO_DIEGO_BULLIT(C_INFO)
{
	npc = pc_thief;
	nr = 5;
	condition = info_diego_bullit_condition;
	information = info_diego_bullit_info;
	permanent = 0;
	description = "А что сейчас делает этот Буллит?";
};


func int info_diego_bullit_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_warumgeholfen) && !DIEGO_AFTER_GAMESTART)
	{
		return 1;
	};
};

func void info_diego_bullit_info()
{
	AI_Output(hero,self,"Info_Diego_Bullit_15_02");	//А что сейчас делает этот Буллит?
	AI_Output(self,hero,"Info_Diego_Bullit_11_03");	//Он с остальными переносит в лагерь припасы из внешнего мира. Ты найдешь его там.
	AI_Output(self,hero,"Info_Diego_Bullit_11_04");	//Но если ты хочешь отплатить ему, будь осторожен. Буллит опытный боец.
};


instance INFO_DIEGO_KOLONIE(C_INFO)
{
	npc = pc_thief;
	nr = 1;
	condition = info_diego_kolonie_condition;
	information = info_diego_kolonie_info;
	permanent = 0;
	description = "Расскажи мне об этом месте.";
};


func int info_diego_kolonie_condition()
{
	if(KAPITEL < 2)
	{
		return TRUE;
	};
};

func void info_diego_kolonie_info()
{
	AI_Output(hero,self,"Info_Diego_Kolonie_15_00");	//Расскажи мне об этом месте.
	AI_Output(self,hero,"Info_Diego_Kolonie_11_01");	//Все, что находится внутри Барьера, мы называем колонией. Ты уже знаешь, что мы здесь добываем руду для короля.
	AI_Output(self,hero,"Info_Diego_Kolonie_11_02");	//Ну, по крайней мере, в Старом лагере...
	AI_Output(self,hero,"Info_Diego_Kolonie_11_03");	//В колонии есть три лагеря. Старый лагерь самый большой. Он был первым.
};


instance INFO_DIEGO_BARRIERE(C_INFO)
{
	npc = pc_thief;
	nr = 3;
	condition = info_diego_barriere_condition;
	information = info_diego_barriere_info;
	permanent = 0;
	description = "Расскажи мне о Барьере.";
};


func int info_diego_barriere_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_kolonie) && (DIEGO_AFTER_GAMESTART == TRUE))
	{
		return 1;
	};
};

func void info_diego_barriere_info()
{
	AI_Output(hero,self,"Info_Diego_Barriere_15_00");	//Расскажи мне о Барьере.
	AI_Output(self,hero,"Info_Diego_Barriere_11_01");	//Я мало что могу о нем рассказать. Мы знаем только, что он непроницаем.
	AI_Output(hero,self,"Info_Diego_Barriere_15_02");	//Что случится, если попробую выйти за Барьер?
	AI_Output(self,hero,"Info_Diego_Barriere_11_03");	//Последний, кто попробовал - уже мертв. Этот чертов Барьер легко впускает тебя внутрь, но обратного хода нет.
	AI_Output(hero,self,"Info_Diego_Barriere_15_04");	//Если есть хоть один способ выбраться, я его найду.
	AI_Output(self,hero,"Info_Diego_Barriere_11_05");	//Уже хочешь выбраться отсюда? Ты же только что попал сюда!
};


instance INFO_DIEGO_OTHERCAMPS(C_INFO)
{
	npc = pc_thief;
	nr = 2;
	condition = info_diego_othercamps_condition;
	information = info_diego_othercamps_info;
	permanent = 0;
	description = "А что с двумя другими лагерями?";
};


func int info_diego_othercamps_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_kolonie) && (DIEGO_AFTER_GAMESTART == TRUE) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void info_diego_othercamps_info()
{
	AI_Output(hero,self,"Info_Diego_OtherCamps_15_00");	//А что с двумя другими лагерями?
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_01");	//Два другие лагеря отделились от нас, чтобы найти способ сбежать из колонии.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_02");	//Новый лагерь находится на западе. Тамошние маги думают, что смогут подорвать Барьер, как только наберут для этого достаточно руды.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_03");	//Есть еще секта придурков на востоке. Их лагерь стоит посреди болота, а они сидят и умоляют своего идола освободить их.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_04");	//Он пока что-то не отвечает.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_05");	//На твоем месте я бы не стал тратить время на этих фанатиков.
};


instance INFO_DIEGO_OLDCAMP(C_INFO)
{
	npc = pc_thief;
	nr = 1;
	condition = info_diego_oldcamp_condition;
	information = info_diego_oldcamp_info;
	permanent = 0;
	description = "Расскажи мне что-нибудь о Старом лагере.";
};


func int info_diego_oldcamp_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_kolonie) && (DIEGO_AFTER_GAMESTART == TRUE))
	{
		return 1;
	};
};

func void info_diego_oldcamp_info()
{
	AI_Output(hero,self,"Info_Diego_OldCamp_15_00");	//Расскажи мне что-нибудь о Старом лагере.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_01");	//Он самый крупный и мощный из трех лагерей. Гомез и его люди контролируют лагерь, а вместе с ним и обмен рудой.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_02");	//Раз в месяц король присылает нам все, что мы закажем. Старик у нас в руках, ясно?
	AI_Output(self,hero,"Info_Diego_OldCamp_11_03");	//Он присылает нам вино, хлеб, мясо, оружие... все.
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		AI_Output(self,hero,"Info_Diego_OldCamp_11_04");	//Ты тоже можешь иметь свой кусок. Если присоединишься к Гомезу.
	};
};


instance INFO_DIEGO_WHOSGOMEZ(C_INFO)
{
	npc = pc_thief;
	nr = 3;
	condition = info_diego_whosgomez_condition;
	information = info_diego_whosgomez_info;
	permanent = 0;
	description = "Кто такой Гомез?";
};


func int info_diego_whosgomez_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_oldcamp) || Npc_KnowsInfo(hero,info_diego_brief))
	{
		return 1;
	};
};

func void info_diego_whosgomez_info()
{
	AI_Output(hero,self,"Info_Diego_WhosGomez_15_00");	//Кто такой Гомез?
	AI_Output(self,hero,"Info_Diego_WhosGomez_11_01");	//Гомез самый влиятельный из Баронов. Он хозяин в Старом лагере, как сильнейший человек в колонии.
};


instance INFO_DIEGO_JOINOLDCAMP(C_INFO)
{
	npc = pc_thief;
	nr = 4;
	condition = info_diego_joinoldcamp_condition;
	information = info_diego_joinoldcamp_info;
	permanent = 0;
	description = "А если я захочу стать одним из его людей, что мне нужно сделать?";
};


func int info_diego_joinoldcamp_condition()
{
	if((Npc_KnowsInfo(hero,info_diego_oldcamp) || Npc_KnowsInfo(hero,info_diego_brief)) && !c_npcbelongstooldcamp(hero) && (Npc_GetTrueGuild(hero) == GIL_NONE && KAPITEL < 2))
	{
		return TRUE;
	};
};

func void info_diego_joinoldcamp_info()
{
	var C_NPC thorus;
	AI_Output(hero,self,"Info_Diego_JoinOldcamp_15_00");	//А если я захочу стать одним из его людей, что мне нужно сделать?
	AI_Output(self,hero,"Info_Diego_JoinOldcamp_11_01");	//У ворот замка ты найдешь человека по имени Торус. Скажи ему, что тебя прислал Диего.
	thorus = Hlp_GetNpc(grd_200_thorus);
	thorus.aivar[AIV_FINDABLE] = TRUE;
	Log_CreateTopic(CH1_JOINOC,LOG_MISSION);
	Log_SetTopicStatus(CH1_JOINOC,LOG_RUNNING);
	b_logentry(CH1_JOINOC,"Если я хочу, чтобы меня взяли в Старый лагерь, я должен поговорить с Торусом.");
};


instance INFO_DIEGO_WAYTOOLDCAMP(C_INFO)
{
	npc = pc_thief;
	nr = 4;
	condition = info_diego_waytooldcamp_condition;
	information = info_diego_waytooldcamp_info;
	permanent = 0;
	description = "Как я смогу найти Старый лагерь?";
};


func int info_diego_waytooldcamp_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_kolonie) && !DIEGO_AFTER_GAMESTART)
	{
		return 1;
	};
};

func void info_diego_waytooldcamp_info()
{
	AI_Output(hero,self,"Info_Diego_WayToOldcamp_15_00");	//Как я смогу найти Старый лагерь?
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_01");	//Иди по этой дороге. Старый лагерь - ближайшее безопасное место на твоем пути.
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_02");	//Между лагерями шляются толпы диких тварей. Разгуливать там безоружным - самоубийство.
};


instance INFO_DIEGO_WOWAFFE(C_INFO)
{
	npc = pc_thief;
	nr = 4;
	condition = info_diego_wowaffe_condition;
	information = info_diego_wowaffe_info;
	permanent = 0;
	description = "Где я могу взять оружие?";
};


func int info_diego_wowaffe_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_waytooldcamp) && !DIEGO_AFTER_GAMESTART)
	{
		return 1;
	};
};

func void info_diego_wowaffe_info()
{
	AI_Output(hero,self,"Info_Diego_WoWaffe_15_00");	//Где я могу взять оружие?
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_01");	//Когда дойдешь до старой шахты, поищи вокруг. Я уверен, ты найдешь что-нибудь сносное.
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_02");	//Ее легко найти в нескольких метрах от выхода из ущелья.
};


instance INFO_DIEGO_THORUSSAYS(C_INFO)
{
	npc = pc_thief;
	nr = 1;
	condition = info_diego_thorussays_condition;
	information = info_diego_thorussays_info;
	permanent = 0;
	description = "Я говорил с Торусом.";
};


func int info_diego_thorussays_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_diegosentme))
	{
		return 1;
	};
};

func void info_diego_thorussays_info()
{
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_00");	//Я говорил с Торусом.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_01");	//И что он сказал?
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_02");	//Он может принять меня в лагерь, если ты дашь на это свое согласие.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_03");	//Вижу, у меня появилась еще одна забота.
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_04");	//Мы начнем прямо сейчас?
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_05");	//Первым делом тебе нужно узнать несколько вещей.
};


instance INFO_DIEGO_RULES(C_INFO)
{
	npc = pc_thief;
	nr = 10;
	condition = info_diego_rules_condition;
	information = info_diego_rules_info;
	permanent = 0;
	description = "Что я должен знать, чтобы меня приняли в Старый лагерь?";
};


func int info_diego_rules_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_thorussays) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void info_diego_rules_info()
{
	AI_Output(hero,self,"Info_Diego_Rules_15_00");	//Что я должен знать, чтобы меня приняли в Старый лагерь?
	AI_Output(self,hero,"Info_Diego_Rules_11_01");	//Если хочешь вступить в лагерь, ты должен заработать авторитет.
	AI_Output(self,hero,"Info_Diego_Rules_11_02");	//Во Внешнем Кольце есть несколько влиятельных парней, в основном Призраки. Если окажешь им пару услуг, считай, полдела сделано.
	AI_Output(self,hero,"Info_Diego_Rules_11_03");	//Потом ты должен будешь пройти тест на преданность.
	AI_Output(self,hero,"Info_Diego_Rules_11_04");	//Кроме того, каждый новичок должен обучиться нескольким способностям. Чем больше ты умеешь, тем больше от тебя пользы для лагеря.
	Log_CreateTopic(CH1_JOINOC,LOG_MISSION);
	Log_SetTopicStatus(CH1_JOINOC,LOG_RUNNING);
	b_logentry(CH1_JOINOC,"Чтобы меня взяли в Старый лагерь, я должен произвести впечатление на нескольких людей из внешнего круга и пройти испытание на преданность, которое предлагает Диего.");
};


instance INFO_DIEGO_CELEBS(C_INFO)
{
	npc = pc_thief;
	nr = 10;
	condition = info_diego_celebs_condition;
	information = info_diego_celebs_info;
	permanent = 0;
	description = "Где найти этих влиятельных людей?";
};


func int info_diego_celebs_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_rules))
	{
		return 1;
	};
};

func void info_diego_celebs_info()
{
	AI_Output(hero,self,"Info_Diego_Celebs_15_00");	//Где найти этих влиятельных людей?
	AI_Output(self,hero,"Info_Diego_Celebs_11_01");	//Так, ну, один из них перед тобой. Потом еще Торус. С ним ты уже знаком.
	AI_Output(self,hero,"Info_Diego_Celebs_11_02");	//А остальные... Их ты найдешь сам. Если ты даже на это не способен, то тебе тут нечего делать.
	AI_Output(self,hero,"Info_Diego_Celebs_11_03");	//Погуляй по Внешнему Кольцу, поболтай с людьми, и ты поймешь, кто есть кто.
};


instance INFO_DIEGO_TEACHERS(C_INFO)
{
	npc = pc_thief;
	nr = 10;
	condition = info_diego_teachers_condition;
	information = info_diego_teachers_info;
	permanent = 0;
	description = "Кто здесь может научить меня чему-нибудь?";
};


func int info_diego_teachers_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_rules))
	{
		return 1;
	};
};

func void info_diego_teachers_info()
{
	AI_Output(hero,self,"Info_Diego_Teachers_15_00");	//Кто здесь может научить меня чему-нибудь?
	AI_Output(self,hero,"Info_Diego_Teachers_11_01");	//Начни с Фингерса. Он самый опытный среди нас.
	AI_Output(self,hero,"Info_Diego_Teachers_11_02");	//И, если у тебя есть голова на плечах, ты легко найдешь себе еще учителей.
	AI_Output(hero,self,"Info_Diego_Teachers_15_03");	//Где я найду Фингерса?
	AI_Output(self,hero,"Info_Diego_Teachers_11_04");	//Его хижину не сразу заметишь. Она прямо под стеной замка по дороге отсюда к арене.
	AI_Output(self,hero,"Info_Diego_Teachers_11_05");	//У ворот замка поверни налево и спускайся вниз в сторону арены.
	Log_CreateTopic(GE_TEACHEROC,LOG_NOTE);
	b_logentry(GE_TEACHEROC,"Фингерс может научить меня воровать и вскрывать замки. Он живет недалеко от арены. Его дом встроен в стену замка.");
};


var int diego_merke_str;
var int diego_merke_dex;

instance INFO_DIEGO_TEACH(C_INFO)
{
	npc = pc_thief;
	nr = 100;
	condition = info_diego_teach_condition;
	information = info_diego_teach_info;
	permanent = 1;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int info_diego_teach_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_teachers))
	{
		return 1;
	};
};

func void info_diego_teach_info()
{
	if(LOG_DIEGOTRAIN == FALSE)
	{
		Log_CreateTopic(GE_TEACHEROC,LOG_NOTE);
		b_logentry(GE_TEACHEROC,"Диего может помочь стать более сильным и ловким.");
		LOG_DIEGOTRAIN = TRUE;
	};
	AI_Output(hero,self,"Info_Diego_Teach_15_00");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,hero,"Info_Diego_Teach_11_01");	//Да. Я могу научить тебя как повысить силу и ловкость.
	DIEGO_MERKE_STR = hero.attribute[ATR_STRENGTH];
	DIEGO_MERKE_DEX = hero.attribute[ATR_DEXTERITY];
	b_diegolearn();
};

func void info_diego_teach_back()
{
	if(DIEGO_MERKE_STR < hero.attribute[ATR_STRENGTH])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_00");	//Теперь ты стал сильнее.
	};
	if(DIEGO_MERKE_DEX < hero.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_01");	//Твои навыки стрельбы из лука и арбалета стали лучше.
	};
	AI_Output(self,hero,"Info_Diego_Teach_BACK_11_02");	//Заходи еще, тебе многому нужно научиться!
	Info_ClearChoices(info_diego_teach);
};

func void info_diego_teach_str_1()
{
	if(hero.guild == GIL_STT || hero.guild == GIL_GRD || hero.guild == GIL_KDF)
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
		AI_Output(self,other,"SVM_11_Ooh");	//Ох! Нехорошо!
	};
	b_diegolearn();
};

func void info_diego_teach_str_5()
{
	if(hero.guild == GIL_STT || hero.guild == GIL_GRD || hero.guild == GIL_KDF)
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
		AI_Output(self,other,"SVM_11_Ooh");	//Ох! Нехорошо!
	};
	b_diegolearn();
};

func void info_diego_teach_dex_1()
{
	if(hero.guild == GIL_STT || hero.guild == GIL_GRD || hero.guild == GIL_KDF)
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
		AI_Output(self,other,"SVM_11_Ooh");	//Ох! Нехорошо!
	};
	b_diegolearn();
};

func void info_diego_teach_dex_5()
{
	if(hero.guild == GIL_STT || hero.guild == GIL_GRD || hero.guild == GIL_KDF)
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
		AI_Output(self,other,"SVM_11_Ooh");	//Ох! Нехорошо!
	};
	b_diegolearn();
};

instance INFO_DIEGO_BRINGLIST_OFFER(C_INFO)
{
	npc = pc_thief;
	nr = 10;
	condition = info_diego_bringlist_offer_condition;
	information = info_diego_bringlist_offer_info;
	permanent = 0;
	description = "Какой тест я должен пройти?";
};


func int info_diego_bringlist_offer_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_rules) && (hero.guild == GIL_NONE || hero.guild == GIL_STT || hero.guild == GIL_GRD) && KAPITEL < 4)
	{
		return 1;
	};
};

func void info_diego_bringlist_offer_info()
{
	var C_NPC ian;
	AI_Output(hero,self,"Info_Diego_BringList_Offer_15_00");	//Какой тест я должен пройти?
	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_01");	//Ты отправишься в Старую шахту. Там встретишь одного парня, его зовут Ян. Он даст тебе список.
	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_02");	//Эта бумага важна для нас. Там список припасов, которые нужны ребятам из шахты для нормальной работы.
	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_03");	//Они получат все это с ближайшей поставкой.
	AI_Output(hero,self,"Info_Diego_BringList_Offer_15_04");	//Без проблем!
	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_05");	//Да нет, проблема все же есть. Новый лагерь ни в коем случае не должен получить этот список!
	AI_Output(self,hero,"Info_Diego_BringList_Offer_11_06");	//Я уже сказал, что это важно. Если у тебя все получится, ты сделаешь большой шаг в своей карьере.
	DIEGO_BRINGLIST = LOG_RUNNING;
	Log_CreateTopic(CH1_BRINGLIST,LOG_MISSION);
	Log_SetTopicStatus(CH1_BRINGLIST,LOG_RUNNING);
	b_logentry(CH1_BRINGLIST,"Диего послал меня в Старую шахту. Там я должен найти человека по имени Ян и взять у него список припасов. Этот список не должен попасть в руки воров из Нового лагеря.");
	ian = Hlp_GetNpc(stt_301_ian);
	CreateInvItem(stt_301_ian,thelist);
};


instance INFO_DIEGO_IANPASSWORD(C_INFO)
{
	npc = pc_thief;
	nr = 1;
	condition = info_diego_ianpassword_condition;
	information = info_diego_ianpassword_info;
	permanent = 0;
	description = "Как может Ян передать мне такую важную бумагу?..";
};


func int info_diego_ianpassword_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_bringlist_offer) && DIEGO_BRINGLIST == LOG_RUNNING)
	{
		return 1;
	};
};

func void info_diego_ianpassword_info()
{
	AI_Output(hero,self,"Info_Diego_IanPassword_Info_15_01");	//Как может Ян передать мне такую важную бумагу? Он же меня не знает.
	AI_Output(self,hero,"Info_Diego_IanPassword_Info_11_02");	//Не бойся, даст, когда ты скажешь, что ты от Диего.
	AI_Output(hero,self,"Info_Diego_IanPassword_Info_15_03");	//Я ему так и скажу.
	b_logentry(CH1_BRINGLIST,"Ян отдаст мне список, если я скажу, что меня прислал Диего.");
};


instance INFO_DIEGO_MAPTOOLDMINE(C_INFO)
{
	npc = pc_thief;
	nr = 1;
	condition = info_diego_maptooldmine_condition;
	information = info_diego_maptooldmine_info;
	permanent = 0;
	description = "Где находится Старая шахта?";
};


func int info_diego_maptooldmine_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_bringlist_offer) && DIEGO_BRINGLIST == LOG_RUNNING)
	{
		return 1;
	};
};

func void info_diego_maptooldmine_info()
{
	AI_Output(hero,self,"Info_Diego_MapToOldMine_Info_15_00");	//Где находится Старая шахта?
	AI_Output(self,hero,"Info_Diego_MapToOldMine_Info_11_01");	//Подойди к Грехему. Он картограф. Скажи, что ты от меня. Он даст тебе карту, и по ней ты найдешь путь к шахте.
	AI_Output(self,hero,"Info_Diego_MapToOldMine_Info_11_02");	//Он живет слева от северных ворот.
	b_logentry(CH1_BRINGLIST,"Грехем даст мне карту. Я смогу найти его возле северных ворот.");
};


instance INFO_DIEGO_BRINGLIST_SUCCESS(C_INFO)
{
	npc = pc_thief;
	nr = 1;
	condition = info_diego_bringlist_success_condition;
	information = info_diego_bringlist_success_info;
	permanent = 0;
	description = "Ян передал мне список.";
};


func int info_diego_bringlist_success_condition()
{
	if((DIEGO_BRINGLIST == LOG_RUNNING || Npc_KnowsInfo(hero,org_801_lares_bringlist)) && (Npc_HasItems(hero,thelist) || Npc_HasItems(hero,thelistnc)) && !Npc_KnowsInfo(hero,info_diego_ocwarn) && !Npc_KnowsInfo(hero,info_milten_ocwarn))
	{
		return 1;
	};
};

func void info_diego_bringlist_success_info()
{
	b_printtrademsg1("Отдан список.");
	AI_Output(hero,self,"Info_Diego_BringList_Success_15_00");	//Ян передал мне список.
	if(Npc_HasItems(hero,thelist) && Npc_KnowsInfo(hero,info_diego_bringlist_offer))
	{
		b_giveinvitems(hero,self,thelist,1);
		b_logentry(CH1_BRINGLIST,"Диего остался доволен моей работой. Я передал ему список Яна.");
		DIEGO_BRINGLIST = LOG_SUCCESS;
		b_givexp(XP_DIEGOBRINGLIST);
		Log_SetTopicStatus(CH1_BRINGLIST,LOG_SUCCESS);
	}
	else if(Npc_HasItems(hero,thelistnc))
	{
		b_giveinvitems(hero,self,thelistnc,1);
		b_printtrademsg1("Отдан дополненный список.");
		if(Npc_KnowsInfo(hero,info_diego_bringlist_offer))
		{
			b_logentry(CH1_BRINGLIST,"Диего остался доволен моей работой. Кажется, он не заметил, что Ларс подделал список. Или все же заметил?");
			DIEGO_BRINGLIST = LOG_SUCCESS;
			b_givexp(XP_DIEGOBRINGLIST);
			//Log_SetTopicStatus(CH1_BRINGLIST,LOG_SUCCESS);
		}
		else if(Npc_KnowsInfo(hero,org_801_lares_newlist) && !Npc_KnowsInfo(hero,info_diego_bringlist_offer))
		{
			b_logentry(THELISTFORNC,"Диего остался доволен моей работой. Кажется, он не заметил, что Ларс подделал список. Или все же заметил?");
			DIEGO_BRINGLIST = LOG_SUCCESS;
			b_givexp(XP_DIEGOBRINGLIST);
		};
	};
	b_usefakescroll();
	AI_Output(self,hero,"Info_Diego_BringList_Success_11_01");	//Отлично сработано! Это будет говорить в твою пользу!
	POINTS_OC = POINTS_OC + 5;
};


var int diego_gomezaudience;

instance INFO_DIEGO_JOINANALYZE(C_INFO)
{
	npc = pc_thief;
	nr = 800;
	condition = info_diego_joinanalyze_condition;
	information = info_diego_joinanalyze_info;
	permanent = 1;
	description = "Что думают обо мне в лагере?";
};


func int info_diego_joinanalyze_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_rules) && (Npc_GetTrueGuild(hero) == GIL_NONE) && (OLDHEROGUILD == 0)  && (DIEGO_GOMEZAUDIENCE == FALSE))
	{
		return 1;
	};
};

func void info_diego_joinanalyze_info()
{
	AI_Output(hero,self,"Info_Diego_JoinAnalyze_15_00");	//Что думают обо мне в лагере?
	AI_Output(self,hero,"Info_Diego_JoinAnalyze_11_01");	//Ну, я тут поговорил с людьми...
	AI_Output(hero,self,"Info_Diego_JoinAnalyze_15_02");	//И что?
	POINTS_OC = 0;
	if((SCATTY_CHARGEKIRGO == LOG_FAILED && KIRGO_KILLED == TRUE) || (SCATTY_CHARGEKHARIM == LOG_FAILED && KHARIM_KILLED == TRUE))
	{
		AI_Output(self,hero,"SVM_11_YouKilledMyFriend");	//Наше первое правило: не убивать. Ты его нарушил!
		POINTS_OC = POINTS_OC - 1;
	};
	if(SCATTY_CHARGEKIRGO == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_01");	//Скатти сказал, что ты одолел Кирго.
		POINTS_OC = POINTS_OC + 2;
	}
	else if(SCATTY_CHARGEKIRGO == LOG_FAILED && KIRGO_KILLED == FALSE)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_02");	//Скатти сказал, что Кирго победил тебя. Мне показалось, что он тобой недоволен.
		POINTS_OC = POINTS_OC - 1;
	}
	else if(SCATTY_CHARGEKIRGO == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_03");	//Скатти сказал, что хотел бы взглянуть на твой бой с Кирго.
	};
	if(SCATTY_CHARGEKHARIM == LOG_FAILED && KHARIM_KILLED == FALSE)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_04");	//Впрочем, ему понравилось, что ты вызвал на бой Карима. Ничего, что ты проиграл.
		POINTS_OC = POINTS_OC + 2;
	}
	else if(SCATTY_CHARGEKHARIM == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_05");	//Однако его в самом деле порадовал твой бой с Каримом. Он все обсуждает твою победу.
		POINTS_OC = POINTS_OC + 5;
	}
	else if(SCATTY_CHARGEKHARIM == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_06");	//И он бы посмотрел, как ты выстоишь против Карима.
	};
	if(WHISTLER_BUYMYSWORD == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_01");	//Уистлер рассказал мне о Фиске... Я, на твоем месте, забрал бы руду и смотался. В любом случае в его глазах ты поднялся.
		POINTS_OC = POINTS_OC + 3;
	}
	else if((WHISTLER_BUYMYSWORD == LOG_FAILED) || ((WHISTLER_BUYMYSWORD == LOG_RUNNING) && (WHISTLER_BUYMYSWORD_DAY <= (Wld_GetDay() - 2))))
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_02");	//Я поговорил с Уистлером. Да ты наглец! Взял и смотался с его рудой. Должен признать, что в храбрости тебе не откажешь!
		POINTS_OC = POINTS_OC + 2;
	}
	else if(WHISTLER_BUYMYSWORD == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_03");	//Уистлер хочет получить свой меч. Давай решай, отдавать его или нет, иначе он наверняка подумает, что ты взял его руду и сбежал!
	};
	if(SLY_LOSTNEK == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_01");	//Слай рассказал, что ты помог в поисках Нека. Похоже, он тобой доволен.
		POINTS_OC = POINTS_OC + 4;
	}
	else if(SLY_LOSTNEK == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_02");	//Мне кажется, Слай неправ насчет Нека. Этот парень был настоящей занозой, плохо знал свое дело, но все же я не думаю, что он перешел в Новый лагерь.
	};
	if(FINGERS_LEARNT == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_01");	//Фингерс может тебя многому научить. Я бы на твоем месте сходил к нему.
	}
	else if(FINGERS_LEARNT == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_02");	//Фингерс сказал, что ты уже кое-что освоил, но он считает, что ты способен на большее.
		POINTS_OC = POINTS_OC + 3;
	};
	if(DEXTER_GETKALOMSRECIPE == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_01");	//Надо бы мне переговорить с Декстером. Он решил использовать тебя для своих торговых дел.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_02");	//Хотя насчет испытания нет никаких правил. Если ты сделаешь это, твой авторитет поднимется.
	}
	else if(DEXTER_GETKALOMSRECIPE == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_03");	//Ты и правда удачно провел это дело с Кор Галомом! Декстер удивлен, да и я тоже.
		POINTS_OC = POINTS_OC + 5;
	};
	if(THORUS_MORDRAGKO == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_01");	//Насчет Мордрага стоит задуматься. Он неплохо сражается. Если и правда хочешь победить его, советую потренироваться.
	}
	else if(THORUS_MORDRAGKO == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_02");	//Торус говорит, что нам нужны ребята вроде тебя - это хороший знак.
		POINTS_OC = POINTS_OC + 5;
	}
	else
	{
		if(THORUS_MORDRAGKO == LOG_FAILED)
		{
			AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_03");	//Торус был очень недоволен, вспоминая твою неудачу. Как ты умудрился провалить такое дело?!
			POINTS_OC = POINTS_OC - 5;
		};
		if(FISK_GETNEWHEHLER == LOG_SUCCESS)
		{
			AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_01");	//Фиск сказал мне, что ты его удивил. В любом случае он на твоей стороне.
			POINTS_OC = POINTS_OC + 5;
		}
		else if((MORDRAGKO_HAUAB == TRUE) || (MORDRAGKO_STAYATNC == TRUE))
		{
			AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_02");	//Фиск теперь тебя недолюбливает, парень. На твоем месте я бы быстренько подыскал замену Мордрагу.
		};
	};
	if(POINTS_OC > 15)
	{
		AI_Output(self,hero,"Info_Diego_Points_11_00");	//Ты обрел поддержку уже многих в этом лагере.
		if(hero.level >= 5)
		{
			if(DIEGO_BRINGLIST == LOG_SUCCESS)
			{
				AI_Output(self,hero,"Info_Diego_Points_11_01");	//Да и проверку на верность ты прошел. Иди к Торусу. Я ему рассказал о твоих успехах. Он разрешит тебе пройти к Гомезу.
				DIEGO_GOMEZAUDIENCE = TRUE;
				//Log_SetTopicStatus(CH1_JOINOC,LOG_SUCCESS);
				b_logentry(CH1_JOINOC,"Диего сказал, что я могу встретиться с Гомезом. Теперь я смогу стать одним из людей Гомеза и войти в замок. Нужно лишь поговорить с Торусом.");
				info_diego_joinanalyze.permanent = 0;
			}
			else
			{
				AI_Output(self,hero,"Info_Diego_Points_11_02");	//Но тебе еще предстоит проверка на верность.
			};
		}
		else
		{
			b_printguildcondition(5);
		};
	}
	else if(POINTS_OC > 10)
	{
		AI_Output(self,hero,"Info_Diego_Points_11_10");	//В результате могу сказать, что ты действовал неплохо для новичка.
	}
	else if(POINTS_OC >= 0)
	{
		AI_Output(self,hero,"Info_Diego_Points_11_20");	//Действуй шустрее, если ты хочешь хоть чего-то добиться в этом лагере.
	};
};


instance INFO_DIEGO_WHATTOSAYTOGOMEZ(C_INFO)
{
	npc = pc_thief;
	nr = 1;
	condition = info_diego_whattosaytogomez_condition;
	information = info_diego_whattosaytogomez_info;
	permanent = 0;
	description = "Как мне вести себя при встрече с Гомезом?";
};


func int info_diego_whattosaytogomez_condition()
{
	if(DIEGO_GOMEZAUDIENCE == TRUE && !Npc_KnowsInfo(hero,dia_gomez_dabei))
	{
		return 1;
	};
};

func void info_diego_whattosaytogomez_info()
{
	AI_Output(hero,self,"Info_Diego_WhatToSayToGomez_Info_15_00");	//Как мне вести себя при встрече с Гомезом?
	AI_Output(self,hero,"Info_Diego_WhatToSayToGomez_Info_11_01");	//Гомез словно нюхом такие вещи чует. Когда он посмотрит на тебя, то сам решит, что с тобой делать.
	AI_Output(self,hero,"Info_Diego_WhatToSayToGomez_Info_11_02");	//Теперь я не буду направлять тебя, так что соберись. Удачи!
};


instance PC_THIEF_ARMOR(C_INFO)
{
	npc = pc_thief;
	condition = pc_thief_armor_condition;
	information = pc_thief_armor_info;
	important = 0;
	permanent = 1;
	description = b_buildbuyarmorstring("Тяжелый доспех Призрака, защита: 40/5/20/0",VALUE_STT_ARMOR_H);
};


func int pc_thief_armor_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_STT) && !Npc_HasItems(hero,stt_armor_h))
	{
		return TRUE;
	};
};

func void pc_thief_armor_info()
{
	AI_Output(hero,self,"PC_Thief_ARMOR_Info_15_01");	//Где я могу достать такой доспех, как у тебя?
	if(Npc_HasItems(hero,itminugget) >= VALUE_STT_ARMOR_H)
	{
		AI_Output(self,hero,"PC_Thief_ARMOR_Info_11_02");	//А руды у тебя хватит?
		b_printtrademsg1("Отдано руды: 1200");
		AI_Output(hero,self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_07");	//Конечно!
		b_giveinvitems(hero,self,itminugget,VALUE_STT_ARMOR_H);
		b_printtrademsg2("Получен доспех Призрака.");
		CreateInvItem(hero,stt_armor_h);
		AI_EquipArmor(hero,stt_armor_h);
	}
	else
	{
		AI_Output(self,hero,"PC_Thief_ARMOR_Info_11_03");	//Неси руду - будут доспехи.
	};
};


instance PC_THIEF_MEETAGAIN(C_INFO)
{
	npc = pc_thief;
	condition = pc_thief_meetagain_condition;
	information = pc_thief_meetagain_info;
	important = 1;
	permanent = 0;
};


func int pc_thief_meetagain_condition()
{
	if((KAPITEL == 3) && (Npc_GetDistToWP(self,"OW_PATH_190") < 700))
	{
		return TRUE;
	};
};

func void pc_thief_meetagain_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_00");	//Эй, я уж думал ты погиб.
	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_01");	//Недавно я тоже так думал.
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_02");	//С момента нашей последней встречи много чего случилось. Я слышал, ты не последнюю роль сыграл на церемонии призыва у сектантов.
	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_03");	//Да, ты так много знаешь.
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_04");	//Даже больше, чем ты думаешь... Теперь ты ищешь юнитор?
	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_05");	//Да, один из этих камней находится где-то здесь.
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_06");	//Я знаю, где лежит один такой камень. Но тут есть проблема.
	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_07");	//Понятно. Что ты за это хочешь?
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_08");	//А ты неплохо выучился, но сейчас дело не в этом.
	AI_Output(hero,self,"PC_Thief_MEETAGAIN_Info_15_09");	//Не в этом? Так что же это за проблема?
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_10");	//Проблема тонны на три весом.
	AI_Output(self,hero,"PC_Thief_MEETAGAIN_Info_11_11");	//Пойдем. Увидишь - сам поймешь.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GuideTroll");
	Log_CreateTopic(CH3_TROLLCANYON,LOG_MISSION);
	Log_SetTopicStatus(CH3_TROLLCANYON,LOG_RUNNING);
	b_logentry(CH3_TROLLCANYON,"Когда я подходил к северному хранилищу юнитора, я снова встретил Диего. Он предупредил меня, что в ущелье скрывается какое-то огромное чудовище.");
	b_logentry(CH3_TROLLCANYON,"Каким-то образом он узнал, что я помогаю Братству и ищу юниторы. Мы решили продолжить путь вместе.");
	AI_StopProcessInfos(self);
};


instance PC_THIEF_SHOWFOCUS(C_INFO)
{
	npc = pc_thief;
	condition = pc_thief_showfocus_condition;
	information = pc_thief_showfocus_info;
	important = 1;
	permanent = 0;
};


func int pc_thief_showfocus_condition()
{
	if(Npc_KnowsInfo(hero,pc_thief_meetagain) && (Npc_GetDistToWP(self,"LOCATION_12_01") < 1000) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void pc_thief_showfocus_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"PC_Thief_SHOWFOCUS_Info_11_01");	//По левую сторону ущелья вход в пещеру, где хранится юнитор.
	AI_Output(hero,self,"PC_Thief_SHOWFOCUS_Info_15_02");	//Понятно, сначала нам придется избавиться от той огромной твари.
	AI_Output(self,hero,"PC_Thief_SHOWFOCUS_Info_11_03");	//Чтобы справиться с троллем, нужно найти его слабое место... или придумать что-нибудь еще.
	AI_Output(self,hero,"PC_Thief_SHOWFOCUS_Info_11_04");	//Я отвлеку его.
	b_logentry(CH3_TROLLCANYON,"Мы нашли огромного тролля, который преграждал нам дальнейший путь. Диего решил отвлечь его, пока я найду способ убить тролля.");
	Npc_ExchangeRoutine(self,"WaitAtWheel");
	AI_DrawWeapon(self);
	AI_StopProcessInfos(self);
};


instance PC_THIEF_AFTERTROLL(C_INFO)
{
	npc = pc_thief;
	condition = pc_thief_aftertroll_condition;
	information = pc_thief_aftertroll_info;
	important = 1;
	permanent = 0;
};


func int pc_thief_aftertroll_condition()
{
	var int trollfound;
	Npc_PerceiveAll(self);
	trollfound = Wld_DetectNpc(self,troll,NOFUNC,-1);
	if(Npc_KnowsInfo(hero,pc_thief_showfocus) && ((trollfound && (Npc_IsDead(other) || Npc_IsInState(other,zs_magicshrink))) || (Npc_GetDistToWP(hero,"LOCATION_12_14_WHEEL") < 1000)))
	{
		return TRUE;
	};
};

func void pc_thief_aftertroll_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"PC_Thief_AFTERTROLL_Info_11_01");	//Просто фантастика! Да, ты вовремя среагировал! Что ж, идем за юнитором.
	AI_Output(self,hero,"PC_Thief_AFTERTROLL_Info_11_02");	//Я побуду здесь, присмотрю, чтобы не было всяких неприятных сюрпризов.
	b_logentry(CH3_TROLLCANYON,"Тролль побежден. Теперь можно заняться лебедкой, которая открывает решетку на пути к платформе с юнитором.");
	AI_StopProcessInfos(self);
};


instance PC_THIEF_WHEEL(C_INFO)
{
	npc = pc_thief;
	condition = pc_thief_wheel_condition;
	information = pc_thief_wheel_info;
	important = 1;
	permanent = 0;
};


func int pc_thief_wheel_condition()
{
	if(Npc_KnowsInfo(hero,pc_thief_aftertroll) && (TROLL_WHEEL == 1))
	{
		return TRUE;
	};
};

func void pc_thief_wheel_info()
{
	AI_Output(self,hero,"PC_Thief_WHEEL_Info_11_01");	//Похоже, заклинило.
	AI_Output(self,hero,"PC_Thief_WHEEL_Info_11_02");	//Дай-ка мне взглянуть, может быть, удастся что-то сделать.
	AI_StopProcessInfos(self);
	AI_GotoWP(self,"LOCATION_12_14_WHEEL");
	AI_AlignToWP(self);
	AI_PlayAni(self,"T_PLUNDER");
};


instance PC_THIEF_FIXWHEEL(C_INFO)
{
	npc = pc_thief;
	condition = pc_thief_fixwheel_condition;
	information = pc_thief_fixwheel_info;
	important = 1;
	permanent = 0;
};


func int pc_thief_fixwheel_condition()
{
	if(Npc_KnowsInfo(hero,pc_thief_wheel))
	{
		return TRUE;
	};
};

func void pc_thief_fixwheel_info()
{
	AI_Output(self,hero,"PC_Thief_FIXWHEEL_Info_11_01");	//Вот, теперь должно заработать.
	TROLL_WHEEL = 2;
	b_logentry(CH3_TROLLCANYON,"Диего сумел отремонтировать лебедку. Теперь мне ничто не мешает взять камень.");
	Npc_ExchangeRoutine(self,"WaitAtFocus");
	AI_StopProcessInfos(self);
};


instance PC_THIEF_WAITATFOCUS(C_INFO)
{
	npc = pc_thief;
	condition = pc_thief_waitatfocus_condition;
	information = pc_thief_waitatfocus_info;
	important = 1;
	permanent = 0;
};


func int pc_thief_waitatfocus_condition()
{
	if(Npc_KnowsInfo(hero,pc_thief_fixwheel) && (Npc_GetDistToWP(hero,"LOCATION_12_03") < 1000))
	{
		return TRUE;
	};
};

func void pc_thief_waitatfocus_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"PC_Thief_WAITATFOCUS_Info_11_01");	//Иди за юнитором, а я подожду здесь.
	AI_StopProcessInfos(self);
};


instance PC_THIEF_GOTIT(C_INFO)
{
	npc = pc_thief;
	condition = pc_thief_gotit_condition;
	information = pc_thief_gotit_info;
	important = 1;
	permanent = 0;
};


func int pc_thief_gotit_condition()
{
	if(Npc_HasItems(hero,focus_2) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void pc_thief_gotit_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"PC_Thief_GOTIT_Info_11_01");	//Нашел юнитор? Отлично.
	AI_Output(self,hero,"PC_Thief_GOTIT_Info_11_02");	//Ладно, мне пора возвращаться в Старый лагерь. Желаю удачи!
	AI_Output(hero,self,"PC_Thief_GOTIT_Info_15_03");	//Смотри, будь осторожен.
	AI_Output(self,hero,"PC_Thief_GOTIT_Info_11_04");	//Еще увидимся.
	//b_logentry(CH3_TROLLCANYON,"Юнитор мой. Осталось только убедить в этом пару гарпий, которые со мной не согласны.");
	b_logentry(CH3_TROLLCANYON,"Юнитор мой, а Диего возвращается в Старый лагерь. Думаю, это была еще не последняя наша встреча.");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"start");
};


instance INFO_DIEGO_OCWARN(C_INFO)
{
	npc = pc_thief;
	condition = info_diego_ocwarn_condition;
	information = info_diego_ocwarn_info;
	important = 1;
	permanent = 0;
};


func int info_diego_ocwarn_condition()
{
	if(KAPITEL == 4 && Npc_CanSeeNpcFreeLOS(self,hero) && Npc_GetDistToNpc(self,hero) < 1400)
	{
		return TRUE;
	};
};

func void info_diego_ocwarn_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Diego_OCWARN_11_01");	//Эй... Тихо!
	if(Npc_KnowsInfo(hero,info_milten_ocwarn))
	{
		AI_Output(hero,self,"Info_Diego_OCWARN_15_02");	//Привет, Диего! Я встретил Мильтена на другом конце лагеря.
		AI_Output(self,hero,"Info_Diego_OCWARN_11_03");	//Хорошо, тогда ты в курсе последних событий.
		AI_Output(self,hero,"Info_Diego_OCWARN_11_04");	//Ты знаешь, что планируется нападение на Свободную шахту?
	}
	else
	{
		AI_Output(hero,self,"Info_Diego_OCWARN_15_05");	//Привет, Диего! Почему ты прячешься?
		AI_Output(self,hero,"Info_Diego_OCWARN_11_06");	//А ты еще не слышал?
		AI_Output(hero,self,"Info_Diego_OCWARN_15_07");	//Слышал что?
		AI_Output(self,hero,"Info_Diego_OCWARN_11_08");	//В Старой шахте обвал, все Маги Огня мертвы, а на Свободную шахту готовится нападение.
		AI_Output(hero,self,"Info_Diego_OCWARN_15_09");	//Что? О чем ты говоришь?
		b_failch4quests();
	};
};


instance INFO_DIEGO_OCMINE(C_INFO)
{
	npc = pc_thief;
	condition = info_diego_ocmine_condition;
	information = info_diego_ocmine_info;
	important = 0;
	permanent = 0;
	description = "Почему обрушилась Старая шахта?";
};


func int info_diego_ocmine_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_ocwarn))
	{
		return TRUE;
	};
};

func void info_diego_ocmine_info()
{
	AI_Output(hero,self,"Info_Diego_OCMINE_15_01");	//Почему обрушилась Старая шахта?
	AI_Output(self,hero,"Info_Diego_OCMINE_11_02");	//Один оставшийся в живых рудокоп говорит, что во время работ на нижнем уровне, они натолкнулись на подземную реку.
	AI_Output(self,hero,"Info_Diego_OCMINE_11_03");	//Когда вода хлынула в шахту, сломалась одна из подпорок, и верхний уровень обрушился.
	AI_Output(self,hero,"Info_Diego_OCMINE_11_04");	//Из тех, кто находился в шахте, уцелела лишь горстка.
};


instance INFO_DIEGO_OCKDF(C_INFO)
{
	npc = pc_thief;
	condition = info_diego_ockdf_condition;
	information = info_diego_ockdf_info;
	important = 0;
	permanent = 0;
	description = "Почему все маги Огня погибли?";
};


func int info_diego_ockdf_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_ocwarn) && !Npc_KnowsInfo(hero,info_diego_ocfm))
	{
		return TRUE;
	};
};

func void info_diego_ockdf_info()
{
	AI_Output(hero,self,"Info_Diego_OCKDF_15_01");	//Почему все маги Огня погибли?
	AI_Output(self,hero,"Info_Diego_OCKDF_11_02");	//Это долгая история.
};


instance INFO_DIEGO_OCFM(C_INFO)
{
	npc = pc_thief;
	condition = info_diego_ocfm_condition;
	information = info_diego_ocfm_info;
	important = 0;
	permanent = 0;
	description = "Зачем они хотят напасть на Свободную шахту?";
};


func int info_diego_ocfm_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_ocwarn) && !Npc_KnowsInfo(hero,info_diego_ockdf))
	{
		return TRUE;
	};
};

func void info_diego_ocfm_info()
{
	AI_Output(hero,self,"Info_Diego_OCFM_15_01");	//Зачем они хотят напасть на Свободную шахту?
	AI_Output(self,hero,"Info_Diego_OCFM_11_02");	//Это долгая история.
};


instance INFO_DIEGO_OCSTORY(C_INFO)
{
	npc = pc_thief;
	condition = info_diego_ocstory_condition;
	information = info_diego_ocstory_info;
	important = 0;
	permanent = 0;
	description = "Расскажи!";
};


func int info_diego_ocstory_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_ocfm) || Npc_KnowsInfo(hero,info_diego_ockdf))
	{
		return TRUE;
	};
};

func void info_diego_ocstory_info()
{
	AI_Output(hero,self,"Info_Diego_OCSTORY_15_01");	//Расскажи! Это далеко не первая долгая история из тех, что мне приходилось слышать.
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_02");	//Ну, ладно. По счастью, я оказался в особняке Баронов, когда они узнали об обвале в шахте.
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_03");	//Гомез чуть не обезумел от ярости, услышав это известие. Верно, испугался, что его положение может пошатнуться.
	AI_Output(hero,self,"Info_Diego_OCSTORY_15_04");	//Еще бы. Тот, кто контролирует добычу руды, тот держит в руках всю колонию.
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_05");	//Ты прав. Теперь у него нет никакого источника руды, поэтому скоро нам перестанут доставлять товары из внешнего мира.
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_06");	//Никто не будет работать на него, если он не найдет новый источник дохода.
	AI_Output(hero,self,"Info_Diego_OCSTORY_15_07");	//И из-за этого он хочет напасть на Свободную шахту?
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_08");	//Это, если честно, последний шанс Гомеза удержать власть.
	AI_Output(self,hero,"Info_Diego_OCSTORY_11_09");	//Часа два назад, около двадцати стражников отправились к Свободной шахте.
	b_story_fmtaken();
};


instance INFO_DIEGO_OCWARNNC(C_INFO)
{
	npc = pc_thief;
	condition = info_diego_ocwarnnc_condition;
	information = info_diego_ocwarnnc_info;
	important = 0;
	permanent = 0;
	description = "Он сошел с ума! Я расскажу об этом в Новом лагере!";
};


func int info_diego_ocwarnnc_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_ocstory))
	{
		return TRUE;
	};
};

func void info_diego_ocwarnnc_info()
{
	AI_Output(hero,self,"Info_Diego_OCWARNNC_15_01");	//Он сошел с ума! Я расскажу об этом в Новом лагере!
	AI_Output(self,hero,"Info_Diego_OCWARNNC_11_02");	//Тогда тебе нужно торопиться - они уже вполне могли добраться туда.
	AI_Output(hero,self,"Info_Diego_OCWARNNC_15_03");	//Но они никогда не смогут прорваться через укрепления Нового лагеря!
	AI_Output(self,hero,"Info_Diego_OCWARNNC_11_04");	//Это им не нужно. Несколько месяцев назад они нашли путь, ведущий через горы прямо к Свободной шахте. Кроме них никто о нем не знает.
};


instance INFO_DIEGO_OCGUARDS(C_INFO)
{
	npc = pc_thief;
	condition = info_diego_ocguards_condition;
	information = info_diego_ocguards_info;
	important = 0;
	permanent = 0;
	description = "Я видел стражников, охраняющих закрытые ворота.";
};


func int info_diego_ocguards_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_ocstory))
	{
		return TRUE;
	};
};

func void info_diego_ocguards_info()
{
	AI_Output(hero,self,"Info_Diego_OCGUARDS_15_01");	//Я видел стражников, охраняющих закрытые ворота.
	AI_Output(self,hero,"Info_Diego_OCGUARDS_11_02");	//Держись от них подальше. Они нападут на любого, кто подойдет к лагерю.
	AI_Output(self,hero,"Info_Diego_OCGUARDS_11_03");	//Они боятся мести за нападение на Свободную шахту.
};


instance INFO_DIEGO_OCMURDER(C_INFO)
{
	npc = pc_thief;
	condition = info_diego_ocmurder_condition;
	information = info_diego_ocmurder_info;
	important = 0;
	permanent = 0;
	description = "Но что случилось с магами Огня?";
};


func int info_diego_ocmurder_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_ocstory))
	{
		return TRUE;
	};
};

func void info_diego_ocmurder_info()
{
	AI_Output(hero,self,"Info_Diego_OCMURDER_15_01");	//Но что случилось с магами Огня?
	AI_Output(self,hero,"Info_Diego_OCMURDER_11_02");	//Корристо и остальные маги оставались последними, кто сохранил рассудок в этой ситуации.
	AI_Output(self,hero,"Info_Diego_OCMURDER_11_03");	//Они запретили нападение и потребовали объединиться с двумя остальными лагерями.
	AI_Output(hero,self,"Info_Diego_OCMURDER_15_04");	//Они запретили Гомезу напасть на шахту?
	AI_Output(self,hero,"Info_Diego_OCMURDER_11_05");	//Ну, да. Корристо и другие не должны были так вести себя. Гомез перестал доверять им и, внезапно напав, перебил всех.
};


instance INFO_DIEGO_OCRETREAT(C_INFO)
{
	npc = pc_thief;
	condition = info_diego_ocretreat_condition;
	information = info_diego_ocretreat_info;
	important = 0;
	permanent = 0;
	description = "Что вы с Мильтеном собираетесь делать теперь?";
};


func int info_diego_ocretreat_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_ocmurder))
	{
		return TRUE;
	};
};

func void info_diego_ocretreat_info()
{
	AI_Output(hero,self,"Info_Diego_OCRETREAT_15_01");	//Что вы с Мильтеном собираетесь делать теперь?
	AI_Output(self,hero,"Info_Diego_OCRETREAT_11_02");	//Мы пока останемся здесь и будем предупреждать друзей, чтобы они не наткнулись на стражу.
	AI_Output(self,hero,"Info_Diego_OCRETREAT_11_03");	//Однако ты мог бы помочь нам.
};


instance INFO_DIEGO_OCFAVOR(C_INFO)
{
	npc = pc_thief;
	condition = info_diego_ocfavor_condition;
	information = info_diego_ocfavor_info;
	important = 0;
	permanent = 0;
	description = "Конечно. Что я должен сделать?";
};


func int info_diego_ocfavor_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_ocretreat))
	{
		return TRUE;
	};
};

func void info_diego_ocfavor_info()
{
	AI_Output(hero,self,"Info_Diego_OCFAVOR_15_01");	//Конечно. Что я должен сделать?
	AI_Output(self,hero,"Info_Diego_OCFAVOR_11_02");	//Разыщи Лестера и Горна. Они должны узнать о том, что здесь происходит.
	AI_Output(self,hero,"Info_Diego_OCFAVOR_11_03");	//Скажи им, что мы четверо встретимся в нашем месте, как всегда.
	AI_Output(hero,self,"Info_Diego_OCFAVOR_15_04");	//Если я встречу их раньше тебя, я передам, что ты хочешь их видеть.
	AI_Output(self,hero,"Info_Diego_OCFAVOR_11_05");	//Благодарю, друг мой. Ты оказался отличным парнем! Теперь иди, еще увидимся.
	Log_CreateTopic(CH4_4FRIENDS,LOG_MISSION);
	Log_SetTopicStatus(CH4_4FRIENDS,LOG_RUNNING);
	b_logentry(CH4_4FRIENDS,"Все маги Огня мертвы. Но Гомез не хочет на этом останавливаться. Диего попросил меня предупредить Горна и Лестера о том, что он хочет встретиться с ними в потайном месте. Мне кажется, они уже давно знакомы.");
};

