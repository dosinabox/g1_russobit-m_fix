
instance INFO_MERDARION_EXIT(C_INFO)
{
	npc = kdw_602_merdarion;
	nr = 999;
	condition = info_merdarion_exit_condition;
	information = info_merdarion_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_merdarion_exit_condition()
{
	return TRUE;
};

func void info_merdarion_exit_info()
{
	AI_StopProcessInfos(self);
};

