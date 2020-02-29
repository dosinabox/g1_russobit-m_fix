
instance INFO_RENYU_EXIT(C_INFO)
{
	npc = org_860_renyu;
	nr = 999;
	condition = info_renyu_exit_condition;
	information = info_renyu_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_renyu_exit_condition()
{
	return 1;
};

func void info_renyu_exit_info()
{
	AI_StopProcessInfos(self);
};


instance ORG_860_RENYU_GETLOST(C_INFO)
{
	npc = org_860_renyu;
	nr = 1;
	condition = org_860_renyu_getlost_condition;
	information = org_860_renyu_getlost_info;
	permanent = 1;
	important = 1;
};


func int org_860_renyu_getlost_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void org_860_renyu_getlost_info()
{
	AI_Output(self,other,"Org_860_Renyu_GetLost_Info_06_00");	//Убирайся!
	AI_StopProcessInfos(self);
};

