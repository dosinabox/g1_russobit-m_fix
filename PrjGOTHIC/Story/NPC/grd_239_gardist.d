
instance GRD_239_GARDIST(NPC_DEFAULT)
{
	name[0] = "Надзиратель";
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_GRD;
	level = 15;
	voice = 7;
	id = 239;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_FatBald",10,1,grd_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,itmw_1h_sword_02);
	EquipItem(self,itrw_crossbow_01);
	CreateInvItems(self,itambolt,30);
	CreateInvItem(self,itfocheese);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	CreateInvItem(self,itlstorch);
	daily_routine = rtn_start_239;
};


func void rtn_start_239()
{
	ta_guardpassage(6,0,23,0,"OCC_CELLAR_HALLWAY_FRONT");
	ta_sleep(23,0,6,0,"OCC_CELLAR_BED_NEW");
};

func void rtn_ot_239()
{
	ta_guard(7,0,20,0,"OCC_CELLAR_HALL");
	ta_guard(20,0,7,0,"OCC_CELLAR_HALL");
};

const string GRD_239_CHECKPOINT = "OCC_CELLAR_HALLWAY_BACK";

instance INFO_GRD_239_FIRSTWARN(C_INFO)
{
	npc = grd_239_gardist;
	nr = 1;
	condition = info_grd_239_firstwarn_condition;
	information = info_grd_239_firstwarn_info;
	permanent = 1;
	important = 1;
};

func int info_grd_239_firstwarn_condition()
{
	var C_NPC alex;
	alex = Hlp_GetNpc(org_899_alex);
	if(alex.aivar[AIV_PARTYMEMBER] == FALSE && (hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) && Npc_GetTrueGuild(hero) != GIL_GRD && Npc_GetTrueGuild(hero) != GIL_STT && Npc_GetTrueGuild(hero) != GIL_KDF && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1000))
	{
		return TRUE;
	};
};

func void info_grd_239_firstwarn_info()
{
	AI_Output(self,hero,"SVM_7_GetOutOfHere");	//Убирайся! Пошел отсюда!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,GRD_239_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	AI_StopProcessInfos(self);
};

instance INFO_GRD_239_LASTWARN(C_INFO)
{
	npc = grd_239_gardist;
	nr = 2;
	condition = info_grd_239_lastwarn_condition;
	information = info_grd_239_lastwarn_info;
	permanent = 1;
	important = 1;
};


func int info_grd_239_lastwarn_condition()
{
	var C_NPC alex;
	alex = Hlp_GetNpc(org_899_alex);
	if(alex.aivar[AIV_PARTYMEMBER] == FALSE && (hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,GRD_239_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) && Npc_GetTrueGuild(hero) != GIL_GRD && Npc_GetTrueGuild(hero) != GIL_STT && Npc_GetTrueGuild(hero) != GIL_KDF && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1000))
	{
		return TRUE;
	};
};

func void info_grd_239_lastwarn_info()
{
	AI_Output(self,hero,"Info_Grd_237_LastWarn_07_01");	//Ты оглох, а? Еще шаг, и ты станешь кормом для червей!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,GRD_239_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};


instance INFO_GRD_239_ATTACK(C_INFO)
{
	npc = grd_239_gardist;
	nr = 1;
	condition = info_grd_239_attack_condition;
	information = info_grd_239_attack_info;
	permanent = 1;
	important = 1;
};


func int info_grd_239_attack_condition()
{
	var C_NPC alex;
	alex = Hlp_GetNpc(org_899_alex);
	if(alex.aivar[AIV_PARTYMEMBER] == FALSE && (hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,GRD_239_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) && Npc_GetTrueGuild(hero) != GIL_GRD && Npc_GetTrueGuild(hero) != GIL_STT && Npc_GetTrueGuild(hero) != GIL_KDF && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1000))
	{
		return TRUE;
	};
};

func void info_grd_239_attack_info()
{
	hero.aivar[AIV_LASTDISTTOWP] = 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_PUNISH;
	b_fullstop(self);
	AI_StopProcessInfos(self);
	b_setattackreason(self,AIV_AR_INTRUDER);
	Npc_SetTarget(self,hero);
	AI_StartState(self,zs_attack,1,"");
};

instance INFO_GRD_239_ALERT(C_INFO)
{
	npc = grd_239_gardist;
	nr = 1;
	condition = info_grd_239_alert_condition;
	information = info_grd_239_alert_info;
	permanent = 0;
	important = 1;
};

func int info_grd_239_alert_condition()
{
	var C_NPC alex;
	alex = Hlp_GetNpc(org_899_alex);
	if(Npc_KnowsInfo(hero,info_alex_letsgo) && alex.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void info_grd_239_alert_info()
{
	var C_NPC alex;
	alex = Hlp_GetNpc(org_899_alex);
	AI_Output(self,hero,"SVM_7_Strange");	//Куда же он ушел? Невозможно! Как такое может быть?!
	AI_Output(self,hero,"SVM_7_Alarm");	//Стража, сюда!
	AI_StopProcessInfos(self);
	b_setattackreason(self,AIV_AR_INTRUDER);
	Npc_SetTarget(self,hero);
	AI_StartState(self,zs_attack,1,"");
	Npc_SetTarget(alex,self);
	AI_StartState(alex,zs_attack,1,"");
};
