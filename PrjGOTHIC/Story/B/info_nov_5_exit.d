
instance INFO_NOV_5_EXIT(C_INFO)
{
	nr = 999;
	condition = info_nov_5_exit_condition;
	information = info_nov_5_exit_info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};


func int info_nov_5_exit_condition()
{
	return 1;
};

func void info_nov_5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_NOV_5_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_nov_5_einervoneuchwerden_condition;
	information = info_nov_5_einervoneuchwerden_info;
	permanent = 1;
	description = "Как мне присоединиться к этому лагерю?";
};


func int info_nov_5_einervoneuchwerden_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void info_nov_5_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Nov_5_EinerVonEuchWerden_15_00");	//Как мне присоединиться к этому лагерю?
	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_01");	//Это очень просто. Поговори с кем-нибудь из младших Гуру. Они тебе помогут.
	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_02");	//Тебе у нас понравится, поверь мне.
};


instance INFO_NOV_5_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_nov_5_wichtigepersonen_condition;
	information = info_nov_5_wichtigepersonen_info;
	permanent = 1;
	description = "Кто здесь всем командует?";
};


func int info_nov_5_wichtigepersonen_condition()
{
	return 1;
};

func void info_nov_5_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Nov_5_WichtigePersonen_15_00");	//Кто здесь всем командует?
	AI_Output(self,other,"Info_Nov_5_WichtigePersonen_05_01");	//Власть здесь принадлежит Гуру. Но если ты не будешь нарушать наших законов, они тебя не тронут.
};


instance INFO_NOV_5_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_nov_5_daslager_condition;
	information = info_nov_5_daslager_info;
	permanent = 1;
	description = "Ты можешь рассказать мне об этом лагере?";
};


func int info_nov_5_daslager_condition()
{
	return 1;
};

func void info_nov_5_daslager_info()
{
	var C_NPC corkalom;
	AI_Output(other,self,"Info_Nov_5_DasLager_15_00");	//Ты можешь рассказать мне об этом лагере?
	AI_Output(self,other,"Info_Nov_5_DasLager_05_01");	//Таких мест, как это, ты во всей колонии не найдешь.
	AI_Output(self,other,"Info_Nov_5_DasLager_05_02");	//В нашем лагере ты сможешь ежедневно получать еду и болотник, даже если ты равнодушен к учению Спящего. Просто поговори с Фортуно.
	AI_Output(other,self,"Info_Nov_5_DasLager_15_03");	//Где я могу найти его?
	AI_Output(self,other,"Info_Nov_5_DasLager_05_04");	//В доме под лабораторией Кор Галома, рядом с нашим храмом.
	corkalom = Hlp_GetNpc(gur_1201_corkalom);
	corkalom.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_NOV_5_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_nov_5_dielage_condition;
	information = info_nov_5_dielage_info;
	permanent = 1;
	description = "Как дела?";
};


func int info_nov_5_dielage_condition()
{
	return 1;
};

func void info_nov_5_dielage_info()
{
	AI_Output(other,self,"Info_Nov_5_DieLage_15_00");	//Как дела?
	AI_Output(self,other,"Info_Nov_5_DieLage_05_01");	//Хорошо. Мне не на что жаловаться. А ты здесь новенький?
	AI_Output(other,self,"Info_Nov_5_DieLage_15_02");	//Да, совсем недавно прибыл.
};

func void b_assignambientinfos_nov_5(var C_NPC slf)
{
	b_assignfindnpc_st(slf);
	info_nov_5_exit.npc = Hlp_GetInstanceID(slf);
	info_nov_5_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_nov_5_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_nov_5_daslager.npc = Hlp_GetInstanceID(slf);
	info_nov_5_dielage.npc = Hlp_GetInstanceID(slf);
};

