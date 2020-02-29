
instance BABE(NPC_DEFAULT)
{
	name[0] = "babe";
	guild = GIL_NONE;
	level = 1;
	flags = 0;
	voice = 19;
	id = 110;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 6;
	attribute[ATR_DEXTERITY] = 8;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	Mdl_SetVisual(self,"Babe.MDS");
	Mdl_SetVisualBody(self,"Bab_body_Naked0",0,0,"Bab_Head_Hair1",0,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_COWARD;
};

instance BABE2(NPC_DEFAULT)
{
	name[0] = "babe2";
	guild = GIL_NONE;
	level = 1;
	flags = 0;
	voice = 19;
	id = 110;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 6;
	attribute[ATR_DEXTERITY] = 8;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	Mdl_SetVisual(self,"Babe.MDS");
	Mdl_SetVisualBody(self,"Bab_body_Naked0",0,1,"Bab_Head_Hair1",0,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItem(self,bab_armor_nude);
	CreateInvItem(self,bab_armor_bikini);
	start_aistate = zs_babe_sweep;
};

instance BABE3(NPC_DEFAULT)
{
	name[0] = "babe3";
	guild = GIL_NONE;
	level = 1;
	flags = 0;
	voice = 19;
	id = 110;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 6;
	attribute[ATR_DEXTERITY] = 8;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	Mdl_SetVisual(self,"Babe.MDS");
	Mdl_SetVisualBody(self,"Bab_body_Naked0",1,1,"Bab_Head_Hair1",1,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	start_aistate = zs_babe_sitaround;
};

instance BABE4(NPC_DEFAULT)
{
	name[0] = "babe4";
	guild = GIL_NONE;
	level = 1;
	flags = 0;
	voice = 19;
	id = 110;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 6;
	attribute[ATR_DEXTERITY] = 8;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	Mdl_SetVisual(self,"Babe.MDS");
	Mdl_SetVisualBody(self,"Bab_body_Naked0",2,1,"Bab_Head_Hair1",2,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	start_aistate = zs_babe_dance;
};

instance BABE5(NPC_DEFAULT)
{
	name[0] = "babe5";
	guild = GIL_NONE;
	level = 1;
	flags = 0;
	voice = 19;
	id = 110;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 6;
	attribute[ATR_DEXTERITY] = 8;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	Mdl_SetVisual(self,"Babe.MDS");
	Mdl_SetVisualBody(self,"Bab_body_Naked0",2,1,"Bab_Head_Hair1",3,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_COWARD;
};

instance BABE6(NPC_DEFAULT)
{
	name[0] = "babe6";
	guild = GIL_NONE;
	level = 1;
	flags = 0;
	voice = 19;
	id = 110;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 6;
	attribute[ATR_DEXTERITY] = 8;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	Mdl_SetVisual(self,"Babe.MDS");
	Mdl_SetVisualBody(self,"Bab_body_Naked0",0,2,"Bab_Head_Hair1",0,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_COWARD;
};

instance BABE7(NPC_DEFAULT)
{
	name[0] = "babe7";
	guild = GIL_NONE;
	level = 1;
	flags = 0;
	voice = 19;
	id = 110;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 6;
	attribute[ATR_DEXTERITY] = 8;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	Mdl_SetVisual(self,"Babe.MDS");
	Mdl_SetVisualBody(self,"Bab_body_Naked0",0,3,"Bab_Head_Hair1",0,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_COWARD;
};

