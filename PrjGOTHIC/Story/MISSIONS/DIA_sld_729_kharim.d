
instance INFO_KHARIM_EXIT(C_INFO)
{
	npc = sld_729_kharim;
	nr = 999;
	condition = info_kharim_exit_condition;
	information = info_kharim_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_kharim_exit_condition()
{
	return 1;
};

func void info_kharim_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_KHARIM_WHAT(C_INFO)
{
	npc = sld_729_kharim;
	nr = 1;
	condition = info_kharim_what_condition;
	information = info_kharim_what_info;
	permanent = 0;
	description = "Я здесь недавно. Скажи, кто ты?";
};


func int info_kharim_what_condition()
{
	return 1;
};

func void info_kharim_what_info()
{
	AI_Output(other,self,"Info_Kharim_What_15_00");	//Я здесь недавно. Скажи, кто ты?
	AI_Output(self,other,"Info_Kharim_What_09_01");	//Я Карим. Наверное, ты прибыл сюда недавно, иначе ты бы уже знал меня.
	AI_Output(self,other,"Info_Kharim_What_09_02");	//Я лучший боец из всех, кого забрасывали в этот лагерь.
};


var int kharim_charged;

instance INFO_KHARIM_CHARGE(C_INFO)
{
	npc = sld_729_kharim;
	nr = 2;
	condition = info_kharim_charge_condition;
	information = info_kharim_charge_info;
	permanent = 1;
	description = "Я вызываю тебя на бой! Пойдем, сразимся на арене!";
};


func int info_kharim_charge_condition()
{
	if(Npc_KnowsInfo(hero,dia_scatty_joinoc) && Npc_KnowsInfo(hero,info_kharim_what) && (KHARIM_CHARGED != TRUE) && (KAPITEL <= 1))
	{
		return 1;
	};
};

func void info_kharim_charge_info()
{
	AI_Output(other,self,"Info_Kharim_Charge_15_00");	//Я вызываю тебя на бой! Пойдем, сразимся на арене!
	AI_Output(self,other,"Info_Kharim_Charge_09_01");	//Ты?! Да я от тебя мокрого места не оставлю!
	AI_Output(self,other,"Info_Kharim_Charge_09_02");	//Лучше забудь об этом и уходи, пока я не передумал!
	Info_ClearChoices(info_kharim_charge);
	Info_AddChoice(info_kharim_charge,"Хорошо, хорошо, я уже почти все забыл.",info_kharim_charge_back);
	Info_AddChoice(info_kharim_charge,"Так ты не принимаешь вызов, трус?!",info_kharim_charge_insult);
};

func void info_kharim_charge_back()
{
	AI_Output(other,self,"Info_Kharim_Charge_BACK_15_00");	//Хорошо, хорошо, я уже почти все забыл.
	AI_StopProcessInfos(self);
};

func void info_kharim_charge_insult()
{
	AI_Output(other,self,"Info_Kharim_Charge_Insult_15_00");	//Так ты не принимаешь вызов, трус?!
	AI_Output(self,other,"Info_Kharim_Charge_Insult_09_01");	//Придумай что-нибудь получше!
	Info_ClearChoices(info_kharim_charge);
	Info_AddChoice(info_kharim_charge,"Ты хочешь получить шанс выслужиться перед Гомезом!",info_kharim_charge_insult_gomezass);
	Info_AddChoice(info_kharim_charge,"Может вот это тебя проймет: твоя мать была похожа на козу...",info_kharim_charge_insult_goats);
	Info_AddChoice(info_kharim_charge,"Я не могу вспомнить ничего, что было бы доступно твоему умишку.",info_kharim_charge_insult_stupid);
	Info_AddChoice(info_kharim_charge,"Твои худые ручки не идут ни в какое сравнение с твоей рожей.",info_kharim_charge_insult_face);
	Info_AddChoice(info_kharim_charge,"Хорошо, хорошо, я уже почти все забыл.",info_kharim_charge_back);
};

func void info_kharim_charge_insult_goats()
{
	AI_Output(other,self,"Info_Kharim_Charge_Insult_Goats_15_00");	//Может вот это тебя проймет: твоя мать была похожа на козу...
	AI_Output(self,other,"Info_Kharim_Charge_Insult_Goats_09_01");	//Странно, но ты угадал...
};

func void info_kharim_charge_insult_gomezass()
{
	AI_Output(other,self,"Info_Kharim_Charge_Insult_GomezAss_15_00");	//Ты хочешь получить шанс выслужиться перед Гомезом!
	AI_Output(self,other,"Info_Kharim_Charge_Insult_GomezAss_09_01");	//Что?! Ах ты, червяк! Да ты ничего о нас не знаешь! Новый Лагерь не подчиняется этому подонку!
	AI_Output(self,other,"Info_Kharim_Charge_Insult_GomezAss_09_02");	//И, кроме того, я здесь по одной причине: мне приятно выбивать дурь из таких умников, как ты!
	AI_Output(self,other,"Info_Kharim_Charge_Insult_GomezAss_09_03");	//С удовольствием окажу тебе эту услугу! Арена ждет нас!
	KHARIM_CHARGED = TRUE;
	Info_ClearChoices(info_kharim_charge);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDE");
};

func void info_kharim_charge_insult_stupid()
{
	AI_Output(other,self,"Info_Kharim_Charge_Insult_Stupid_15_00");	//Подумать только: я не могу вспомнить ничего такого, что было бы доступно твоему умишку.
	AI_Output(self,other,"Info_Kharim_Charge_Insult_Stupid_09_01");	//Может быть, тебе стоит попробовать еще раз?
};

func void info_kharim_charge_insult_face()
{
	AI_Output(other,self,"Info_Kharim_Charge_Insult_Face_15_00");	//Ну, сначала я хотел обратить всеобщее внимание на твои худые ручки, но потом я увидел твою ужасную рожу.
	AI_Output(self,other,"Info_Kharim_Charge_Insult_Face_09_01");	//Ладно, я даю тебе еще один шанс убраться отсюда как можно быстрее!
};


instance INFO_KHARIM_INARENA(C_INFO)
{
	npc = sld_729_kharim;
	nr = 1;
	condition = info_kharim_inarena_condition;
	information = info_kharim_inarena_info;
	permanent = 0;
	important = 1;
};


func int info_kharim_inarena_condition()
{
	if((KHARIM_CHARGED == TRUE) && (Npc_GetDistToWP(hero,"OCR_ARENABATTLE_TRAIN") < 500))
	{
		return 1;
	};
};

func void info_kharim_inarena_info()
{
	if(KAPITEL <= 1)
	{
		AI_Output(self,other,"Info_Kharim_InArena_09_00");	//Боль - это испытание силы духа!
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
		Npc_SetTarget(self,other);
		AI_StartState(self,zs_attack,1,"");
	}
	else
	{
		AI_Output(self,other,"SVM_9_LetsForgetOurLittleFight");	//Может, стоит забыть об этом...
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
	};
};

