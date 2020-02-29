
instance DIA_CUTTER_EXIT(C_INFO)
{
	npc = grd_208_cutter;
	nr = 999;
	condition = dia_cutter_exit_condition;
	information = dia_cutter_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_cutter_exit_condition()
{
	return 1;
};

func void dia_cutter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CUTTER_HELLO(C_INFO)
{
	npc = grd_208_cutter;
	nr = 1;
	condition = dia_cutter_hello_condition;
	information = dia_cutter_hello_info;
	permanent = 0;
	description = "Да, какой большой замок.";
};


func int dia_cutter_hello_condition()
{
	if(!c_npcbelongstooldcamp(other))
	{
		return 1;
	};
};

func void dia_cutter_hello_info()
{
	AI_Output(other,self,"DIA_Cutter_Hello_15_00");	//Да, какой большой замок.
	AI_Output(self,other,"DIA_Cutter_Hello_08_01");	//Раньше я тебя здесь не видел. Кто ты?
	AI_Output(other,self,"DIA_Cutter_Hello_15_02");	//Я здесь недавно. Хочу немного осмотреть это место.
};


instance DIA_CUTTER_BURG(C_INFO)
{
	npc = grd_208_cutter;
	nr = 1;
	condition = dia_cutter_burg_condition;
	information = dia_cutter_burg_info;
	permanent = 10;
	description = "Ты можешь рассказать мне что-нибудь о замке?";
};


func int dia_cutter_burg_condition()
{
	if(Npc_KnowsInfo(hero,dia_cutter_hello))
	{
		return 1;
	};
};

func void dia_cutter_burg_info()
{
	AI_Output(other,self,"DIA_Cutter_Burg_15_00");	//Ты можешь рассказать мне что-нибудь о замке?
	AI_Output(self,other,"DIA_Cutter_Burg_08_01");	//После великого восстания он был занят Гомезом и его людьми. Теперь никто другой не смеет приближаться к нему.
	AI_Output(self,other,"DIA_Cutter_Burg_08_02");	//Я еще тогда понял, что лучше всего будет присоединиться к Гомезу.
	AI_Output(self,other,"DIA_Cutter_Burg_08_03");	//Еще в те времена, когда все мы сидели в подземельях и работали на шахте, он был самым влиятельным среди заключенных.
	AI_Output(other,self,"DIA_Cutter_Burg_15_04");	//Так под замком есть подземелья?
	AI_Output(self,other,"DIA_Cutter_Burg_08_05");	//Да, но сейчас они пусты. Со времен восстания туда никто не спускался.
};


instance DIA_CUTTER_PERM(C_INFO)
{
	npc = grd_208_cutter;
	nr = 1;
	condition = dia_cutter_perm_condition;
	information = dia_cutter_perm_info;
	permanent = 1;
	description = "Как живется здесь стражникам?";
};


func int dia_cutter_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_cutter_burg))
	{
		return 1;
	};
};

func void dia_cutter_perm_info()
{
	AI_Output(other,self,"DIA_Cutter_PERM_15_00");	//Как живется здесь стражникам?
	AI_Output(self,other,"DIA_Cutter_PERM_08_01");	//Спокойно живется. Наш лагерь сильнейший в колонии. С нами лучше не ссориться.
	AI_Output(other,self,"DIA_Cutter_PERM_15_02");	//Я уже понял.
	AI_StopProcessInfos(self);
};


instance GRD_208_CUTTER_WELCOME(C_INFO)
{
	npc = grd_208_cutter;
	condition = grd_208_cutter_welcome_condition;
	information = grd_208_cutter_welcome_info;
	important = 1;
	permanent = 0;
};


func int grd_208_cutter_welcome_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void grd_208_cutter_welcome_info()
{
	AI_Output(self,other,"GRD_208_Cutter_WELCOME_Info_08_01");	//Ты принял правильное решение. Думаю, тебе понравится быть стражником.
	AI_StopProcessInfos(self);
};

