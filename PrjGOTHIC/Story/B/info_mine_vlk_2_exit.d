
instance INFO_MINE_VLK_2_EXIT(C_INFO)
{
	nr = 999;
	condition = info_mine_vlk_2_exit_condition;
	information = info_mine_vlk_2_exit_info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};


func int info_mine_vlk_2_exit_condition()
{
	return 1;
};

func void info_mine_vlk_2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_MINE_VLK_2_MINE(C_INFO)
{
	nr = 4;
	condition = info_mine_vlk_2_mine_condition;
	information = info_mine_vlk_2_mine_info;
	permanent = 1;
	description = "Расскажи мне о шахте.";
};


func int info_mine_vlk_2_mine_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_vlk_2_mine_info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_Mine_15_00");	//Расскажи мне о шахте.
	AI_Output(self,other,"Info_Mine_Vlk_2_Mine_01_01");	//Там полно пещер, где еще осталась руда. Но из-за ползунов добычу пришлось прекратить.
	AI_Output(self,other,"Info_Mine_Vlk_2_Mine_01_02");	//Слишком много атак, слишком большие потери.
};


instance INFO_MINE_VLK_2_WICHTIGEPERSONEN(C_INFO)
{
	nr = 3;
	condition = info_mine_vlk_2_wichtigepersonen_condition;
	information = info_mine_vlk_2_wichtigepersonen_info;
	permanent = 1;
	description = "Кто еще может рассказать об этом месте?";
};


func int info_mine_vlk_2_wichtigepersonen_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_vlk_2_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_WichtigePersonen_15_00");	//Кто еще может рассказать об этом месте?
	AI_Output(self,other,"Info_Mine_Vlk_2_WichtigePersonen_01_01");	//Вайпер плавильщик. Он знаток своего дела, не страшится жара, да и сам словно из стали. Изо дня в день он плавит руду.
};


instance INFO_MINE_VLK_2_MINECRAWLER(C_INFO)
{
	nr = 2;
	condition = info_mine_vlk_2_minecrawler_condition;
	information = info_mine_vlk_2_minecrawler_info;
	permanent = 1;
	description = "Что ты знаешь о ползунах?";
};


func int info_mine_vlk_2_minecrawler_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_vlk_2_minecrawler_info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_Minecrawler_15_00");	//Что ты знаешь о ползунах?
	AI_Output(self,other,"Info_Mine_Vlk_2_Minecrawler_01_01");	//Мы прекратили добычу руды, большой забой внизу закрыт. Там тьма этих тварей.
	AI_Output(self,other,"Info_Mine_Vlk_2_Minecrawler_01_02");	//Ползуны там повсюду. Ты их слышишь? Я точно слышу.
};


instance INFO_MINE_VLK_2_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_mine_vlk_2_dielage_condition;
	information = info_mine_vlk_2_dielage_info;
	permanent = 1;
	description = "Как у тебя дела?";
};


func int info_mine_vlk_2_dielage_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_vlk_2_dielage_info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_DieLage_15_00");	//Как у тебя дела?
	AI_Output(self,other,"Info_Mine_Vlk_2_DieLage_01_01");	//Я должен работать. Если стражники увидят, что я бездельничаю, мне уменьшат паек.
};

func void b_assignambientinfos_mine_vlk_2(var C_NPC slf)
{
	info_mine_vlk_2_exit.npc = Hlp_GetInstanceID(slf);
	info_mine_vlk_2_minecrawler.npc = Hlp_GetInstanceID(slf);
	info_mine_vlk_2_mine.npc = Hlp_GetInstanceID(slf);
	info_mine_vlk_2_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_mine_vlk_2_dielage.npc = Hlp_GetInstanceID(slf);
};

