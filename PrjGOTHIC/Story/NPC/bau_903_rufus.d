
instance BAU_903_RUFUS(NPC_DEFAULT)
{
	name[0] = "Ðóôóñ";
	npctype = NPCTYPE_MAIN;
	guild = GIL_BAU;
	level = 4;
	voice = 2;
	id = 903;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,2,"Hum_Head_Bald",2,1,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_scythe_01);
	CreateInvItems(self,itforice,3);
	daily_routine = rtn_start_903;
};


func void rtn_start_903()
{
	ta_pickrice(7,10,20,10,"NC_PATH83_MOVEMENT");
	ta_sitcampfire(20,10,7,10,"NC_PATH_PEASANT_OUTSIDE5");
};

