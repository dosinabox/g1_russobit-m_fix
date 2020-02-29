
instance INFO_PACHO_EXIT(C_INFO)
{
	npc = grd_224_pacho;
	nr = 999;
	condition = info_pacho_exit_condition;
	information = info_pacho_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_pacho_exit_condition()
{
	return TRUE;
};

func void info_pacho_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_PACHO_STOP(C_INFO)
{
	npc = grd_224_pacho;
	condition = info_pacho_stop_condition;
	information = info_pacho_stop_info;
	important = 1;
	permanent = 0;
};


func int info_pacho_stop_condition()
{
	return TRUE;
};

func void info_pacho_stop_info()
{
	AI_Output(self,hero,"Info_Pacho_STOP_13_01");	//Эй, ты!
	AI_Output(hero,self,"Info_Pacho_STOP_15_02");	//Кто? Я?
	AI_Output(self,hero,"Info_Pacho_STOP_13_03");	//Нет, твоя бабуля... Конечно ты, кто ж еще?
	AI_Output(self,hero,"Info_Pacho_STOP_13_04");	//Я бы на твоем месте туда не ходил!
	AI_Output(hero,self,"Info_Pacho_STOP_15_05");	//Почему?
	AI_Output(self,hero,"Info_Pacho_STOP_13_06");	//Похоже, ты здесь недавно.
	AI_Output(self,hero,"Info_Pacho_STOP_13_07");	//Парень, эта дорога ведет прямиком к оркам...
	AI_Output(self,hero,"Info_Pacho_STOP_13_08");	//Они с радостью сделают из тебя котлету!
	AI_Output(hero,self,"Info_Pacho_STOP_15_09");	//Ох...
	AI_Output(self,hero,"Info_Pacho_STOP_13_10");	//Не за что!
	Npc_ExchangeRoutine(self,"start2");
	AI_StopProcessInfos(self);
};

