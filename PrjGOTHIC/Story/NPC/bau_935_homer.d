
instance BAU_935_HOMER(NPC_DEFAULT)
{
	name[0] = "Гомер";
	npctype = NPCTYPE_MAIN;
	guild = GIL_BAU;
	level = 6;
	flags = 0;
	voice = 2;
	id = 935;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 11;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 112;
	attribute[ATR_HITPOINTS] = 112;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Thief",5,1,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itforice,5);
	CreateInvItem(self,itfoloaf);
	CreateInvItem(self,itfobooze);
	EquipItem(self,itmw_1h_mace_01);
	CreateInvItem(self,itmi_stuff_pipe_01);
	CreateInvItem(self,itmi_stuff_barbknife_01);
	CreateInvItem(self,itmi_stuff_mug_01);
	CreateInvItem(self,itmi_alchemy_quicksilver_01);
	daily_routine = rtn_prestart_935;
};


func void rtn_prestart_935()
{
	ta_boss(7,30,21,30,"NC_DAM");
	ta_boss(21,30,7,30,"NC_DAM");
};

func void rtn_start_935()
{
	ta_sitaround(7,30,15,30,"NC_HUT13_OUT");
	ta_boss(15,30,20,0,"NC_DAM");
	ta_sleep(20,0,7,30,"NC_HUT13_IN");
};

func void rtn_damnpast_935()
{
	ta_sitaround(7,30,21,30,"NC_HUT13_OUT");
	ta_sleep(21,30,7,30,"NC_HUT13_IN");
};

