
instance INFO_MINE_GRD_13_EXIT(C_INFO)
{
	nr = 999;
	condition = info_mine_grd_13_exit_condition;
	information = info_mine_grd_13_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_mine_grd_13_exit_condition()
{
	return 1;
};

func void info_mine_grd_13_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_MINE_GRD_13_MINE(C_INFO)
{
	nr = 1;
	condition = info_mine_grd_13_mine_condition;
	information = info_mine_grd_13_mine_info;
	permanent = 1;
	description = "Что происходит на шахте?";
};


func int info_mine_grd_13_mine_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_grd_13_mine_info()
{
	AI_Output(other,self,"Info_Mine_Grd_13_Mine_15_00");	//Что происходит на шахте?
	AI_Output(self,other,"Info_Mine_Grd_13_Mine_13_01");	//Шахта - сердце Старого лагеря. Без нее у нас не будет руды, а без руды не будет и товаров. Понятно?
};


instance INFO_MINE_GRD_13_WICHTIGEPERSONEN(C_INFO)
{
	nr = 1;
	condition = info_mine_grd_13_wichtigepersonen_condition;
	information = info_mine_grd_13_wichtigepersonen_info;
	permanent = 1;
	description = "Кто здесь командует?";
};


func int info_mine_grd_13_wichtigepersonen_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_grd_13_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Mine_Grd_13_WichtigePersonen_15_00");	//Кто здесь командует?
	AI_Output(self,other,"Info_Mine_Grd_13_WichtigePersonen_13_01");	//Главный здесь Асгхан. Но к нему лучше не подходить. Тебе стоит сначала поговорить с Яном.
};


instance INFO_MINE_GRD_13_DASLAGER(C_INFO)
{
	nr = 1;
	condition = info_mine_grd_13_daslager_condition;
	information = info_mine_grd_13_daslager_info;
	permanent = 1;
	description = "Расскажи мне о ползунах.";
};


func int info_mine_grd_13_daslager_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_grd_13_daslager_info()
{
	AI_Output(other,self,"Info_Mine_Grd_13_DasLager_15_00");	//Расскажи мне о ползунах.
	AI_Output(self,other,"Info_Mine_Grd_13_DasLager_13_01");	//Здесь на ползунов охотятся члены Братства. За это они отдают Старому лагерю часть своего урожая болотника.
};


instance INFO_MINE_GRD_13_DIELAGE(C_INFO)
{
	nr = 1;
	condition = info_mine_grd_13_dielage_condition;
	information = info_mine_grd_13_dielage_info;
	permanent = 1;
	description = "Как дела?";
};


func int info_mine_grd_13_dielage_condition()
{
	if(KAPITEL < 3)
	{
		return 1;
	};
};

func void info_mine_grd_13_dielage_info()
{
	AI_Output(other,self,"Info_Mine_Grd_13_DieLage_15_00");	//Как дела?
	AI_Output(self,other,"Info_Mine_Grd_13_DieLage_13_01");	//Я так давно не участвовал ни в одной битве!
};

func void b_assignambientinfos_mine_grd_13(var C_NPC slf)
{
	info_mine_grd_13_exit.npc = Hlp_GetInstanceID(slf);
	info_mine_grd_13_mine.npc = Hlp_GetInstanceID(slf);
	info_mine_grd_13_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_mine_grd_13_daslager.npc = Hlp_GetInstanceID(slf);
	info_mine_grd_13_dielage.npc = Hlp_GetInstanceID(slf);
};

