
instance DIA_TORLOF_EXIT(C_INFO)
{
	npc = sld_737_torlof;
	nr = 999;
	condition = dia_torlof_exit_condition;
	information = dia_torlof_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_torlof_exit_condition()
{
	return 1;
};

func void dia_torlof_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_HALLO(C_INFO)
{
	npc = sld_737_torlof;
	nr = 1;
	condition = dia_torlof_hallo_condition;
	information = dia_torlof_hallo_info;
	permanent = 0;
	description = "Кто ты такой?";
};


func int dia_torlof_hallo_condition()
{
	return 1;
};

func void dia_torlof_hallo_info()
{
	AI_Output(other,self,"DIA_Torlof_Hallo_15_00");	//Кто ты такой?
	AI_Output(self,other,"DIA_Torlof_Hallo_04_01");	//Торлоф.
	AI_Output(self,other,"DIA_Torlof_Hallo_04_02");	//Я был одним из главных организаторов мятежа на одном из военных кораблей.
	AI_Output(self,other,"DIA_Torlof_Hallo_04_03");	//Не стоило этого затевать. Большая часть команды была на стороне капитана.
	AI_Output(self,other,"DIA_Torlof_Hallo_04_04");	//Вот поэтому я и попал сюда.
};


instance DIA_TORLOF_MITMACHEN(C_INFO)
{
	npc = sld_737_torlof;
	nr = 2;
	condition = dia_torlof_mitmachen_condition;
	information = dia_torlof_mitmachen_info;
	permanent = 1;
	description = "Я хочу стать одним из вас.";
};


func int dia_torlof_mitmachen_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_NONE) || (Npc_GetTrueGuild(hero) == GIL_ORG))
	{
		return 1;
	};
};

func void dia_torlof_mitmachen_info()
{
	AI_Output(other,self,"DIA_Torlof_Mitmachen_15_00");	//Я хочу стать одним из вас.
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_01");	//Ли не возьмет к себе неизвестно кого. Сначала ты должен показать, на что ты способен.
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_02");	//А до этого тебе придется иметь дело с Ларсом и его шайкой.
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_03");	//Если хочешь, послушайся моего совета: укради что-нибудь ценное из Старого лагеря или из Старой шахты.
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_04");	//Если воры из шайки Ларса поймут, что ты тоже против Гомеза, тебя легко примут в наш лагерь.
	AI_Output(other,self,"DIA_Torlof_Mitmachen_15_05");	//А как мне украсть что-то ценное?
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_06");	//Сначала постарайся войти к ним в доверие, а потом ты запросто сможешь их ограбить!
};

