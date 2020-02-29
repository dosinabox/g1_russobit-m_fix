
instance ORG_898_ALEX(NPC_DEFAULT)
{
	name[0] = "Алекс";
	npctype = NPCTYPE_FRIEND;
	guild = GIL_SLD;
	level = 999;
	voice = 19;
	id = 898;
	//flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 20;
	attribute[ATR_MANA] = 20;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	protection[PROT_FIRE] = 1000;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",39,4,org2l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	aivar[AIV_IMPORTANT] = TRUE;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_mace_03);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,70);
	daily_routine = rtn_start_898;
};


func void rtn_start_898()
{
	ta_practicesword(7,0,20,0,"LOCATION_11_14");
	ta_practicesword(20,0,7,0,"LOCATION_11_14");
};

func void rtn_follow_898()
{
	ta_followpc(13,0,14,0,"LOCATION_11_14");
	ta_followpc(14,0,13,0,"LOCATION_11_14");
};

func void rtn_oc2_898()
{
	ta_stay(13,0,14,0,"OC_ROUND_26");
	ta_stay(14,0,13,0,"OC_ROUND_26");
};

instance INFO_ALEX2_EXIT(C_INFO)
{
	npc = org_898_alex;
	nr = 999;
	condition = info_raeubers_exit_condition;
	information = info_raeubers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

instance INFO_ALEX2_LETSGO(C_INFO)
{
	npc = org_898_alex;
	condition = info_alex2_letsgo_condition;
	information = info_alex2_letsgo_info;
	important = 0;
	permanent = 1;
	description = "Пойдем со мной, мне нужна твоя помощь.";
};

func int info_alex2_letsgo_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (Npc_GetDistToWP(self,"OW_VM_ENTRANCE") > 1200) && (Npc_GetDistToWP(self,"LOCATION_03_OUT") > 1200) && (Npc_GetDistToWP(self,"OW_PATH_198_ORCGRAVEYARD7") > 1200) && (Npc_GetDistToWP(self,"PATH_OC_PSI_18") > 4200) && (Npc_GetDistToWP(self,"OW_PATH_ORCENTRANCE") > 1200) && (Npc_GetDistToWP(self,"NC_PATH51") > 1200) && (Npc_GetDistToWP(self,"OW_OM_ENTRANCE02_WHEEL") > 5400) && (Npc_GetDistToWP(self,"OC1") > 1200) && (Npc_GetDistToWP(self,"OC2") > 1200))
	{
		return TRUE;
	};
};

func void info_alex2_letsgo_info()
{
	AI_Output(hero,self,"Info_GornFM_FOLLOW_15_01");	//Пойдем со мной, мне нужна твоя помощь.
	AI_Output(self,hero,"Alex_03_01");	//Без проблем, дружище!
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"follow");
	if(FMTAKEN == TRUE)
	{
		self.guild = GIL_KDF;
	};
	AI_StopProcessInfos(self);
};

instance ALEX2_OM(C_INFO)
{
	npc = org_898_alex;
	nr = 1;
	condition = alex2_om_condition;
	information = alex2_om_info;
	permanent = 1;
	important = 1;
};

func int alex2_om_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToWP(self,"OW_OM_ENTRANCE02_WHEEL") < 5200) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return 1;
	};
};

func void alex2_om_info()
{
	AI_Output(self,hero,"Alex_OM");	//Шахта? Ну уж нет, у меня до сих пор кашель после сырости в тюрьме.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"start");
	Npc_SetRefuseTalk(self,5);
	AI_StopProcessInfos(self);
};

instance ALEX2_AM(C_INFO)
{
	npc = org_898_alex;
	nr = 1;
	condition = alex2_am_condition;
	information = alex2_am_info;
	permanent = 1;
	important = 1;
};

func int alex2_am_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToWP(self,"OW_VM_ENTRANCE") < 1000) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (KAPITEL < 3))
	{
		return 1;
	};
};

func void alex2_am_info()
{
	AI_Output(self,hero,"Alex_OM");	//Шахта? Ну уж нет, у меня до сих пор кашель после сырости в тюрьме.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"start");
	Npc_SetRefuseTalk(self,5);
	AI_StopProcessInfos(self);
};

instance ALEX2_OC(C_INFO)
{
	npc = org_898_alex;
	nr = 1;
	condition = alex2_oc_condition;
	information = alex2_oc_info;
	permanent = 1;
	important = 1;
};

func int alex2_oc_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToWP(self,"OC1") < 1000) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (FMTAKEN == FALSE))
	{
		return 1;
	};
};

func void alex2_oc_info()
{
	AI_Output(self,hero,"Alex_OC");	//Прости, больше я в Старый лагерь ни ногой!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"start");
	Npc_SetRefuseTalk(self,5);
	AI_StopProcessInfos(self);
};

instance ALEX2_OC2(C_INFO)
{
	npc = org_898_alex;
	nr = 1;
	condition = alex2_oc2_condition;
	information = alex2_oc2_info;
	permanent = 1;
	important = 1;
};

func int alex2_oc2_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToWP(self,"OC2") < 1000) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (FMTAKEN == FALSE))
	{
		return 1;
	};
};

func void alex2_oc2_info()
{
	AI_Output(self,hero,"Alex_OC");	//Прости, больше я в Старый лагерь ни ногой!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"oc2");
	Npc_SetRefuseTalk(self,5);
	AI_StopProcessInfos(self);
};

instance ALEX2_NC(C_INFO)
{
	npc = org_898_alex;
	nr = 1;
	condition = alex2_nc_condition;
	information = alex2_nc_info;
	permanent = 1;
	important = 1;
};

func int alex2_nc_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToWP(self,"NC_PATH51") < 1000) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return 1;
	};
};

func void alex2_nc_info()
{
	AI_Output(self,hero,"Alex_NC");	//Извини, в Новый лагерь тебе придется пойти без меня.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"start");
	Npc_SetRefuseTalk(self,5);
	AI_StopProcessInfos(self);
};

instance ALEX2_OT(C_INFO)
{
	npc = org_898_alex;
	nr = 1;
	condition = alex2_ot_condition;
	information = alex2_ot_info;
	permanent = 1;
	important = 1;
};

func int alex2_ot_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToWP(self,"OW_PATH_ORCENTRANCE") < 1000) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return 1;
	};
};

func void alex2_ot_info()
{
	AI_Output(self,hero,"Alex_OT");	//Я вернусь в наше логово, ты сможешь найти меня там.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"start");
	Npc_SetRefuseTalk(self,5);
	AI_StopProcessInfos(self);
};

instance ALEX2_PC(C_INFO)
{
	npc = org_898_alex;
	nr = 1;
	condition = alex2_pc_condition;
	information = alex2_pc_info;
	permanent = 1;
	important = 1;
};

func int alex2_pc_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToWP(self,"PATH_OC_PSI_18") < 4000) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return 1;
	};
};

func void alex2_pc_info()
{
	AI_Output(self,hero,"Alex_PC");	//В Болотном лагере меня знают в лицо, лучше там не появляться...
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"start");
	Npc_SetRefuseTalk(self,5);
	AI_StopProcessInfos(self);
};

instance ALEX2_XARDAS(C_INFO)
{
	npc = org_898_alex;
	nr = 1;
	condition = alex2_xardas_condition;
	information = alex2_xardas_info;
	permanent = 1;
	important = 1;
};

func int alex2_xardas_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToWP(self,"LOCATION_03_OUT") < 1000) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return 1;
	};
};

func void alex2_xardas_info()
{
	AI_Output(self,hero,"Alex_OT");	//Я вернусь в наше логово, ты сможешь найти меня там.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"start");
	Npc_SetRefuseTalk(self,5);
	AI_StopProcessInfos(self);
};

instance ALEX2_OGY(C_INFO)
{
	npc = org_898_alex;
	nr = 1;
	condition = alex2_ogy_condition;
	information = alex2_ogy_info;
	permanent = 1;
	important = 1;
};

func int alex2_ogy_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToWP(self,"OW_PATH_198_ORCGRAVEYARD7") < 1000) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return 1;
	};
};

func void alex2_ogy_info()
{
	AI_Output(self,hero,"Alex_OT");	//Я вернусь в наше логово, ты сможешь найти меня там.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"start");
	Npc_SetRefuseTalk(self,5);
	AI_StopProcessInfos(self);
};

