
instance DIA_ORG_875_EXIT(C_INFO)
{
	npc = org_875_tuersteher;
	nr = 999;
	condition = dia_org_875_exit_condition;
	information = dia_org_875_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_org_875_exit_condition()
{
	return 1;
};

func void dia_org_875_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORG_875_PERM(C_INFO)
{
	npc = org_875_tuersteher;
	nr = 1;
	condition = dia_org_875_perm_condition;
	information = dia_org_875_perm_info;
	permanent = 1;
	description = "“ы пропускаешь кого-нибудь, кроме воров и рудокопов?";
};


func int dia_org_875_perm_condition()
{
	return 1;
};

func void dia_org_875_perm_info()
{
	AI_Output(other,self,"DIA_Org_875_PERM_15_00");	//“ы пропускаешь кого-нибудь, кроме воров и рудокопов?
	AI_Output(self,other,"DIA_Org_875_PERM_13_01");	//Ѕрать€м из секты здесь проход всегда открыт.
	AI_Output(self,other,"DIA_Org_875_PERM_13_02");	//Ќо кроме них мы никого не пропускаем.
};

