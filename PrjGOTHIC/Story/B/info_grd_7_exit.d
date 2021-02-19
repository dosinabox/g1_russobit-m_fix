
instance INFO_GRD_7_EXIT(C_INFO)
{
	nr = 999;
	condition = info_grd_7_exit_condition;
	information = info_grd_7_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_grd_7_exit_condition()
{
	return 1;
};

func void info_grd_7_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_GRD_7_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 1;
	condition = info_grd_7_einervoneuchwerden_condition;
	information = info_grd_7_einervoneuchwerden_info;
	permanent = 1;
	description = "Я хочу быть одним из стражников Гомеза. Что мне сделать для этого?";
};


func int info_grd_7_einervoneuchwerden_condition()
{
	if((Npc_GetTrueGuild(other) != GIL_GRD) && (Npc_GetTrueGuild(other) != GIL_KDF) && !c_npcbelongstonewcamp(other) && !c_npcbelongstopsicamp(other))
	{
		return TRUE;
	};
};

func void info_grd_7_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_grd_7_EinerVonEuchWerden_15_00");	//Я хочу быть одним из стражников Гомеза. Что мне сделать для этого?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_01");	//Что ты можешь сделать? Ты шутишь? Думаешь, можно просто прийти сюда и сразу стать одним из нас?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_02");	//Гомез назначает своими стражниками только самых лучших.
	if(Npc_GetTrueGuild(other) != GIL_STT)
	{
		AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_03");	//Тебе придется начинать так же, как и все остальные. Сначала нужно стать Призраком и доказать, что на тебя можно положиться.
	};
};


instance INFO_GRD_7_WICHTIGEPERSONEN(C_INFO)
{
	nr = 1;
	condition = info_grd_7_wichtigepersonen_condition;
	information = info_grd_7_wichtigepersonen_info;
	permanent = 1;
	description = "Кто здесь командует?";
};


func int info_grd_7_wichtigepersonen_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void info_grd_7_wichtigepersonen_info()
{
	var C_NPC diego;
	var C_NPC thorus;
	AI_Output(other,self,"Info_grd_7_WichtigePersonen_15_00");	//Кто здесь командует?
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_01");	//Торус следит за порядком в лагере. Диего - его правая рука.
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_02");	//Если ты хочешь стать одним из нас, поговори с ними.
	diego = Hlp_GetNpc(pc_thief);
	diego.aivar[AIV_FINDABLE] = TRUE;
	thorus = Hlp_GetNpc(grd_200_thorus);
	thorus.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_GRD_7_DASLAGER(C_INFO)
{
	nr = 1;
	condition = info_grd_7_daslager_condition;
	information = info_grd_7_daslager_info;
	permanent = 1;
	description = "Здесь все работают на Гомеза?";
};


func int info_grd_7_daslager_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void info_grd_7_daslager_info()
{
	AI_Output(other,self,"Info_grd_7_DasLager_15_00");	//Здесь все работают на Гомеза?
	AI_Output(self,other,"Info_grd_7_DasLager_07_01");	//Нет. Большинство людей лагеря простые рудокопы.
	AI_Output(self,other,"Info_grd_7_DasLager_07_02");	//Только стражники и Призраки являются людьми Гомеза.
	Info_ClearChoices(info_grd_7_daslager);
	Info_AddChoice(info_grd_7_daslager,DIALOG_BACK,info_grd_7_daslager_zurueck);
	Info_AddChoice(info_grd_7_daslager,"Чем занимаются стражники?",info_grd_7_daslager_gardisten);
	Info_AddChoice(info_grd_7_daslager,"Что делают Призраки?",info_grd_7_daslager_schatten);
	Info_AddChoice(info_grd_7_daslager,"Чем занимаются рудокопы?",info_grd_7_daslager_buddler);
};

func void info_grd_7_daslager_zurueck()
{
	Info_ClearChoices(info_grd_7_daslager);
};

func void info_grd_7_daslager_gardisten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_WasIstAerger_15_00");	//Чем занимаются стражники?
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_01");	//Мы охраняем лагерь и защищаем рудокопов.
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_02");	//Мы живем на то, что нам платит Гомез и рудокопы за защиту. Этой руды вполне хватает, чтобы иногда приятно провести время.
};

func void info_grd_7_daslager_schatten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_Schatten_15_00");	//Что делают Призраки?
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_01");	//Они следят за тем, чтобы все приказы Гомеза выполнялись так, как нужно.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_02");	//Большинство из них просто хотят занять место получше, но если ты хочешь чего-то добиться в этом лагере, то единственный верный путь - стать Призраком.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_03");	//Если ты будешь хорошо выполнять свою работу, ты сможешь стать одним из стражников.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_04");	//Ну, а когда ты станешь одним из людей Гомеза, никто во всей колонии не посмеет лезть к тебе, поверь мне.
};

func void info_grd_7_daslager_buddler()
{
	var C_NPC thorus;
	AI_Output(other,self,"Info_grd_7_DasLager_Buddler_15_00");	//Чем занимаются рудокопы?
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_01");	//Хороший вопрос! Они работают в шахте, а мы их оттуда не выпускаем.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_02");	//Правда, иногда они выходят, чтобы потратить заработанную руду, если, конечно, проработают там достаточно долго.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_03");	//Когда руда заканчивается, они возвращаются в шахту. Так живет большинство из них.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_04");	//Но, по-моему, ты не похож на человека, которому подойдет подобный образ жизни. Поговори с Торусом, если ты этого еще не сделал.
	thorus = Hlp_GetNpc(grd_200_thorus);
	thorus.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_GRD_7_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_grd_7_dielage_condition;
	information = info_grd_7_dielage_info;
	permanent = 1;
	description = "Как дела?";
};


func int info_grd_7_dielage_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void info_grd_7_dielage_info()
{
	AI_Output(other,self,"Info_grd_7_DieLage_15_00");	//Как дела?
	AI_Output(self,other,"Info_grd_7_DieLage_07_01");	//Пока ты не присоединишься к одному из лагерей, тебя здесь никто не будет воспринимать всерьез!
};

func void b_assignambientinfos_grd_7(var C_NPC slf)
{
	b_assignfindnpc_oc(slf);
	info_grd_7_exit.npc = Hlp_GetInstanceID(slf);
	info_grd_7_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_grd_7_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_grd_7_daslager.npc = Hlp_GetInstanceID(slf);
	info_grd_7_dielage.npc = Hlp_GetInstanceID(slf);
};

