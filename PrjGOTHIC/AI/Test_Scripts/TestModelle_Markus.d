
instance PC_MINI(C_NPC)
{
	name[0] = "Mini";
	guild = GIL_NONE;
	level = 10;
	voice = 11;
	id = 3001;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_MANA_MAX] = 10;
	attribute[ATR_MANA] = 10;
	attribute[ATR_HITPOINTS_MAX] = 18;
	attribute[ATR_HITPOINTS] = 18;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Pony",77,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_COWARD;
};

instance OVERLAYTESTMODELL(C_NPC)
{
	name[0] = "ATestmodell";
	guild = GIL_BAU;
	level = 10;
	voice = 11;
	id = 3001;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 18;
	attribute[ATR_HITPOINTS] = 18;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald",DEFAULT,DEFAULT,-1);
	Mdl_ApplyOverlayMds(self,"Humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_1hST2.mds");
	Mdl_ApplyOverlayMds(self,"Humans_2hST1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"Humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_BowT2.mds");
	Mdl_ApplyOverlayMds(self,"Humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_CBowT2.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Acrobatic.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_ApplyOverlayMds(self,"Humans_drunken.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Swim.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Sprint.mds");
	b_scale(self);
	fight_tactic = FAI_HUMAN_COWARD;
};

instance BATHBABE(C_NPC)
{
	name[0] = "Badenixe";
	guild = GIL_EBR;
	level = 3;
	voice = 11;
	id = 3009;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 7;
	attribute[ATR_DEXTERITY] = 11;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 13;
	attribute[ATR_HITPOINTS] = 13;
	Mdl_SetVisual(self,"BABE.MDS");
	Mdl_SetVisualBody(self,"Bab_body_Naked0",DEFAULT,1,"Bab_Head_Hair1",3,DEFAULT,-1);
	start_aistate = zs_bathing_babe;
};

