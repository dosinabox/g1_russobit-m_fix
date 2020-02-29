
instance GRD_212_TORWACHE(NPC_DEFAULT)
{
	name[0] = NAME_TORWACHE;
	npctype = NPCTYPE_MAIN;
	guild = GIL_GRD;
	level = 15;
	voice = 13;
	id = 212;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",19,1,grd_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	aivar[AIV_RESPAWN] = TRUE;
	fight_tactic = FAI_HUMAN_RANGED;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,itmw_1h_sword_03);
	EquipItem(self,itrw_crossbow_01);
	CreateInvItems(self,itambolt,30);
	CreateInvItem(self,itfocheese);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	CreateInvItem(self,itlstorch);
	daily_routine = rtn_start_212;
};


func void rtn_start_212()
{
	ta_guardpassage(6,0,21,0,"OCC_GATE_RIGHT_GUARD");
	ta_guardpassage(21,0,6,0,"OCC_GATE_RIGHT_GUARD");
};

func void rtn_omfull_212()
{
	ta_guardpassage(6,0,21,0,"OCC_GATE_RIGHT_GUARD");
	ta_standaround(21,0,22,0,"OCC_MERCS_RIGHT_ROOM_FRONT");
	ta_sitaround(22,0,24,0,"OCC_GATE_CAMPFIRE_1");
	ta_sleep(24,0,6,0,"OCC_MERCS_UPPER_LEFT_ROOM_FRONT");
};

func void rtn_fmtaken_212()
{
};

func void rtn_orcassault_212()
{
};

