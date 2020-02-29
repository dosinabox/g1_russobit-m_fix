
instance VLK_584_SNIPES(NPC_DEFAULT)
{
	name[0] = "—Ì‡ÈÔÒ";
	npctype = NPCTYPE_MAIN;
	guild = GIL_VLK;
	level = 5;
	voice = 7;
	id = 584;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Thief",72,2,vlk_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_nailmace_01);
	CreateInvItem(self,itmwpickaxe);
	CreateInvItem(self,itfobeer);
	CreateInvItem(self,itlstorch);
	daily_routine = rtn_start_584;
};


func void rtn_start_584()
{
	ta_standaround(0,0,12,0,"OM_CAVE1_37");
	ta_sitaround(12,0,24,0,"OM_CAVE1_37");
};

