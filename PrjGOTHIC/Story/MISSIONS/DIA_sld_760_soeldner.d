
instance DIA_SLD_760_SOELDNER_INTRO(C_INFO)
{
	npc = sld_760_soeldner;
	condition = dia_sld_760_soeldner_intro_condition;
	information = dia_sld_760_soeldner_intro_info;
	important = 1;
	permanent = 0;
};


func int dia_sld_760_soeldner_intro_condition()
{
	if(Npc_GetDistToNpc(self,hero) < 200)
	{
		return 1;
	};
};

func void dia_sld_760_soeldner_intro_info()
{
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INTRO_INFO_13_01");	//Что это ты здесь делаешь? Убери руки от этой двери, я повторять не буду!
};


instance DIA_SLD_760_SOELDNER_EXIT_1(C_INFO)
{
	nr = 999;
	npc = sld_760_soeldner;
	condition = dia_sld_760_soeldner_exit_1_condition;
	information = dia_sld_760_soeldner_exit_1_info;
	important = 0;
	permanent = 0;
	description = "Думаю, мне следует уйти.";
};


func int dia_sld_760_soeldner_exit_1_condition()
{
	return 1;
};

func void dia_sld_760_soeldner_exit_1_info()
{
	AI_Output(other,self,"DIA_SLD_760_Soeldner_EXIT_1_INFO_15_01");	//Думаю, мне следует уйти.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_EXIT_1_INFO_13_02");	//Надеюсь, мы понимаем друг друга.
	AI_StopProcessInfos(self);
};


instance DIA_SLD_760_SOELDNER_EXIT_2(C_INFO)
{
	nr = 999;
	npc = sld_760_soeldner;
	condition = dia_sld_760_soeldner_exit_2_condition;
	information = dia_sld_760_soeldner_exit_2_info;
	important = 0;
	permanent = 1;
	description = "Я уже ухожу.";
};


func int dia_sld_760_soeldner_exit_2_condition()
{
	if(Npc_KnowsInfo(hero,dia_sld_760_soeldner_exit_1))
	{
		return 1;
	};
};

func void dia_sld_760_soeldner_exit_2_info()
{
	AI_Output(other,self,"DIA_SLD_760_Soeldner_EXIT_2_INFO_15_01");	//Я уже ухожу.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_EXIT_2_INFO_13_02");	//Уйди. Добром прошу.
	AI_StopProcessInfos(self);
};


instance DIA_SLD_760_SOELDNER_UMSEHEN(C_INFO)
{
	npc = sld_760_soeldner;
	condition = dia_sld_760_soeldner_umsehen_condition;
	information = dia_sld_760_soeldner_umsehen_info;
	important = 0;
	permanent = 0;
	description = "Я просто хочу немного оглядеться.";
};


func int dia_sld_760_soeldner_umsehen_condition()
{
	return 1;
};

func void dia_sld_760_soeldner_umsehen_info()
{
	AI_Output(other,self,"DIA_SLD_760_Soeldner_UMSEHEN_INFO_15_01");	//Я просто хочу немного оглядеться.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_UMSEHEN_INFO_13_02");	//Тогда не распускай руки, иначе будет хуже.
};


instance DIA_SLD_760_SOELDNER_INMINE(C_INFO)
{
	npc = sld_760_soeldner;
	condition = dia_sld_760_soeldner_inmine_condition;
	information = dia_sld_760_soeldner_inmine_info;
	important = 0;
	permanent = 0;
	description = "Я хочу посмотреть шахту.";
};


func int dia_sld_760_soeldner_inmine_condition()
{
	return 1;
};

func void dia_sld_760_soeldner_inmine_info()
{
	AI_Output(other,self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_01");	//Я хочу посмотреть шахту.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_02");	//В шахту? Без разрешения Окила туда вход закрыт.
	if(!Npc_KnowsInfo(hero,dia_sld_752_okyl_werbistdu))
	{
		AI_Output(other,self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_03");	//Кто такой Окил?
	}
	else
	{
		AI_Output(other,self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_08");	//Не тот ли это тип в хорошей броне и с большим топором?
	};
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_04");	//Поосторожнее в выражениях, особенно если это касается нашего босса.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_05");	//Я скажу тебе вот что: нет в Новом лагере человека круче Окила. Однажды он даже пробрался к рудным Баронам. После этого они не досчитались целой горы руды.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_06");	//Так что он заслуживает уважения.
	AI_Output(self,other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_07");	//Не знаю, где он сейчас, но если ты его встретишь, не забывай о моих словах.
};

