
instance INFO_NOV_3_EXIT(C_INFO)
{
	nr = 999;
	condition = info_nov_3_exit_condition;
	information = info_nov_3_exit_info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};


func int info_nov_3_exit_condition()
{
	return 1;
};

func void info_nov_3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_NOV_3_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_nov_3_einervoneuchwerden_condition;
	information = info_nov_3_einervoneuchwerden_info;
	permanent = 1;
	description = "Как я могу присоединиться к этому лагерю?";
};


func int info_nov_3_einervoneuchwerden_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void info_nov_3_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Nov_3_EinerVonEuchWerden_15_00");	//Как я могу присоединиться к этому лагерю?
	AI_Output(self,other,"Info_Nov_3_EinerVonEuchWerden_03_01");	//Очень просто. Пройдись по лагерю, брат.
	AI_Output(self,other,"Info_Nov_3_EinerVonEuchWerden_03_02");	//Поговори с Гуру, они смогут многое поведать тебе.
};


instance INFO_NOV_3_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_nov_3_wichtigepersonen_condition;
	information = info_nov_3_wichtigepersonen_info;
	permanent = 1;
	description = "Кто здесь главный?";
};


func int info_nov_3_wichtigepersonen_condition()
{
	return 1;
};

func void info_nov_3_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Nov_3_WichtigePersonen_15_00");	//Кто здесь главный?
	AI_Output(self,other,"Info_Nov_3_WichtigePersonen_03_01");	//Юберион! Да пребудет с ним Спящий! Он указал нам это священное место.
	AI_Output(self,other,"Info_Nov_3_WichtigePersonen_03_02");	//Его видения помогли нам создать наше Братство.
};


instance INFO_NOV_3_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_nov_3_daslager_condition;
	information = info_nov_3_daslager_info;
	permanent = 1;
	description = "Кто еще может рассказать мне об этом месте?";
};


func int info_nov_3_daslager_condition()
{
	return 1;
};

func void info_nov_3_daslager_info()
{
	var C_NPC corkalom;
	AI_Output(other,self,"Info_Nov_3_DasLager_15_00");	//Кто еще может рассказать мне об этом месте?
	AI_Output(self,other,"Info_Nov_3_DasLager_03_01");	//Найди Фортуно, одного из братьев. Он раздает болотник всем приверженцам нашей веры.
	AI_Output(self,other,"Info_Nov_3_DasLager_03_02");	//Его дом ты найдешь под лабораторией Кор Галома.
	corkalom = Hlp_GetNpc(gur_1201_corkalom);
	corkalom.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_NOV_3_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_nov_3_dielage_condition;
	information = info_nov_3_dielage_info;
	permanent = 1;
	description = "Как жизнь?";
};


func int info_nov_3_dielage_condition()
{
	return 1;
};

func void info_nov_3_dielage_info()
{
	AI_Output(other,self,"Info_Nov_3_DieLage_15_00");	//Как жизнь?
	AI_Output(self,other,"Info_Nov_3_DieLage_03_01");	//Прекрасно, просто прекрасно, брат!
};

func void b_assignambientinfos_nov_3(var C_NPC slf)
{
	b_assignfindnpc_st(slf);
	info_nov_3_exit.npc = Hlp_GetInstanceID(slf);
	info_nov_3_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_nov_3_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_nov_3_daslager.npc = Hlp_GetInstanceID(slf);
	info_nov_3_dielage.npc = Hlp_GetInstanceID(slf);
};

