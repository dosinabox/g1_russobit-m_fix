
instance GRD_201_JACKAL(NPC_DEFAULT)
{
	name[0] = "Шакал";
	npctype = NPCTYPE_MAIN;
	guild = GIL_GRD;
	level = 50;
	voice = 7;
	id = 201;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,2,"Hum_Head_Fighter",4,1,grd_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,itmw_1h_axe_03);
	EquipItem(self,itrw_crossbow_03);
	CreateInvItems(self,itambolt,15);
	daily_routine = rtn_start_201;
};


func void rtn_start_201()
{
	ta_guard(6,0,7,0,"OCR_CAMPFIRE_F_1");
	ta_guard(7,0,8,0,"OCR_OUTSIDE_HUT_42");
	ta_guard(8,0,9,0,"OCR_CAMPFIRE_F_1");
	ta_guard(9,0,10,0,"OCR_NORTHGATE_RAMP_BELOW");
	ta_guard(10,0,11,0,"OCR_CAMPFIRE_F_1");
	ta_guard(11,0,12,0,"OCR_OUTSIDE_HUT_42");
	ta_guard(12,0,13,0,"OCR_CAMPFIRE_F_1");
	ta_guard(13,0,14,0,"OCR_NORTHGATE_RAMP_BELOW");
	ta_guard(14,0,15,0,"OCR_CAMPFIRE_F_1");
	ta_guard(15,0,16,0,"OCR_OUTSIDE_HUT_42");
	ta_guard(16,0,17,0,"OCR_CAMPFIRE_F_1");
	ta_guard(17,0,18,0,"OCR_NORTHGATE_RAMP_BELOW");
	ta_guard(18,0,19,0,"OCR_CAMPFIRE_F_1");
	ta_guard(19,0,20,0,"OCR_OUTSIDE_HUT_42");
	ta_guard(20,0,21,0,"OCR_CAMPFIRE_F_1");
	ta_guard(21,0,22,0,"OCR_NORTHGATE_RAMP_BELOW");
	ta_guard(22,0,23,0,"OCR_CAMPFIRE_F_1");
	ta_guard(23,0,0,0,"OCR_OUTSIDE_HUT_42");
	ta_guard(0,0,1,0,"OCR_CAMPFIRE_F_1");
	ta_guard(1,0,2,0,"OCR_NORTHGATE_RAMP_BELOW");
	ta_guard(2,0,3,0,"OCR_CAMPFIRE_F_1");
	ta_guard(3,0,4,0,"OCR_OUTSIDE_HUT_42");
	ta_guard(4,0,5,0,"OCR_CAMPFIRE_F_1");
	ta_guard(5,0,6,0,"OCR_NORTHGATE_RAMP_BELOW");
};

func void rtn_fmtaken_201()
{
	ta_stayneutral(2,0,3,0,"FMC_FM_ENTRANCE");
	ta_stayneutral(3,0,2,0,"FMC_FM_ENTRANCE");
};

func void rtn_fmtaken2_201()
{
	ta_stay(2,0,3,0,"FMC_FM_ENTRANCE");
	ta_stay(3,0,2,0,"FMC_FM_ENTRANCE");
};

