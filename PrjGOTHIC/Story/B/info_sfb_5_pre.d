
instance INFO_SFB_5_PRE(C_INFO)
{
	nr = 1;
	condition = info_sfb_5_pre_condition;
	information = info_sfb_5_pre_info;
	permanent = 0;
	important = 1;
};


func int info_sfb_5_pre_condition()
{
	return 1;
};

func void info_sfb_5_pre_info()
{
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_00");	//Привет!
};


instance INFO_SFB_5_EXIT(C_INFO)
{
	nr = 999;
	condition = info_sfb_5_exit_condition;
	information = info_sfb_5_exit_info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};


func int info_sfb_5_exit_condition()
{
	return 1;
};

func void info_sfb_5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_SFB_5_EINERVONEUCHWERDEN(C_INFO)
{
	nr = 4;
	condition = info_sfb_5_einervoneuchwerden_condition;
	information = info_sfb_5_einervoneuchwerden_info;
	permanent = 1;
	description = "Я вот думаю присоединиться к вам.";
};


func int info_sfb_5_einervoneuchwerden_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

func void info_sfb_5_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_00");	//Я думаю присоединиться к вам.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_01");	//Хочешь присоединиться, да? Водоносом хочешь стать, что ли?
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_02");	//Нет, рудокопом.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_03");	//Лучше послушай меня: Никто в этой проклятой шахте не работает добровольно.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_04");	//Но раз ты так хочешь... Иди и найди Суини. Уж он-то снабдит тебя старой киркой, которая может еще пойти в дело.
};


instance INFO_SFB_5_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_sfb_5_wichtigepersonen_condition;
	information = info_sfb_5_wichtigepersonen_info;
	permanent = 1;
	description = "Кого здесь можно считать важным человеком?";
};


func int info_sfb_5_wichtigepersonen_condition()
{
	return 1;
};

func void info_sfb_5_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_SFB_5_WichtigePersonen_15_00");	//Кого здесь можно считать важным человеком?
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_01");	//Важные? Конечно. Я один из них.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_02");	//Думаю, ты хотел узнать, кому здесь принадлежит власть.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_03");	//Что ж, по-моему, тебе следует поговорить с наемниками или ворами. А вот к магам Круга Воды подходить не стоит.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_04");	//Суини не самый лучший тип, но сам он считает себя большой шишкой. А ведь он просто раздает кирки и подчиняется приказам Окила.
};


instance INFO_SFB_5_DASLAGER(C_INFO)
{
	nr = 2;
	condition = info_sfb_5_daslager_condition;
	information = info_sfb_5_daslager_info;
	permanent = 1;
	description = "Что может дать мне этот лагерь?";
};


func int info_sfb_5_daslager_condition()
{
	return 1;
};

func void info_sfb_5_daslager_info()
{
	AI_Output(other,self,"Info_SFB_5_DasLager_15_00");	//Что может дать мне этот лагерь?
	AI_Output(self,other,"Info_SFB_5_DasLager_02_01");	//Все зависит от того, кем ты здесь будешь. Некоторые работают в поте лица, а некоторые пользуются их трудом.
};


instance INFO_SFB_5_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_sfb_5_dielage_condition;
	information = info_sfb_5_dielage_info;
	permanent = 1;
	description = "Как здесь живется?";
};


func int info_sfb_5_dielage_condition()
{
	return 1;
};

func void info_sfb_5_dielage_info()
{
	AI_Output(other,self,"Info_SFB_5_DieLage_15_00");	//Как здесь живется?
	AI_Output(self,other,"Info_SFB_5_DieLage_02_01");	//Хорошо!
	AI_Output(self,other,"Info_SFB_5_DieLage_02_02");	//Да, нам здесь так нравится, что мы изо всех сил пытаемся сбежать отсюда.
	AI_Output(self,other,"Info_SFB_5_DieLage_02_03");	//Где мы, по-твоему, находимся? Мы в тюрьме, а кто может наслаждаться жизнью заключенного?
};

func void b_assignambientinfos_sfb_5(var C_NPC slf)
{
	info_sfb_5_pre.npc = Hlp_GetInstanceID(slf);
	info_sfb_5_exit.npc = Hlp_GetInstanceID(slf);
	info_sfb_5_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_sfb_5_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_sfb_5_daslager.npc = Hlp_GetInstanceID(slf);
	info_sfb_5_dielage.npc = Hlp_GetInstanceID(slf);
};

