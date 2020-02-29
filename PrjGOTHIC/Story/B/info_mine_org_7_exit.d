
instance INFO_MINE_ORG_7_EXIT(C_INFO)
{
	nr = 999;
	condition = info_mine_org_7_exit_condition;
	information = info_mine_org_7_exit_info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};


func int info_mine_org_7_exit_condition()
{
	return 1;
};

func void info_mine_org_7_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_MINE_ORG_7_MINE(C_INFO)
{
	nr = 1;
	condition = info_mine_org_7_mine_condition;
	information = info_mine_org_7_mine_info;
	permanent = 1;
	description = "Расскажи мне об этом лагере.";
};


func int info_mine_org_7_mine_condition()
{
	return 1;
};

func void info_mine_org_7_mine_info()
{
	AI_Output(other,self,"Info_Mine_Org_7_Mine_15_00");	//Расскажи мне об этом лагере.
	AI_Output(self,other,"Info_Mine_Org_7_Mine_07_01");	//О лагере? Ты имеешь в виду нашу пещеру? Здесь не так уж плохо. Рудокопы добывают руду, наемники нас охраняют, а мы, воры, всем здесь заправляем.
};


instance INFO_MINE_ORG_7_WICHTIGEPERSONEN(C_INFO)
{
	nr = 1;
	condition = info_mine_org_7_wichtigepersonen_condition;
	information = info_mine_org_7_wichtigepersonen_info;
	permanent = 1;
	description = "Кто здесь всем руководит?";
};


func int info_mine_org_7_wichtigepersonen_condition()
{
	return 1;
};

func void info_mine_org_7_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Mine_Org_7_WichtigePersonen_15_00");	//Кто здесь всем руководит?
	AI_Output(self,other,"Info_Mine_Org_7_WichtigePersonen_07_01");	//Зависит от того, кому ты подчиняешься.
	AI_Output(self,other,"Info_Mine_Org_7_WichtigePersonen_07_02");	//Но если Окил захочет, чтобы ты что-нибудь для него сделал, лучше с ним не спорить. Он не прощает тех, кто в чем-то ему отказывает.
};


instance INFO_MINE_ORG_7_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_mine_org_7_dielage_condition;
	information = info_mine_org_7_dielage_info;
	permanent = 1;
	description = "Как жизнь?";
};


func int info_mine_org_7_dielage_condition()
{
	return 1;
};

func void info_mine_org_7_dielage_info()
{
	AI_Output(other,self,"Info_Mine_Org_7_DieLage_15_00");	//Как жизнь?
	AI_Output(self,other,"Info_Mine_Org_7_DieLage_07_01");	//Слушай, не отвлекай меня от работы!
};

func void b_assignambientinfos_mine_org_7(var C_NPC slf)
{
	info_mine_org_7_exit.npc = Hlp_GetInstanceID(slf);
	info_mine_org_7_mine.npc = Hlp_GetInstanceID(slf);
	info_mine_org_7_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_mine_org_7_dielage.npc = Hlp_GetInstanceID(slf);
};

