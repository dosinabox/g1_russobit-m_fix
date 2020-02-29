
instance INFO_GRD_13_EXIT(C_INFO)
{
	nr = 999;
	condition = info_grd_13_exit_condition;
	information = info_grd_13_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_grd_13_exit_condition()
{
	return 1;
};

func void info_grd_13_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_GRD_13_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 1;
	condition = info_grd_13_einervoneuchwerden_condition;
	information = info_grd_13_einervoneuchwerden_info;
	permanent = 1;
	description = "Я хочу стать одним из стражников.";
};


func int info_grd_13_einervoneuchwerden_condition()
{
	if((Npc_GetTrueGuild(other) != GIL_GRD) && (Npc_GetTrueGuild(other) != GIL_KDF) && !c_npcbelongstonewcamp(other) && !c_npcbelongstopsicamp(other))
	{
		return TRUE;
	};
};

func void info_grd_13_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_grd_13_EinerVonEuchWerden_15_00");	//Я хочу стать одним из стражников.
	AI_Output(self,other,"Info_grd_13_EinerVonEuchWerden_13_01");	//Для этого тебе нужно как-то показать себя.
};


instance INFO_GRD_13_WICHTIGEPERSONEN(C_INFO)
{
	nr = 1;
	condition = info_grd_13_wichtigepersonen_condition;
	information = info_grd_13_wichtigepersonen_info;
	permanent = 1;
	description = "А кто здесь главный?";
};


func int info_grd_13_wichtigepersonen_condition()
{
	return 1;
};

func void info_grd_13_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_grd_13_WichtigePersonen_15_00");	//А кто здесь главный?
	AI_Output(self,other,"Info_grd_13_WichtigePersonen_13_01");	//Здесь я главный. И послушай меня: следи за тем, что ты говоришь!
};


instance INFO_GRD_13_DASLAGER(C_INFO)
{
	nr = 1;
	condition = info_grd_13_daslager_condition;
	information = info_grd_13_daslager_info;
	permanent = 1;
	description = "Как мне войти в замок?";
};


func int info_grd_13_daslager_condition()
{
	if(KAPITEL == 1)
	{
		return 1;
	};
};

func void info_grd_13_daslager_info()
{
	AI_Output(other,self,"Info_grd_13_DasLager_15_00");	//Как мне войти в замок?
	AI_Output(self,other,"Info_grd_13_DasLager_13_01");	//Никак. В замок могут заходить только люди Гомеза.
	Info_ClearChoices(info_grd_13_daslager);
	Info_AddChoice(info_grd_13_daslager,"Ясно.",info_grd_13_daslager_verstehe);
	Info_AddChoice(info_grd_13_daslager,"А если подкупить стражников?",info_grd_13_daslager_wachenbestechen);
	Info_AddChoice(info_grd_13_daslager,"Мне нужно поговорить с Гомезом. Как мне с ним встретиться?",info_grd_13_daslager_gomezsprechen);
};

func void info_grd_13_daslager_verstehe()
{
	AI_Output(other,self,"Info_grd_13_DasLager_Verstehe_15_00");	//Ясно.
	Info_ClearChoices(info_grd_13_daslager);
};

func void info_grd_13_daslager_wachenbestechen()
{
	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_00");	//А если подкупить стражников?
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_01");	//Наглости тебе не занимать. Думаю, если ты предложишь им достаточно руды, они могут отвернуться ненадолго.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_02");	//Но если Гомез узнает о том, что они пропустили в замок чужака, он посадит их в подземелье.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_03");	//Поэтому подкуп обойдется тебе очень недешево.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_04");	//Но если уж ты попадешь в замок, тебе не удастся пройти дальше двора. Там кругом охрана.
	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_05");	//Да, я просто поинтересовался, вот и все.
};

func void info_grd_13_daslager_gomezsprechen()
{
	var C_NPC thorus;
	AI_Output(other,self,"Info_grd_13_DasLager_GomezSprechen_15_00");	//Мне нужно поговорить с Гомезом. Как мне с ним встретиться?
	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_01");	//Гомезу не нужны люди, которых никто здесь не знает.
	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_02");	//Но если для тебя это так важно, поговори с Торусом.
	thorus = Hlp_GetNpc(grd_200_thorus);
	thorus.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_GRD_13_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_grd_13_dielage_condition;
	information = info_grd_13_dielage_info;
	permanent = 1;
	description = "Как дела?";
};


func int info_grd_13_dielage_condition()
{
	if(!c_npcbelongstonewcamp(other) && !c_npcbelongstopsicamp(other))
	{
		return 1;
	};
};

func void info_grd_13_dielage_info()
{
	AI_Output(other,self,"Info_grd_13_DieLage_15_00");	//Как дела?
	AI_Output(self,other,"Info_grd_13_DieLage_13_01");	//Все спокойно. Была, правда, пара разборок с людьми Нового лагеря, да вот еще эти болотные сектанты заглядывают.
	AI_Output(self,other,"Info_grd_13_DieLage_13_02");	//Ты здесь еще новенький, поэтому для тебя это не так важно, но когда ты присоединишься к одному из лагерей, ты узнаешь, что приобретешь не только друзей.
};

func void b_assignambientinfos_grd_13(var C_NPC slf)
{
	b_assignfindnpc_oc(slf);
	info_grd_13_exit.npc = Hlp_GetInstanceID(slf);
	info_grd_13_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_grd_13_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_grd_13_daslager.npc = Hlp_GetInstanceID(slf);
	info_grd_13_dielage.npc = Hlp_GetInstanceID(slf);
};

