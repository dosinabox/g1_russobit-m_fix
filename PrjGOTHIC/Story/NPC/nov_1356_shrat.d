
instance NOV_1356_SHRAT(NPC_DEFAULT)
{
	name[0] = "Øðýò";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NOV;
	level = 3;
	voice = 2;
	id = 1356;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 7;
	attribute[ATR_MANA] = 7;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_FatBald",28,1,nov_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_hatchet_01);
	daily_routine = rtn_start_1356;
};


func void rtn_start_1356()
{
	ta_sitcampfire(8,0,20,0,"PATH_SWAMP_HUT");
	ta_sitcampfire(20,0,8,0,"PATH_SWAMP_HUT");
};

func void rtn_follow_1356()
{
	ta_followpc(23,0,16,0,"PATH_SWAMP_HUT");
	ta_followpc(16,0,23,0,"PATH_SWAMP_HUT");
};

