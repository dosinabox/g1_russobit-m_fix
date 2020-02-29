
instance INFO_MYXIR_EXIT(C_INFO)
{
	npc = kdw_601_myxir;
	nr = 999;
	condition = info_myxir_exit_condition;
	information = info_myxir_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_myxir_exit_condition()
{
	return TRUE;
};

func void info_myxir_exit_info()
{
	AI_StopProcessInfos(self);
};

