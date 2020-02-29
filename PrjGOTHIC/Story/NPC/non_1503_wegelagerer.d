
instance NON_1503_WEGELAGERER(NPC_DEFAULT)
{
	name[0] = "Бандит";
	npctype = NPCTYPE_ROGUE;
	guild = GIL_NONE;
	level = 9;
	voice = 9;
	id = 1503;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 170;
	attribute[ATR_HITPOINTS] = 170;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,2,"Hum_Head_FatBald",9,3,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nailmace_01);
	CreateInvItems(self,itminugget,11);
	CreateInvItem(self,itfoloaf);
	CreateInvItem(self,itfobeer);
	daily_routine = rtn_start_1503;
};


func void rtn_start_1503()
{
	ta_sitcampfire(22,0,6,0,"OW_PATH_BANDITOS01");
	ta_smalltalk(6,0,22,0,"OW_PATH_BANDITOS01");
};
