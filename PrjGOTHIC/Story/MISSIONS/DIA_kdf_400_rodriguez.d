
instance DIA_RODRIGUEZ_EXIT(C_INFO)
{
	npc = kdf_400_rodriguez;
	nr = 999;
	condition = dia_rodriguez_exit_condition;
	information = dia_rodriguez_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_rodriguez_exit_condition()
{
	return 1;
};

func void dia_rodriguez_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RODRIGUEZ_HELLO(C_INFO)
{
	npc = kdf_400_rodriguez;
	nr = 1;
	condition = dia_rodriguez_hello_condition;
	information = dia_rodriguez_hello_info;
	permanent = 1;
	description = "Я ищу Верховного Мага Круга Огня.";
};


func int dia_rodriguez_hello_condition()
{
	if(Npc_GetTrueGuild(hero) != GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_rodriguez_hello_info()
{
	AI_Output(other,self,"DIA_Rodriguez_Hello_15_00");	//Я ищу Верховного Мага Круга Огня.
	AI_Output(self,other,"DIA_Rodriguez_Hello_12_01");	//Отправляйся к Мильтену. Он у нас занимается гонцами.
	AI_StopProcessInfos(self);
};

