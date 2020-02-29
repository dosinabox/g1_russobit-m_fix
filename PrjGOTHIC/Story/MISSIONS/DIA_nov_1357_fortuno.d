
instance DIA_FORTUNO_EXIT(C_INFO)
{
	npc = nov_1357_fortuno;
	nr = 999;
	condition = dia_fortuno_exit_condition;
	information = dia_fortuno_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_fortuno_exit_condition()
{
	return 1;
};

func void dia_fortuno_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_FORTUNO_GREET(C_INFO)
{
	npc = nov_1357_fortuno;
	nr = 1;
	condition = dia_fortuno_greet_condition;
	information = dia_fortuno_greet_info;
	permanent = 0;
	important = 1;
};


func int dia_fortuno_greet_condition()
{
	if(Npc_GetDistToNpc(self,other) <= ZIVILANQUATSCHDIST)
	{
		return 1;
	};
};

func void dia_fortuno_greet_info()
{
	AI_Output(self,other,"DIA_Fortuno_Greet_05_00");	//Иди-ка сюда. Я ни одного новичка не отпускаю без подарка.
};


var int fortuno_rationday;

instance DIA_FORTUNO_GETGESCHENK(C_INFO)
{
	npc = nov_1357_fortuno;
	nr = 1;
	condition = dia_fortuno_getgeschenk_condition;
	information = dia_fortuno_getgeschenk_info;
	permanent = 0;
	description = "Что это за подарок?";
};


func int dia_fortuno_getgeschenk_condition()
{
	return 1;
};

func void dia_fortuno_getgeschenk_info()
{
	AI_Output(other,self,"DIA_Fortuno_GetGeschenk_15_00");	//Что это за подарок?
	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_01");	//Вот, возьми этот болотник. Это 'Северный темный'. Отличная вещь!
	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_02");	//Каждый день я буду давать тебе немного болотника, но если тебе нужно больше, чем три сигареты, ты должен будешь заплатить.
	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_03");	//Если найдешь какие-нибудь травы или ягоды, заходи ко мне. Я с удовольствием куплю их у тебя.
	CreateInvItems(self,itmijoint_2,3);
	b_giveinvitems(self,other,itmijoint_2,3);
	FORTUNO_RATIONDAY = Wld_GetDay();
	Log_CreateTopic(GE_TRADERPSI,LOG_NOTE);
	b_logentry(GE_TRADERPSI,"Фортуно торгует травами. Его дом находится под лабораторией Кор Галома.");
};


instance DIA_FORTUNO_DAILYRATION(C_INFO)
{
	npc = nov_1357_fortuno;
	nr = 3;
	condition = dia_fortuno_dailyration_condition;
	information = dia_fortuno_dailyration_info;
	permanent = 1;
	description = "Я хочу взять дневную порцию болотника.";
};


func int dia_fortuno_dailyration_condition()
{
	if(Npc_KnowsInfo(hero,dia_fortuno_getgeschenk))
	{
		return 1;
	};
};

func void dia_fortuno_dailyration_info()
{
	AI_Output(other,self,"DIA_Fortuno_DailyRation_15_00");	//Я хочу взять дневную порцию болотника.
	if(FORTUNO_RATIONDAY != Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Fortuno_DailyRation_05_01");	//Вот, возьми. Три 'Северных темных'. Только не стоит курить их все сразу!
		CreateInvItems(self,itmijoint_2,3);
		b_giveinvitems(self,other,itmijoint_2,3);
		FORTUNO_RATIONDAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Fortuno_DailyRation_05_02");	//Свою дневную порцию ты уже получил. Если тебе нужно больше, приходи утром, или купи сейчас.
	};
};


instance DIA_FORTUNO_BUYJOINTS(C_INFO)
{
	npc = nov_1357_fortuno;
	nr = 4;
	condition = dia_fortuno_buyjoints_condition;
	information = dia_fortuno_buyjoints_info;
	permanent = 1;
	description = "Давай меняться.";
	trade = 1;
};


func int dia_fortuno_buyjoints_condition()
{
	if(Npc_KnowsInfo(hero,dia_fortuno_getgeschenk))
	{
		return 1;
	};
};

func void dia_fortuno_buyjoints_info()
{
	AI_Output(other,self,"DIA_Fortuno_BuyJoints_15_00");	//Давай меняться.
	AI_Output(self,other,"DIA_Fortuno_BuyJoints_05_01");	//Что ты от меня хочешь? Быть может, что-нибудь купить?
};

