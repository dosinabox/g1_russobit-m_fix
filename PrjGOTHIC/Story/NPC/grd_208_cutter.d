
instance GRD_208_CUTTER(NPC_DEFAULT)
{
	name[0] = "Палач";
	npctype = NPCTYPE_MAIN;
	guild = GIL_GRD;
	level = 20;
	voice = 8;
	id = 208;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 280;
	attribute[ATR_HITPOINTS] = 280;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Bald",3,1,grd_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,1);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,itmw_1h_sword_03);
	EquipItem(self,itrw_crossbow_01);
	CreateInvItems(self,itambolt,30);
	CreateInvItem(self,itfomutton);
	CreateInvItems(self,itminugget,20);
	CreateInvItem(self,itfo_potion_health_01);
	CreateInvItem(self,itlstorch);
	daily_routine = rtn_start_208;
};


func void rtn_start_208()
{
	ta_sleep(23,35,8,35,"OCC_MERCS_UPPER_RIGHT_ROOM_BED2");
	ta_smalltalk(8,35,23,35,"OCC_MERCS_ENTRANCE");
};

func void rtn_ot_208()
{
	ta_guard(7,0,20,0,"OCC_MERCS_ENTRANCE");
	ta_guard(20,0,7,0,"OCC_MERCS_ENTRANCE");
};

func void rtn_fmtaken_208()
{
	ta_stayneutral(7,0,20,0,"OCR_NORTHGATE_LEFT_GUARD_CHANGE");
	ta_stayneutral(20,0,7,0,"OCR_NORTHGATE_LEFT_GUARD_CHANGE");
};

func void rtn_fmtaken2_208()
{
	ta_stay(7,0,20,0,"OCR_NORTHGATE_LEFT_GUARD_CHANGE");
	ta_stay(20,0,7,0,"OCR_NORTHGATE_LEFT_GUARD_CHANGE");
};

