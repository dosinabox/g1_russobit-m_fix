
instance INFO_VLK_1_EXIT(C_INFO)
{
	nr = 999;
	condition = info_vlk_1_exit_condition;
	information = info_vlk_1_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_vlk_1_exit_condition()
{
	return 1;
};

func void info_vlk_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_VLK_1_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_vlk_1_einervoneuchwerden_condition;
	information = info_vlk_1_einervoneuchwerden_info;
	permanent = 1;
	description = "Я хочу присоединиться к лагерю. Как мне это сделать?";
};


func int info_vlk_1_einervoneuchwerden_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void info_vlk_1_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Vlk_1_EinerVonEuchWerden_15_00");	//Я хочу присоединиться к лагерю. Как мне это сделать?
	AI_Output(self,other,"Info_Vlk_1_EinerVonEuchWerden_01_01");	//Очень просто. Найди себе кирку и иди в шахту. Около половины руды тебе придется отдавать солдатам, а на оставшуюся часть можно лишь кое-как сводить концы с концами.
	AI_Output(self,other,"Info_Vlk_1_EinerVonEuchWerden_01_02");	//Цены, которые назначает Гомез за товары из внешнего мира, просто драконовские. Но это все же лучше, чем целыми днями жевать рис, как в Новом лагере.
};


instance INFO_VLK_1_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_vlk_1_wichtigepersonen_condition;
	information = info_vlk_1_wichtigepersonen_info;
	permanent = 1;
	description = "Кто здесь всем управляет?";
};


func int info_vlk_1_wichtigepersonen_condition()
{
	return 1;
};

func void info_vlk_1_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Vlk_1_WichtigePersonen_15_00");	//Кто здесь всем управляет?
	AI_Output(self,other,"Info_Vlk_1_WichtigePersonen_01_01");	//Бароны. Они организуют поставки руды для короля. Чем ближе ты к ним, тем больше получаешь.
};


instance INFO_VLK_1_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_vlk_1_daslager_condition;
	information = info_vlk_1_daslager_info;
	permanent = 1;
	description = "Здесь есть что-нибудь интересное, кроме этих лачуг?";
};


func int info_vlk_1_daslager_condition()
{
	return 1;
};

func void info_vlk_1_daslager_info()
{
	AI_Output(other,self,"Info_Vlk_1_DasLager_15_00");	//Здесь есть что-нибудь интересное, кроме этих лачуг?
	AI_Output(self,other,"Info_Vlk_1_DasLager_01_01");	//Ну, по вечерам можно полюбоваться тем, как стражники избивают друг друга на арене.
	AI_Output(other,self,"Info_Vlk_1_DasLager_01_02");	//Понятно.
};


instance INFO_VLK_1_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_vlk_1_dielage_condition;
	information = info_vlk_1_dielage_info;
	permanent = 1;
	description = "Как у тебя дела?";
};


func int info_vlk_1_dielage_condition()
{
	return 1;
};

func void info_vlk_1_dielage_info()
{
	AI_Output(other,self,"Info_Vlk_1_DieLage_15_00");	//Как у тебя дела?
	AI_Output(self,other,"Info_Vlk_1_DieLage_01_01");	//Последние две недели я работал в шахте. Теперь я хочу отдохнуть, так что не мешай.
};

func void b_assignambientinfos_vlk_1(var C_NPC slf)
{
	b_assignfindnpc_oc(slf);
	info_vlk_1_exit.npc = Hlp_GetInstanceID(slf);
	info_vlk_1_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_vlk_1_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_vlk_1_daslager.npc = Hlp_GetInstanceID(slf);
	info_vlk_1_dielage.npc = Hlp_GetInstanceID(slf);
};

