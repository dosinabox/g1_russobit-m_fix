
instance INFO_VLK_2_EXIT(C_INFO)
{
	nr = 999;
	condition = info_vlk_2_exit_condition;
	information = info_vlk_2_exit_info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};


func int info_vlk_2_exit_condition()
{
	return 1;
};

func void info_vlk_2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_VLK_2_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_vlk_2_einervoneuchwerden_condition;
	information = info_vlk_2_einervoneuchwerden_info;
	permanent = 1;
	description = "Я хочу стать одним из вас.";
};


func int info_vlk_2_einervoneuchwerden_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void info_vlk_2_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Vlk_2_EinerVonEuchWerden_15_00");	//Я хочу стать одним из вас.
	AI_Output(self,other,"Info_Vlk_2_EinerVonEuchWerden_02_01");	//Не понимаю, зачем тебе добровольно соваться в шахту. Таким как ты дорога одна - в замок.
};


instance INFO_VLK_2_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_vlk_2_wichtigepersonen_condition;
	information = info_vlk_2_wichtigepersonen_info;
	permanent = 1;
	description = "Кто здесь всем управляет?";
};


func int info_vlk_2_wichtigepersonen_condition()
{
	return 1;
};

func void info_vlk_2_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Vlk_2_WichtigePersonen_15_00");	//Кто здесь всем управляет?
	AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_01");	//Здесь, во Внешнем Кольце, деньги за защиту собирают Флетчер, Бладвин и Шакал. У каждого из них есть свой район.
	AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_02");	//Если поладишь с ними, считай, все в порядке.
};


instance INFO_VLK_2_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_vlk_2_daslager_condition;
	information = info_vlk_2_daslager_info;
	permanent = 1;
	description = "Расскажи мне что-нибудь еще о лагере.";
};


func int info_vlk_2_daslager_condition()
{
	return 1;
};

func void info_vlk_2_daslager_info()
{
	AI_Output(other,self,"Info_Vlk_2_DasLager_15_00");	//Расскажи мне что-нибудь еще о лагере.
	AI_Output(self,other,"Info_Vlk_2_DasLager_02_01");	//Тебе нужно поговорить с Призраками. Они знают обо всем, что тебе нужно. Но будь осторожен - большинству из них нельзя доверять.
};


instance INFO_VLK_2_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_vlk_2_dielage_condition;
	information = info_vlk_2_dielage_info;
	permanent = 1;
	description = "Как здесь живется?";
};


func int info_vlk_2_dielage_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void info_vlk_2_dielage_info()
{
	AI_Output(other,self,"Info_Vlk_2_DieLage_15_00");	//Как здесь живется?
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_01");	//Если тебя прислали Бароны, скажи им, что я не хочу неприятностей. Я ни с кем не говорю об этом.
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_02");	//Я доволен тем, что они дают нам.
	AI_Output(other,self,"Info_Vlk_2_DieLage_15_03");	//Никто меня не посылал. Я совсем недавно пришел сюда.
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_04");	//Новенький, а? Новички всегда быстро попадают в неприятности. А мне не нужны проблемы, понял?
};

func void b_assignambientinfos_vlk_2(var C_NPC slf)
{
	b_assignfindnpc_oc(slf);
	info_vlk_2_exit.npc = Hlp_GetInstanceID(slf);
	info_vlk_2_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_vlk_2_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_vlk_2_daslager.npc = Hlp_GetInstanceID(slf);
	info_vlk_2_dielage.npc = Hlp_GetInstanceID(slf);
};

