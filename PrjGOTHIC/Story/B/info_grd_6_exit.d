
instance INFO_GRD_6_EXIT(C_INFO)
{
	nr = 999;
	condition = info_grd_6_exit_condition;
	information = info_grd_6_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_grd_6_exit_condition()
{
	return 1;
};

func void info_grd_6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_GRD_6_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 1;
	condition = info_grd_6_einervoneuchwerden_condition;
	information = info_grd_6_einervoneuchwerden_info;
	permanent = 1;
	description = "Вам нужны люди?";
};


func int info_grd_6_einervoneuchwerden_condition()
{
	if((Npc_GetTrueGuild(other) != GIL_GRD) && (Npc_GetTrueGuild(other) != GIL_STT) && (Npc_GetTrueGuild(other) != GIL_KDF) && !c_npcbelongstonewcamp(other) && !c_npcbelongstopsicamp(other))
	{
		return TRUE;
	};
};

func void info_grd_6_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Grd_6_EinerVonEuchWerden_15_00");	//Вам нужны люди?
	AI_Output(self,other,"Info_Grd_6_EinerVonEuchWerden_06_01");	//Ты недавно в колонии, да? Если ты ищешь лагерь, к которому хочешь присоединиться, поговори с сектантами. Они берут всех без разбора.
	AI_Output(self,other,"Info_Grd_6_EinerVonEuchWerden_06_02");	//В наш лагерь не принимают кого попало... Конечно, если ты не хочешь пойти поработать в шахте!
};


instance INFO_GRD_6_WICHTIGEPERSONEN(C_INFO)
{
	nr = 1;
	condition = info_grd_6_wichtigepersonen_condition;
	information = info_grd_6_wichtigepersonen_info;
	permanent = 1;
	description = "Кто здесь командует?";
};


func int info_grd_6_wichtigepersonen_condition()
{
	return 1;
};

func void info_grd_6_wichtigepersonen_info()
{
	var C_NPC thorus;
	AI_Output(other,self,"Info_Grd_6_WichtigePersonen_15_00");	//Кто здесь командует?
	AI_Output(self,other,"Info_Grd_6_WichtigePersonen_06_01");	//Торус следит за порядком. Он подчиняется Гомезу.
	thorus = Hlp_GetNpc(grd_200_thorus);
	thorus.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_GRD_6_DASLAGER(C_INFO)
{
	nr = 1;
	condition = info_grd_6_daslager_condition;
	information = info_grd_6_daslager_info;
	permanent = 1;
	description = "Я новенький.";
};


func int info_grd_6_daslager_condition()
{
	if(!c_npcbelongstooldcamp(other) && !c_npcbelongstonewcamp(other) && !c_npcbelongstopsicamp(other))
	{
		return 1;
	};
};

func void info_grd_6_daslager_info()
{
	AI_Output(other,self,"Info_Grd_6_DasLager_15_00");	//Я новенький.
	AI_Output(self,other,"Info_Grd_6_DasLager_06_01");	//Да, я вижу.
	AI_Output(other,self,"Info_Grd_6_DasLager_15_02");	//Каковы здешние порядки?
	AI_Output(self,other,"Info_Grd_6_DasLager_06_03");	//Не создавай нам проблем, и тебя никто не тронет.
	Info_ClearChoices(info_grd_6_daslager);
	Info_AddChoice(info_grd_6_daslager,"Ясно.",info_grd_6_daslager_verstehe);
	Info_AddChoice(info_grd_6_daslager,"А что ты имеешь в виду, говоря о проблемах?",info_grd_6_daslager_wasistaerger);
};

func void info_grd_6_daslager_verstehe()
{
	AI_Output(other,self,"Info_Grd_6_DasLager_Verstehe_15_00");	//Ясно.
	Info_ClearChoices(info_grd_6_daslager);
};

func void info_grd_6_daslager_wasistaerger()
{
	AI_Output(other,self,"Info_Grd_6_DasLager_WasIstAerger_15_00");	//А что ты имеешь в виду, говоря о проблемах?
	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_01");	//Большинство рудокопов платит нам, а мы их защищаем.
	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_02");	//Если ты обидишь кого-то из них, будешь иметь дело с нами.
	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_03");	//А если я замечу тебя в чужой хижине, то...
	AI_Output(other,self,"Info_Grd_6_DasLager_WasIstAerger_15_04");	//Хорошо, хорошо. Я все понял.
	Info_ClearChoices(info_grd_6_daslager);
};


instance INFO_GRD_6_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_grd_6_dielage_condition;
	information = info_grd_6_dielage_info;
	permanent = 1;
	description = "Как дела?";
};


func int info_grd_6_dielage_condition()
{
	return 1;
};

func void info_grd_6_dielage_info()
{
	AI_Output(other,self,"Info_Grd_6_DieLage_15_00");	//Как дела?
	AI_Output(self,other,"Info_Grd_6_DieLage_06_01");	//Ищешь неприятностей?
};

func void b_assignambientinfos_grd_6(var C_NPC slf)
{
	b_assignfindnpc_oc(slf);
	info_grd_6_exit.npc = Hlp_GetInstanceID(slf);
	info_grd_6_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_grd_6_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_grd_6_daslager.npc = Hlp_GetInstanceID(slf);
	info_grd_6_dielage.npc = Hlp_GetInstanceID(slf);
};

