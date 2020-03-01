
instance ORG_861_KILLIAN_EXIT(C_INFO)
{
	npc = org_861_killian;
	nr = 999;
	condition = org_861_killian_exit_condition;
	information = org_861_killian_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int org_861_killian_exit_condition()
{
	return TRUE;
};

func void org_861_killian_exit_info()
{
	AI_StopProcessInfos(self);
};


instance ORG_861_KILLIAN_GETLOST(C_INFO)
{
	npc = org_861_killian;
	nr = 1;
	condition = org_861_killian_getlost_condition;
	information = org_861_killian_getlost_info;
	permanent = 1;
	important = 1;
};


func int org_861_killian_getlost_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void org_861_killian_getlost_info()
{
	AI_Output(self,other,"Org_861_Killian_GetLost_Info_13_00");	//Убирайся отсюда!
	AI_StopProcessInfos(self);
};

