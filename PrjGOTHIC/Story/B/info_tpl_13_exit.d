
instance INFO_TPL_13_EXIT(C_INFO)
{
	nr = 999;
	condition = info_tpl_13_exit_condition;
	information = info_tpl_13_exit_info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};


func int info_tpl_13_exit_condition()
{
	return 1;
};

func void info_tpl_13_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_TPL_13_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_tpl_13_einervoneuchwerden_condition;
	information = info_tpl_13_einervoneuchwerden_info;
	permanent = 1;
	description = "Я хочу быть Стражем, как ты.";
};


func int info_tpl_13_einervoneuchwerden_condition()
{
	if((Npc_GetTrueGuild(other) != GIL_TPL) && !c_npcbelongstonewcamp(other) && !c_npcbelongstooldcamp(other))
	{
		return TRUE;
	};
};

func void info_tpl_13_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Tpl_13_EinerVonEuchWerden_15_00");	//Я хочу быть Стражем, как ты.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_01");	//Знаешь ли ты, что мне пришлось пережить, чтобы Спящий избрал меня одним из своих стражей? Тебе этого пока не понять.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_02");	//Не думай, что тебя просто так, без доказательства твоей преданности, могут назначить на это почетное место. 
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_03");	//Сначала ты должен будешь познакомиться с учением Спящего.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_04");	//На это уйдет некоторое время. Это избавит тебя от глупостей, которые вертятся в твоей голове.
};


instance INFO_TPL_13_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_tpl_13_wichtigepersonen_condition;
	information = info_tpl_13_wichtigepersonen_info;
	permanent = 1;
	description = "Кто здесь всем управляет?";
};


func int info_tpl_13_wichtigepersonen_condition()
{
	return 1;
};

func void info_tpl_13_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Tpl_13_WichtigePersonen_15_00");	//Кто здесь всем управляет?
	AI_Output(self,other,"Info_Tpl_13_WichtigePersonen_13_01");	//Наши Гуру, избранные Спящим! Спящий указывает нам путь дальнейшей жизни, а Гуру передают нам его слова.
};


instance INFO_TPL_13_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_tpl_13_daslager_condition;
	information = info_tpl_13_daslager_info;
	permanent = 1;
	description = "А можно зайти и посмотреть храм Спящего?";
};


func int info_tpl_13_daslager_condition()
{
	if(KAPITEL <= 1)
	{
		return 1;
	};
};

func void info_tpl_13_daslager_info()
{
	AI_Output(other,self,"Info_Tpl_13_DasLager_15_00");	//А можно зайти и посмотреть храм Спящего..
	AI_Output(self,other,"Info_Tpl_13_DasLager_13_01");	//Это невозможно! Неверным дорога в Храм закрыта. Ты сможешь войти туда только в том случае, если изберешь служение Спящему!
};


instance INFO_TPL_13_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_tpl_13_dielage_condition;
	information = info_tpl_13_dielage_info;
	permanent = 1;
	description = "Как жизнь?";
};


func int info_tpl_13_dielage_condition()
{
	if(!c_npcbelongstopsicamp(other))
	{
		return 1;
	};
};

func void info_tpl_13_dielage_info()
{
	AI_Output(other,self,"Info_Tpl_13_DieLage_15_00");	//Как жизнь?
	AI_Output(self,other,"Info_Tpl_13_DieLage_13_01");	//Моя жизнь очень сильно изменилась, с тех пор как я посвятил себя служению Спящему.
	AI_Output(other,self,"Info_Tpl_13_DieLage_15_02");	//Звучит многозначительно...
	AI_Output(self,other,"Info_Tpl_13_DieLage_13_03");	//Ты один из неверных. Тебе этого не понять.
};

func void b_assignambientinfos_tpl_13(var C_NPC slf)
{
	b_assignfindnpc_st(slf);
	info_tpl_13_exit.npc = Hlp_GetInstanceID(slf);
	info_tpl_13_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_tpl_13_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_tpl_13_daslager.npc = Hlp_GetInstanceID(slf);
	info_tpl_13_dielage.npc = Hlp_GetInstanceID(slf);
};

