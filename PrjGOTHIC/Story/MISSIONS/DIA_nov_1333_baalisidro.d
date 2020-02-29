
instance DIA_BAALISIDRO_EXIT(C_INFO)
{
	npc = nov_1333_baalisidro;
	nr = 999;
	condition = dia_baalisidro_exit_condition;
	information = dia_baalisidro_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_baalisidro_exit_condition()
{
	return 1;
};

func void dia_baalisidro_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAALISIDRO_HELLO(C_INFO)
{
	npc = nov_1333_baalisidro;
	nr = 1;
	condition = dia_baalisidro_hello_condition;
	information = dia_baalisidro_hello_info;
	permanent = 0;
	description = "Какой-то у тебя слишком грустный вид.";
};


func int dia_baalisidro_hello_condition()
{
	return 1;
};

func void dia_baalisidro_hello_info()
{
	AI_Output(other,self,"DIA_BaalIsidro_Hello_15_00");	//Какой-то у тебя слишком грустный вид.
	AI_Output(self,other,"DIA_BaalIsidro_Hello_03_01");	//Какой проницательный! 
	AI_Output(self,other,"DIA_BaalIsidro_Hello_03_02");	//Мне срочно нужно избавиться от целой горы болотника.
	AI_Output(other,self,"DIA_BaalIsidro_Hello_15_03");	//Ты продаешь товары из Лагеря сектантов?
	AI_Output(self,other,"DIA_BaalIsidro_Hello_03_04");	//Да. 
};


instance DIA_BAALISIDRO_TRADE(C_INFO)
{
	npc = nov_1333_baalisidro;
	nr = 800;
	condition = dia_baalisidro_trade_condition;
	information = dia_baalisidro_trade_info;
	permanent = 1;
	description = "Покажи, что ты там продаешь.";
	trade = 1;
};


func int dia_baalisidro_trade_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalisidro_hello))
	{
		return 1;
	};
};

func void dia_baalisidro_trade_info()
{
	AI_Output(other,self,"DIA_BaalIsidro_TRADE_15_00");	//Покажи, что ты там продаешь.
	AI_Output(self,other,"DIA_BaalIsidro_TRADE_03_01");	//Вот...
};


instance DIA_BAALISIDRO_GIMMEKRAUT(C_INFO)
{
	npc = nov_1333_baalisidro;
	nr = 1;
	condition = dia_baalisidro_gimmekraut_condition;
	information = dia_baalisidro_gimmekraut_info;
	permanent = 0;
	description = "Я могу помочь продавать болотник. Но тебе придется поделиться.";
};


func int dia_baalisidro_gimmekraut_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalisidro_hello))
	{
		return 1;
	};
};

func void dia_baalisidro_gimmekraut_info()
{
	AI_Output(other,self,"DIA_BaalIsidro_GimmeKraut_15_00");	//Я могу помочь тебе продавать болотник. Но тебе придется поделиться.
	AI_Output(self,other,"DIA_BaalIsidro_GimmeKraut_03_01");	//Даже не думай меня обмануть, я еще не слишком пьян, чтобы отдать весь мой болотник первому встречному.
	Log_CreateTopic(CH1_DEALERJOB,LOG_MISSION);
	Log_SetTopicStatus(CH1_DEALERJOB,LOG_RUNNING);
	b_logentry(CH1_DEALERJOB,"Послушник Идол Исидро целыми днями пьянствует в баре на озере. Ему нужно продать свой болотник, но он ничего не может с собой поделать. Может быть, я смогу уговорить его поручить это дело мне...");
};


instance DIA_BAALISIDRO_PROBLEM(C_INFO)
{
	npc = nov_1333_baalisidro;
	nr = 1;
	condition = dia_baalisidro_problem_condition;
	information = dia_baalisidro_problem_info;
	permanent = 0;
	description = "Идол Каган хочет найти себе другого помощника...";
};


func int dia_baalisidro_problem_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalkagan_wannahelp))
	{
		return 1;
	};
};

func void dia_baalisidro_problem_info()
{
	AI_Output(other,self,"DIA_BaalIsidro_Problem_15_00");	//Послушай меня: Идол Каган хочет найти себе другого помощника. Кажется, скоро тебе придется несладко.
	AI_Output(self,other,"DIA_BaalIsidro_Problem_03_01");	//Что? О великий Спящий! Как же мне избавиться от этой травы...
	if(BAALISIDRO_GOTDRINK == FALSE)
	{
		b_logentry(CH1_DEALERJOB,"Идол Исидро был сильно напуган, когда я рассказал ему о планах Идола Кагана найти ему замену. Но этого было недостаточно, чтобы уговорить его.");
	}
	else
	{
		b_logentry(CH1_DEALERJOB,"Идол Исидро был сильно напуган, когда я рассказал ему о планах Идола Кагана найти ему замену. Но этого было недостаточно, чтобы уговорить его.");
	};
};


var int baalisidro_gotdrink;

instance DIA_BAALISIDRO_DRINK(C_INFO)
{
	npc = nov_1333_baalisidro;
	nr = 1;
	condition = dia_baalisidro_drink_condition;
	information = dia_baalisidro_drink_info;
	permanent = 1;
	description = "Я тоже так думаю. Вот, выпей.";
};


func int dia_baalisidro_drink_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalisidro_gimmekraut) && (BAALISIDRO_GOTDRINK == FALSE))
	{
		return 1;
	};
};

func void dia_baalisidro_drink_info()
{
	AI_Output(other,self,"DIA_BaalIsidro_Drink_15_00");	//Я тоже так думаю. Вот, выпей.
	if((Npc_HasItems(other,itfobooze) > 0) || (Npc_HasItems(other,itfobeer) > 0) || (Npc_HasItems(other,itfowine) > 0))
	{
		AI_Output(self,other,"DIA_BaalIsidro_Drink_03_01");	//Спасибо тебе! Я выпью за твое здоровье!
		if(Npc_HasItems(other,itfobooze))
		{
			b_giveinvitems(other,self,itfobooze,1);
			if(c_bodystatecontains(self,BS_SIT))
			{
				AI_Standup(self);
				AI_TurnToNPC(self,hero);
			};
			AI_UseItem(self,itfobooze);
		}
		else if(Npc_HasItems(other,itfobeer))
		{
			b_giveinvitems(other,self,itfobeer,1);
			if(c_bodystatecontains(self,BS_SIT))
			{
				AI_Standup(self);
				AI_TurnToNPC(self,hero);
			};
			AI_UseItem(self,itfobeer);
		}
		else if(Npc_HasItems(other,itfowine))
		{
			b_giveinvitems(other,self,itfowine,1);
			if(c_bodystatecontains(self,BS_SIT))
			{
				AI_Standup(self);
				AI_TurnToNPC(self,hero);
			};
			AI_UseItem(self,itfowine);
		};
		BAALISIDRO_GOTDRINK = TRUE;
		if(Npc_KnowsInfo(hero,dia_baalisidro_problem))
		{
			b_logentry(CH1_DEALERJOB,"Мое угощение подействовало как нужно. Думаю, теперь Идол Исидро примет мое предложение.");
		}
		else
		{
			b_logentry(CH1_DEALERJOB,"Идол Исидро с радостью выпил за мое здоровье. Но, кажется, он все еще не согласен отдать мне свой болотник.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_BaalIsidro_NO_Drink_03_00");	//Что? Где?
	};
};


var int baalisidro_dealerjob;

instance DIA_BAALISIDRO_THINKAGAIN(C_INFO)
{
	npc = nov_1333_baalisidro;
	nr = 1;
	condition = dia_baalisidro_thinkagain_condition;
	information = dia_baalisidro_thinkagain_info;
	permanent = 1;
	description = "Подумай, я продам твой болотник, а прибыль мы поделим пополам!";
};


func int dia_baalisidro_thinkagain_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalisidro_gimmekraut) && ((BAALISIDRO_DEALERJOB != LOG_RUNNING) && (BAALISIDRO_DEALERJOB != LOG_SUCCESS)))
	{
		return 1;
	};
};

func void dia_baalisidro_thinkagain_info()
{
	AI_Output(other,self,"DIA_BaalIsidro_ThinkAgain_15_00");	//Подумай, я продам твой болотник, а прибыль мы поделим пополам!
	if((BAALISIDRO_GOTDRINK == TRUE) && Npc_KnowsInfo(hero,dia_baalisidro_problem))
	{
		AI_Output(self,other,"DIA_BaalIsidro_ThinkAgain_03_01");	//О Спящий! Как же я замучился с этим болотником. Ты же не хочешь обвести меня вокруг пальца, да?
		AI_Output(other,self,"DIA_BaalIsidro_ThinkAgain_15_02");	//Честное слово.
		AI_Output(self,other,"DIA_BaalIsidro_ThinkAgain_03_03");	//Хорошо, вот тебе весь болотник... Ты должен получить за него не меньше 400 кусков руды. Мы поделим их пополам. Как справишься со всем, приходи ко мне. Я все время буду здесь.
		AI_Output(other,self,"DIA_BaalIsidro_ThinkAgain_15_04");	//Не знаешь, кто здесь может купить большую партию болотника?
		AI_Output(self,other,"DIA_BaalIsidro_ThinkAgain_03_05");	//Если бы я знал, я бы и сам сходил к нему.
		AI_Output(self,other,"DIA_BaalIsidro_ThinkAgain_03_06");	//Да, без этой проклятой травы я чувствую себя гораздо лучше.
		BAALISIDRO_DEALERJOB = LOG_RUNNING;
		b_logentry(CH1_DEALERJOB,"Идол Исидро передал мне свой болотник. Я должен его продать и половину выручки принести ему.");
		CreateInvItems(self,itmijoint_1,40);
		b_giveinvitems(self,other,itmijoint_1,50);
		Npc_RemoveInvItems(self,itmijoint_2,20);
		Npc_RemoveInvItems(self,itmijoint_3,20);
		Npc_RemoveInvItems(other,itmijoint_1,40);
		CreateInvItems(other,itmijoint_2,20);
		CreateInvItems(other,itmijoint_3,20);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_BaalIsidro_REFUSE_ThinkAgain_03_00");	//Нет, ни за что. Я и сам смогу с этим справиться...
	};
};


instance DIA_BAALISIDRO_RUNNING(C_INFO)
{
	npc = nov_1333_baalisidro;
	nr = 1;
	condition = dia_baalisidro_running_condition;
	information = dia_baalisidro_running_info;
	permanent = 0;
	description = "Я продал весь болотник.";
};


func int dia_baalisidro_running_condition()
{
	if(BAALISIDRO_DEALERJOB == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_baalisidro_running_info()
{
	AI_Output(other,self,"DIA_BaalIsidro_RUNNING_15_00");	//Я продал весь болотник.
	AI_Output(self,other,"DIA_BaalIsidro_RUNNING_03_01");	//А где мои 200 кусков?
	if(Npc_HasItems(other,itminugget) >= 200)
	{
		AI_Output(other,self,"DIA_BaalIsidro_RUNNING_15_02");	//Вот они.
		AI_Output(self,other,"DIA_BaalIsidro_RUNNING_03_03");	//Хорошо... А этот Идол Каган пусть делает что хочет! 
		AI_Output(self,other,"DIA_BaalIsidro_RUNNING_03_04");	//Приятно иметь с тобой дело, брат.
		b_giveinvitems(hero,self,itminugget,200);
		BAALISIDRO_DEALERJOB = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_DEALERJOB,LOG_SUCCESS);
		b_logentry(CH1_DEALERJOB,"Идол Исидро был очень рад, что я избавил его от горы болотника и принес 200 кусков руды.");
		b_givexp(XP_BAALISIDROPAYSHARE);
	}
	else
	{
		AI_Output(other,self,"DIA_BaalIsidro_RUNNING_NoOre_15_05");	//Я забыл взять твою долю.
		AI_Output(self,other,"DIA_BaalIsidro_RUNNING_NoOre_03_06");	//Так принеси их!
		AI_StopProcessInfos(self);
	};
};

