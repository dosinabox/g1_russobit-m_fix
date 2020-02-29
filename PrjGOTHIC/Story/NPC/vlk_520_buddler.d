
instance VLK_520_BUDDLER(NPC_DEFAULT)
{
	name[0] = NAME_BUDDLER;
	npctype = NPCTYPE_MAIN;
	guild = GIL_VLK;
	level = 2;
	voice = 1;
	id = 520;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Thief",68,2,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_club_01);
	CreateInvItem(self,itfoapple);
	CreateInvItem(self,itmilute);
	daily_routine = rtn_start_520;
};


func void rtn_start_520()
{
	ta_sitcampfire(10,0,22,0,"OC_ROUND_22_CF_1");
	ta_sitcampfire(10,0,22,0,"OC_ROUND_22_CF_1");
};

