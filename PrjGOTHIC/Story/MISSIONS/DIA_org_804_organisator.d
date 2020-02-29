
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
	return 1;
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
	if((Npc_GetDistToNpc(self,hero) < ZIVILANQUATSCHDIST) && (other.guild != GIL_GRD) && (other.guild != GIL_STT) && (other.guild != GIL_KDF) && (other.guild != GIL_ORG))
	{
		return 1;
	};
};

func void org_804_organisator_greet_info()
{
	AI_Output(self,other,"Org_804_Organisator_Greet_06_00");	//А ты куда собрался?
	if(Npc_HasItems(hero,thelist))
	{
		AI_Output(other,self,"ORG_801_Lares_BringList_15_00");		//У меня есть список припасов для Старой шахты.
		AI_Output(other,self,"Org_804_Organisator_PERM_15_00");	//Могу я увидеть Ларса?
		AI_Output(self,other,"Org_804_Organisator_PERM_06_01");	//Спроси об этом у Роско.
	}
	else
	{
		AI_Output(other,self,"Org_804_Organisator_WayTo_15_00");	//А куда еще здесь можно идти?
		AI_Output(self,other,"Org_804_Organisator_WayTo_06_01");	//К Ларсу.
		AI_Output(other,self,"Org_804_Organisator_ToLares_15_00");	//Мне нужно к Ларсу.
		AI_Output(self,other,"Org_804_Organisator_ToLares_06_01");	//Мне кажется, он не захочет с тобой разговаривать.
		AI_Output(other,self,"Org_804_Organisator_ToLares_15_02");	//Я сам с этим разберусь.
		AI_Output(self,other,"Org_804_Organisator_ToLares_06_03");	//Ну, не буду тебя задерживать.
	};
	AI_StopProcessInfos(self);
	var C_NPC lares;
	lares = Hlp_GetNpc(org_801_lares);
	lares.aivar[AIV_FINDABLE] = TRUE;
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
	if(((other.guild == GIL_GRD) || (other.guild == GIL_STT) || (other.guild == GIL_KDF)) && (self.aivar[AIV_PASSGATE] == FALSE) && (hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		if(Npc_GetDistToWP(hero,"NC_HUT23_OUT") < 450)
		{
			return TRUE;
		};
	};
};

func void info_org_804_firstwarn_info()
{
	printglobals(PD_MISSION);
	AI_Output(self,hero,"Info_Org_804_FirstWarn_Info_06_00");	//Прислужникам Гомеза вход воспрещен! Уходи!
	if(Npc_HasItems(hero,thelist))
	{
		AI_Output(other,self,"ORG_801_Lares_BringList_15_00");		//У меня есть список припасов для Старой шахты.
		AI_Output(other,self,"Org_804_Organisator_PERM_15_00");	//Могу я увидеть Ларса?
		AI_Output(self,other,"Org_804_Organisator_PERM_06_01");	//Спроси об этом у Роско.
		self.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,ORG_804_CHECKPOINT);
		hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
		AI_StopProcessInfos(self);
		LARES_STOP = TRUE;
	};
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
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && ((other.guild == GIL_GRD) || (other.guild == GIL_STT) || (other.guild == GIL_KDF)) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,ORG_804_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_org_804_lastwarn_info()
{
	AI_Output(self,hero,"Info_Org_804_LastWarn_06_00");	//Убирайся, пока цел!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,ORG_804_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
	LARES_STOP = TRUE;
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
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && ((other.guild == GIL_GRD) || (other.guild == GIL_STT) || (other.guild == GIL_KDF)) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,ORG_804_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_org_804_attack_info()
{
	hero.aivar[AIV_LASTDISTTOWP] = 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_PUNISH;
	b_fullstop(self);
	AI_StopProcessInfos(self);
	b_intruderalert(self,other);
	b_setattackreason(self,AIV_AR_INTRUDER);
	Npc_SetTarget(self,hero);
	AI_StartState(self,zs_attack,1,"");
	LARES_STOP = TRUE;
};

