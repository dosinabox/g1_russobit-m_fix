
instance DIA_BUTCH_EXIT(C_INFO)
{
	npc = org_851_butch;
	nr = 999;
	condition = dia_butch_exit_condition;
	information = dia_butch_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_butch_exit_condition()
{
	return TRUE;
};

func void dia_butch_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUTCH_HELLO(C_INFO)
{
	npc = org_851_butch;
	nr = 1;
	condition = dia_butch_hello_condition;
	information = dia_butch_hello_info;
	important = 0;
	description = "Привет. Кто ты?";
};


func int dia_butch_hello_condition()
{
	return 1;
};

func void dia_butch_hello_info()
{
	AI_Output(other,self,"DIA_Butch_Hello_15_00");	//Привет. Кто ты?
	AI_Output(self,other,"DIA_Butch_Hello_13_01");	//Это тебя не касается! Что-то ты мне совсем не нравишься!
	AI_StopProcessInfos(self);
};

