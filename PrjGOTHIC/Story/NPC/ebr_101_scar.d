
instance EBR_101_SCAR(NPC_DEFAULT)
{
	name[0] = "и№рь";
	npctype = NPCTYPE_MAIN;
	guild = GIL_EBR;
	level = 80;
	voice = 8;
	id = 101;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 55;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",79,1,ebr_armor_h2);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,2);
	EquipItem(self,scars_schwert);
	EquipItem(self,itrw_crossbow_04);
	CreateInvItem(self,itfo_potion_health_03);
	CreateInvItems(self,itambolt,20);
	daily_routine = rtn_start_101;
	aivar[AIV_ITEMSCHWEIN] = TRUE;
};


func void rtn_start_101()
{
	ta_sleep(2,10,7,40,"OCC_BARONS_UPPER_RIGHT_ROOM_BED3");
	ta_smalltalk(7,40,21,5,"OCC_BARONS_GREATHALL_CENTER_FRONT");
	ta_standaround(21,5,2,10,"OCC_BARONS_GREATHALL_CENTER_MOVEMENT2");
};

func void rtn_ot_101()
{
	ta_guard(7,0,20,0,"OCC_MERCS_HALLWAY_MIDDLE");
	ta_guard(20,0,7,0,"OCC_MERCS_HALLWAY_MIDDLE");
};

func void rtn_qc_101()
{
	ta_practicesword(7,0,20,0,"LOCATION_11_08");
	ta_boss(20,0,7,0,"LOCATION_11_08");
};

