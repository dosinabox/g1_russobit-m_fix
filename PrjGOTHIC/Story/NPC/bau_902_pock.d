
instance BAU_902_POCK(NPC_DEFAULT)
{
	name[0] = "Пок";
	npctype = NPCTYPE_MAIN;
	guild = GIL_BAU;
	level = 4;
	voice = 4;
	id = 902;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Pony",3,2,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itforice,6);
	CreateInvItem(self,itmi_stuff_plate_01);
	CreateInvItem(self,itfobooze);
	EquipItem(self,itmw_1h_scythe_01);
	daily_routine = rtn_start_902;
};


func void rtn_start_902()
{
	ta_sleep(20,15,7,15,"NC_PATH_PEASANT_OUTSIDE2");
	ta_pickrice(7,15,20,15,"NC_PATH54_02");
};

