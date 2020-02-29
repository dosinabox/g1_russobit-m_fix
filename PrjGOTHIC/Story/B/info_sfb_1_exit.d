
instance INFO_SFB_1_EXIT(C_INFO)
{
	nr = 999;
	condition = info_sfb_1_exit_condition;
	information = info_sfb_1_exit_info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};


func int info_sfb_1_exit_condition()
{
	return 1;
};

func void info_sfb_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_SFB_1_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_sfb_1_einervoneuchwerden_condition;
	information = info_sfb_1_einervoneuchwerden_info;
	permanent = 1;
	description = "Я хочу быть рудокопом. Как мне присоединиться к вам?";
};


func int info_sfb_1_einervoneuchwerden_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void info_sfb_1_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_SFB_1_EinerVonEuchWerden_15_00");	//Я хочу быть рудокопом. Как мне присоединиться к вам?
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_01");	//Одним из нас? Только не думай, что если нас не заставляют, мы здесь не работаем.
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_02");	//Если ты надеешься бездельничать здесь, то ты сильно ошибаешься. Иди и займись чем-нибудь еще.
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_03");	//Если ты все еще думаешь, что сможешь справиться с этим делом, поговори с Суини. Это тот рудокоп, что весь день стоит в сторонке и курит.
};


instance INFO_SFB_1_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_sfb_1_wichtigepersonen_condition;
	information = info_sfb_1_wichtigepersonen_info;
	permanent = 1;
	description = "Кто здесь командует?";
};


func int info_sfb_1_wichtigepersonen_condition()
{
	return 1;
};

func void info_sfb_1_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_SFB_1_WichtigePersonen_15_00");	//Кто здесь командует?
	AI_Output(self,other,"Info_SFB_1_WichtigePersonen_01_01");	//Командует? А ты оглянись вокруг. Уж конечно не те, кто целыми днями машет киркой, чтобы добыть немного руды.
};


instance INFO_SFB_1_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_sfb_1_daslager_condition;
	information = info_sfb_1_daslager_info;
	permanent = 1;
	description = "Что это за место?";
};


func int info_sfb_1_daslager_condition()
{
	return 1;
};

func void info_sfb_1_daslager_info()
{
	AI_Output(other,self,"Info_SFB_1_DasLager_15_00");	//Что это за место?
	AI_Output(self,other,"Info_SFB_1_DasLager_01_01");	//А на что оно, по-твоему, похоже? На королевский дворец?
	AI_Output(self,other,"Info_SFB_1_DasLager_01_02");	//Если уж ты в самом деле захотел поработать в Свободной шахте, то сначала ты должен доказать, что сможешь принести нам хоть какую-то пользу.
};


instance INFO_SFB_1_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_sfb_1_dielage_condition;
	information = info_sfb_1_dielage_info;
	permanent = 1;
	description = "Как жизнь?";
};


func int info_sfb_1_dielage_condition()
{
	return 1;
};

func void info_sfb_1_dielage_info()
{
	AI_Output(other,self,"Info_SFB_1_DieLage_15_00");	//Как жизнь?
	AI_Output(self,other,"Info_SFB_1_DieLage_01_01");	//А ты как думаешь? Хуже не бывает. Работаю как вол, а руды и на горсть риса не всегда хватает.
	AI_Output(self,other,"Info_SFB_1_DieLage_01_02");	//Ты здесь можешь найти только одного довольного рудокопа - Суини. Окил назначил его главным среди нас. А теперь он слоняется по шахте и старается не набить себе мозоли ходьбой.
};

func void b_assignambientinfos_sfb_1(var C_NPC slf)
{
	info_sfb_1_exit.npc = Hlp_GetInstanceID(slf);
	info_sfb_1_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_sfb_1_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_sfb_1_daslager.npc = Hlp_GetInstanceID(slf);
	info_sfb_1_dielage.npc = Hlp_GetInstanceID(slf);
};

