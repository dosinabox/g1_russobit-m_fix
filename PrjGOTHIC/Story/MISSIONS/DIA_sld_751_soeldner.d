
instance DIA_SLD_751_SOELDNER_INTRO(C_INFO)
{
	npc = sld_751_soeldner;
	condition = dia_sld_751_soeldner_intro_condition;
	information = dia_sld_751_soeldner_intro_info;
	important = 1;
	permanent = 0;
};


func int dia_sld_751_soeldner_intro_condition()
{
	if(Npc_GetDistToNpc(self,hero) < 300)
	{
		return 1;
	};
};

func void dia_sld_751_soeldner_intro_info()
{
	AI_Output(self,other,"DIA_SLD_751_Soeldner_INTRO_INFO_01_01");	//А, новенький! Смотри, не создавай нам проблем, ведь мы спросим с тебя!
};


instance DIA_SLD_751_SOELDNER_EXIT_1(C_INFO)
{
	nr = 999;
	npc = sld_751_soeldner;
	condition = dia_sld_751_soeldner_exit_1_condition;
	information = dia_sld_751_soeldner_exit_1_info;
	important = 0;
	permanent = 0;
	description = "Пожалуй, я пойду.";
};


func int dia_sld_751_soeldner_exit_1_condition()
{
	return 1;
};

func void dia_sld_751_soeldner_exit_1_info()
{
	AI_Output(other,self,"DIA_SLD_751_Soeldner_EXIT_1_INFO_15_01");	//Пожалуй, я пойду.
	AI_Output(self,other,"DIA_SLD_751_Soeldner_EXIT_1_INFO_01_02");	//Надеюсь, ты понимаешь, как себя вести.
	AI_StopProcessInfos(self);
};


instance DIA_SLD_751_SOELDNER_EXIT_2(C_INFO)
{
	nr = 999;
	npc = sld_751_soeldner;
	condition = dia_sld_751_soeldner_exit_2_condition;
	information = dia_sld_751_soeldner_exit_2_info;
	important = 0;
	permanent = 1;
	description = "Я пойду, ладно?";
};


func int dia_sld_751_soeldner_exit_2_condition()
{
	if(Npc_KnowsInfo(hero,dia_sld_751_soeldner_exit_1))
	{
		return 1;
	};
};

func void dia_sld_751_soeldner_exit_2_info()
{
	AI_Output(other,self,"DIA_SLD_751_Soeldner_EXIT_2_INFO_15_01");	//Я пойду, ладно?
	AI_Output(self,other,"DIA_SLD_751_Soeldner_EXIT_2_INFO_01_02");	//Да, да, иди.
	AI_StopProcessInfos(self);
};


instance DIA_SLD_751_SOELDNER_UMSEHEN(C_INFO)
{
	npc = sld_751_soeldner;
	condition = dia_sld_751_soeldner_umsehen_condition;
	information = dia_sld_751_soeldner_umsehen_info;
	important = 0;
	permanent = 0;
	description = "Я просто хотел посмотреть, что здесь есть.";
};


func int dia_sld_751_soeldner_umsehen_condition()
{
	return 1;
};

func void dia_sld_751_soeldner_umsehen_info()
{
	AI_Output(other,self,"DIA_SLD_751_Soeldner_UMSEHEN_INFO_15_01");	//Я просто хотел посмотреть, что здесь есть.
	AI_Output(self,other,"DIA_SLD_751_Soeldner_UMSEHEN_INFO_01_02");	//Только будь осторожен и постарайся ни с кем не ссориться.
};


instance DIA_SLD_751_SOELDNER_INMINE(C_INFO)
{
	npc = sld_751_soeldner;
	condition = dia_sld_751_soeldner_inmine_condition;
	information = dia_sld_751_soeldner_inmine_info;
	important = 0;
	permanent = 0;
	description = "Я хочу осмотреть шахту.";
};


func int dia_sld_751_soeldner_inmine_condition()
{
	return 1;
};

func void dia_sld_751_soeldner_inmine_info()
{
	AI_Output(other,self,"DIA_SLD_751_Soeldner_INMINE_INFO_15_01");	//Я хочу осмотреть шахту.
	AI_Output(self,other,"DIA_SLD_751_Soeldner_INMINE_INFO_01_02");	//Не думаю, что у тебя это получится. Но можешь поговорить об этом с Окилом.
};

