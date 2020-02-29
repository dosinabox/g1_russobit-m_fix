
instance INFO_MINE_GRD_7_EXIT(C_INFO)
{
	nr = 999;
	condition = info_mine_grd_7_exit_condition;
	information = info_mine_grd_7_exit_info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};


func int info_mine_grd_7_exit_condition()
{
	return 1;
};

func void info_mine_grd_7_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_MINE_GRD_7_MINE(C_INFO)
{
	nr = 1;
	condition = info_mine_grd_7_mine_condition;
	information = info_mine_grd_7_mine_info;
	permanent = 1;
	description = "Расскажи мне о шахте.";
};


func int info_mine_grd_7_mine_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_grd_7_mine_info()
{
	AI_Output(other,self,"Info_Mine_Grd_7_Mine_15_00");	//Расскажи мне о шахте.
	AI_Output(self,other,"Info_Mine_Grd_7_Mine_07_01");	//А что тут рассказывать? Рудокопы добывают руду, а мы их защищаем от ползунов.
};


instance INFO_MINE_GRD_7_WICHTIGEPERSONEN(C_INFO)
{
	nr = 1;
	condition = info_mine_grd_7_wichtigepersonen_condition;
	information = info_mine_grd_7_wichtigepersonen_info;
	permanent = 1;
	description = "Кто здесь командует?";
};


func int info_mine_grd_7_wichtigepersonen_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_grd_7_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Mine_Grd_7_WichtigePersonen_15_00");	//Кто здесь командует?
	AI_Output(self,other,"Info_Mine_Grd_7_WichtigePersonen_07_01");	//Ян и Асгхан. Обращайся к ним, если тебе что-нибудь понадобится.
};


instance INFO_MINE_GRD_7_MINECRAWLER(C_INFO)
{
	nr = 1;
	condition = info_mine_grd_7_minecrawler_condition;
	information = info_mine_grd_7_minecrawler_info;
	permanent = 1;
	description = "Что ты знаешь о ползунах?";
};


func int info_mine_grd_7_minecrawler_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_grd_7_minecrawler_info()
{
	AI_Output(other,self,"Info_Mine_Grd_7_Minecrawler_15_00");	//Что ты знаешь о ползунах?
	AI_Output(self,other,"Info_Mine_Grd_7_Minecrawler_07_01");	//Вот что я думаю, их всех нужно уничтожить как можно быстрее.
};


instance INFO_MINE_GRD_7_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_mine_grd_7_dielage_condition;
	information = info_mine_grd_7_dielage_info;
	permanent = 1;
	description = "Как дела?";
};


func int info_mine_grd_7_dielage_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_grd_7_dielage_info()
{
	AI_Output(other,self,"Info_Mine_Grd_7_DieLage_15_00");	//Как жизнь?
	AI_Output(self,other,"Info_Mine_Grd_7_DieLage_07_01");	//Слушай, не отвлекай меня от работы!
};

func void b_assignambientinfos_mine_grd_7(var C_NPC slf)
{
	info_mine_grd_7_exit.npc = Hlp_GetInstanceID(slf);
	info_mine_grd_7_mine.npc = Hlp_GetInstanceID(slf);
	info_mine_grd_7_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_mine_grd_7_minecrawler.npc = Hlp_GetInstanceID(slf);
	info_mine_grd_7_dielage.npc = Hlp_GetInstanceID(slf);
};

