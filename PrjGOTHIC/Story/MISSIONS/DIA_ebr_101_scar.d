
instance DIA_SCAR_EXIT(C_INFO)
{
	npc = ebr_101_scar;
	nr = 999;
	condition = dia_scar_exit_condition;
	information = dia_scar_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_scar_exit_condition()
{
	return 1;
};

func void dia_scar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SCAR_HELLO(C_INFO)
{
	npc = ebr_101_scar;
	nr = 3;
	condition = dia_scar_hello_condition;
	information = dia_scar_hello_info;
	permanent = 0;
	description = "Ты кто?";
};


func int dia_scar_hello_condition()
{
	return 1;
};

func void dia_scar_hello_info()
{
	AI_Output(other,self,"DIA_SCAR_Hello_15_00");	//Ты кто?
	AI_Output(self,other,"DIA_SCAR_Hello_08_01");	//Все называют меня Шрам.
};


instance DIA_SCAR_WHAT(C_INFO)
{
	npc = ebr_101_scar;
	nr = 3;
	condition = dia_scar_what_condition;
	information = dia_scar_what_info;
	permanent = 0;
	description = "И чем ты занимаешься?";
};


func int dia_scar_what_condition()
{
	if(Npc_KnowsInfo(hero,dia_scar_hello))
	{
		return 1;
	};
};

func void dia_scar_what_info()
{
	AI_Output(other,self,"DIA_SCAR_What_15_00");	//И чем ты занимаешься?
	AI_Output(self,other,"DIA_SCAR_What_08_01");	//Я и мой напарник Арто следим за тем, чтобы к Гомезу не заходили непрошенные гости.
	AI_Output(self,other,"DIA_SCAR_What_08_02");	//Еще мы заботимся о том, чтобы никто не подходил к женщинам слишком близко.
};


instance DIA_SCAR_FRAU(C_INFO)
{
	npc = ebr_101_scar;
	nr = 3;
	condition = dia_scar_frau_condition;
	information = dia_scar_frau_info;
	permanent = 0;
	description = "Когда меня отправляли сюда, я видел женщину.";
};


func int dia_scar_frau_condition()
{
	if(Npc_KnowsInfo(hero,dia_scar_what))
	{
		return 1;
	};
};

func void dia_scar_frau_info()
{
	AI_Output(other,self,"DIA_SCAR_Frau_15_00");	//Когда меня отправляли сюда, я видел женщину на платформе с товаром.
	AI_Output(self,other,"DIA_SCAR_Frau_08_01");	//Ну и что?
	AI_Output(other,self,"DIA_SCAR_Frau_15_02");	//Она здесь?
	AI_Output(self,other,"DIA_SCAR_Frau_08_03");	//Если она тебе понравилась, мой тебе совет: забудь о ней.
	AI_Output(self,other,"DIA_SCAR_Frau_08_04");	//Как только она здесь появилась, Гомез отвел ее в свою комнату и запер там.
	AI_Output(self,other,"DIA_SCAR_Frau_08_05");	//Когда она ему надоест, он отправит ее вниз. Но пока она принадлежит ему, так что лучше перестань о ней вспоминать.
};


instance DIA_SCAR_PERM(C_INFO)
{
	npc = ebr_101_scar;
	nr = 3;
	condition = dia_scar_perm_condition;
	information = dia_scar_perm_info;
	permanent = 1;
	description = "Что ты знаешь о Гомезе?";
};


func int dia_scar_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_scar_frau))
	{
		return 1;
	};
};

func void dia_scar_perm_info()
{
	AI_Output(other,self,"DIA_SCAR_PERM_15_00");	//Что ты знаешь о Гомезе?
	AI_Output(self,other,"DIA_SCAR_PERM_08_01");	//Я могу сказать тебе только то, что он один из самых влиятельных людей колонии.
	AI_Output(self,other,"DIA_SCAR_PERM_08_02");	//Он может получить все, что хочет, но единственное, что ему действительно нужно - это власть.
};

