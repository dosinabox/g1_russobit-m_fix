
instance GRD_244_GARDIST(NPC_DEFAULT)
{
	name[0] = NAME_GARDIST;
	npctype = NPCTYPE_GUARD;
	guild = GIL_GRD;
	level = 20;
	voice = 7;
	id = 244;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 280;
	attribute[ATR_HITPOINTS] = 280;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",18,2,grd_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_RANGED;
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
	daily_routine = rtn_start_244;
};


func void rtn_start_244()
{
	ta_guardpalisade(6,0,21,0,"OCR_PALISADE_WALK_18");
	ta_guardpalisade(21,0,6,0,"OCR_PALISADE_WALK_18");
};

func void rtn_fmtaken_244()
{
	ta_stayneutral(7,0,20,0,"OCR_MAINGATE_OUTSIDE");
	ta_stayneutral(20,0,7,0,"OCR_MAINGATE_OUTSIDE");
};

func void rtn_fmtaken2_244()
{
	ta_stay(7,0,20,0,"OCR_MAINGATE_OUTSIDE");
	ta_stay(20,0,7,0,"OCR_MAINGATE_OUTSIDE");
};

