
instance INFO_SFB_2_PRE(C_INFO)
{
	nr = 1;
	condition = info_sfb_2_pre_condition;
	information = info_sfb_2_pre_info;
	permanent = 0;
	important = 1;
};


func int info_sfb_2_pre_condition()
{
	return 1;
};

func void info_sfb_2_pre_info()
{
	AI_Output(self,other,"Info_SFB_2_EinerVonEuchWerden_02_00");	//Что тебе нужно? Я не хочу неприятностей.
};


instance INFO_SFB_2_EXIT(C_INFO)
{
	nr = 999;
	condition = info_sfb_2_exit_condition;
	information = info_sfb_2_exit_info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};


func int info_sfb_2_exit_condition()
{
	return 1;
};

func void info_sfb_2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_SFB_2_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_sfb_2_einervoneuchwerden_condition;
	information = info_sfb_2_einervoneuchwerden_info;
	permanent = 1;
	description = "Что мне сделать, чтобы присоединиться к вам?";
};


func int info_sfb_2_einervoneuchwerden_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void info_sfb_2_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_SFB_2_EinerVonEuchWerden_15_00");	//Что мне сделать, чтобы присоединиться к вам?
	AI_Output(self,other,"Info_SFB_2_EinerVonEuchWerden_02_01");	//Я не смогу тебе помочь. Я человек невлиятельный. Поговори с Суини.
};


instance INFO_SFB_2_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_sfb_2_wichtigepersonen_condition;
	information = info_sfb_2_wichtigepersonen_info;
	permanent = 1;
	description = "Кто здесь всем управляет?";
};


func int info_sfb_2_wichtigepersonen_condition()
{
	return 1;
};

func void info_sfb_2_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_SFB_2_WichtigePersonen_15_00");	//Кто здесь всем управляет?
	AI_Output(self,other,"Info_SFB_2_WichtigePersonen_02_01");	//Здесь, в Лощине, господствуют наемники, но в Новом лагере все несколько иначе.
	AI_Output(self,other,"Info_SFB_2_WichtigePersonen_02_02");	//Думай сам, кого не стоит наживать себе в качестве врагов.
};


instance INFO_SFB_2_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_sfb_2_daslager_condition;
	information = info_sfb_2_daslager_info;
	permanent = 1;
	description = "Я хочу больше узнать о лагере.";
};


func int info_sfb_2_daslager_condition()
{
	return 1;
};

func void info_sfb_2_daslager_info()
{
	AI_Output(other,self,"Info_SFB_2_DasLager_15_00");	//Я хочу больше узнать о лагере.
	AI_Output(self,other,"Info_SFB_2_DasLager_02_01");	//Не знаю, чем и помочь тебе. Ты лучше поговори с Суини или с наемниками.
};


instance INFO_SFB_2_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_sfb_2_dielage_condition;
	information = info_sfb_2_dielage_info;
	permanent = 1;
	description = "Как здесь живется?";
};


func int info_sfb_2_dielage_condition()
{
	return 1;
};

func void info_sfb_2_dielage_info()
{
	AI_Output(other,self,"Info_SFB_2_DieLage_15_00");	//Как здесь живется?
	AI_Output(self,other,"Info_SFB_2_DieLage_02_01");	//Я не жалуюсь. Мы все должны делать одно дело.
	AI_Output(self,other,"Info_SFB_2_DieLage_02_02");	//По крайней мере, лучше работать здесь, чем в Старом лагере.
	AI_Output(self,other,"Info_SFB_2_DieLage_02_03");	//Ты из Старого лагеря?
	AI_Output(self,other,"Info_SFB_2_DieLage_02_04");	//Если ты из Старого лагеря, запомни: я не хочу неприятностей!
	AI_StopProcessInfos(self);
};

func void b_assignambientinfos_sfb_2(var C_NPC slf)
{
	info_sfb_2_pre.npc = Hlp_GetInstanceID(slf);
	info_sfb_2_exit.npc = Hlp_GetInstanceID(slf);
	info_sfb_2_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_sfb_2_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_sfb_2_daslager.npc = Hlp_GetInstanceID(slf);
	info_sfb_2_dielage.npc = Hlp_GetInstanceID(slf);
};

