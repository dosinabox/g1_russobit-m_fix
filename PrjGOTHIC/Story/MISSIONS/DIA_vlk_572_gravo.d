
instance DIA_GRAVO_EXIT(C_INFO)
{
	npc = vlk_572_gravo;
	nr = 999;
	condition = dia_gravo_exit_condition;
	information = dia_gravo_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_gravo_exit_condition()
{
	return 1;
};

func void dia_gravo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GRAVO_HALLO(C_INFO)
{
	npc = vlk_572_gravo;
	nr = 1;
	condition = dia_gravo_hallo_condition;
	information = dia_gravo_hallo_info;
	permanent = 0;
	description = "Как дела?";
};


func int dia_gravo_hallo_condition()
{
	return 1;
};

func void dia_gravo_hallo_info()
{
	AI_Output(other,self,"DIA_Gravo_Hallo_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Gravo_Hallo_04_01");	//Я ушел с шахты, и теперь мне живется очень неплохо. Так что жаловаться не на что.
	AI_Output(other,self,"DIA_Gravo_Hallo_15_02");	//Чем же ты зарабатываешь на жизнь?
	AI_Output(self,other,"DIA_Gravo_Hallo_04_03");	//Я помогаю людям решать их проблемы.
	AI_Output(self,other,"DIA_Gravo_Hallo_04_04");	//Если ты поссоришься с кем-то из влиятельных людей, я могу позаботиться о том, чтобы об этой ссоре быстро забыли.
};


instance DIA_GRAVO_HELPHOW(C_INFO)
{
	npc = vlk_572_gravo;
	nr = 1;
	condition = dia_gravo_helphow_condition;
	information = dia_gravo_helphow_info;
	permanent = 0;
	description = "Если у меня возникнут проблемы, я могу обратиться к тебе? Как?";
};


func int dia_gravo_helphow_condition()
{
	if(Npc_KnowsInfo(hero,dia_gravo_hallo))
	{
		return 1;
	};
};

func void dia_gravo_helphow_info()
{
	AI_Output(other,self,"DIA_Gravo_HelpHow_15_00");	//Значит, если у меня возникнут проблемы, я могу обратиться к тебе? Как?
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_01");	//Ну, например, ты не угодишь Торусу, придешь ко мне... Но, знаешь, будет лучше, если ты с ним вообще не будешь ссориться, хотя кто знает, что может случиться.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_02");	//Торус иногда бывает очень упрямым. Он никогда не разговариваем с теми, кто его хоть раз подвел. А это плохо.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_03");	//Он решает, что делать с новичками. Так вот, приходишь ко мне, а я говорю с теми людьми, к мнению которых Торус прислушивается.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_04");	//Они замолвят ему за тебя словечко, и он больше на тебя не в обиде. Конечно, бесплатно никто из них ничего не сделает. Все это будешь оплачивать ты.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_05");	//А я позабочусь о том, чтобы твоя руда попала в нужные руки...
	Log_CreateTopic(GE_TRADEROC,LOG_NOTE);
	b_logentry(GE_TRADEROC,"Рудокоп Граво предлагает особую услугу. Если у меня случится ссора с кем-то из важных людей из Старого лагеря, я смогу заплатить ему, и он уладит проблему.");
};

func void b_gravo_helpattitude(var C_NPC prob)
{
	if(Npc_GetPermAttitude(prob,other) == ATT_ANGRY)
	{
		AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_00");	//Да, я уже слышал его мнение о тебе. Он тобой недоволен.
		AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_01");	//Ладно, я позабочусь о том, чтобы с ним кое-кто переговорил. 100 кусков руды, и я улажу эту проблему.
		if(Npc_HasItems(other,itminugget) >= 100)
		{
			b_printtrademsg1("Отдано руды: 100");
			AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_02");	//Посмотрим, сколько у тебя есть... А! Этого вполне хватит. Считай, что дело сделано.
			AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_03");	//И постарайся не проговориться. Веди себя так, будто ничего не случилось.
			b_giveinvitems(hero,self,itminugget,100);
			npc_setpermattitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
			AI_Output(self,other,"B_Gravo_HelpAttitude_NoOre_04_02");	//Что ж, тогда ничего не получится. Очень жаль, но я ничего не могу сделать.
		};
	}
	else if(Npc_GetPermAttitude(prob,other) == ATT_HOSTILE)
	{
		AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_00");	//По-моему, ты не совсем точно выразился! Да он же хочет оторвать тебе голову.
		AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_01");	//Я должен буду поговорить с некоторыми людьми, которых он послушает. Но его будет нелегко успокоить. Я возьмусь за это дело за 500 кусков руды.
		if(Npc_HasItems(other,itminugget) >= 500)
		{
			b_printtrademsg1("Отдано руды: 500");
			AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_02");	//Посмотрим, сколько у тебя есть... Да ты богат! Я возьму 500 кусков и улажу для тебя эту проблему.
			AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_03");	//И еще кое-что: он ни в коем случае не должен узнать, что этим занимался я. Никому об этом не рассказывай!
			b_giveinvitems(hero,self,itminugget,500);
			npc_setpermattitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня не так много руды.
			AI_Output(self,other,"B_Gravo_HelpAttitude_NoOre_04_02");	//Что ж, тогда ничего не получится. Очень жаль, но я ничего не могу сделать.
		};
	}
	else
	{
		AI_Output(self,other,"B_Gravo_HelpAttitude_NoProb_04_00");	//Насколько я знаю, у тебя с ним нормальные отношения. Не стоит волноваться.
	};
};


instance DIA_GRAVO_HELPANGRYNOW(C_INFO)
{
	npc = vlk_572_gravo;
	nr = 1;
	condition = dia_gravo_helpangrynow_condition;
	information = dia_gravo_helpangrynow_info;
	permanent = 1;
	description = "Кажется, у меня возникла проблема. Ты можешь мне помочь?";
};


func int dia_gravo_helpangrynow_condition()
{
	if(Npc_KnowsInfo(hero,dia_gravo_helphow))
	{
		return 1;
	};
};

func void dia_gravo_helpangrynow_info()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_15_00");	//Кажется, у меня возникла проблема. Ты можешь мне помочь?
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_04_01");	//Думаю, могу. Но это будет стоить тебе от 100 до 500 кусков руды.
	Info_ClearChoices(dia_gravo_helpangrynow);
	Info_AddChoice(dia_gravo_helpangrynow,DIALOG_BACK,dia_gravo_helpangrynow_back);
	Info_AddChoice(dia_gravo_helpangrynow,"Диего сердится на меня.",dia_gravo_helpangrynow_diego);
	Info_AddChoice(dia_gravo_helpangrynow,"У меня вышла ссора с Торусом.",dia_gravo_helpangrynow_thorus);
	Info_AddChoice(dia_gravo_helpangrynow,"Я поссорился с Гомезом.",dia_gravo_helpangrynow_gomez);
};

func void dia_gravo_helpangrynow_back()
{
	Info_ClearChoices(dia_gravo_helpangrynow);
};

func void dia_gravo_helpangrynow_diego()
{
	var C_NPC diego;
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Diego_15_00");	//Диего сердится на меня.
	diego = Hlp_GetNpc(pc_thief);
	b_gravo_helpattitude(diego);
	Info_ClearChoices(dia_gravo_helpangrynow);
};

func void dia_gravo_helpangrynow_thorus()
{
	var C_NPC thorus;
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Thorus_15_00");	//У меня вышла ссора с Торусом.
	thorus = Hlp_GetNpc(grd_200_thorus);
	b_gravo_helpattitude(thorus);
	Info_ClearChoices(dia_gravo_helpangrynow);
};

func void dia_gravo_helpangrynow_gomez()
{
	var C_NPC gomez;
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Gomez_15_00");	//Я поссорился с Гомезом.
	gomez = Hlp_GetNpc(ebr_100_gomez);
	b_gravo_helpattitude(gomez);
	Info_ClearChoices(dia_gravo_helpangrynow);
};


instance DIA_GRAVO_INFLUENCE(C_INFO)
{
	npc = vlk_572_gravo;
	nr = 2;
	condition = dia_gravo_influence_condition;
	information = dia_gravo_influence_info;
	permanent = 1;
	description = "Ты можешь назвать мне самых влиятельных из Призраков?";
};


func int dia_gravo_influence_condition()
{
	if(Npc_KnowsInfo(hero,dia_gravo_hallo))
	{
		return 1;
	};
};

func void dia_gravo_influence_info()
{
	var int log;
	AI_Output(other,self,"DIA_Gravo_Influence_15_00");	//Ты можешь назвать мне самых влиятельных из Призраков.
	AI_Output(self,other,"DIA_Gravo_Influence_04_01");	//Хочешь подружиться с нужными людьми, да?
	AI_Output(self,other,"DIA_Gravo_Influence_04_02");	//Самый влиятельный из Призраков - Диего. Он доверяет Фингерсу, Уистлеру и Слаю.
	AI_Output(self,other,"DIA_Gravo_Influence_04_03");	//Декстер и Фиск продают товары на рыночной площади. У них много покупателей среди стражников, поэтому они тоже могут повлиять на некоторых людей.
	AI_Output(self,other,"DIA_Gravo_Influence_04_04");	//Еще здесь есть Скатти. Он организует сражения на арене. В лагере многие должны ему руду, так что я и его причисляю к влиятельным людям.
	if(log == FALSE)
	{
		Log_CreateTopic(GE_TRADEROC,LOG_NOTE);
		b_logentry(GE_TRADEROC,"Декстер и Фиск торгуют различными товарами на рыночной площади.");
		log = TRUE;
	};
};

