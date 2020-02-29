
instance VLK_548_BUDDLER(NPC_DEFAULT)
{
	name[0] = NAME_BUDDLER;
	npctype = NPCTYPE_MINE_AMBIENT;
	guild = GIL_VLK;
	level = 3;
	voice = 2;
	id = 548;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_FatBald",72,1,vlk_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nailmace_01);
	CreateInvItem(self,itmwpickaxe);
	CreateInvItem(self,itfoloaf);
	CreateInvItem(self,itfobeer);
	CreateInvItem(self,itlstorch);
	daily_routine = rtn_start_548;
};


func void rtn_start_548()
{
	ta_pickore(0,0,23,0,"OM_PICKORE_06");
	ta_pickore(23,0,24,0,"OM_PICKORE_06");
};

