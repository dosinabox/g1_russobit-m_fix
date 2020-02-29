
instance DIA_SFB_1001_EXIT(C_INFO)
{
	npc = sfb_1001_schuerfer;
	nr = 999;
	condition = dia_sfb_1001_exit_condition;
	information = dia_sfb_1001_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_sfb_1001_exit_condition()
{
	return 1;
};

func void dia_sfb_1001_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SFB_1001_HELLO(C_INFO)
{
	npc = sfb_1001_schuerfer;
	nr = 1;
	condition = dia_sfb_1001_hello_condition;
	information = dia_sfb_1001_hello_info;
	permanent = 1;
	description = "Как дела в шахте?";
};


func int dia_sfb_1001_hello_condition()
{
	if(FMTAKEN == FALSE)
	{
		return 1;
	};
};

func void dia_sfb_1001_hello_info()
{
	AI_Output(other,self,"DIA_Sfb_1001_Hello_15_00");	//Как дела в шахте?
	AI_Output(self,other,"DIA_Sfb_1001_Hello_02_01");	//Самое сложное позади. Еще пара недель, и у нас будет достаточно руды.
	AI_StopProcessInfos(self);
};

