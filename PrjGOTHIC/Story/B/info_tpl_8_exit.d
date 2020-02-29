
instance INFO_TPL_8_EXIT(C_INFO)
{
	nr = 999;
	condition = info_tpl_8_exit_condition;
	information = info_tpl_8_exit_info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};


func int info_tpl_8_exit_condition()
{
	return 1;
};

func void info_tpl_8_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_TPL_8_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_tpl_8_einervoneuchwerden_condition;
	information = info_tpl_8_einervoneuchwerden_info;
	permanent = 1;
	description = "Вам нужны верные люди?";
};


func int info_tpl_8_einervoneuchwerden_condition()
{
	if((Npc_GetTrueGuild(other) != GIL_TPL) && !c_npcbelongstonewcamp(other) && !c_npcbelongstooldcamp(other))
	{
		return TRUE;
	};
};

func void info_tpl_8_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Tpl_8_EinerVonEuchWerden_15_00");	//Вам нужны верные люди?
	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_01");	//Да, такие люди нам всегда нужны. Но тебе еще нужно набраться опыта. Только усердный послушник может стать Стражем.
	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_02");	//Это большая честь для последователя Братства Спящего.
};


instance INFO_TPL_8_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_tpl_8_wichtigepersonen_condition;
	information = info_tpl_8_wichtigepersonen_info;
	permanent = 1;
	description = "Кто здесь всем управляет?";
};


func int info_tpl_8_wichtigepersonen_condition()
{
	return 1;
};

func void info_tpl_8_wichtigepersonen_info()
{
	var C_NPC yberion;
	var C_NPC corkalom;
	var C_NPC corangar;
	AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_00");	//Кто здесь всем управляет?
	AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_01");	//Гуру - главные среди нас. Мы делаем то, что они нам говорят. В этом состоит наше послушание.
	if(KAPITEL < 3)
	{
		AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_02");	//А кто здесь Гуру?
		AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_03");	//Верховный Гуру лагеря, Юберион, просвещенный. Ему помогают Кор Галом, Кор Ангари и некоторые другие.
		yberion = Hlp_GetNpc(gur_1200_yberion);
		corkalom = Hlp_GetNpc(gur_1201_corkalom);
		corangar = Hlp_GetNpc(gur_1202_corangar);
		yberion.aivar[AIV_FINDABLE] = TRUE;
		corkalom.aivar[AIV_FINDABLE] = TRUE;
		corangar.aivar[AIV_FINDABLE] = TRUE;
	};
};


instance INFO_TPL_8_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_tpl_8_daslager_condition;
	information = info_tpl_8_daslager_info;
	permanent = 1;
	description = "Расскажи мне об этом лагере.";
};


func int info_tpl_8_daslager_condition()
{
	if(!c_npcbelongstopsicamp(other))
	{
		return 1;
	};
};

func void info_tpl_8_daslager_info()
{
	AI_Output(other,self,"Info_Tpl_8_DasLager_15_00");	//Расскажи мне об этом лагере.
	AI_Output(self,other,"Info_Tpl_8_DasLager_08_01");	//Ты здесь новичок. Тебе можно ходить везде. Для неверных закрыт лишь храм Спящего.
	AI_Output(self,other,"Info_Tpl_8_DasLager_08_02");	//Поэтому лучше тебе не заходить на запретную территорию и не беспокоить наших учителей во время медитации.
};


instance INFO_TPL_8_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_tpl_8_dielage_condition;
	information = info_tpl_8_dielage_info;
	permanent = 1;
	description = "Как дела?";
};


func int info_tpl_8_dielage_condition()
{
	if(!c_npcbelongstopsicamp(other))
	{
		return 1;
	};
};

func void info_tpl_8_dielage_info()
{
	AI_Output(other,self,"Info_Tpl_8_DieLage_15_00");	//Как дела?
	AI_Output(self,other,"Info_Tpl_8_DieLage_08_01");	//Не забывай, ко всем служителям Спящего нужно обращаться с уважением. А я - один из избранных защитников пророков.
};

func void b_assignambientinfos_tpl_8(var C_NPC slf)
{
	b_assignfindnpc_st(slf);
	info_tpl_8_exit.npc = Hlp_GetInstanceID(slf);
	info_tpl_8_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_tpl_8_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_tpl_8_daslager.npc = Hlp_GetInstanceID(slf);
	info_tpl_8_dielage.npc = Hlp_GetInstanceID(slf);
};

