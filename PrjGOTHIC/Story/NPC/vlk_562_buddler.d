
instance VLK_562_BUDDLER(NPC_DEFAULT)
{
	name[0] = NAME_BUDDLER;
	npctype = NPCTYPE_MINE_AMBIENT;
	guild = GIL_VLK;
	level = 4;
	voice = 2;
	id = 562;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Thief",67,1,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_club_01);
	CreateInvItem(self,itmwpickaxe);
	CreateInvItem(self,itfoapple);
	daily_routine = rtn_start_562;
};


func void rtn_start_562()
{
	ta_pickore(23,0,5,0,"OM_CAVE1_74B");
	ta_pickore(5,0,23,0,"OM_CAVE1_74B");
};

