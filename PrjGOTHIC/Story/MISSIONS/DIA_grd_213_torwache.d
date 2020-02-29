
const string GRD_213_CHECKPOINT = "OCC_GATE_INSIDE";

instance INFO_GRD_213_FIRSTWARN(C_INFO)
{
	npc = grd_213_torwache;
	nr = 1;
	condition = info_grd_213_firstwarn_condition;
	information = info_grd_213_firstwarn_info;
	permanent = 1;
	important = 1;
};


func int info_grd_213_firstwarn_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_grd_213_firstwarn_info()
{
	printglobals(PD_MISSION);
	AI_Output(self,hero,"Info_Grd_213_FirstWarn_Info_07_01");	//Стоять!
	AI_Output(hero,self,"Info_Grd_213_FirstWarn_Info_15_02");	//В чем дело?
	AI_Output(self,hero,"Info_Grd_213_FirstWarn_Info_07_03");	//Тебе нельзя заходить в замок! Убирайся!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,GRD_213_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	AI_StopProcessInfos(self);
};


instance INFO_GRD_213_LASTWARN(C_INFO)
{
	npc = grd_213_torwache;
	nr = 1;
	condition = info_grd_213_lastwarn_condition;
	information = info_grd_213_lastwarn_info;
	permanent = 1;
	important = 1;
};


func int info_grd_213_lastwarn_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,GRD_213_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_grd_213_lastwarn_info()
{
	AI_Output(self,hero,"Info_Grd_213_LastWarn_07_01");	//Ты оглох? Еще шаг, и я превращу тебя в корм для червей!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,GRD_213_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};


instance INFO_GRD_213_ATTACK(C_INFO)
{
	npc = grd_213_torwache;
	nr = 1;
	condition = info_grd_213_attack_condition;
	information = info_grd_213_attack_info;
	permanent = 1;
	important = 1;
};


func int info_grd_213_attack_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,GRD_213_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_grd_213_attack_info()
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


instance GRD_213_TORWACHE_WELCOME(C_INFO)
{
	npc = grd_213_torwache;
	condition = grd_213_torwache_welcome_condition;
	information = grd_213_torwache_welcome_info;
	important = 1;
	permanent = 0;
};


func int grd_213_torwache_welcome_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void grd_213_torwache_welcome_info()
{
	AI_Output(self,other,"Grd_213_Torwache_WELCOME_Info_07_01");	//Я слышал, ты стал одним из нас. Неплохо для того, кто так мало времени провел в колонии.
};


instance INFO_GRD_213_EXIT(C_INFO)
{
	npc = grd_213_torwache;
	nr = 999;
	condition = info_grd_213_exit_condition;
	information = info_grd_213_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_grd_213_exit_condition()
{
	return 1;
};

func void info_grd_213_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_GRD_213_ABBLITZEN(C_INFO)
{
	npc = grd_213_torwache;
	nr = 1;
	condition = info_grd_213_abblitzen_condition;
	information = info_grd_213_abblitzen_info;
	permanent = 1;
	description = "Тебе следует менять вид деятельности. Может, пустишь в замок?";
};


func int info_grd_213_abblitzen_condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return 1;
	};
};

func void info_grd_213_abblitzen_info()
{
	AI_Output(other,self,"Info_Grd_213_Abblitzen_15_00");	//Тебе иногда следует менять вид деятельности, чтобы жизнь разнообразить. Может, пустишь меня в замок?
	AI_Output(self,other,"Info_Grd_213_Abblitzen_07_01");	//Разнообразить, говоришь? А мне нравится эта идея. Мне уже так давно не удавалось хорошо проучить такого как ты.
	AI_StopProcessInfos(self);
};


instance INFO_GRD_213_PASSGATE(C_INFO)
{
	npc = grd_213_torwache;
	nr = 1;
	condition = info_grd_213_passgate_condition;
	information = info_grd_213_passgate_info;
	permanent = 1;
	description = "Ну, все в порядке?";
};


func int info_grd_213_passgate_condition()
{
	if(self.aivar[AIV_PASSGATE] == TRUE)
	{
		return 1;
	};
};

func void info_grd_213_passgate_info()
{
	AI_Output(other,self,"Info_Grd_213_Passgate_15_00");	//Ну, все в порядке?
	AI_Output(self,other,"Info_Grd_213_Passgate_07_01");	//Хватит стоять в воротах и мешать другим, проходи.
	AI_StopProcessInfos(self);
};

