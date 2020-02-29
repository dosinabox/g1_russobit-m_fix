
instance PC_PSIONIC_EXIT(C_INFO)
{
	npc = pc_psionic;
	nr = 999;
	condition = pc_psionic_exit_condition;
	information = pc_psionic_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int pc_psionic_exit_condition()
{
	return 1;
};

func void pc_psionic_exit_info()
{
	if(self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output(self,hero,"Info_Lester_EXIT_05_01");	//Пойдем!
	}
	else
	{
		AI_Output(self,hero,"Info_Lester_EXIT_05_02");	//Да хранит тебя Спящий!
	};
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_SAKRILEG(C_INFO)
{
	npc = pc_psionic;
	nr = 1;
	condition = dia_lester_sakrileg_condition;
	information = dia_lester_sakrileg_info;
	permanent = 0;
	important = 1;
};


func int dia_lester_sakrileg_condition()
{
	if(BAALNAMIB_SAKRILEG == TRUE)
	{
		return 1;
	};
};

func void dia_lester_sakrileg_info()
{
	AI_Output(self,other,"DIA_Lester_Sakrileg_05_00");	//Ты захотел поговорить с Гуру! Этого нельзя делать! Это святотатство. Когда учитель захочет, он сам обратится к тебе.
};


instance DIA_LESTER_HALLO(C_INFO)
{
	npc = pc_psionic;
	nr = 1;
	condition = dia_lester_hallo_condition;
	information = dia_lester_hallo_info;
	permanent = 0;
	description = "Кто ты?";
};


func int dia_lester_hallo_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_lester_hallo_info()
{
	AI_Output(other,self,"DIA_Lester_Hallo_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Lester_Hallo_05_01");	//Я Лестер. Я забочусь о тех, кто приходит в этот лагерь.
	if(BAALNAMIB_SAKRILEG == FALSE)
	{
		AI_Output(self,other,"DIA_Lester_Hallo_05_02");	//Ты не стал обращаться к Идолу Намибу. Это хороший знак. Ни один неверный не может говорить с Гуру.
	};
};


instance DIA_LESTER_WANNATALKTOMASTER(C_INFO)
{
	npc = pc_psionic;
	nr = 2;
	condition = dia_lester_wannatalktomaster_condition;
	information = dia_lester_wannatalktomaster_info;
	permanent = 0;
	description = "Но мне нужно с ним поговорить.";
};


func int dia_lester_wannatalktomaster_condition()
{
	if((Npc_KnowsInfo(hero,dia_lester_hallo) || Npc_KnowsInfo(hero,dia_lester_sakrileg)) && (Npc_GetTrueGuild(hero) == GIL_NONE) && !Npc_KnowsInfo(hero,dia_lester_showhallo))
	{
		return 1;
	};
};

func void dia_lester_wannatalktomaster_info()
{
	AI_Output(other,self,"DIA_Lester_WannaTalkToMaster_15_00");	//Но мне нужно с ним поговорить.
	AI_Output(self,other,"DIA_Lester_WannaTalkToMaster_05_01");	//Не стоит! Я уверен, что сам смогу помочь тебе решить твои проблемы.
};


instance DIA_LESTER_CAMPINFO(C_INFO)
{
	npc = pc_psionic;
	nr = 2;
	condition = dia_lester_campinfo_condition;
	information = dia_lester_campinfo_info;
	permanent = 1;
	description = "Расскажи мне что-нибудь о лагере.";
};


func int dia_lester_campinfo_condition()
{
	if(Npc_KnowsInfo(hero,dia_lester_hallo) && (KAPITEL < 3))
	{
		return 1;
	};
};

func void dia_lester_campinfo_info()
{
	AI_Output(other,self,"DIA_Lester_CampInfo_15_00");	//Расскажи мне что-нибудь о лагере.
	AI_Output(self,other,"DIA_Lester_CampInfo_05_01");	//Что ты хочешь знать?
	Info_ClearChoices(dia_lester_campinfo);
	Info_AddChoice(dia_lester_campinfo,DIALOG_BACK,dia_lester_campinfo_back);
	Info_AddChoice(dia_lester_campinfo,"Расскажи мне о гильдиях.",dia_lester_campinfo_gil);
	Info_AddChoice(dia_lester_campinfo,"Кто такой Спящий?",dia_lester_campinfo_sleeper);
	Info_AddChoice(dia_lester_campinfo,"Что ты знаешь о болотнике?",dia_lester_campinfo_herb);
};

func void dia_lester_campinfo_back()
{
	Info_ClearChoices(dia_lester_campinfo);
};

func void dia_lester_campinfo_gil()
{
	AI_Output(other,self,"DIA_Lester_CampInfo_GIL_15_00");	//Расскажи мне о гильдиях.
	AI_Output(self,other,"DIA_Lester_CampInfo_GIL_05_01");	//Гуру входят в верховную Гильдию. Они представляют дух нашего лагеря и их сила велика. Следом идут Стражи, которые используют свою духовную силу в бою.
	AI_Output(self,other,"DIA_Lester_CampInfo_GIL_05_02");	//Их воля несокрушима. Лучше не вставать у них на пути. Сам я послушник. Мы возносим молитвы Спящему и выполняем всю работу в лагере.
	AI_Output(self,other,"DIA_Lester_CampInfo_GIL_05_03");	//Некоторые из послушников могут стать Гуру, но для этого они должны многому научиться.
};

func void dia_lester_campinfo_sleeper()
{
	AI_Output(other,self,"DIA_Lester_CampInfo_SLEEPER_15_00");	//Кто такой Спящий?
	AI_Output(self,other,"DIA_Lester_CampInfo_SLEEPER_05_01");	//Спящий - наш бог. Он посылает нам видения. Но не каждый достоин такой чести. Лишь Гуру получают от него этот дар.
	AI_Output(self,other,"DIA_Lester_CampInfo_SLEEPER_05_02");	//Мы молимся ему, потому что знаем, что он сможет освободить нас.
	AI_Output(other,self,"DIA_Lester_CampInfo_SLEEPER_15_03");	//И ты в это веришь?
	AI_Output(self,other,"DIA_Lester_CampInfo_SLEEPER_05_04");	//Эй, я провел здесь уже два года. Ты знаешь, что это такое - прожить два года в этой тюрьме?
	AI_Output(self,other,"DIA_Lester_CampInfo_SLEEPER_05_05");	//Ты даже представить не можешь, чему я готов поверить, лишь бы уйти из этого места.
};

func void dia_lester_campinfo_herb()
{
	AI_Output(other,self,"DIA_Lester_CampInfo_HERB_15_00");	//Что ты знаешь о болотнике?
	AI_Output(self,other,"DIA_Lester_CampInfo_HERB_05_01");	//Ну, болотник мы собираем на болотах, это всем известно. После сбора он подвергается правильной обработке, чтобы его можно было курить. Эту работу выполняют послушники.
	AI_Output(self,other,"DIA_Lester_CampInfo_HERB_05_02");	//Болотник помогает расслабиться и успокаивает, дает возможность сосредоточиться на главном и раскрывает сознание.
	AI_Output(self,other,"DIA_Lester_CampInfo_HERB_05_03");	//Мы меняем его на товары из других лагерей и используем для привлечения новых людей в Братство.
	AI_Output(self,other,"DIA_Lester_CampInfo_HERB_05_04");	//Конечно, некоторые присоединяются к нам только из-за него. Ну, они хотя бы соглашаются выполнять некоторые работы в лагере.
};


instance DIA_LESTER_WANNAJOIN(C_INFO)
{
	npc = pc_psionic;
	nr = 2;
	condition = dia_lester_wannajoin_condition;
	information = dia_lester_wannajoin_info;
	permanent = 0;
	description = "Я хочу присоединиться к Братству!";
};


func int dia_lester_wannajoin_condition()
{
	if(Npc_KnowsInfo(hero,dia_lester_hallo) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void dia_lester_wannajoin_info()
{
	AI_Output(other,self,"DIA_Lester_WannaJoin_15_00");	//Я хочу присоединиться к Братству!
	AI_Output(self,other,"DIA_Lester_WannaJoin_05_01");	//Только Кор Галом может решать, готов ли ты вступить в наше Братство.
	AI_Output(self,other,"DIA_Lester_WannaJoin_05_02");	//Но он полагается и на мнение других Гуру. Он ценит мнение Идола Намиба.
	AI_Output(self,other,"DIA_Lester_WannaJoin_05_03");	//Сначала ты должен доказать свою преданность, после этого один из Гуру направит тебя к Кор Галому.
};


instance DIA_LESTER_HOWPROOFWORTHY(C_INFO)
{
	npc = pc_psionic;
	nr = 2;
	condition = dia_lester_howproofworthy_condition;
	information = dia_lester_howproofworthy_info;
	permanent = 0;
	description = "Как же это сделать? Никто из них не хочет со мной разговаривать?";
};


func int dia_lester_howproofworthy_condition()
{
	if(Npc_KnowsInfo(hero,dia_lester_wannajoin) && (Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2))
	{
		return 1;
	};
};

func void dia_lester_howproofworthy_info()
{
	AI_Output(other,self,"DIA_Lester_HowProofWorthy_15_00");	//Как же это сделать, если никто из них не хочет со мной разговаривать?
	AI_Output(self,other,"DIA_Lester_HowProofWorthy_05_01");	//Быть может, ты не будешь этого замечать, но за тобой всегда будут наблюдать Гуру.
	AI_Output(self,other,"DIA_Lester_HowProofWorthy_05_02");	//Когда они решат, что ты достоин быть принятым, они скажут тебе об этом.
	AI_Output(self,other,"DIA_Lester_HowProofWorthy_05_03");	//Я думаю, тебе очень скоро предоставится возможность доказать свою преданность нашему лагерю.
	Log_CreateTopic(CH1_JOINPSI,LOG_MISSION);
	Log_SetTopicStatus(CH1_JOINPSI,LOG_RUNNING);
	b_logentry(CH1_JOINPSI,"Если я хочу присоединиться к братьям из Болотного лагеря, я должен произвести впечатление на Гуру. Они не разговаривают с новичками. Но, как сказал Лестер, они будут наблюдать за мной, и когда я буду находиться недалеко от них, я должен вести себя достойно. Правда, я еще не понимаю, что это значит! Лучше я осмотрю Болотный лагерь.");
};


var int lester_show;

instance DIA_LESTER_WEITWEG(C_INFO)
{
	npc = pc_psionic;
	nr = 2;
	condition = dia_lester_weitweg_condition;
	information = dia_lester_weitweg_info;
	permanent = 0;
	description = "Как мне поговорить с твоим учителем?";
};


func int dia_lester_weitweg_condition()
{
	var C_NPC namib;
	namib = Hlp_GetNpc(gur_1204_baalnamib);
	if((Npc_GetDistToNpc(other,namib) > 1000) && (BAALNAMIB_ANSPRECHBAR == FALSE) && (Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2))
	{
		return 1;
	};
};

func void dia_lester_weitweg_info()
{
	AI_Output(other,self,"DIA_Lester_WeitWeg_15_00");	//Как мне поговорить с твоим учителем?
	AI_Output(self,other,"DIA_Lester_WeitWeg_05_01");	//Ты должен знать, что он хочет от тебя услышать.
	AI_Output(other,self,"DIA_Lester_WeitWeg_15_02");	//И что же?
	AI_Output(self,other,"DIA_Lester_WeitWeg_05_03");	//Будь внимателен. Когда мы в следующий раз подойдем к нему, обратись ко мне, и мы немного поговорим.
	AI_Output(self,other,"DIA_Lester_WeitWeg_05_04");	//Сейчас у Идола Намиба очень много забот, ведь наши послушники все еще не отвыкли молиться старым богам.
	AI_Output(self,other,"DIA_Lester_WeitWeg_05_05");	//Ты скажешь мне, что отрекаешься от старой веры и отныне будешь уповать на милость Спящего.
	AI_Output(self,other,"DIA_Lester_WeitWeg_05_06");	//Я спрошу тебя, что заставило тебя прийти к такому решению, а ты ответишь, что тебе было видение, в котором Спящий призвал тебя к себе.
	AI_Output(self,other,"DIA_Lester_WeitWeg_05_07");	//Он не останется равнодушным. Ты сможешь с этим справиться?
	AI_Output(other,self,"DIA_Lester_WeitWeg_15_08");	//Смогу.
	Log_CreateTopic(CH1_JOINPSI,LOG_MISSION);
	Log_SetTopicStatus(CH1_JOINPSI,LOG_RUNNING);
	b_logentry(CH1_JOINPSI,"Чтобы удивить Идола Намиба, я должен сказать Лестеру, что принимаю веру в Спящего и отказываюсь от старых богов, так чтобы он это слышал.");
	LESTER_SHOW = TRUE;
};


instance DIA_LESTER_SHOWHALLO(C_INFO)
{
	npc = pc_psionic;
	nr = 1;
	condition = dia_lester_showhallo_condition;
	information = dia_lester_showhallo_info;
	permanent = 0;
	important = 1;
};


func int dia_lester_showhallo_condition()
{
	var C_NPC namib;
	namib = Hlp_GetNpc(gur_1204_baalnamib);
	if((Npc_GetDistToNpc(other,namib) < 500) && (BAALNAMIB_ANSPRECHBAR == FALSE) && (LESTER_SHOW == TRUE) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void dia_lester_showhallo_info()
{
	AI_Output(self,other,"DIA_Lester_ShowHallo_05_00");	//Ах! Как я рад нашей встрече. Как у тебя дела?
};


instance DIA_LESTER_SHOW(C_INFO)
{
	npc = pc_psionic;
	nr = 1;
	condition = dia_lester_show_condition;
	information = dia_lester_show_info;
	permanent = 0;
	description = "Я отрекся от старых богов.";
};


func int dia_lester_show_condition()
{
	var C_NPC namib;
	namib = Hlp_GetNpc(gur_1204_baalnamib);
	if((Npc_GetDistToNpc(other,namib) < 500) && (BAALNAMIB_ANSPRECHBAR == FALSE) && (LESTER_SHOW == TRUE))
	{
		return 1;
	};
};

func void dia_lester_show_info()
{
	AI_Output(other,self,"DIA_Lester_Show_15_00");	//Я отрекся от старых богов.
	AI_Output(self,other,"DIA_Lester_Show_05_01");	//Правда? А почему ты так решил?
	AI_Output(other,self,"DIA_Lester_Show_15_02");	//Мне было видение. Спящий говорил со мной.
	AI_Output(self,other,"DIA_Lester_Show_05_03");	//И что он сказал?
	AI_Output(other,self,"DIA_Lester_Show_15_04");	//Он сказал: иди в лагерь на болотах и стань одним из братьев.
	AI_Output(self,other,"DIA_Lester_Show_05_05");	//Тебе несказанно повезло, незнакомец, немногие могут удостоиться такой чести!
	BAALNAMIB_ANSPRECHBAR = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_GUIDEOFFER(C_INFO)
{
	npc = pc_psionic;
	nr = 5;
	condition = dia_lester_guideoffer_condition;
	information = dia_lester_guideoffer_info;
	permanent = 0;
	description = "Как мне ориентироваться в этом лагере?";
};


func int dia_lester_guideoffer_condition()
{
	if(Npc_KnowsInfo(hero,dia_lester_hallo) && (KAPITEL < 3))
	{
		return 1;
	};
};

func void dia_lester_guideoffer_info()
{
	AI_Output(other,self,"DIA_Lester_GuideOffer_15_00");	//Как мне ориентироваться в этом лагере?
	AI_Output(self,other,"DIA_Lester_GuideOffer_05_01");	//Я могу тебе показать наш лагерь.
};


instance PC_PSIONIC_SOON(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_soon_condition;
	information = pc_psionic_soon_info;
	important = 0;
	permanent = 1;
	description = "Мы уже пришли?";
};


func int pc_psionic_soon_condition()
{
	if(Npc_KnowsInfo(hero,dia_lester_guideoffer) && (KAPITEL < 3) && (LESTERGUIDE >= 1))
	{
		return TRUE;
	};
};

func void pc_psionic_soon_info()
{
	AI_Output(other,self,"PC_Psionic_SOON_Info_15_01");	//Мы уже пришли?
	AI_Output(self,other,"PC_Psionic_SOON_Info_05_02");	//Если ты не будешь задавать много вопросов, мы с этим быстро справимся.
	AI_StopProcessInfos(self);
};


instance PC_PSIONIC_CHANGE(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_change_condition;
	information = pc_psionic_change_info;
	important = 0;
	permanent = 1;
	description = "Я передумал.";
};


func int pc_psionic_change_condition()
{
	if(Npc_KnowsInfo(hero,dia_lester_guideoffer) && (KAPITEL < 3) && (LESTERGUIDE >= 1))
	{
		return TRUE;
	};
};

func void pc_psionic_change_info()
{
	AI_Output(other,self,"PC_Psionic_CHANGE_Info_15_01");	//Я передумал.
	AI_Output(self,other,"PC_Psionic_CHANGE_Info_05_02");	//Ты знаешь, где меня найти.
	AI_StopProcessInfos(self);
	LESTERGUIDE = 0;
	Npc_ExchangeRoutine(self,"START");
};


instance PC_PSIONIC_GUIDEFIRST(C_INFO)
{
	npc = pc_psionic;
	nr = 5;
	condition = pc_psionic_guidefirst_condition;
	information = pc_psionic_guidefirst_info;
	important = 0;
	permanent = 1;
	description = "Как пройти...";
};


func int pc_psionic_guidefirst_condition()
{
	if(Npc_KnowsInfo(hero,dia_lester_guideoffer) && (KAPITEL < 3) && (LESTERGUIDE == 0))
	{
		return TRUE;
	};
};

func void pc_psionic_guidefirst_info()
{
	AI_Output(other,self,"PC_Psionic_GUIDEFIRST_Info_15_01");	//Как пройти...
	Info_ClearChoices(pc_psionic_guidefirst);
	Info_AddChoice(pc_psionic_guidefirst,DIALOG_BACK,pc_psionic_guidefirst_back);
	Info_AddChoice(pc_psionic_guidefirst,"...назад к главным воротам?",pc_psionic_guidefirst_maingate);
	Info_AddChoice(pc_psionic_guidefirst,"...к кузнице?",pc_psionic_guidefirst_smith);
	Info_AddChoice(pc_psionic_guidefirst,"...к Храму?",pc_psionic_guidefirst_tempel);
	Info_AddChoice(pc_psionic_guidefirst,"...к наставникам?",pc_psionic_guidefirst_train);
	Info_AddChoice(pc_psionic_guidefirst,"...в лабораторию?",pc_psionic_guidefirst_herb);
};

func void pc_psionic_guidefirst_maingate()
{
	Npc_ClearAIQueue(self);
	Info_ClearChoices(pc_psionic_guidefirst);
	LESTERGUIDE = 0;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void pc_psionic_guidefirst_smith()
{
	AI_Output(other,self,"PC_Psionic_GUIDEFIRST_SMITH_Info_15_01");	//...к кузнице?
	AI_Output(self,other,"PC_Psionic_GUIDEFIRST_SMITH_Info_05_02");	//Следуй за мной!
	LESTERGUIDE = 1;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDETOSMITH");
};

func void pc_psionic_guidefirst_tempel()
{
	AI_Output(other,self,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_15_01");	//...к Храму?
	AI_Output(self,other,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_05_02");	//Следуй за мной!
	LESTERGUIDE = 2;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDETOTEMPEL");
};

func void pc_psionic_guidefirst_train()
{
	AI_Output(other,self,"PC_Psionic_GUIDEFIRST_TRAIN_Info_15_01");	//...к наставникам?
	AI_Output(self,other,"PC_Psionic_GUIDEFIRST_TARIN_Info_05_02");	//Следуй за мной!
	LESTERGUIDE = 3;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDETOTRAIN");
};

func void pc_psionic_guidefirst_herb()
{
	AI_Output(other,self,"PC_Psionic_GUIDEFIRST_HERB_Info_15_01");	//...в лабораторию?
	AI_Output(self,other,"PC_Psionic_GUIDEFIRST_HERB_Info_05_02");	//Следуй за мной!
	LESTERGUIDE = 4;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDETOHERB");
};

func void pc_psionic_guidefirst_back()
{
	Info_ClearChoices(pc_psionic_guidefirst);
};


instance PC_PSIONIC_TRAIN(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_train_condition;
	information = pc_psionic_train_info;
	important = 1;
	permanent = 1;
};


func int pc_psionic_train_condition()
{
	if((Npc_GetDistToWP(self,"PSI_PATH_9_4") < 500) && (LESTERGUIDE == 3))
	{
		return TRUE;
	};
};

func void pc_psionic_train_info()
{
	AI_Output(self,other,"PC_Psionic_TRAIN_Info_05_01");	//Здесь внизу ты найдешь Идола Кадара. Он обучает послушников.
	AI_PointAt(self,"PSI_PATH_9_14");
	AI_StopPointAt(self);
	AI_Output(self,other,"PC_Psionic_TRAIN_Info_05_02");	//Эта лестница ведет на тренировочную площадку Стражей. Я подожду тебя здесь. Если ты задержишься, ты сможешь найти меня у входа в лагерь.
	LESTERGUIDE = 0;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay(self);
	ta_stay(0,0,0,55,"PSI_PATH_9_4");
	TA_EndOverlay(self);
};


instance PC_PSIONIC_TEMPEL(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_tempel_condition;
	information = pc_psionic_tempel_info;
	important = 1;
	permanent = 0;
};


func int pc_psionic_tempel_condition()
{
	if((Npc_GetDistToWP(self,"PSI_TEMPLE_NOVIZE_PR") < 600) && (LESTERGUIDE == 2))
	{
		return TRUE;
	};
};

func void pc_psionic_tempel_info()
{
	AI_Output(self,other,"PC_Psionic_TEMPEL_Info_05_01");	//Это наш Храм. Ты можешь осмотреться здесь, но долго не задерживайся, иначе я вернусь к Идолу Намибу.
	LESTERGUIDE = 0;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay(self);
	ta_stay(0,0,1,0,"PSI_TEMPLE_NOVIZE_PR");
	TA_EndOverlay(self);
};


instance PC_PSIONIC_SMITH(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_smith_condition;
	information = pc_psionic_smith_info;
	important = 1;
	permanent = 0;
};


func int pc_psionic_smith_condition()
{
	if((Npc_GetDistToWP(self,"PSI_SMITH_IN") < 900) && (LESTERGUIDE == 1))
	{
		return 1;
	};
};

func void pc_psionic_smith_info()
{
	AI_Output(self,other,"PC_Psionic_SMITH_Info_05_01");	//Вот наша кузница! Осмотрись, у тебя есть ровно час. Потом я вернусь к Идолу Намибу.
	LESTERGUIDE = 0;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay(self);
	ta_stay(0,0,1,0,"PSI_SMITH_IN");
	TA_EndOverlay(self);
};


instance PC_PSIONIC_HERB(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_herb_condition;
	information = pc_psionic_herb_info;
	important = 1;
	permanent = 0;
};


func int pc_psionic_herb_condition()
{
	if((Npc_GetDistToWP(self,"PSI_WALK_06") < 800) && (LESTERGUIDE == 4))
	{
		return TRUE;
	};
};

func void pc_psionic_herb_info()
{
	AI_Output(self,other,"PC_Psionic_HERB_Info_05_01");	//Эта лестница ведет в лабораторию Кор Галома, алхимика. А внизу живет Фортуно, торговец болотником.
	AI_Output(self,other,"PC_Psionic_HERB_Info_05_02");	//Я буду ждать тебя здесь в течение часа. А потом мне придется уйти.
	LESTERGUIDE = 0;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay(self);
	ta_stay(0,0,1,0,"PSI_32_HUT_EX");
	TA_EndOverlay(self);
};


instance PC_PSIONIC_SEND(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_send_condition;
	information = pc_psionic_send_info;
	important = 1;
	permanent = 0;
};


func int pc_psionic_send_condition()
{
	if((Npc_GetTrueGuild(hero) != GIL_NONE) && (YBERION_BRINGFOCUS != LOG_RUNNING) && (YBERION_BRINGFOCUS != LOG_SUCCESS))
	{
		return 1;
	};
};

func void pc_psionic_send_info()
{
	AI_GotoNpc(self,hero);
	if(Npc_KnowsInfo(hero,dia_lester_hallo))
	{
		AI_Output(self,other,"PC_Psionic_SEND_Info_05_00");	//Хорошо, что ты пришел. У меня для тебя новость.
		AI_Output(other,self,"PC_Psionic_SEND_Info_15_01");	//Расскажи.
	};
	AI_Output(self,other,"PC_Psionic_SEND_Info_05_02");	//Гуру нашего Братства ожидают великого события.
	AI_Output(other,self,"PC_Psionic_SEND_Info_15_03");	//Да? Они хотят выйти отсюда?
	AI_Output(self,other,"PC_Psionic_SEND_Info_05_04");	//Они хотят призвать Спящего. Но им нужно что-то, что поможет объединить их духовные силы.
	//AI_Output(other,self,"PC_Psionic_SEND_Info_15_05");	//Да?
	AI_Output(self,other,"PC_Psionic_SEND_Info_05_06");	//Для этого нужен магический артефакт, который они называют юнитором.
	Npc_ExchangeRoutine(pc_psionic,"StartCH2");
	Npc_ExchangeRoutine(gur_1204_baalnamib,"StartCH2");
	b_kapitelwechsel(2);
};


instance PC_PSIONIC_BROTHERHOOD_TODO(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_brotherhood_todo_condition;
	information = pc_psionic_brotherhood_todo_info;
	important = 0;
	permanent = 0;
	description = "А я что могу сделать?";
};


func int pc_psionic_brotherhood_todo_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_send))
	{
		return TRUE;
	};
};

func void pc_psionic_brotherhood_todo_info()
{
	var C_NPC yberion;
	AI_Output(other,self,"PC_Psionic_BROTHERHOOD_TODO_15_01");	//А я что могу сделать?
	AI_Output(self,other,"PC_Psionic_BROTHERHOOD_TODO_05_02");	//Поговори с Юберионом. Он наш Учитель и самый могущественный из нас. У тебя будет возможность заслужить его доверие.
	AI_Output(other,self,"PC_Psionic_BROTHERHOOD_TODO_15_03");	//Где я могу его найти?
	AI_Output(self,other,"PC_Psionic_BROTHERHOOD_TODO_05_04");	//Иди к Храму. Он редко покидает его. Наверное, в этом холодном здании он чувствует себя ближе к Спящему.
	Log_CreateTopic(CH2_FOCUS,LOG_MISSION);
	Log_SetTopicStatus(CH2_FOCUS,LOG_RUNNING);
	b_logentry(CH2_FOCUS,"Послушник Лестер рассказал мне, что Юбериону нужен юнитор. Учителя я смогу найти в храме на холме.");
	yberion = Hlp_GetNpc(gur_1200_yberion);
	yberion.aivar[AIV_FINDABLE] = TRUE;
};


instance PC_PSIONIC_FOLLOWME(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_followme_condition;
	information = pc_psionic_followme_info;
	important = 1;
	permanent = 0;
};


func int pc_psionic_followme_condition()
{
	if((Npc_GetDistToWP(hero,"LOCATION_19_01") < 400) && (Npc_GetDistToNpc(hero,self) < 400))
	{
		return TRUE;
	};
};

func void pc_psionic_followme_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"PC_Psionic_FOLLOWME_Info_05_01");	//Эй, что ты здесь делаешь?
	AI_Output(other,self,"PC_Psionic_FOLLOWME_Info_15_02");	//Я выполняю задание магов Воды. Им нужны магические артефакты, называемые юниторами.
	AI_Output(self,other,"PC_Psionic_FOLLOWME_Info_05_03");	//Ты хочешь найти юнитор, да? Храбрости тебе не занимать.
	AI_Output(other,self,"PC_Psionic_FOLLOWME_Info_15_04");	//С его помощью Сатурас и другие маги из Нового лагеря хотят разрушить Барьер и освободить колонию.
	AI_Output(self,other,"PC_Psionic_FOLLOWME_Info_05_05");	//Я поверю тебе, только когда увижу его собственными глазами.
	AI_Output(other,self,"PC_Psionic_FOLLOWME_Info_15_06");	//Я тоже. Но скажи мне, зачем ты здесь?
	AI_Output(self,other,"PC_Psionic_FOLLOWME_Info_05_07");	//Я как раз думаю над тем, не пойти ли мне в горный форт.
	AI_Output(self,other,"PC_Psionic_FOLLOWME_Info_05_08");	//Есть один документ, который бы мне хотелось взять себе. С другой стороны, дорога туда очень опасна.
};


instance PC_PSIONIC_GOLEM(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_golem_condition;
	information = pc_psionic_golem_info;
	important = 0;
	permanent = 0;
	description = "Как тебе удалось пробраться через эту живую гору?";
};


func int pc_psionic_golem_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_followme) && !Npc_KnowsInfo(hero,pc_psionic_finish))
	{
		return TRUE;
	};
};

func void pc_psionic_golem_info()
{
	AI_Output(other,self,"PC_Psionic_NORMAL_Info_15_01");	//Как тебе удалось пробраться через эту живую гору?
	AI_Output(self,other,"PC_Psionic_NORMAL_Info_05_02");	//Я многому научился у Гуру. Их магия бывает весьма полезна.
};


instance PC_PSIONIC_STORY(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_story_condition;
	information = pc_psionic_story_info;
	important = 0;
	permanent = 0;
	description = "Что за документ ты хочешь найти?";
};


func int pc_psionic_story_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_followme))
	{
		return TRUE;
	};
};

func void pc_psionic_story_info()
{
	AI_Output(other,self,"PC_Psionic_STORY_Info_15_01");	//Что за документ ты хочешь найти?
	AI_Output(self,other,"PC_Psionic_STORY_Info_05_02");	//Когда-то давно в этом форте жил правитель этих земель. Ему принадлежала эта земля и все шахты.
	AI_Output(self,other,"PC_Psionic_STORY_Info_05_03");	//Как у всякого дворянина, у него был документ, подтверждающий право собственности на землю. Он то мне и нужен.
	AI_Output(other,self,"PC_Psionic_STORY_Info_15_04");	//Но пока мы находимся за Барьером, он будет совершенно бесполезен.
	AI_Output(self,other,"PC_Psionic_STORY_Info_05_05");	//Ты прав. Но если маги Воды смогу разрушить Барьер, этот документ снова вступит в силу.
};


instance PC_PSIONIC_COMEWITHME(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_comewithme_condition;
	information = pc_psionic_comewithme_info;
	important = 0;
	permanent = 0;
	description = "Мы можем вместе осмотреть этот форт.";
};


func int pc_psionic_comewithme_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_story) && Npc_KnowsInfo(hero,pc_psionic_golem))
	{
		return TRUE;
	};
};

func void pc_psionic_comewithme_info()
{
	AI_Output(other,self,"PC_Psionic_COMEWITHME_Info_15_01");	//Мы можем вместе осмотреть этот форт.
	AI_Output(self,other,"PC_Psionic_COMEWITHME_Info_05_02");	//Отличное предложение. Иди вперед, а я пойду следом.
	Log_CreateTopic(CH3_FORTRESS,LOG_MISSION);
	Log_SetTopicStatus(CH3_FORTRESS,LOG_RUNNING);
	b_logentry(CH3_FORTRESS,"Недалеко от огромного форта на горе я встретил послушника Лестера из Болотного лагеря. Сам он ищет здесь один документ. Он решил присоединиться ко мне.");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"FORTRESSFOLLOW");
	AI_StopProcessInfos(self);
};


instance PC_PSIONIC_FOKUSPLACE(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_fokusplace_condition;
	information = pc_psionic_fokusplace_info;
	important = 1;
	permanent = 0;
};


func int pc_psionic_fokusplace_condition()
{
	if(Npc_GetDistToWP(hero,"LOCATION_19_03_PATH_RUIN7") < 400 && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void pc_psionic_fokusplace_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"PC_Psionic_FOKUSPLACE_Info_05_01");	//Посмотри-ка, кажется, это и есть юнитор.
	AI_Output(other,self,"PC_Psionic_FOKUSPLACE_Info_15_02");	//Да, кажется, ты прав, хм... Его не так-то легко достать...
	AI_StopProcessInfos(self);
	b_logentry(CH3_FORTRESS,"Юнитор, который мне нужен, находится на пьедестале. Сам я не смогу его достать. Но мне придется найти способ сделать это.");
	Wld_InsertNpc(harpie,"LOCATION_19_03_ENTRANCE_HARPYE");
	Wld_InsertNpc(harpie,"LOCATION_19_03_ENTRANCE_HARPYE2");
	Wld_InsertNpc(harpie,"LOCATION_19_03_ENTRANCE_HARPYE3");
};


instance PC_PSIONIC_COMEBACK(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_comeback_condition;
	information = pc_psionic_comeback_info;
	important = 1;
	permanent = 0;
};


func int pc_psionic_comeback_condition()
{
	if((Npc_GetDistToWP(hero,"PATH_TO_PLATEAU04_BRIDGE2") < 600) && Npc_KnowsInfo(hero,pc_psionic_followme) && !Npc_HasItems(hero,focus_3) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void pc_psionic_comeback_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"PC_Psionic_COMEBACK_Info_05_01");	//Куда же ты? Наши поиски еще не закончены.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"FORTRESSWAIT");
	AI_StopProcessInfos(self);
};


instance PC_PSIONIC_IAMHURT(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_iamhurt_condition;
	information = pc_psionic_iamhurt_info;
	important = 0;
	permanent = 1;
	description = "Я ранен. Ты можешь помочь мне?";
};


func int pc_psionic_iamhurt_condition()
{
	if((hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]) && Npc_KnowsInfo(hero,pc_psionic_followme) && !Npc_KnowsInfo(hero,pc_psionic_finish))
	{
		return TRUE;
	};
};

func void pc_psionic_iamhurt_info()
{
	AI_Output(other,self,"PC_Psionic_IAMHURT_Info_15_01");	//Я ранен. Ты можешь помочь мне?
	if(LESTER_HEAL == 0)
	{
		AI_Output(self,other,"PC_Psionic_IAMHURT_Info_05_02");	//Вот, возьми это зелье лечения.
		b_giveinvitems(self,hero,itfo_potion_health_02,1);
		LESTER_HEAL = 1;
	}
	else if(LESTER_HEAL == 1)
	{
		AI_Output(self,other,"PC_Psionic_IAMHURT_Info_05_02");	//Вот, возьми это зелье лечения.
		b_giveinvitems(self,hero,itfo_potion_health_02,1);
		LESTER_HEAL = 2;
	}
	else if(LESTER_HEAL == 2)
	{
		AI_Output(self,other,"PC_Psionic_IAMHURT_Info_05_02");	//Вот, возьми это зелье лечения.
		b_giveinvitems(self,hero,itfo_potion_health_02,1);
		LESTER_HEAL = 3;
	}
	else
	{
		AI_Output(self,other,"SVM_5_Help");	//Черт!
	};
	AI_StopProcessInfos(self);
};


instance PC_PSIONIC_URKUNDE(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_urkunde_condition;
	information = pc_psionic_urkunde_info;
	important = 0;
	permanent = 0;
	description = "Я нашел документ.";
};


func int pc_psionic_urkunde_condition()
{
	if(Npc_HasItems(hero,itwr_urkunde_01) && Npc_KnowsInfo(hero,pc_psionic_story))
	{
		return TRUE;
	};
};

func void pc_psionic_urkunde_info()
{
	AI_Output(other,self,"PC_Psionic_URKUNDE_Info_15_01");	//Я нашел документ.
	AI_Output(self,other,"PC_Psionic_URKUNDE_Info_05_02");	//Отлично! Возьми эти свитки в качестве награды. Они помогут тебе добраться до юнитора.
	AI_Output(self,other,"PC_Psionic_URKUNDE_Info_05_03");	//Я подожду тебя внизу, у пьедестала.
	b_logentry(CH3_FORTRESS,"Завещание, которое искал Лестер, находилось в ящике. В обмен на него он дал мне четыре свитка телекинеза. С их помощью я смогу достать юнитор.");
	CreateInvItems(self,itarscrolltelekinesis,4);
	b_giveinvitems(self,hero,itarscrolltelekinesis,4);
	b_giveinvitems(hero,self,itwr_urkunde_01,1);
	Npc_ExchangeRoutine(self,"WaitAtFocus");
	AI_StopProcessInfos(self);
};


instance PC_PSIONIC_TIP(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_tip_condition;
	information = pc_psionic_tip_info;
	important = 0;
	permanent = 0;
	description = "Как же мне достать этот юнитор?";
};


func int pc_psionic_tip_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_urkunde) && !Npc_HasItems(hero,focus_3) && !Npc_KnowsInfo(hero,pc_psionic_finish))
	{
		return TRUE;
	};
};

func void pc_psionic_tip_info()
{
	AI_Output(other,self,"PC_Psionic_TIP_Info_15_01");	//Как же мне достать этот юнитор?
	AI_Output(self,other,"PC_Psionic_TIP_Info_05_02");	//Как сказал Учитель Юберион: 'Невежда старается передвигать предметы руками, а мастер использует силу своего духа'.
};


instance PC_PSIONIC_LEAVE(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_leave_condition;
	information = pc_psionic_leave_info;
	important = 1;
	permanent = 0;
};


func int pc_psionic_leave_condition()
{
	if(!Npc_HasItems(hero,focus_3) && !Npc_HasItems(self,itwr_urkunde_01) && (Npc_GetDistToWP(hero,"PATH_TO_PLATEAU04_BRIDGE2") < 900) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void pc_psionic_leave_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"PC_Psionic_LEAVE_Info_05_01");	//Я останусь здесь и поищу документ.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"BOOK");
	AI_StopProcessInfos(self);
};


instance PC_PSIONIC_BALKON(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_balkon_condition;
	information = pc_psionic_balkon_info;
	important = 1;
	permanent = 0;
};


func int pc_psionic_balkon_condition()
{
	if(!Npc_HasItems(self,itwr_urkunde_01) && (Npc_GetDistToWP(hero,"LOCATION_19_03_PEMTAGRAM2") < 1000) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void pc_psionic_balkon_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"PC_Psionic_BALKON_Info_05_01");	//Пойду, посмотрю, что там есть.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"BALKON");
};


instance PC_PSIONIC_FINISH(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_finish_condition;
	information = pc_psionic_finish_info;
	important = 1;
	permanent = 0;
};


func int pc_psionic_finish_condition()
{
	if(Npc_HasItems(hero,focus_3) && Npc_KnowsInfo(hero,pc_psionic_urkunde))
	{
		return TRUE;
	};
};

func void pc_psionic_finish_info()
{
	AI_Output(self,other,"PC_Psionic_FINISH_Info_05_01");	//Мы нашли то, что искали. Я останусь здесь ненадолго, хочу изучить старинные книги.
	AI_Output(other,self,"PC_Psionic_FINISH_Info_15_02");	//Мы еще встретимся.
	b_logentry(CH3_FORTRESS,"Я достал юнитор. Лестер захотел еще ненадолго остаться в форте, чтобы посмотреть библиотеку. Интересно, встретимся ли мы еще когда-нибудь?");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"BOOK");
	AI_StopProcessInfos(self);
};


instance PC_PSIONIC_CHESTCLOSED(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_chestclosed_condition;
	information = pc_psionic_chestclosed_info;
	important = 0;
	permanent = 0;
	description = "Ты нашел что-нибудь?";
};


func int pc_psionic_chestclosed_condition()
{
	if(!Npc_HasItems(hero,focus_3) && !Npc_HasItems(self,itwr_urkunde_01) && (Npc_GetDistToWP(hero,"LOCATION_19_03_SECOND_ETAGE_BALCON") < 500))
	{
		return TRUE;
	};
};

func void pc_psionic_chestclosed_info()
{
	AI_Output(other,self,"PC_Psionic_CHESTCLOSED_Info_15_01");	//Ты нашел что-нибудь?
	AI_Output(self,other,"PC_Psionic_CHESTCLOSED_Info_05_02");	//Сундук закрыт. Быть может, его хозяева оставили ключ где-то поблизости.
	AI_Output(self,other,"PC_Psionic_CHESTCLOSED_Info_05_03");	//Ты документ нигде не видишь?
	AI_Output(other,self,"PC_Psionic_CHESTCLOSED_Info_15_04");	//Нет, пока не вижу...
	AI_Output(self,other,"PC_Psionic_CHESTCLOSED_Info_05_05");	//А в библиотеке ты не смотрел?
	AI_StopProcessInfos(self);
};


instance PC_PSIONIC_COMEAGAIN(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_comeagain_condition;
	information = pc_psionic_comeagain_info;
	important = 0;
	permanent = 0;
	description = "Мы можем осмотреть этот форт вместе.";
};


func int pc_psionic_comeagain_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_leave) && !Npc_HasItems(hero,focus_3))
	{
		return TRUE;
	};
};

func void pc_psionic_comeagain_info()
{
	AI_Output(other,self,"PC_Psionic_COMEAGAIN_Info_15_01");	//Мы можем осмотреть этот форт вместе.
	AI_Output(self,other,"PC_Psionic_COMEAGAIN_Info_05_02");	//Хорошо, ты иди вперед.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"FORTRESSFOLLOW");
	AI_StopProcessInfos(self);
};


instance INFO_LESTER_DIEGOMILTEN(C_INFO)
{
	npc = pc_psionic;
	condition = info_lester_diegomilten_condition;
	information = info_lester_diegomilten_info;
	important = 0;
	permanent = 0;
	description = "Как жизнь?";
};


func int info_lester_diegomilten_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_ocfavor))
	{
		return TRUE;
	};
};

func void info_lester_diegomilten_info()
{
	AI_Output(hero,self,"Info_SFB_1_DieLage_15_00");	//Как жизнь?
	AI_Output(self,hero,"PC_Psionic_FOLLOWME_Info_05_01");	//Эй, что ты здесь делаешь?
	AI_Output(hero,self,"Info_Saturas_COLLAPSE_15_01");	//Старая шахта обрушилась, после того как ее залила вода!
	AI_Output(self,hero,"DIA_Fingers_BecomeShadow_05_01");	//И что?
	AI_Output(hero,self,"Info_Xardas_KDW_15_01");	//Все маги Круга Огня мертвы!
	AI_Output(hero,self,"Info_Xardas_KDW_15_02");	//Убиты по приказу Гомеза.
	AI_Output(self,hero,"SVM_5_GetThingsRight");	//Не хотел бы я попасть в подобную переделку!
	AI_Output(hero,self,"Info_Gorn_DIEGOMILTEN_15_01");	//Недалеко от Старого лагеря я встретил Диего и Мильтена.
	AI_Output(hero,self,"Info_lester_DIEGOMILTEN_15_01");	//Они хотят встретиться с тобой. На вашем обычном месте.
	AI_Output(self,hero,"SVM_5_YeahWellDone");	//Как удачно!
	AI_Output(other,self,"Info_Gorn_RUINWALLWHAT_15_01");	//Что нам делать теперь?
	AI_Output(self,hero,"Info_lester_DIEGOMILTEN_05_02");	//Я еще немного побуду здесь, посмотрю старые книги.
	AI_Output(hero,self,"KDW_600_Saturas_OATH_Info_15_06");	//Но... я не понимаю...
	AI_Output(self,hero,"PC_Psionic_TIP_Info_05_02");	//Как сказал Учитель Юберион: 'Невежда старается передвигать предметы руками, а мастер использует силу своего духа'.
	AI_Output(hero,self,"Info_Grd_6_DasLager_WasIstAerger_15_04");	//Хорошо, хорошо. Я все понял.
	AI_Output(self,hero,"DIA_Fingers_Lehrer_Pickpocket2_05_03");	//Будь осторожен.
	AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_03");	//Спасибо. А теперь мне нужно уходить.
	AI_Output(self,hero,"Info_Lester_EXIT_05_02");	//Да хранит тебя Спящий!
	b_givexp(XP_MESSAGEFORGORN);
	if(KAPITEL == 6)
	{
		Npc_ExchangeRoutine(self,"Reunion");
	};
	if(WARNED_GORN_OR_LESTER == FALSE)
	{
		WARNED_GORN_OR_LESTER = TRUE;
		b_logentry(CH4_4FRIENDS,"Лестер скоро направится на встречу с друзьями. Надеюсь, с ними все будет в порядке.");
	}
	else
	{
		b_logentry(CH4_4FRIENDS,"Я сказал Лестеру и Горну, что их друзья хотят с ними встретиться. Место встречи они знают сами.");
		Log_SetTopicStatus(CH4_4FRIENDS,LOG_SUCCESS);
	};
	AI_StopProcessInfos(self);
};

