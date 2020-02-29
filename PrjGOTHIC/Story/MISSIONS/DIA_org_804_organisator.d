
instance ORG_804_ORGANISATOR_EXIT(C_INFO)
{
	npc = org_804_organisator;
	nr = 999;
	condition = org_804_organisator_exit_condition;
	information = org_804_organisator_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int org_804_organisator_exit_condition()
{
	if(Npc_KnowsInfo(hero,org_804_organisator_tolares))
	{
		return 1;
	};
};

func void org_804_organisator_exit_info()
{
	AI_StopProcessInfos(self);
};


instance ORG_804_ORGANISATOR_GREET(C_INFO)
{
	npc = org_804_organisator;
	nr = 1;
	condition = org_804_organisator_greet_condition;
	information = org_804_organisator_greet_info;
	permanent = 0;
	important = 1;
};


func int org_804_organisator_greet_condition()
{
	if(Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST)
	{
		return 1;
	};
};

func void org_804_organisator_greet_info()
{
	AI_Output(self,other,"Org_804_Organisator_Greet_06_00");	//А ты куда собрался?
};


instance ORG_804_ORGANISATOR_WAYTO(C_INFO)
{
	npc = org_804_organisator;
	nr = 1;
	condition = org_804_organisator_wayto_condition;
	information = org_804_organisator_wayto_info;
	permanent = 0;
	description = "А куда еще здесь можно идти?";
};


func int org_804_organisator_wayto_condition()
{
	return 1;
};

func void org_804_organisator_wayto_info()
{
	var C_NPC lares;
	AI_Output(other,self,"Org_804_Organisator_WayTo_15_00");	//А куда еще здесь можно идти?
	AI_Output(self,other,"Org_804_Organisator_WayTo_06_01");	//К Ларсу.
	lares = Hlp_GetNpc(org_801_lares);
	lares.aivar[AIV_FINDABLE] = TRUE;
};


instance ORG_804_ORGANISATOR_TOLARES(C_INFO)
{
	npc = org_804_organisator;
	nr = 1;
	condition = org_804_organisator_tolares_condition;
	information = org_804_organisator_tolares_info;
	permanent = 0;
	description = "Мне нужно к Ларсу.";
};


func int org_804_organisator_tolares_condition()
{
	if(Npc_KnowsInfo(hero,org_804_organisator_wayto))
	{
		return 1;
	};
};

func void org_804_organisator_tolares_info()
{
	AI_Output(other,self,"Org_804_Organisator_ToLares_15_00");	//Мне нужно к Ларсу.
	AI_Output(self,other,"Org_804_Organisator_ToLares_06_01");	//Мне кажется, он не захочет с тобой разговаривать.
	AI_Output(other,self,"Org_804_Organisator_ToLares_15_02");	//Я сам с этим разберусь.
	AI_Output(self,other,"Org_804_Organisator_ToLares_06_03");	//Ну, не буду тебя задерживать.
	AI_StopProcessInfos(self);
};


instance ORG_804_ORGANISATOR_PERM(C_INFO)
{
	npc = org_804_organisator;
	nr = 1;
	condition = org_804_organisator_perm_condition;
	information = org_804_organisator_perm_info;
	permanent = 1;
	description = "Могу я увидеть Ларса?";
};


func int org_804_organisator_perm_condition()
{
	if(Npc_KnowsInfo(hero,org_804_organisator_tolares))
	{
		return 1;
	};
};

func void org_804_organisator_perm_info()
{
	AI_Output(other,self,"Org_804_Organisator_PERM_15_00");	//Могу я увидеть Ларса?
	AI_Output(self,other,"Org_804_Organisator_PERM_06_01");	//Спроси об этом у Роско.
	AI_StopProcessInfos(self);
};


const string ORG_804_CHECKPOINT = "NC_HUT23_OUT";

instance INFO_ORG_804_FIRSTWARN(C_INFO)
{
	npc = org_804_organisator;
	nr = 2;
	condition = info_org_804_firstwarn_condition;
	information = info_org_804_firstwarn_info;
	permanent = 1;
	important = 1;
};


func int info_org_804_firstwarn_condition()
{
	if(((other.guild == GIL_GRD) || (other.guild == GIL_STT)) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_org_804_firstwarn_info()
{
	printglobals(PD_MISSION);
	AI_Output(self,hero,"Info_Org_804_FirstWarn_Info_06_00");	//Прислужникам Гомеза вход воспрещен! Уходи!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,ORG_804_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	AI_StopProcessInfos(self);
};


instance INFO_ORG_804_LASTWARN(C_INFO)
{
	npc = org_804_organisator;
	nr = 1;
	condition = info_org_804_lastwarn_condition;
	information = info_org_804_lastwarn_info;
	permanent = 1;
	important = 1;
};


func int info_org_804_lastwarn_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && ((other.guild == GIL_GRD) || (other.guild == GIL_STT)) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,ORG_804_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func int info_org_804_lastwarn_info()
{
	AI_Output(self,hero,"Info_Org_804_LastWarn_06_00");	//Убирайся, пока цел!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,ORG_804_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};


instance INFO_ORG_804_ATTACK(C_INFO)
{
	npc = org_804_organisator;
	nr = 1;
	condition = info_org_804_attack_condition;
	information = info_org_804_attack_info;
	permanent = 1;
	important = 1;
};


func int info_org_804_attack_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && ((other.guild == GIL_GRD) || (other.guild == GIL_STT)) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,ORG_804_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func int info_org_804_attack_info()
{
	hero.aivar[AIV_LASTDISTTOWP] = 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_PUNISH;
	b_fullstop(self);
	AI_StopProcessInfos(self);
	b_intruderalert(self,other);
	b_setattackreason(self,AIV_AR_INTRUDER);
	Npc_SetTarget(self,hero);
	AI_StartState(self,zs_attack,1,"");
};

