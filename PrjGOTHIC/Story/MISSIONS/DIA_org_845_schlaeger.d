
instance DIA_845_EXIT(C_INFO)
{
	npc = org_845_schlaeger;
	nr = 999;
	condition = dia_lefty_exit_condition;
	information = dia_lefty_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_845_exit_condition()
{
	return 1;
};

func void dia_845_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_845_HELLO(C_INFO)
{
	npc = org_845_schlaeger;
	nr = 1;
	condition = dia_845_hello_condition;
	information = dia_845_hello_info;
	permanent = 0;
	description = "Что ты делаешь?";
};


func int dia_845_hello_condition()
{
	return 1;
};

func void dia_845_hello_info()
{
	var C_NPC lefty;
	AI_Output(other,self,"DIA_845_Hello_15_00");	//Что ты делаешь?
	AI_Output(self,other,"DIA_845_Hello_13_01");	//Я работаю на Лорда.
	lefty = Hlp_GetNpc(org_844_lefty);
	if(!Npc_IsDead(lefty))
	{
		AI_Output(self,other,"DIA_845_Hello_13_02");	//Если тебе что-нибудь нужно, поговори с Лефти.
	};
};

