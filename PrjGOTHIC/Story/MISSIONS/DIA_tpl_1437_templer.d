
instance TPL_1437_TEMPLER_EXIT(C_INFO)
{
	npc = tpl_1437_templer;
	nr = 999;
	condition = tpl_1437_templer_exit_condition;
	information = tpl_1437_templer_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int tpl_1437_templer_exit_condition()
{
	return TRUE;
};

func void tpl_1437_templer_exit_info()
{
	AI_StopProcessInfos(self);
};


instance TPL_1437_TEMPLER_NERV(C_INFO)
{
	npc = tpl_1437_templer;
	condition = tpl_1437_templer_nerv_condition;
	information = tpl_1437_templer_nerv_info;
	important = 0;
	permanent = 1;
	description = "Как дела?";
};


func int tpl_1437_templer_nerv_condition()
{
	return TRUE;
};

func void tpl_1437_templer_nerv_info()
{
	AI_Output(other,self,"Tpl_1437_Templer_NERV_Info_15_01");	//Как дела?
	AI_Output(self,other,"Tpl_1437_Templer_NERV_Info_13_02");	//Слушай, ты что, намерен всех здесь достать?
	AI_StopProcessInfos(self);
};


instance TPL_1437_TEMPLER_LEAVE(C_INFO)
{
	npc = tpl_1437_templer;
	condition = tpl_1437_templer_leave_condition;
	information = tpl_1437_templer_leave_info;
	important = 0;
	permanent = 0;
	description = "У тебя все в порядке?";
};


func int tpl_1437_templer_leave_condition()
{
	if(Npc_KnowsInfo(hero,tpl_1437_templer_nerv))
	{
		return TRUE;
	};
};

func void tpl_1437_templer_leave_info()
{
	AI_Output(other,self,"Tpl_1437_Templer_LEAVE_Info_15_01");	//У тебя все в порядке?
	AI_Output(self,other,"Tpl_1437_Templer_LEAVE_Info_13_02");	//Я хочу остаться один, ясно? Иди, займись чем-нибудь!
	AI_StopProcessInfos(self);
};


instance TPL_1437_TEMPLER_LEAVENOW(C_INFO)
{
	npc = tpl_1437_templer;
	condition = tpl_1437_templer_leavenow_condition;
	information = tpl_1437_templer_leavenow_info;
	important = 0;
	permanent = 0;
	description = "Но я не понимаю тебя!";
};


func int tpl_1437_templer_leavenow_condition()
{
	if(Npc_KnowsInfo(hero,tpl_1437_templer_leave))
	{
		return TRUE;
	};
};

func void tpl_1437_templer_leavenow_info()
{
	AI_Output(other,self,"Tpl_1437_Templer_LEAVENOW_Info_15_01");	//Но я не понимаю тебя!
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_02");	//Ну, хорошо. Я тебе объясню!
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_03");	//Вали отсюда!
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_04");	//Убирайся из этой шахты!
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_05");	//Никогда больше ко мне не подходи!
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_06");	//Сделай так, чтобы я тебя больше не видел!
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_07");	//Пошел вон!
	AI_StopProcessInfos(self);
};

