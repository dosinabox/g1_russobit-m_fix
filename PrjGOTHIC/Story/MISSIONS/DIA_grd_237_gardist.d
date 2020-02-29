
const string GRD_237_CHECKPOINT = "OW_PATH_272";

instance INFO_GRD_237_FIRSTWARN(C_INFO)
{
	npc = grd_237_gardist;
	nr = 1;
	condition = info_grd_237_firstwarn_condition;
	information = info_grd_237_firstwarn_info;
	permanent = 1;
	important = 1;
};

func int info_grd_237_firstwarn_condition()
{
	var C_ITEM eqarmor1;
	eqarmor1 = Npc_GetEquippedArmor(hero);
	if(!Hlp_IsItem(eqarmor1,grd_armor_h) && (KAPITEL < 4) && (hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_grd_237_firstwarn_info()
{
	AI_Output(self,hero,"Info_Grd_237_FirstWarn_07_01");	//Тебе лучше здесь не оставаться. За этим укреплением начинаются земли орков.
	AI_Output(hero,self,"Info_Grd_237_FirstWarn_15_02");	//Там очень опасно?
	AI_Output(self,hero,"Info_Grd_237_FirstWarn_07_03");	//Скажем так: орки все равно не оставят тебя в живых, так что тебе лучше будет оставить всю свою руду у меня.
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,GRD_237_CHECKPOINT);
	Info_ClearChoices(info_grd_237_firstwarn);
	Info_AddChoice(info_grd_237_firstwarn,"Не думаю, что ты получишь от меня хоть что-нибудь.",info_grd_237_firstwarn_info_no);
	if(Npc_HasItems(other,itminugget) > 0)
	{
		Info_AddChoice(info_grd_237_firstwarn,"Ладно, вот тебе руда!",info_grd_237_firstwarn_info_yes);
	}
	else
	{
		Info_AddChoice(info_grd_237_firstwarn,"Но у меня не так много руды.",info_grd_237_firstwarn_info_noore);
	};
	Info_AddChoice(info_grd_237_firstwarn,"Думаю, я лучше пойду обратно.",info_grd_237_firstwarn_info_retreat);
};

func void info_grd_237_firstwarn_info_retreat()
{
	Info_ClearChoices(info_grd_237_firstwarn);
	AI_Output(hero,self,"Info_Grd_237_FirstWarn_15_04");	//Думаю, я лучше пойду обратно.
	AI_Output(self,hero,"Info_Grd_237_FirstWarn_07_05");	//Жаль, я уже придумал, как бы я потратил твою руду.
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,GRD_237_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	AI_StopProcessInfos(self);
};

func void info_grd_237_firstwarn_info_yes()
{
	var int ore;
	Info_ClearChoices(info_grd_237_firstwarn);
	AI_Output(hero,self,"Info_Grd_237_FirstWarn_15_06");	//Ладно, вот тебе руда!
	AI_Output(self,hero,"Info_Grd_237_FirstWarn_07_07");	//О, как щедро с твоей стороны!
	ore = Npc_HasItems(hero,itminugget);
	b_giveinvitems(hero,self,itminugget,ore);
	self.aivar[AIV_PASSGATE] = TRUE;
};

func void info_grd_237_firstwarn_info_noore()
{
	AI_Output(hero,self,"DIA_Grd_215_Torwache_First_Pay_NoOre_15_00");	//Но у меня не так много руды.
	AI_Output(self,hero,"SVM_7_ShitNoOre");	//Что, нет руды? Да от тебя никакого толка!
	AI_Output(self,hero,"SVM_7_OutOfMyWay");	//Уйди с дороги!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,GRD_237_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	AI_StopProcessInfos(self);
};

func void info_grd_237_firstwarn_info_no()
{
	Info_ClearChoices(info_grd_237_firstwarn);
	AI_Output(hero,self,"Info_Grd_237_FirstWarn_15_08");	//Не думаю, что ты получишь от меня хоть что-нибудь.
	AI_Output(self,hero,"Info_Grd_237_FirstWarn_07_09");	//Тогда разворачивайся и уходи.
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,GRD_237_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	AI_StopProcessInfos(self);
};


instance INFO_GRD_237_LASTWARN(C_INFO)
{
	npc = grd_237_gardist;
	nr = 2;
	condition = info_grd_237_lastwarn_condition;
	information = info_grd_237_lastwarn_info;
	permanent = 1;
	important = 1;
};


func int info_grd_237_lastwarn_condition()
{
	var C_ITEM eqarmor1;
	eqarmor1 = Npc_GetEquippedArmor(hero);
	if(!Hlp_IsItem(eqarmor1,grd_armor_h) && (KAPITEL < 4) && (hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,GRD_237_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_grd_237_lastwarn_info()
{
	AI_Output(self,hero,"Info_Grd_237_LastWarn_07_01");	//Ты оглох, а? Еще шаг, и ты станешь кормом для червей!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,GRD_237_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};


instance INFO_GRD_237_ATTACK(C_INFO)
{
	npc = grd_237_gardist;
	nr = 1;
	condition = info_grd_237_attack_condition;
	information = info_grd_237_attack_info;
	permanent = 1;
	important = 1;
};


func int info_grd_237_attack_condition()
{
	var C_ITEM eqarmor1;
	eqarmor1 = Npc_GetEquippedArmor(hero);
	if(!Hlp_IsItem(eqarmor1,grd_armor_h) && (KAPITEL < 4) && (hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,GRD_237_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_grd_237_attack_info()
{
	hero.aivar[AIV_LASTDISTTOWP] = 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_PUNISH;
	b_fullstop(self);
	AI_StopProcessInfos(self);
	b_setattackreason(self,AIV_AR_INTRUDER);
	Npc_SetTarget(self,hero);
	AI_StartState(self,zs_attack,1,"");
};

