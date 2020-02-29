
instance DIA_DUSTY2_EXIT(C_INFO)
{
	npc = nov_1372_dusty;
	nr = 999;
	condition = dia_dusty2_exit_condition;
	information = dia_dusty2_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_dusty2_exit_condition()
{
	return 1;
};

func void dia_dusty2_exit_info()
{
	AI_StopProcessInfos(self);
};

