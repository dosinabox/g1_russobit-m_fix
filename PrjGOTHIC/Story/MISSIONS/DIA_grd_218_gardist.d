
instance DIA_GRD_218_FIRSTIN(C_INFO)
{
	npc = grd_218_gardist;
	nr = 1;
	condition = dia_grd_218_firstin_condition;
	information = dia_grd_218_firstin_info;
	permanent = 0;
	important = 1;
};


func int dia_grd_218_firstin_condition()
{
	if(self.aivar[AIV_PASSGATE] == TRUE)
	{
		return 1;
	};
};

func void dia_grd_218_firstin_info()
{
	AI_Output(self,other,"DIA_Grd_218_FirstIn_07_00");	//Стой! Что тебе здесь нужно?
	AI_Output(other,self,"DIA_Grd_218_FirstIn_15_01");	//Просто хотел зайти.
	AI_Output(self,other,"DIA_Grd_218_FirstIn_07_02");	//Ты шутишь, да?
	AI_Output(other,self,"DIA_Grd_218_FirstIn_15_03");	//Лучше спроси об этом Торуса.
	AI_Output(self,other,"DIA_Grd_218_FirstIn_07_04");	//Конечно, спрошу. И если ты солгал, я лично тебя убью.
	AI_Output(other,self,"DIA_Grd_218_FirstIn_15_05");	//Это значит, что я могу войти?
	AI_Output(self,other,"DIA_Grd_218_FirstIn_07_06");	//Да, давай быстрее!
	AI_StopProcessInfos(self);
};


const string GRD_218_CHECKPOINT = "OCC_BARONS_HALLWAY_FRONT";

instance INFO_GRD_218_FIRSTWARN(C_INFO)
{
	npc = grd_218_gardist;
	nr = 1;
	condition = info_grd_218_firstwarn_condition;
	information = info_grd_218_firstwarn_info;
	permanent = 1;
	important = 1;
};


func int info_grd_218_firstwarn_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_grd_218_firstwarn_info()
{
	printglobals(PD_MISSION);
	AI_Output(self,hero,"Info_Grd_218_FirstWarn_Info_07_01");	//Стой! Ни шагу дальше!
	AI_Output(hero,self,"Info_Grd_218_FirstWarn_Info_15_02");	//Это почему?
	AI_Output(self,hero,"Info_Grd_218_FirstWarn_Info_07_03");	//Для таких как ты дом Баронов закрыт, понял?
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,GRD_218_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	AI_StopProcessInfos(self);
};


instance INFO_GRD_218_ATTACK(C_INFO)
{
	npc = grd_218_gardist;
	nr = 1;
	condition = info_grd_218_attack_condition;
	information = info_grd_218_attack_info;
	permanent = 1;
	important = 1;
};


func int info_grd_218_attack_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,GRD_218_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 200)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_grd_218_attack_info()
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

