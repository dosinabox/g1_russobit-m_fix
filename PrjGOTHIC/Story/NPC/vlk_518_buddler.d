
instance VLK_518_BUDDLER(NPC_DEFAULT)
{
	name[0] = NAME_BUDDLER;
	npctype = NPCTYPE_MINE_AMBIENT;
	guild = GIL_VLK;
	level = 2;
	voice = 3;
	id = 518;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Thief",70,2,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItem(self,itminugget);
	EquipItem(self,itmwpickaxe);
	daily_routine = rtn_start_518;
};


func void rtn_start_518()
{
	ta_pickore(0,0,12,0,"OM_PICKORE_13");
	ta_pickore(12,0,24,0,"OM_PICKORE_13");
};

