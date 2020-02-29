
instance CS_RICHTER(NPC_DEFAULT)
{
	name[0] = "Судья";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 5;
	voice = 13;
	id = 3022;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",89,1,law_armor);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = rtn_start_3022;
};


func void rtn_start_3022()
{
	ta_position(0,0,24,0,"WP_INTRO_WI01");
};

