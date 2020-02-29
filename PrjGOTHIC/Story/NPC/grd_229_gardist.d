
instance GRD_229_GARDIST(NPC_DEFAULT)
{
	name[0] = NAME_GARDIST;
	npctype = NPCTYPE_GUARD;
	guild = GIL_GRD;
	level = 20;
	voice = 13;
	id = 229;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 280;
	attribute[ATR_HITPOINTS] = 280;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Psionic",2,1,grd_armor_h);
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
	daily_routine = rtn_start_229;
};


func void rtn_start_229()
{
	ta_guardpalisade(8,0,22,0,"OCR_PALISADE_ABOVE_MARKETPLACE_01");
	ta_sleep(22,0,8,0,"OCC_MERCS_LEFT_ROOM_BED5");
};

func void rtn_fmtaken_229()
{
	ta_stayneutral(7,0,20,0,"OCR_NORTHGATE_OUTSIDE_DOOR");
	ta_stayneutral(20,0,7,0,"OCR_NORTHGATE_OUTSIDE_DOOR");
};

func void rtn_fmtaken2_229()
{
	ta_stay(7,0,20,0,"OCR_NORTHGATE_OUTSIDE_DOOR");
	ta_stay(20,0,7,0,"OCR_NORTHGATE_OUTSIDE_DOOR");
};

