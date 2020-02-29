
instance ORG_825_ORGANISATOR_EXIT(C_INFO)
{
	npc = org_825_organisator;
	nr = 999;
	condition = org_825_organisator_exit_condition;
	information = org_825_organisator_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int org_825_organisator_exit_condition()
{
	return 1;
};

func void org_825_organisator_exit_info()
{
	AI_StopProcessInfos(self);
};


instance ORG_825_ORGANISATOR_PERM(C_INFO)
{
	npc = org_825_organisator;
	nr = 1;
	condition = org_825_organisator_perm_condition;
	information = org_825_organisator_perm_info;
	permanent = 1;
	description = "А что вы охраняете?";
};


func int org_825_organisator_perm_condition()
{
	return 1;
};

func void org_825_organisator_perm_info()
{
	AI_Output(other,self,"Org_825_Organisator_PERM_15_00");	//А что вы охраняете?
	AI_Output(self,other,"Org_825_Organisator_PERM_07_01");	//Мы здесь затем, чтобы никто из людей Ли или Гомеза не приближался к Ларсу.
	AI_StopProcessInfos(self);
};

