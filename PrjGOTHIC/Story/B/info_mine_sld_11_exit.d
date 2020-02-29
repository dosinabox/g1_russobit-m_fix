
instance INFO_MINE_SLD_11_EXIT(C_INFO)
{
	nr = 999;
	condition = info_mine_sld_11_exit_condition;
	information = info_mine_sld_11_exit_info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};


func int info_mine_sld_11_exit_condition()
{
	return 1;
};

func void info_mine_sld_11_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_MINE_SLD_11_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_mine_sld_11_einervoneuchwerden_condition;
	information = info_mine_sld_11_einervoneuchwerden_info;
	permanent = 1;
	description = "Как мне присоединиться к вам?";
};


func int info_mine_sld_11_einervoneuchwerden_condition()
{
	if((Npc_GetTrueGuild(other) != GIL_SLD) && (Npc_GetTrueGuild(other) != GIL_KDW) && !c_npcbelongstooldcamp(other) && !c_npcbelongstopsicamp(other))
	{
		return TRUE;
	};
};

func void info_mine_sld_11_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_EinerVonEuchWerden_15_00");	//Как мне присоединиться к вам?
	AI_Output(self,other,"Info_Mine_Sld_11_EinerVonEuchWerden_011_01");	//Если хочешь стать одним из нас, ты должен показать, на что ты способен.
	AI_Output(self,other,"Info_Mine_Sld_11_EinerVonEuchWerden_011_02");	//Покажи себя с лучшей стороны, и тогда мы, быть может, позволим тебе работать здесь.
};


instance INFO_MINE_SLD_11_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_mine_sld_11_wichtigepersonen_condition;
	information = info_mine_sld_11_wichtigepersonen_info;
	permanent = 1;
	description = "Кто здесь главный?";
};


func int info_mine_sld_11_wichtigepersonen_condition()
{
	return 1;
};

func void info_mine_sld_11_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_WichtigePersonen_15_00");	//Кто здесь главный?
	AI_Output(self,other,"Info_Mine_Sld_11_WichtigePersonen_011_01");	//Здесь всем заправляет Окил. У него есть связи со всеми важными людьми лагеря.
	AI_Output(self,other,"Info_Mine_Sld_11_WichtigePersonen_011_02");	//Так что если ты здесь сделаешь что-то не то, то об этом тут же узнают маги Воды.
};


instance INFO_MINE_SLD_11_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_mine_sld_11_daslager_condition;
	information = info_mine_sld_11_daslager_info;
	permanent = 1;
	description = "Что-нибудь еще?";
};


func int info_mine_sld_11_daslager_condition()
{
	return 1;
};

func void info_mine_sld_11_daslager_info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_DasLager_15_00");	//Что-нибудь еще?
	AI_Output(self,other,"Info_Mine_Sld_11_DasLager_011_01");	//Постарайся не делать глупостей, и с тобой все будет в порядке.
	AI_Output(self,other,"Info_Mine_Sld_11_DasLager_011_02");	//Ах, да, не стоит пытаться войти в шахту без разрешения. Ты же не хочешь неприятностей, верно?
};


instance INFO_MINE_SLD_11_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_mine_sld_11_dielage_condition;
	information = info_mine_sld_11_dielage_info;
	permanent = 1;
	description = "Как дела?";
};


func int info_mine_sld_11_dielage_condition()
{
	return 1;
};

func void info_mine_sld_11_dielage_info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_DieLage_15_00");	//Как дела?
	AI_Output(self,other,"Info_Mine_Sld_11_DieLage_011_01");	//Здесь тихо, слишком тихо на мой взгляд.
};

func void b_assignambientinfos_mine_sld_11(var C_NPC slf)
{
	info_mine_sld_11_exit.npc = Hlp_GetInstanceID(slf);
	info_mine_sld_11_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_mine_sld_11_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_mine_sld_11_daslager.npc = Hlp_GetInstanceID(slf);
	info_mine_sld_11_dielage.npc = Hlp_GetInstanceID(slf);
};

