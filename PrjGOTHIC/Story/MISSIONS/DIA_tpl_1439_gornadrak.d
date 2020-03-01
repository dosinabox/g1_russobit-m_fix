
instance DIA_GORNADRAK_EXIT(C_INFO)
{
	npc = tpl_1439_gornadrak;
	nr = 999;
	condition = dia_gornadrak_exit_condition;
	information = dia_gornadrak_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_gornadrak_exit_condition()
{
	return 1;
};

func void dia_gornadrak_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORNADRAK_GREET(C_INFO)
{
	npc = tpl_1439_gornadrak;
	nr = 1;
	condition = dia_gornadrak_greet_condition;
	information = dia_gornadrak_greet_info;
	permanent = 0;
	description = "Привет! Куда вы идете?";
};


func int dia_gornadrak_greet_condition()
{
	if(!Npc_KnowsInfo(hero,info_corkalom_bringmcqballs_success))
	{
		return 1;
	};
};

func void dia_gornadrak_greet_info()
{
	AI_Output(other,self,"DIA_GorNaDrak_Greet_15_00");	//Привет! Куда вы идете?
	AI_Output(self,other,"DIA_GorNaDrak_Greet_09_01");	//Мы несем Кор Галому слюну ползунов, убитых нашими братьями в Старой шахте.
	AI_Output(self,other,"DIA_GorNaDrak_Greet_09_02");	//Раз в день мы приходим к ним и забираем их добычу.
};


instance DIA_GORNADRAK_WASSEKRET(C_INFO)
{
	npc = tpl_1439_gornadrak;
	nr = 1;
	condition = dia_gornadrak_wassekret_condition;
	information = dia_gornadrak_wassekret_info;
	permanent = 0;
	description = "О какой слюне ты говоришь?";
};


func int dia_gornadrak_wassekret_condition()
{
	if(Npc_KnowsInfo(hero,dia_gornadrak_greet) && !Npc_KnowsInfo(hero,info_corkalom_bringmcqballs_success))
	{
		return 1;
	};
};

func void dia_gornadrak_wassekret_info()
{
	AI_Output(other,self,"DIA_GorNaDrak_WasSekret_15_00");	//О какой слюне ты говоришь?
	AI_Output(self,other,"DIA_GorNaDrak_WasSekret_09_01");	//Ее производят особые железы в пасти ползунов. Но чтобы ее добыть, нужно знать несколько особых приемов.
};


instance DIA_GORNADRAK_TEACHMANDIBLES(C_INFO)
{
	npc = tpl_1439_gornadrak;
	nr = 1;
	condition = dia_gornadrak_teachmandibles_condition;
	information = dia_gornadrak_teachmandibles_info;
	permanent = 0;
	description = "Ты можешь рассказать мне, как добывать слюну?";
};


func int dia_gornadrak_teachmandibles_condition()
{
	if(Npc_KnowsInfo(hero,dia_gornadrak_wassekret) && (KNOWS_GETMCMANDIBLES == FALSE))
	{
		return 1;
	};
};

func void dia_gornadrak_teachmandibles_info()
{
	AI_Output(other,self,"DIA_GorNaDrak_TeachMandibles_15_00");	//Ты можешь рассказать мне, как добывать слюну?
	AI_Output(self,other,"DIA_GorNaDrak_TeachMandibles_09_01");	//Конечно. Убив ползуна, ухватись покрепче за клыки и дергай их на себя. Так ты вырвешь челюсти вместе с железами, которые при этом останутся целыми.
	b_learn_trophies_mandibles();
};


instance DIA_GORNADRAK_WHATFOR(C_INFO)
{
	npc = tpl_1439_gornadrak;
	nr = 1;
	condition = dia_gornadrak_whatfor_condition;
	information = dia_gornadrak_whatfor_info;
	permanent = 0;
	description = "А зачем Кор Галому нужна эта слюна?";
};


func int dia_gornadrak_whatfor_condition()
{
	if(Npc_KnowsInfo(hero,dia_gornadrak_wassekret))
	{
		return 1;
	};
};

func void dia_gornadrak_whatfor_info()
{
	AI_Output(other,self,"DIA_GorNaDrak_WhatFor_15_00");	//А зачем Кор Галому нужна эта слюна?
	AI_Output(self,other,"DIA_GorNaDrak_WhatFor_09_01");	//Насколько я знаю, он готовит из нее зелья, повышающие магическую силу наших послушников.
	AI_Output(self,other,"DIA_GorNaDrak_WhatFor_09_02");	//Мы ведь готовимся к великой Церемонии, и к тому времени у нас должно быть столько зелья, чтобы его хватило на всех.
	AI_Output(self,other,"DIA_GorNaDrak_WhatFor_09_03");	//С его помощью Кор Галом сможет подготовить всех послушников к этому великому дню.
};


instance DIA_GORNADRAK_PERMANENT(C_INFO)
{
	npc = tpl_1439_gornadrak;
	nr = 1;
	condition = dia_gornadrak_permanent_condition;
	information = dia_gornadrak_permanent_info;
	permanent = 1;
	description = "У вас уже достаточно зелья для великой Церемонии?";
};


func int dia_gornadrak_permanent_condition()
{
	if(Npc_KnowsInfo(hero,dia_gornadrak_whatfor) && (KAPITEL < 3))
	{
		return 1;
	};
};

func void dia_gornadrak_permanent_info()
{
	AI_Output(other,self,"DIA_GorNaDrak_Permanent_15_00");	//У вас уже достаточно зелья для великой Церемонии?
	if(CORKALOM_BRINGMCQBALLS == LOG_SUCCESS)
	{
		AI_Output(self,other,"SVM_9_LookAway");	//Да! Погода сегодня отличная!
	}
	else
	{
		AI_Output(self,other,"DIA_GorNaDrak_Permanent_09_01");	//Нет. Нам нужно еще очень много слюны. Нашим Стражам приходится охотиться на ползунов в Старой шахте и днем, и ночью.
	};
};

