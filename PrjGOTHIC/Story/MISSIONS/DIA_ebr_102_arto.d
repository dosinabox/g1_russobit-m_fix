
instance DIA_ARTO_EXIT(C_INFO)
{
	npc = ebr_102_arto;
	nr = 999;
	condition = dia_arto_exit_condition;
	information = dia_arto_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_arto_exit_condition()
{
	return 1;
};

func void dia_arto_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ARTO_HELLO(C_INFO)
{
	npc = ebr_102_arto;
	nr = 3;
	condition = dia_arto_hello_condition;
	information = dia_arto_hello_info;
	permanent = 0;
	description = "Ты кто?";
};


func int dia_arto_hello_condition()
{
	return 1;
};

func void dia_arto_hello_info()
{
	AI_Output(other,self,"DIA_ARTO_Hello_15_00");	//Ты кто?
	AI_Output(self,other,"DIA_ARTO_Hello_13_01");	//Я Арто.
};


instance DIA_ARTO_WHAT(C_INFO)
{
	npc = ebr_102_arto;
	nr = 3;
	condition = dia_arto_what_condition;
	information = dia_arto_what_info;
	permanent = 0;
	description = "Что ты здесь делаешь?";
};


func int dia_arto_what_condition()
{
	if(Npc_KnowsInfo(hero,dia_arto_hello))
	{
		return 1;
	};
};

func void dia_arto_what_info()
{
	AI_Output(other,self,"DIA_ARTO_What_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_ARTO_What_13_01");	//Я охраняю Гомеза.
};


instance DIA_ARTO_PERM(C_INFO)
{
	npc = ebr_102_arto;
	nr = 3;
	condition = dia_arto_perm_condition;
	information = dia_arto_perm_info;
	permanent = 1;
	description = "А ты, вижу, неразговорчивый?";
};


func int dia_arto_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_arto_what))
	{
		return 1;
	};
};

func void dia_arto_perm_info()
{
	AI_Output(other,self,"DIA_ARTO_PERM_15_00");	//А ты, вижу, неразговорчивый?
	AI_Output(self,other,"DIA_ARTO_PERM_13_01");	//Точно.
};

