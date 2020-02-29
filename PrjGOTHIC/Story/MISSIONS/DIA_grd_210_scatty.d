
instance DIA_SCATTY_EXIT(C_INFO)
{
	npc = grd_210_scatty;
	nr = 999;
	condition = dia_scatty_exit_condition;
	information = dia_scatty_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_scatty_exit_condition()
{
	return 1;
};

func void dia_scatty_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SCATTY_WHATDOYOUDO(C_INFO)
{
	npc = grd_210_scatty;
	nr = 1;
	condition = dia_scatty_whatdoyoudo_condition;
	information = dia_scatty_whatdoyoudo_info;
	permanent = 0;
	description = "Что ты здесь делаешь?";
};


func int dia_scatty_whatdoyoudo_condition()
{
	return 1;
};

func void dia_scatty_whatdoyoudo_info()
{
	AI_Output(other,self,"DIA_Scatty_WhatDoYouDo_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_Scatty_WhatDoYouDo_01_01");	//Я отвечаю за бои на арене: организую ставки, нанимаю бойцов, ну, еще что-то делаю.
};


var int scatty_chargekirgo;
var int scatty_chargekharim;
var int scatty_chargegorhanis;

instance DIA_SCATTY_JOINOC(C_INFO)
{
	npc = grd_210_scatty;
	nr = 1;
	condition = dia_scatty_joinoc_condition;
	information = dia_scatty_joinoc_info;
	permanent = 0;
	description = "Я хочу присоединиться к этому лагерю. Ты можешь мне помочь?";
};


func int dia_scatty_joinoc_condition()
{
	if(Npc_KnowsInfo(hero,dia_scatty_whatdoyoudo) && Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void dia_scatty_joinoc_info()
{
	var C_NPC kirgo;
	var C_NPC kharim;
	var C_NPC gorhanis;
	AI_Output(other,self,"DIA_Scatty_JoinOC_15_00");	//Я хочу присоединиться к этому лагерю. Ты можешь мне помочь?
	AI_Output(self,other,"DIA_Scatty_JoinOC_01_01");	//Если ты сможешь удивить меня, то, может быть, помогу.
	AI_Output(self,other,"DIA_Scatty_JoinOC_01_02");	//У меня на арене состязаются лучшие бойцы трех лагерей.
	AI_Output(self,other,"DIA_Scatty_JoinOC_01_03");	//Вызови кого-нибудь из них на бой, а я посмотрю, как ты себя покажешь. Ну, а там увидим, смогу ли я тебе помочь.
	SCATTY_CHARGEKIRGO = LOG_RUNNING;
	SCATTY_CHARGEKHARIM = LOG_RUNNING;
	SCATTY_CHARGEGORHANIS = LOG_RUNNING;
	kirgo = Hlp_GetNpc(grd_251_kirgo);
	kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
	kharim = Hlp_GetNpc(sld_729_kharim);
	kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
	gorhanis = Hlp_GetNpc(tpl_1422_gorhanis);
	gorhanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	gorhanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
	Log_CreateTopic(CH1_JOINOC,LOG_MISSION);
	Log_SetTopicStatus(CH1_JOINOC,LOG_RUNNING);
	b_logentry(CH1_JOINOC,"Скатти, распорядитель боев на арене, будет удивлен, если я вызову одного из бойцов.");
};


instance DIA_SCATTY_KIRGOSUCCESS(C_INFO)
{
	npc = grd_210_scatty;
	nr = 1;
	condition = dia_scatty_kirgosuccess_condition;
	information = dia_scatty_kirgosuccess_info;
	permanent = 0;
	description = "Я сразился с Кирго!";
};


func int dia_scatty_kirgosuccess_condition()
{
	var C_NPC kirgo;
	kirgo = Hlp_GetNpc(grd_251_kirgo);
	if((SCATTY_CHARGEKIRGO == LOG_RUNNING) && (KIRGO_CHARGED == TRUE) && ((kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)) && (KAPITEL == 1))
	{
		return 1;
	};
};

func void dia_scatty_kirgosuccess_info()
{
	var C_NPC kirgo;
	kirgo = Hlp_GetNpc(grd_251_kirgo);
	AI_Output(other,self,"DIA_Scatty_KirgoSuccess_15_00");	//Я сразился с Кирго!
	if(kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_01");	//И ты просто так отдал ему победу?!
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_02");	//Думаю, ты уже знаешь, что этим меня не удивить...
		SCATTY_CHARGEKIRGO = LOG_FAILED;
		b_logentry(CH1_JOINOC,"Мое поражение в бою с Кирго не принесло мне расположения Скатти.");
	}
	else if(kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_03");	//Ты победил его! Неплохо для новичка! Ты действительно удивил меня!
		SCATTY_CHARGEKIRGO = LOG_SUCCESS;
		b_logentry(CH1_JOINOC,"Скатти был удивлен моими успехами в бою с Кирго.");
		b_givexp(XP_KIRGOVICTORY);
	};
	Npc_ExchangeRoutine(kirgo,"START");
};


instance DIA_SCATTY_KHARIMSUCCESS(C_INFO)
{
	npc = grd_210_scatty;
	nr = 1;
	condition = dia_scatty_kharimsuccess_condition;
	information = dia_scatty_kharimsuccess_info;
	permanent = 0;
	description = "Я сразился с Каримом!";
};


func int dia_scatty_kharimsuccess_condition()
{
	var C_NPC kharim;
	kharim = Hlp_GetNpc(sld_729_kharim);
	if((SCATTY_CHARGEKHARIM == LOG_RUNNING) && (KHARIM_CHARGED == TRUE) && ((kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (kharim.aivar[AIV_HASDEFEATEDSC] == TRUE)) && (KAPITEL == 1))
	{
		return 1;
	};
};

func void dia_scatty_kharimsuccess_info()
{
	var C_NPC kharim;
	kharim = Hlp_GetNpc(sld_729_kharim);
	AI_Output(other,self,"DIA_Scatty_KHARIMSuccess_15_00");	//Я сразился с Каримом!
	if(kharim.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_01");	//Да, как же и он тебя избил!
		if(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_02");	//Хорошо, что ты выбрал именно этого противника! Я терпеть не могу этих лентяев из Нового лагеря.
			AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_03");	//Мне кажется, ты тоже так думаешь. Такой человек, как ты, нам еще пригодится!
		};
		SCATTY_CHARGEKHARIM = LOG_FAILED;
		b_givexp(XP_KHARIMLOST);
		b_logentry(CH1_JOINOC,"Я проиграл бой с Каримом! Моя смелость порадовала Скатти, а вот боевые таланты - не очень.");
	}
	else if(kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_04");	//Ты победил его! Признаться, я от тебя такого не ожидал. Он считался одним из самых сильных бойцов.
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_05");	//Ты действительно удивил меня!
		SCATTY_CHARGEKHARIM = LOG_SUCCESS;
		b_logentry(CH1_JOINOC,"Я показал Кариму, как нужно драться! Скатти был впечатлен.");
		b_givexp(XP_KHARIMVICTORY);
	};
	Npc_ExchangeRoutine(kharim,"START");
};


instance DIA_SCATTY_OTHERCAMPS(C_INFO)
{
	npc = grd_210_scatty;
	nr = 1;
	condition = dia_scatty_othercamps_condition;
	information = dia_scatty_othercamps_info;
	permanent = 0;
	description = "Почему же люди из Старого и Нового лагеря сражаются здесь?";
};


func int dia_scatty_othercamps_condition()
{
	if(Npc_KnowsInfo(hero,dia_scatty_whatdoyoudo))
	{
		return 1;
	};
};

func void dia_scatty_othercamps_info()
{
	AI_Output(other,self,"DIA_Scatty_OtherCamps_15_00");	//Я думал, что отношения между людьми из Старого и Нового лагеря не самые дружеские. Почему же они сражаются здесь?
	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_01");	//Все просто: раз в неделю на арене устраиваются бои, а рудокопы после тяжелой работы с удовольствием приходят посмотреть, как наши бойцы бьют лентяев из Нового лагеря.
	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_02");	//Обычно наши люди делают больше ставок, когда дерется кто-нибудь из них.
	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_03");	//Лично мне не нравятся люди из Нового лагеря, но дело есть дело...
};

instance DIA_SCATTY_WANNAFIGHT(C_INFO)
{
	npc = grd_210_scatty;
	nr = 1;
	condition = dia_scatty_wannafight_condition;
	information = dia_scatty_wannafight_info;
	permanent = 0;
	description = "Я хочу сражаться на арене!";
};


func int dia_scatty_wannafight_condition()
{
	if(Npc_KnowsInfo(hero,dia_scatty_whatdoyoudo) && Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void dia_scatty_wannafight_info()
{
	AI_Output(other,self,"DIA_Scatty_WannaFight_15_00");	//Я хочу сражаться на арене!
	AI_Output(self,other,"DIA_Scatty_WannaFight_01_01");	//Ты еще не вступил ни в один из лагерей, поэтому я не разрешу тебе выходить на арену!
	AI_Output(self,other,"DIA_Scatty_WannaFight_01_02");	//Никто не захочет видеть здесь независимого бойца-одиночку!
};


instance DIA_SCATTY_TRAIN(C_INFO)
{
	npc = grd_210_scatty;
	nr = 10;
	condition = dia_scatty_train_condition;
	information = dia_scatty_train_info;
	permanent = 1;
	description = "А ты тренируешь бойцов?";
};


func int dia_scatty_train_condition()
{
	if(Npc_KnowsInfo(hero,dia_scatty_whatdoyoudo) && (Npc_GetTalentSkill(hero,NPC_TALENT_1H) < 2) && (KIRGO_KILLED == FALSE && GORHANIS_KILLED == FALSE && KHARIM_KILLED == FALSE))
	{
		return 1;
	};
};

func void dia_scatty_train_info()
{
	if(LOG_SCATTYTRAIN == FALSE)
	{
		Log_CreateTopic(GE_TEACHEROC,LOG_NOTE);
		b_logentry(GE_TEACHEROC,"Скатти, распорядитель боев на арене, может научить меня обращаться с одноручным мечом.");
		LOG_SCATTYTRAIN = TRUE;
	};
	AI_Output(other,self,"DIA_Scatty_TRAIN_15_00");	//А ты тренируешь бойцов?
	AI_Output(self,other,"DIA_Scatty_TRAIN_01_01");	//Конечно, но я делаю это не ради развлечения. Если хочешь, чтобы я тебя тренировал, придется заплатить.
	Info_ClearChoices(dia_scatty_train);
	Info_AddChoice(dia_scatty_train,DIALOG_BACK,dia_scatty_train_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 1)
	{
		Info_AddChoice(dia_scatty_train,b_buildlearnstring(NAME_LEARN1H_2,LPCOST_TALENT_1H_2,150),dia_scatty_train_2h);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 0)
	{
		Info_AddChoice(dia_scatty_train,b_buildlearnstring(NAME_LEARN1H_1,LPCOST_TALENT_1H_1,50),dia_scatty_train_1h);
	};
};

func void dia_scatty_train_back()
{
	Info_ClearChoices(dia_scatty_train);
};

func void dia_scatty_train_1h()
{
	AI_Output(other,self,"DIA_Scatty_TRAIN_1h_15_00");	//Я хотел бы научиться лучше владеть одноручным мечом.
	if(Npc_HasItems(other,itminugget) >= 50)
	{
		if(b_giveskill(other,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1))
		{
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_01");	//Хороший выбор! Чтобы улучшить технику ведения боя, ты должен научиться правильно держать оружие.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_02");	//Начиная тренироваться, многие неопытные воины стараются держать рукоять меча двумя руками. Это ненужная привычка, которая может помешать тебе в дальнейшем.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_03");	//Держи меч одной рукой. Клинок направь вверх и не держи его неподвижно.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_04");	//Ты должен научиться чувствовать меч как часть самого себя, и тогда его движения будут согласованы с движениями твоего тела. Это увеличит скорость атаки.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_05");	//Если ты будешь следовать моим советам, ты сможешь виртуозно вести бой. Но самое главное, твои движения станут быстрее.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_06");	//Да, есть еще кое-что: некоторые удары наносят большее повреждение противнику. Ты еще новичок, поэтому у тебя не так много шансов на решающий удар.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_07");	//Но частые тренировки помогут тебе совершенствоваться и наносить все больше таких ударов.
			b_giveinvitems(other,self,itminugget,50);
			Info_AddChoice(dia_scatty_train,b_buildlearnstring(NAME_LEARN1H_2,LPCOST_TALENT_1H_2,150),dia_scatty_train_2h);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00");	//Твоей руды недостаточно!
	};
};

func void dia_scatty_train_2h()
{
	AI_Output(other,self,"DIA_Scatty_TRAIN_2h_15_01");	//Научи меня лучше владеть одноручным мечом.
	if(Npc_HasItems(other,itminugget) >= 150)
	{
		if(b_giveskill(other,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2))
		{
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_02");	//Ты уже получил начальное представление о владении этим оружием. Если ты будешь держать меч клинком вниз, ты сможешь вложить большую силу в свой первый удар.
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_03");	//Помнишь, что я говорил о хорошем размахе? Следующий шаг на пути к мастерству - умение использовать движения собственного тела. Если ты успел нанести два удара, сделай разворот. Это отвлечет противника и даст тебе возможность выбрать более удачную позицию.
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_04");	//Затем размахнись и нанеси удар справа налево.
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_05");	//И вернись в исходную стойку. Не забывай при этом, что мастерство приходит с опытом. А теперь иди и не забывай о тренировках.
			b_giveinvitems(other,self,itminugget,150);
			Info_ClearChoices(dia_scatty_train);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_TRAIN_2h_NoOre_01_00");	//Приходи, когда у тебя будет больше руды!
	};
};


instance DIA_SCATTY_GORHANISSUCCESS(C_INFO)
{
	npc = grd_210_scatty;
	nr = 1;
	condition = dia_scatty_gorhanissuccess_condition;
	information = dia_scatty_gorhanissuccess_info;
	permanent = 0;
	important = 1;
};


func int dia_scatty_gorhanissuccess_condition()
{
	var C_NPC hanis;
	hanis = Hlp_GetNpc(tpl_1422_gorhanis);
	if((HANIS_CHARGED == TRUE) && ((hanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (hanis.aivar[AIV_HASDEFEATEDSC] == TRUE)))
	{
		return 1;
	};
};

func void dia_scatty_gorhanissuccess_info()
{
	var C_NPC hanis;
	hanis = Hlp_GetNpc(tpl_1422_gorhanis);
	if(hanis.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_01");	//И ты просто так отдал ему победу?!
		AI_StopProcessInfos(self);
	}
	else if(hanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_04");	//Ты победил его! Признаться, я от тебя такого не ожидал. Он считался одним из самых сильных бойцов.
		b_givexp(300);
	};
	Npc_ExchangeRoutine(hanis,"START");
};

instance DIA_SCATTY_WTF(C_INFO)
{
	npc = grd_210_scatty;
	nr = 1;
	condition = dia_scatty_wtf_condition;
	information = dia_scatty_wtf_info;
	permanent = 0;
	important = 1;
};


func int dia_scatty_wtf_condition()
{
	if(KAPITEL < 4 && (((HANIS_CHARGED_END == TRUE) && (Npc_IsDead(tpl_1422_gorhanis))) || ((KIRGO_CHARGED_END == TRUE) && (Npc_IsDead(grd_251_kirgo))) || ((KHARIM_CHARGED_END == TRUE) && (Npc_IsDead(sld_729_kharim)))))
	{
		return 1;
	};
};

func void dia_scatty_wtf_info()
{
	AI_Output(self,other,"SVM_1_HeKilledHim");	//Зачем ты убил его? Теперь тебе не жить!
	b_logentry(CH1_JOINOC,"Скатти в ярости, потому что я убил одного из его бойцов.");
	SCATTY_CHARGEGORHANIS = LOG_FAILED;
	SCATTY_CHARGEKIRGO = LOG_FAILED;
	SCATTY_CHARGEKHARIM = LOG_FAILED;
	if(Npc_IsDead(tpl_1422_gorhanis))
	{
		GORHANIS_KILLED = TRUE;
		b_exchangeroutine(grd_251_kirgo,"nopractice");
		b_exchangeroutine(sld_729_kharim,"nopractice");
	};
	if(Npc_IsDead(grd_251_kirgo))
	{
		KIRGO_KILLED = TRUE;
		b_exchangeroutine(sld_729_kharim,"nopractice");
		b_exchangeroutine(tpl_1422_gorhanis,"nopractice");
	};
	if(Npc_IsDead(sld_729_kharim))
	{
		KHARIM_KILLED = TRUE;
		b_exchangeroutine(grd_251_kirgo,"nopractice");
		b_exchangeroutine(tpl_1422_gorhanis,"nopractice");
	};
	b_exchangeroutine(vlk_513_buddler,"noarena");
	b_exchangeroutine(vlk_514_buddler,"noarena");
	b_exchangeroutine(vlk_515_buddler,"noarena");
	b_exchangeroutine(vlk_530_guy,"noarena");
	b_exchangeroutine(stt_306_schatten,"noarena");
	b_exchangeroutine(stt_316_schatten,"noarena");
	b_exchangeroutine(stt_328_schatten,"noarena");
	AI_StopProcessInfos(self);
};

