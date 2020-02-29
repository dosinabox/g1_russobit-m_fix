
instance INFO_COERPRESSER_EXIT(C_INFO)
{
	npc = org_889_coerpresser;
	nr = 999;
	condition = info_coerpresser_exit_condition;
	information = info_coerpresser_exit_info;
	important = 1;
	permanent = 1;
};


func int info_coerpresser_exit_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void info_coerpresser_exit_info()
{
	AI_Output(self,other,"SVM_7_YouDeafOrWhat");	//’очешь со мной поссоритьс€? ”йди с дороги!
	AI_StopProcessInfos(self);
};

