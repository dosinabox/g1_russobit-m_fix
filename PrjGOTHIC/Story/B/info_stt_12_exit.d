
instance INFO_STT_12_EXIT(C_INFO)
{
	nr = 999;
	condition = info_stt_12_exit_condition;
	information = info_stt_12_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_stt_12_exit_condition()
{
	return 1;
};

func void info_stt_12_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_STT_12_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_stt_12_einervoneuchwerden_condition;
	information = info_stt_12_einervoneuchwerden_info;
	permanent = 1;
	description = "Я хочу быть Призраком.";
};


func int info_stt_12_einervoneuchwerden_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void info_stt_12_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Stt_12_EinerVonEuchWerden_15_00");	//Я хочу быть Призраком.
	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_01");	//А... Тогда тебе надо знать, что Гомез не выносит неудачников. Если хочешь быть среди нас, то будь готов жизнь за него отдать.
	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_02");	//Он принимает, в лучшем случае, половину из всех желающих.
	AI_Output(other,self,"Info_Stt_12_EinerVonEuchWerden_15_03");	//А остальные? Что с ними?
	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_04");	//Вероятно жуют рис в Новом лагере.
};


instance INFO_STT_12_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_stt_12_wichtigepersonen_condition;
	information = info_stt_12_wichtigepersonen_info;
	permanent = 1;
	description = "Кто здесь главный?";
};


func int info_stt_12_wichtigepersonen_condition()
{
	return 1;
};

func void info_stt_12_wichtigepersonen_info()
{
	var C_NPC diego;
	var C_NPC thorus;
	AI_Output(other,self,"Info_Stt_12_WichtigePersonen_15_00");	//Кто здесь главный?
	AI_Output(self,other,"Info_Stt_12_WichtigePersonen_12_01");	//Диего заправляет Призраками. А если надо поговорить с Гомезом, то это к Торусу.
	diego = Hlp_GetNpc(pc_thief);
	diego.aivar[AIV_FINDABLE] = TRUE;
	thorus = Hlp_GetNpc(grd_200_thorus);
	thorus.aivar[AIV_FINDABLE] = TRUE;
};


instance INFO_STT_12_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_stt_12_daslager_condition;
	information = info_stt_12_daslager_info;
	permanent = 1;
	description = "А что хорошего в этом лагере? Расскажи, а!";
};


func int info_stt_12_daslager_condition()
{
	return 1;
};

func void info_stt_12_daslager_info()
{
	AI_Output(other,self,"Info_Stt_12_DasLager_15_00");	//А что хорошего в этом лагере? Расскажи, а!
	AI_Output(self,other,"Info_Stt_12_DasLager_12_01");	//Думаю, у рудокопов найдется свободная минутка с тобой об этом поболтать. Они все равно маются без дела.
};


instance INFO_STT_12_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_stt_12_dielage_condition;
	information = info_stt_12_dielage_info;
	permanent = 1;
	description = "Ну, как жизнь?";
};


func int info_stt_12_dielage_condition()
{
	return 1;
};

func void info_stt_12_dielage_info()
{
	AI_Output(other,self,"Info_Stt_12_DieLage_15_00");	//Ну, как жизнь?
	AI_Output(self,other,"Info_Stt_12_DieLage_12_01");	//Что тебе надо?
};

func void b_assignambientinfos_stt_12(var C_NPC slf)
{
	b_assignfindnpc_oc(slf);
	info_stt_12_exit.npc = Hlp_GetInstanceID(slf);
	info_stt_12_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_stt_12_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_stt_12_daslager.npc = Hlp_GetInstanceID(slf);
	info_stt_12_dielage.npc = Hlp_GetInstanceID(slf);
};

