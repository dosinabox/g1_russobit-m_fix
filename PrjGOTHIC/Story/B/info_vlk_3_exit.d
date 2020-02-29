
instance INFO_VLK_3_EXIT(C_INFO)
{
	nr = 999;
	condition = info_vlk_3_exit_condition;
	information = info_vlk_3_exit_info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};


func int info_vlk_3_exit_condition()
{
	return 1;
};

func void info_vlk_3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_VLK_3_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_vlk_3_einervoneuchwerden_condition;
	information = info_vlk_3_einervoneuchwerden_info;
	permanent = 1;
	description = "Что надо, чтобы присоединиться к этому лагерю?";
};


func int info_vlk_3_einervoneuchwerden_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void info_vlk_3_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Vlk_3_EinerVonEuchWerden_15_00");	//Что надо, чтобы присоединиться к этому лагерю?
	AI_Output(self,other,"Info_Vlk_3_EinerVonEuchWerden_03_01");	//Я простой рудокоп и не так уж много могу рассказать тебе. Поговори лучше с Призраками или стражниками.
};


instance INFO_VLK_3_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_vlk_3_wichtigepersonen_condition;
	information = info_vlk_3_wichtigepersonen_info;
	permanent = 1;
	description = "Кто здесь главный?";
};


func int info_vlk_3_wichtigepersonen_condition()
{
	if(!c_npcbelongstooldcamp(other))
	{
		return 1;
	};
};

func void info_vlk_3_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Vlk_3_WichtigePersonen_15_00");	//Кто здесь главный?
	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_01");	//Гомез. Он живет в замке. Но мы видим только его стражников, которые выполняют его приказы.
	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_02");	//Лучше всего, если они тебя вообще не будут замечать. Если ты встанешь у них на пути, у тебя будут проблемы.
};


instance INFO_VLK_3_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_vlk_3_daslager_condition;
	information = info_vlk_3_daslager_info;
	permanent = 1;
	description = "Что интересного есть в этом лагере?";
};


func int info_vlk_3_daslager_condition()
{
	return 1;
};

func void info_vlk_3_daslager_info()
{
	AI_Output(other,self,"Info_Vlk_3_DasLager_15_00");	//Что интересного есть в этом лагере?
	AI_Output(self,other,"Info_Vlk_3_DasLager_03_01");	//Если тебя привлекают азартные игры, приходи вечером к арене. А если хочешь купить что-нибудь, то сходи на рынок.
	AI_Output(self,other,"Info_Vlk_3_DasLager_03_02");	//У местных торговцев есть почти все. Разве только карт нет. Но их ты можешь найти у Грехема. Он живет в доме напротив ворот замка.
};


instance INFO_VLK_3_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_vlk_3_dielage_condition;
	information = info_vlk_3_dielage_info;
	permanent = 1;
	description = "Как здесь живется?";
};


func int info_vlk_3_dielage_condition()
{
	return 1;
};

func void info_vlk_3_dielage_info()
{
	AI_Output(other,self,"Info_Vlk_3_DieLage_15_00");	//Как здесь живется?
	AI_Output(self,other,"Info_Vlk_3_DieLage_03_01");	//Очень скоро ты ознакомишься со здешними порядками. Будь всегда начеку. Особенно по ночам.
	AI_Output(self,other,"Info_Vlk_3_DieLage_03_02");	//Солдаты заставляют нас работать в две смены. Мне уже так долго не удается выспаться как следует.
};

func void b_assignambientinfos_vlk_3(var C_NPC slf)
{
	b_assignfindnpc_oc(slf);
	info_vlk_3_exit.npc = Hlp_GetInstanceID(slf);
	info_vlk_3_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_vlk_3_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_vlk_3_daslager.npc = Hlp_GetInstanceID(slf);
	info_vlk_3_dielage.npc = Hlp_GetInstanceID(slf);
};

