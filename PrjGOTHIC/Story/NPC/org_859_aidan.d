
instance ORG_859_AIDAN(NPC_DEFAULT)
{
	name[0] = "Ёйдан";
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORG;
	level = 15;
	voice = 13;
	id = 859;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 192;
	attribute[ATR_HITPOINTS] = 192;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_Thief",9,1,org_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itkelockpick,1);
	CreateInvItems(self,itminugget,13);
	CreateInvItems(self,itforice,7);
	CreateInvItems(self,itfobooze,3);
	CreateInvItems(self,itlstorch,2);
	CreateInvItems(self,itfo_potion_health_01,1);
	CreateInvItem(self,itmi_stuff_barbknife_01);
	CreateInvItem(self,itmi_stuff_cup_01);
	CreateInvItem(self,itfomutton);
	CreateInvItem(self,itat_teeth_01);
	CreateInvItem(self,itfobooze);
	EquipItem(self,itmw_1h_mace_03);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	daily_routine = rtn_start_859;
	aivar[AIV_ITEMSCHWEIN] = TRUE;
};


func void rtn_start_859()
{
	ta_standaround(7,0,16,0,"OW_WOODRUIN_WOLF_SPAWN");
	ta_practicebow(16,0,21,0,"OW_WOODRUIN_WOLF_SPAWN");
	ta_sitcampfire(21,0,23,0,"OW_WOODRUIN_WOLF_SPAWN");
	ta_sleep(23,0,7,0,"OW_WOODRUIN_WOLF_SPAWN");
};

