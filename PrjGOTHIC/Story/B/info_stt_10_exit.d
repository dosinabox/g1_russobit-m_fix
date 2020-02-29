
instance INFO_STT_10_EXIT(C_INFO)
{
	nr = 999;
	condition = info_stt_10_exit_condition;
	information = info_stt_10_exit_info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};


func int info_stt_10_exit_condition()
{
	return 1;
};

func void info_stt_10_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_STT_10_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_stt_10_einervoneuchwerden_condition;
	information = info_stt_10_einervoneuchwerden_info;
	permanent = 1;
	description = "Я бы хотел стать Призраком.";
};


func int info_stt_10_einervoneuchwerden_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void info_stt_10_einervoneuchwerden_info()
{
	var C_NPC diego;
	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_15_00");	//Я бы хотел стать Призраком.
	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_10_01");	//Да? А ты уже поговорил с Диего?
	diego = Hlp_GetNpc(pc_thief);
	diego.aivar[AIV_FINDABLE] = TRUE;
	Info_ClearChoices(info_stt_10_einervoneuchwerden);
	Info_AddChoice(info_stt_10_einervoneuchwerden,"Еще нет.",info_stt_10_einervoneuchwerden_nein);
	Info_AddChoice(info_stt_10_einervoneuchwerden,"Я подойду к нему.",info_stt_10_einervoneuchwerden_ja);
};

func void info_stt_10_einervoneuchwerden_nein()
{
	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_Nein_15_00");	//Еще нет.
	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_Nein_10_01");	//Так поговори. Ты найдешь его перед воротами замка.
	Info_ClearChoices(info_stt_10_einervoneuchwerden);
};

func void info_stt_10_einervoneuchwerden_ja()
{
	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_Ja_15_00");	//Я подойду к нему.
	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_Ja_10_01");	//Хорошо. Делай то, что он тебе скажет. Мне это никак не повредит. Но кто знает...
	Info_ClearChoices(info_stt_10_einervoneuchwerden);
};


instance INFO_STT_10_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_stt_10_wichtigepersonen_condition;
	information = info_stt_10_wichtigepersonen_info;
	permanent = 1;
	description = "Есть еще кто-нибудь, кто может быть мне полезен?";
};


func int info_stt_10_wichtigepersonen_condition()
{
	return 1;
};

func void info_stt_10_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Stt_10_WichtigePersonen_15_00");	//Есть еще кто-нибудь, кто может быть мне полезен?
	AI_Output(self,other,"Info_Stt_10_WichtigePersonen_10_01");	//Если ты испортишь отношения с кем-нибудь из лагеря, обратись к Граво. Он сидит возле купальни рядом с воротами замка. Он помогает людям улаживать их проблемы. А проблемы чаще всего возникают у таких новичков, как ты.
};


instance INFO_STT_10_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_stt_10_daslager_condition;
	information = info_stt_10_daslager_info;
	permanent = 1;
	description = "Что ты можешь рассказать об этом лагере?";
};


func int info_stt_10_daslager_condition()
{
	return 1;
};

func void info_stt_10_daslager_info()
{
	AI_Output(other,self,"Info_Stt_10_DasLager_15_00");	//Что ты можешь рассказать об этом лагере?
	AI_Output(self,other,"Info_Stt_10_DasLager_10_01");	//По-моему, самое интересное место в лагере - рынок. Там продается почти все. Так что заходи туда, если что-нибудь понадобится.
	AI_Output(self,other,"Info_Stt_10_DasLager_10_02");	//Он находится под большой крышей на Внешнем Кольце, к югу от замка.
};


instance INFO_STT_10_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_stt_10_dielage_condition;
	information = info_stt_10_dielage_info;
	permanent = 1;
	description = "Привет!";
};


func int info_stt_10_dielage_condition()
{
	return 1;
};

func void info_stt_10_dielage_info()
{
	AI_Output(other,self,"Info_Stt_10_DieLage_15_00");	//Привет!
	AI_Output(self,other,"Info_Stt_10_DieLage_10_01");	//Что тебе нужно?
};

func void b_assignambientinfos_stt_10(var C_NPC slf)
{
	b_assignfindnpc_oc(slf);
	info_stt_10_exit.npc = Hlp_GetInstanceID(slf);
	info_stt_10_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_stt_10_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_stt_10_daslager.npc = Hlp_GetInstanceID(slf);
	info_stt_10_dielage.npc = Hlp_GetInstanceID(slf);
};

