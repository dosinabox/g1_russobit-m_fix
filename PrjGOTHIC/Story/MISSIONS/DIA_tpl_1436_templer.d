
instance TPL_1436_TEMPLER_EXIT(C_INFO)
{
	npc = tpl_1436_templer;
	nr = 999;
	condition = tpl_1436_templer_exit_condition;
	information = tpl_1436_templer_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int tpl_1436_templer_exit_condition()
{
	return TRUE;
};

func void tpl_1436_templer_exit_info()
{
	AI_StopProcessInfos(self);
};


instance TPL_1436_TEMPLER_CRAWLER(C_INFO)
{
	npc = tpl_1436_templer;
	condition = tpl_1436_templer_crawler_condition;
	information = tpl_1436_templer_crawler_info;
	important = 0;
	permanent = 1;
	description = "Как дела?";
};


func int tpl_1436_templer_crawler_condition()
{
	return TRUE;
};

func void tpl_1436_templer_crawler_info()
{
	AI_Output(other,self,"Tpl_1436_Templer_CRAWLER_Info_15_01");	//Как дела?
	AI_Output(self,other,"Tpl_1436_Templer_CRAWLER_Info_13_02");	//Не плохо. Охотимся на ползунов, а заодно и рудокопов защищаем, - недовольных нет.
	AI_Output(self,other,"Tpl_1436_Templer_CRAWLER_Info_13_03");	//Основная наша задача - это добывать слюну из челюстей этих ползучих тварей. Из нее Гуру Кор Галом готовит магические эликсиры.
};

