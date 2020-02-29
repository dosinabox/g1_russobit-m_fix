
instance DIA_846_EXIT(C_INFO)
{
	npc = org_846_schlaeger;
	nr = 999;
	condition = dia_846_exit_condition;
	information = dia_846_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_846_exit_condition()
{
	return 1;
};

func void dia_846_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_846_HELLO(C_INFO)
{
	npc = org_846_schlaeger;
	nr = 1;
	condition = dia_846_hello_condition;
	information = dia_846_hello_info;
	permanent = 0;
	description = "Что ты здесь делаешь?";
};


func int dia_846_hello_condition()
{
	return 1;
};

func void dia_846_hello_info()
{
	var C_NPC lefty;
	AI_Output(other,self,"DIA_846_Hello_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_846_Hello_07_01");	//Я работаю на Лорда.
	lefty = Hlp_GetNpc(org_844_lefty);
	if(!Npc_IsDead(lefty))
	{
		AI_Output(self,other,"DIA_846_Hello_07_02");	//Если тебе нужна работа, поговори с Лефти.
	};
};

