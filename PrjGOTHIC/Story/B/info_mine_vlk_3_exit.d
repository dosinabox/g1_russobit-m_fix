
instance INFO_MINE_VLK_3_EXIT(C_INFO)
{
	nr = 999;
	condition = info_mine_vlk_3_exit_condition;
	information = info_mine_vlk_3_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_mine_vlk_3_exit_condition()
{
	return 1;
};

func void info_mine_vlk_3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_MINE_VLK_3_MINE(C_INFO)
{
	nr = 4;
	condition = info_mine_vlk_3_mine_condition;
	information = info_mine_vlk_3_mine_info;
	permanent = 1;
	description = "Расскажи мне о шахте.";
};


func int info_mine_vlk_3_mine_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_vlk_3_mine_info()
{
	AI_Output(other,self,"Info_Mine_Vlk_3_Mine_15_00");	//Расскажи мне о шахте.
	AI_Output(self,other,"Info_Mine_Vlk_3_Mine_01_01");	//Все мы должны работать. Без отдыха, без солнца. У нас нет шансов выбраться отсюда. Только смерть прекратит наши мучения.
};


instance INFO_MINE_VLK_3_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_mine_vlk_3_wichtigepersonen_condition;
	information = info_mine_vlk_3_wichtigepersonen_info;
	permanent = 1;
	description = "Кто здесь главный?";
};


func int info_mine_vlk_3_wichtigepersonen_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_vlk_3_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Mine_Vlk_3_WichtigePersonen_15_00");	//Кто здесь главный?
	AI_Output(self,other,"Info_Mine_Vlk_3_WichtigePersonen_01_01");	//В шахте всем заправляет Ян. Во главе стражи стоит Асгхан.
};


instance INFO_MINE_VLK_3_MINECRAWLER(C_INFO)
{
	nr = 2;
	condition = info_mine_vlk_3_minecrawler_condition;
	information = info_mine_vlk_3_minecrawler_info;
	permanent = 1;
	description = "Что ты знаешь о ползунах?";
};


func int info_mine_vlk_3_minecrawler_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_vlk_3_minecrawler_info()
{
	AI_Output(other,self,"Info_Mine_Vlk_3_Minecrawler_15_00");	//Что ты знаешь о ползунах?
	AI_Output(self,other,"Info_Mine_Vlk_3_Minecrawler_01_01");	//Как вести себя при встрече с ползунами? Бежать. Бежать изо всех сил. И тогда быть может, ты сможешь уцелеть.
	AI_Output(self,other,"Info_Mine_Vlk_3_Minecrawler_01_02");	//Но если потеряешься, никто не придет к тебе на помощь, никто и не заметит твоего исчезновения.
};


instance INFO_MINE_VLK_3_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_mine_vlk_3_dielage_condition;
	information = info_mine_vlk_3_dielage_info;
	permanent = 1;
	description = "Как жизнь?";
};


func int info_mine_vlk_3_dielage_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_vlk_3_dielage_info()
{
	AI_Output(other,self,"Info_Mine_Vlk_3_DieLage_15_00");	//Как жизнь?
	AI_Output(self,other,"Info_Mine_Vlk_3_DieLage_01_01");	//Что ж, у меня болит спина, руки отваливаются, меня мучает жажда и вообще, я смертельно устал.
	AI_Output(self,other,"Info_Mine_Vlk_3_DieLage_01_02");	//И еще эта монотонная работа, которая скоро сведет меня с ума.
};

func void b_assignambientinfos_mine_vlk_3(var C_NPC slf)
{
	info_mine_vlk_3_exit.npc = Hlp_GetInstanceID(slf);
	info_mine_vlk_3_minecrawler.npc = Hlp_GetInstanceID(slf);
	info_mine_vlk_3_mine.npc = Hlp_GetInstanceID(slf);
	info_mine_vlk_3_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_mine_vlk_3_dielage.npc = Hlp_GetInstanceID(slf);
};

