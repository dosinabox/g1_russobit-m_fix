
instance DIA_KYLE_EXIT(C_INFO)
{
	npc = vlk_536_kyle;
	nr = 999;
	condition = dia_kyle_exit_condition;
	information = dia_kyle_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_kyle_exit_condition()
{
	return 1;
};

func void dia_kyle_exit_info()
{
	Npc_SetRefuseTalk(self,120);
	AI_StopProcessInfos(self);
};


instance DIA_KYLE_HUTRAGE(C_INFO)
{
	npc = vlk_536_kyle;
	nr = 2;
	condition = dia_kyle_hutrage_condition;
	information = dia_kyle_hutrage_info;
	permanent = 1;
	important = 1;
};


func int dia_kyle_hutrage_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,other) <= ZIVILANQUATSCHDIST))
	{
		return 1;
	};
};

func void dia_kyle_hutrage_info()
{
	AI_Output(self,other,"DIA_Kyle_HutRage_10_00");	//Сколько можно повторять: мой дом не проходной двор!
};


instance DIA_KYLE_PROBLEM(C_INFO)
{
	npc = vlk_536_kyle;
	nr = 2;
	condition = dia_kyle_problem_condition;
	information = dia_kyle_problem_info;
	permanent = 1;
	description = "У тебя какие-то проблемы?";
};


func int dia_kyle_problem_condition()
{
	return 1;
};

func void dia_kyle_problem_info()
{
	AI_Output(other,self,"DIA_Kyle_Problem_15_00");	//У тебя какие-то проблемы?
	AI_Output(self,other,"DIA_Kyle_Problem_10_01");	//Оставь меня в покое! Здесь вы все для меня одна большая проблема!
	AI_Output(self,other,"DIA_Kyle_Problem_10_02");	//Все началось с того, когда я решил построить свой дом.
	AI_Output(self,other,"DIA_Kyle_Problem_10_03");	//Все советовали мне не строить его близко к обрыву.
	AI_Output(self,other,"DIA_Kyle_Problem_10_04");	//Но никто не сказал почему. И я все же построил его именно на краю обрыва.
	AI_Output(self,other,"DIA_Kyle_Problem_10_05");	//А когда я через несколько дней пришел из шахты, у меня появилась вторая дверь.
	AI_Output(self,other,"DIA_Kyle_Problem_10_06");	//Предатели! Я их ненавижу! Ты даже представить себе не можешь, как я их ненавижу!
	AI_Output(self,other,"DIA_Kyle_Problem_10_07");	//А теперь все эти идиоты ходят через мой дом. 
};

