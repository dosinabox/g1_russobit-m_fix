
instance DIA_SLD_761_SOELDNER_INTRO(C_INFO)
{
	npc = sld_761_soeldner;
	condition = dia_sld_761_soeldner_intro_condition;
	information = dia_sld_761_soeldner_intro_info;
	important = 1;
	permanent = 0;
};


func int dia_sld_761_soeldner_intro_condition()
{
	if(Npc_GetDistToNpc(self,hero) < 300)
	{
		return 1;
	};
};

func void dia_sld_761_soeldner_intro_info()
{
	AI_Output(self,other,"DIA_SLD_761_Soeldner_INTRO_INFO_03_01");	//Что ты здесь делаешь?
};


instance DIA_SLD_761_SOELDNER_EXIT_1(C_INFO)
{
	nr = 999;
	npc = sld_761_soeldner;
	condition = dia_sld_761_soeldner_exit_1_condition;
	information = dia_sld_761_soeldner_exit_1_info;
	important = 0;
	permanent = 0;
	description = "Думаю, у меня есть более важные дела.";
};


func int dia_sld_761_soeldner_exit_1_condition()
{
	return 1;
};

func void dia_sld_761_soeldner_exit_1_info()
{
	AI_Output(other,self,"DIA_SLD_761_Soeldner_EXIT_1_INFO_15_01");	//Думаю, у меня есть более важные дела.
	AI_Output(self,other,"DIA_SLD_761_Soeldner_EXIT_1_INFO_03_02");	//Я тоже так думаю.
	AI_StopProcessInfos(self);
};


instance DIA_SLD_761_SOELDNER_EXIT_2(C_INFO)
{
	nr = 999;
	npc = sld_761_soeldner;
	condition = dia_sld_761_soeldner_exit_2_condition;
	information = dia_sld_761_soeldner_exit_2_info;
	important = 0;
	permanent = 1;
	description = "Лучше я пойду отсюда...";
};


func int dia_sld_761_soeldner_exit_2_condition()
{
	if(Npc_KnowsInfo(hero,dia_sld_761_soeldner_exit_1))
	{
		return 1;
	};
};

func void dia_sld_761_soeldner_exit_2_info()
{
	AI_Output(other,self,"DIA_SLD_761_Soeldner_EXIT_2_INFO_15_01");	//Лучше я пойду отсюда...
	AI_Output(self,other,"DIA_SLD_761_Soeldner_EXIT_2_INFO_03_02");	//Хорошо.
	AI_StopProcessInfos(self);
};


instance DIA_SLD_761_SOELDNER_UMSEHEN(C_INFO)
{
	npc = sld_761_soeldner;
	condition = dia_sld_761_soeldner_umsehen_condition;
	information = dia_sld_761_soeldner_umsehen_info;
	important = 0;
	permanent = 0;
	description = "Я просто хотел посмотреть лагерь.";
};


func int dia_sld_761_soeldner_umsehen_condition()
{
	return 1;
};

func void dia_sld_761_soeldner_umsehen_info()
{
	AI_Output(other,self,"DIA_SLD_761_Soeldner_UMSEHEN_INFO_15_01");	//Я просто хотел посмотреть лагерь.
	AI_Output(self,other,"DIA_SLD_761_Soeldner_UMSEHEN_INFO_03_02");	//Это не место для прогулок, а вход в шахту. Посторонним сюда нельзя.
};


instance DIA_SLD_761_SOELDNER_INMINE(C_INFO)
{
	npc = sld_761_soeldner;
	condition = dia_sld_761_soeldner_inmine_condition;
	information = dia_sld_761_soeldner_inmine_info;
	important = 0;
	permanent = 0;
	description = "Я просто хотел осмотреть шахту.";
};


func int dia_sld_761_soeldner_inmine_condition()
{
	return 1;
};

func void dia_sld_761_soeldner_inmine_info()
{
	AI_Output(other,self,"DIA_SLD_761_Soeldner_INMINE_INFO_15_01");	//Я просто хотел осмотреть шахту.
	AI_Output(self,other,"DIA_SLD_761_Soeldner_INMINE_INFO_03_02");	//Ты же видишь, что шахта закрыта. Тебе здесь не место.
};


instance DIA_SLD_761_SOELDNER_BRIBE(C_INFO)
{
	npc = sld_761_soeldner;
	condition = dia_sld_761_soeldner_bribe_condition;
	information = dia_sld_761_soeldner_bribe_info;
	important = 0;
	permanent = 0;
	description = "Значит, ничего нельзя сделать?";
};


func int dia_sld_761_soeldner_bribe_condition()
{
	if(Npc_KnowsInfo(hero,dia_sld_761_soeldner_inmine))
	{
		return 1;
	};
};

func void dia_sld_761_soeldner_bribe_info()
{
	AI_Output(other,self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_01");	//Значит, ничего нельзя сделать?
	AI_Output(self,other,"DIA_SLD_761_Soeldner_Bribe_INFO_03_02");	//А что тут можно сделать?
	AI_Output(self,other,"DIA_SLD_761_Soeldner_Bribe_INFO_03_03");	//Постой-ка! Если ты думаешь меня подкупить, то у тебя ничего не выйдет.
	AI_Output(other,self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_04");	//Да я и не думал подкупать тебя, я просто подумал...
	AI_Output(other,self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_05");	//Лучше мне уйти отсюда.
	AI_StopProcessInfos(self);
};

