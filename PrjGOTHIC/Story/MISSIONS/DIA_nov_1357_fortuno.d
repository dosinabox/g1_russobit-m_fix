
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
	if(KAPITEL < 3)
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
	if(Npc_KnowsInfo(hero,dia_fortuno_greet) && (KAPITEL < 3))
	{
		return 1;
	};
};

func void dia_fortuno_getgeschenk_info()
{
	AI_Output(other,self,"DIA_Fortuno_GetGeschenk_15_00");	//Что это за подарок?
	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_01");	//Вот, возьми этот болотник. Это 'Северный темный'. Отличная вещь!
	b_printtrademsg1("Получено 3 'Северных темных'.");
	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_02");	//Каждый день я буду давать тебе немного болотника, но если тебе нужно больше, чем три сигареты, ты должен будешь заплатить.
	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_03");	//Если найдешь какие-нибудь травы или ягоды, заходи ко мне. Я с удовольствием куплю их у тебя.
	CreateInvItems(self,itmijoint_2,3);
	b_giveinvitems(self,other,itmijoint_2,3);
	FORTUNO_RATIONDAY = Wld_GetDay();
	Log_CreateTopic(GE_TRADERPSI,LOG_NOTE);
	b_logentry(GE_TRADERPSI,"Фортуно торгует травами и алхимическими принадлежностями. Его дом находится под лабораторией Кор Галома.");
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
	if(Npc_KnowsInfo(hero,dia_fortuno_getgeschenk) && (KAPITEL < 3))
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
		b_printtrademsg1("Получено 3 'Северных темных'.");
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
	permanent = 0;
	description = "Давай меняться.";
	trade = 1;
};


func int dia_fortuno_buyjoints_condition()
{
	if(Npc_KnowsInfo(hero,dia_fortuno_getgeschenk) || KAPITEL > 2)
	{
		return 1;
	};
};

func void dia_fortuno_buyjoints_info()
{
	AI_Output(other,self,"DIA_Fortuno_BuyJoints_15_00");	//Давай меняться.
	AI_Output(self,other,"DIA_Fortuno_BuyJoints_05_01");	//Что ты от меня хочешь? Быть может, что-нибудь купить?
};

instance DIA_FORTUNO_BUYJOINTS2(C_INFO)
{
	npc = nov_1357_fortuno;
	nr = 4;
	condition = dia_fortuno_buyjoints2_condition;
	information = dia_fortuno_buyjoints2_info;
	permanent = 1;
	description = "Давай меняться.";
	trade = 1;
};


func int dia_fortuno_buyjoints2_condition()
{
	if(Npc_KnowsInfo(hero,dia_fortuno_buyjoints))
	{
		return 1;
	};
};

func void dia_fortuno_buyjoints2_info()
{
	AI_Output(other,self,"DIA_Fortuno_BuyJoints_15_00");	//Давай меняться.
};

instance DIA_FORTUNO_HELP(C_INFO)
{
	npc = nov_1357_fortuno;
	nr = 1;
	condition = dia_fortuno_help_condition;
	information = dia_fortuno_help_info;
	permanent = 0;
	description = "Как мне узнать те травы, которые помогут Юбериону?";
};


func int dia_fortuno_help_condition()
{
	if(CORANGAR_FINDHERB == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_fortuno_help_info()
{
	AI_Output(other,self,"Info_CorAngar_FindHerb_LOOK_15_01");	//Как мне узнать те травы, которые помогут Юбериону?
	AI_Output(self,other,"DIA_Fortuno_SaveYberion_01");	//Ты ищешь травы для Юбериона? Тебя прислал Кор Ангар?
	AI_Output(other,self,"GUR_1201_CorKalom_SACHE_JA_15_01");	//Да.
	AI_Output(self,other,"DIA_Fortuno_SaveYberion_02");	//И он поручил тебе принести ему какие-то целебные травки? О, Спящий, это не поможет! У Юбериона тяжелая магическая травма!
	AI_Output(self,other,"DIA_Fortuno_SaveYberion_03");	//Послушай, я изучал записи и рецепты Кор Галома после его ухода... Кажется, Юбериону можно помочь.
	AI_Output(self,other,"DIA_Fortuno_SaveYberion_04");	//Я разработал рецепт мощного лечебного зелья, которое укрепит его дух. Но чтобы приготовить это зелье, мне не хватает одного очень редкого компонента...
	AI_Output(self,other,"DIA_Fortuno_SaveYberion_05");	//Это растение называется Мертвый лист. К счастью, я знаю где его можно найти.
	AI_Output(self,other,"DIA_Fortuno_SaveYberion_06");	//Выше по течению реки, которая заканчивается водопадом у нашего лагеря, находится озеро с затонувшей башней. Поищи вокруг нее, на острове.
	AI_Output(other,self,"Info_FreemineOrc_OFFER_15_01");	//Я постараюсь найти его тебе!
	AI_Output(self,other,"DIA_Fortuno_SaveYberion_07");	//Пару месяцев назад я был там, но меня чуть не загрыз шныг. Поторопись, у нас очень мало времени!
	b_logentry(CH3_FINDHERBS,"Фортуно предложил другой план: найти редкое растение у затонувшей башни на озере и сделать из него лечебное зелье.");
	AI_StopProcessInfos(self);
};

instance DIA_FORTUNO_DEADLEAFFOUND(C_INFO)
{
	npc = nov_1357_fortuno;
	nr = 1;
	condition = dia_fortuno_deadleaffound_condition;
	information = dia_fortuno_deadleaffound_info;
	permanent = 0;
	description = "Вот, возьми его. Как ты и просил.";
};


func int dia_fortuno_deadleaffound_condition()
{
	if(Npc_KnowsInfo(hero,dia_fortuno_help) && Npc_HasItems(other,itfo_plants_deadleaf) && CORANGAR_FINDHERB == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_fortuno_deadleaffound_info()
{
	AI_Output(hero,self,"Info_Milten_SHSUCCESS_15_02");	//Вот, возьми его. Как ты и просил.
	AI_Output(self,other,"DIA_Fortuno_SaveYberion_08");	//Отлично! Все готово! Скажи, ты знаком с алхимией?
	if(ALCHEMYACTIVE == TRUE)
	{
		AI_Output(other,self,"Info_Milten_SHWAIT_15_03");	//Так, стараюсь...
		AI_Output(self,other,"DIA_Fortuno_SaveYberion_09");	//Пока тебя не было, я приготовил основу из того, что было. Держи рецепт и закончи зелье, а потом скорее отнеси его Кор Ангару!
		b_printtrademsg1("Получен рецепт и основа зелья.");
		if(!Npc_HasItems(hero,itmiflask))
		{
			CreateInvItem(hero,itmiflask);
		};
		CreateInvItem(hero,specialwater);
		CreateInvItem(hero,alchemy_fortuno);
		b_logentry(CH3_FINDHERBS,"Фортуно дал мне рецепт и основу зелья, нужно быстро приготовить его и отнести в храм Кор Ангару.");
	}
	else
	{
		AI_Output(other,self,"DIA_Orry_GuardGate_No_15_00");	//Еще нет.
		AI_Output(self,other,"DIA_Fortuno_SaveYberion_10");	//Хм, тогда я сам приготовлю зелье... Подожди...
		b_printtrademsg1("Отдан Мертвый лист.");
		Npc_RemoveInvItems(hero,itfo_plants_deadleaf,1);
		AI_UseMob(self,"LAB",1);
		AI_Wait(self,13);
		AI_UseMob(self,"LAB",-1);
		AI_GotoNpc(self,other);
		AI_Output(self,other,"DIA_Fortuno_SaveYberion_11");	//Вот, быстрее отнеси его Кор Ангару! Торопись!
		b_printtrademsg2("Получено лечебное зелье Фортуно.");
		CreateInvItem(hero,healthwater);
		b_logentry(CH3_FINDHERBS,"Лечебное зелье готово! Теперь нужно быстрее отнести его в храм и отдать Кор Ангару.");
	};
	AI_StopProcessInfos(self);
};

