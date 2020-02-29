
instance DIA_MELVIN2_EXIT(C_INFO)
{
	npc = nov_1373_melvin;
	nr = 999;
	condition = dia_melvin2_exit_condition;
	information = dia_melvin2_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_melvin2_exit_condition()
{
	return 1;
};

func void dia_melvin2_exit_info()
{
	AI_StopProcessInfos(self);
};

