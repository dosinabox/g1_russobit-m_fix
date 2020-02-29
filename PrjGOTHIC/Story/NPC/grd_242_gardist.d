
instance GRD_242_GARDIST(NPC_DEFAULT)
{
	name[0] = NAME_GARDIST;
	npctype = NPCTYPE_GUARD;
	guild = GIL_GRD;
	level = 20;
	voice = 7;
	id = 242;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 280;
	attribute[ATR_HITPOINTS] = 280;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_Thief",1,2,grd_armor_h);
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
	daily_routine = rtn_start_242;
};


func void rtn_start_242()
{
	ta_guardpalisade(6,0,21,0,"OCR_PALISADE_WALK_15");
	ta_guardpalisade(21,0,6,0,"OCR_PALISADE_WALK_15");
};

func void rtn_omfull_242()
{
	ta_guardpalisade(6,0,21,0,"OCC_BARONS_UPSTAIRS_PROMENADE_LEFT_GUARD");
	ta_sitaround(21,0,24,0,"OCC_MERCS_RIGHT_ROOM_FRONT");
	ta_sleep(24,0,6,0,"OCC_MERCS_UPPER_RIGHT_ROOM_FRONT");
};

func void rtn_fmtaken_242()
{
};

func void rtn_orcassault_242()
{
};

func void rtn_qc_242()
{
	ta_guardpassage(7,0,20,0,"LOCATION_11_07");
	ta_guardpassage(20,0,7,0,"LOCATION_11_07");
};

