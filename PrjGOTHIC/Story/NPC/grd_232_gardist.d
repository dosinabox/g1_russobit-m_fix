
instance GRD_232_GARDIST(NPC_DEFAULT)
{
	name[0] = NAME_GARDIST;
	npctype = NPCTYPE_GUARD;
	guild = GIL_GRD;
	level = 15;
	voice = 13;
	id = 232;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Thief",1,2,grd_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
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
	daily_routine = rtn_start_232;
};


func void rtn_start_232()
{
	ta_sleep(23,0,7,0,"OCC_MERCS_LEFT_ROOM_BED1");
	ta_smalltalk(7,0,23,0,"OCR_TO_MAINGATE_INSERT");
};

func void rtn_fmtaken_232()
{
	ta_stayneutral(7,0,20,0,"OCR_NORTHGATE_RIGHT_GUARD_CHANGE");
	ta_stayneutral(20,0,7,0,"OCR_NORTHGATE_RIGHT_GUARD_CHANGE");
};

func void rtn_fmtaken2_232()
{
	ta_stay(7,0,20,0,"OCR_NORTHGATE_RIGHT_GUARD_CHANGE");
	ta_stay(20,0,7,0,"OCR_NORTHGATE_RIGHT_GUARD_CHANGE");
};

