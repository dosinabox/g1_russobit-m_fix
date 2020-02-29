
instance ORG_818_RATFORD(NPC_DEFAULT)
{
	name[0] = "Ðועפמנה";
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORG;
	level = 9;
	voice = 7;
	id = 818;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_Fighter",9,3,org_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itkelockpick,2);
	CreateInvItems(self,itminugget,17);
	CreateInvItems(self,itforice,6);
	CreateInvItems(self,itfobooze,2);
	CreateInvItems(self,itlstorch,3);
	CreateInvItems(self,itfo_potion_health_01,3);
	CreateInvItem(self,itmi_stuff_plate_01);
	CreateInvItem(self,itmi_stuff_cup_01);
	CreateInvItem(self,itfoloaf);
	CreateInvItem(self,itat_claws_01);
	EquipItem(self,itmw_1h_mace_03);
	EquipItem(self,itrw_bow_small_04);
	CreateInvItems(self,itamarrow,40);
	daily_routine = rtn_start_818;
};


func void rtn_start_818()
{
	ta_smalltalk(0,0,23,0,"OW_PATH_1_5_A");
	ta_smalltalk(23,0,0,0,"OW_PATH_1_5_A");
};

func void rtn_fmtaken_818()
{
	ta_sitcampfire(7,0,18,0,"OW_WOODRUIN_WOLF_SPAWN");
	ta_standaround(18,0,7,0,"OW_PATH_02");
};

