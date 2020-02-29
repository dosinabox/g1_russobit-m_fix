
instance BAU_901_HORATIO(NPC_DEFAULT)
{
	name[0] = "Горацио";
	npctype = NPCTYPE_MAIN;
	guild = GIL_BAU;
	level = 8;
	voice = 9;
	id = 901;
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 11;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 136;
	attribute[ATR_HITPOINTS] = 136;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Fighter",99,2,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itforice,5);
	CreateInvItem(self,itmi_stuff_plate_01);
	CreateInvItem(self,itfobooze);
	EquipItem(self,itmw_1h_scythe_01);
	daily_routine = rtn_start_901;
};


func void rtn_start_901()
{
	ta_sitcampfire(20,0,6,0,"NC_PATH_PEASANT_OUTSIDE10");
	ta_pickrice(6,0,20,0,"NC_PATH78_A");
};

