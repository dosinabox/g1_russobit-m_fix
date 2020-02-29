
instance NOV_1371_BAALNETBEK(NPC_DEFAULT)
{
	name[0] = "ָהמכ ֽועבוך";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NOV;
	level = 3;
	flags = 0;
	voice = 3;
	id = 1371;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Fatbald",101,1,nov_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	CreateInvItem(self,itmw_1h_hatchet_01);
	daily_routine = rtn_start_1371;
};


func void rtn_start_1371()
{
	ta_stay(24,0,6,0,"PATH_TAKE_HERB_08");
	ta_stay(6,0,24,0,"PATH_TAKE_HERB_08");
};

