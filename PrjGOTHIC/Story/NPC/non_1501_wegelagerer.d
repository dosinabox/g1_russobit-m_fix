
instance NON_1501_WEGELAGERER(NPC_DEFAULT)
{
	name[0] = "Бандит";
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_NONE;
	level = 9;
	voice = 6;
	id = 1501;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 175;
	attribute[ATR_HITPOINTS] = 175;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,0,"Hum_Head_Thief",11,3,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_axe_old_01);
	CreateInvItem(self,itfoloaf);
	CreateInvItems(self,itminugget,9);
	CreateInvItems(self,itfobeer,2);
	daily_routine = rtn_start_1501;
};


func void rtn_start_1501()
{
	npc_setpermattitude(self,ATT_HOSTILE);
	ta_sitcampfire(22,0,6,0,"SPAWN_TALL_PATH_BANDITOS2_03");
	ta_smalltalk(6,0,22,0,"SPAWN_TALL_PATH_BANDITOS2_02_04");
};

