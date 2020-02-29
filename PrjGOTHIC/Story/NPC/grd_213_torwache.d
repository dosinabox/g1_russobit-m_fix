
instance GRD_213_TORWACHE(NPC_DEFAULT)
{
	name[0] = NAME_TORWACHE;
	npctype = NPCTYPE_MAIN;
	guild = GIL_GRD;
	level = 15;
	voice = 7;
	id = 213;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",13,1,grd_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
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
	daily_routine = rtn_start_213;
};


func void rtn_start_213()
{
	ta_guardpassage(6,0,21,0,"OCC_GATE_LEFT_GUARD");
	ta_guardpassage(21,0,6,0,"OCC_GATE_LEFT_GUARD");
};

func void rtn_omfull_213()
{
	ta_sleep(0,0,6,0,"OCC_MERCS_UPPER_LEFT_ROOM_FRONT");
	ta_guardpassage(6,0,21,0,"OCC_GATE_LEFT_GUARD");
	ta_standaround(21,0,22,0,"OCC_MERCS_RIGHT_ROOM_FRONT");
	ta_sitaround(22,0,22,15,"OCC_FIGHTTRAINING");
	ta_practicesword(22,15,24,0,"OCC_FIGHTTRAINING");
};

func void rtn_fmtaken_213()
{
};

func void rtn_orcassault_213()
{
};

