
instance INFO_MINE_VLK_1_EXIT(C_INFO)
{
	nr = 999;
	condition = info_mine_vlk_1_exit_condition;
	information = info_mine_vlk_1_exit_info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};


func int info_mine_vlk_1_exit_condition()
{
	return 1;
};

func void info_mine_vlk_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_MINE_VLK_1_MINE(C_INFO)
{
	nr = 4;
	condition = info_mine_vlk_1_mine_condition;
	information = info_mine_vlk_1_mine_info;
	permanent = 1;
	description = "Расскажи мне об этой шахте.";
};


func int info_mine_vlk_1_mine_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_vlk_1_mine_info()
{
	AI_Output(other,self,"Info_Mine_Vlk_1_Mine_15_00");	//Расскажи мне об этой шахте.
	AI_Output(self,other,"Info_Mine_Vlk_1_Mine_01_01");	//В шахте растут грибы и травы. Вообще-то их даже можно есть, но для восстановления сил лучше съесть хороший кусок мяса.
	AI_Output(self,other,"Info_Mine_Vlk_1_Mine_01_02");	//А вот ползуны почти несъедобны. К сожалению.
};


instance INFO_MINE_VLK_1_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_mine_vlk_1_wichtigepersonen_condition;
	information = info_mine_vlk_1_wichtigepersonen_info;
	permanent = 1;
	description = "Кто здесь всем управляет?";
};


func int info_mine_vlk_1_wichtigepersonen_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_vlk_1_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Mine_Vlk_1_WichtigePersonen_15_00");	//Кто здесь всем управляет?
	AI_Output(self,other,"Info_Mine_Vlk_1_WichtigePersonen_01_01");	//Главный в шахте Ян. Он организует работу и обмен товаров с лагерем. Если тебе что-нибудь понадобится, поговори с ним.
};


instance INFO_MINE_VLK_1_MINECRAWLER(C_INFO)
{
	nr = 2;
	condition = info_mine_vlk_1_minecrawler_condition;
	information = info_mine_vlk_1_minecrawler_info;
	permanent = 1;
	description = "Что ты знаешь о ползунах?";
};


func int info_mine_vlk_1_minecrawler_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_vlk_1_minecrawler_info()
{
	AI_Output(other,self,"Info_Mine_Vlk_1_Minecrawler_15_00");	//Что ты знаешь о ползунах?
	AI_Output(self,other,"Info_Mine_Vlk_1_Minecrawler_01_01");	//Стражи из Болотного лагеря заключили с Гомезом сделку. Они убивают ползунов и за это забирают их слюну.
};


instance INFO_MINE_VLK_1_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_mine_vlk_1_dielage_condition;
	information = info_mine_vlk_1_dielage_info;
	permanent = 1;
	description = "Как жизнь?";
};


func int info_mine_vlk_1_dielage_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_vlk_1_dielage_info()
{
	AI_Output(other,self,"Info_Mine_Vlk_1_DieLage_15_00");	//Как жизнь?
	AI_Output(self,other,"Info_Mine_Vlk_1_DieLage_01_01");	//Уйма работы и слишком мало отдыха. Если есть вопросы, задавай их быстрее. Я очень занят.
};

func void b_assignambientinfos_mine_vlk_1(var C_NPC slf)
{
	info_mine_vlk_1_exit.npc = Hlp_GetInstanceID(slf);
	info_mine_vlk_1_minecrawler.npc = Hlp_GetInstanceID(slf);
	info_mine_vlk_1_mine.npc = Hlp_GetInstanceID(slf);
	info_mine_vlk_1_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_mine_vlk_1_dielage.npc = Hlp_GetInstanceID(slf);
};

