
instance NOV_1351_NOVIZE(NPC_DEFAULT)
{
	name[0] = NAME_NOVIZE;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_NOV;
	level = 3;
	flags = 0;
	voice = 3;
	id = 1351;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,2,"Hum_Head_Bald",6,0,nov_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_hatchet_01);
	CreateInvItem(self,itmw_1h_sledgehammer_01);
	daily_routine = rtn_start_1351;
};


func void rtn_start_1351()
{
	ta_smith_fire(8,40,8,50,"PSI_SMITH_01");
	ta_smith_anvil(8,50,9,0,"PSI_SMITH_01");
	ta_smith_cool(9,0,9,10,"PSI_SMITH_01");
	ta_smith_sharp(9,10,9,20,"PSI_SMITH_01");
	
	ta_standaround(9,20,9,30,"PSI_SMITH_01");
	ta_smith_fire(9,30,9,40,"PSI_SMITH_01");
	ta_smith_anvil(9,40,9,50,"PSI_SMITH_01");
	ta_smith_cool(9,50,10,0,"PSI_SMITH_01");
	ta_smith_sharp(10,0,10,10,"PSI_SMITH_01");
	
	ta_standaround(10,10,10,30,"PSI_SMITH_01");
	ta_smith_fire(10,30,10,40,"PSI_SMITH_01");
	ta_smith_anvil(10,40,10,50,"PSI_SMITH_01");
	ta_smith_cool(10,50,11,0,"PSI_SMITH_01");
	ta_smith_sharp(11,0,11,10,"PSI_SMITH_01");
	
	ta_standaround(11,10,11,30,"PSI_SMITH_01");
	ta_smith_fire(11,30,11,40,"PSI_SMITH_01");
	ta_smith_anvil(11,40,11,50,"PSI_SMITH_01");
	ta_smith_cool(11,50,12,0,"PSI_SMITH_01");
	ta_smith_sharp(12,0,12,10,"PSI_SMITH_01");
	
	ta_standaround(12,10,12,30,"PSI_SMITH_01");
	ta_smith_fire(12,30,12,40,"PSI_SMITH_01");
	ta_smith_anvil(12,40,12,50,"PSI_SMITH_01");
	ta_smith_cool(12,50,13,0,"PSI_SMITH_01");
	ta_smith_sharp(13,0,13,10,"PSI_SMITH_01");
	
	ta_standaround(13,10,13,30,"PSI_SMITH_01");
	ta_smith_fire(13,30,13,40,"PSI_SMITH_01");
	ta_smith_anvil(13,40,13,50,"PSI_SMITH_01");
	ta_smith_cool(13,50,14,0,"PSI_SMITH_01");
	ta_smith_sharp(14,0,14,10,"PSI_SMITH_01");
	
	ta_standaround(14,10,14,30,"PSI_SMITH_01");
	ta_smith_fire(14,30,14,40,"PSI_SMITH_01");
	ta_smith_anvil(14,40,14,50,"PSI_SMITH_01");
	ta_smith_cool(14,50,15,0,"PSI_SMITH_01");
	ta_smith_sharp(15,0,15,10,"PSI_SMITH_01");
	
	ta_standaround(15,10,15,30,"PSI_SMITH_01");
	ta_smith_fire(15,30,15,40,"PSI_SMITH_01");
	ta_smith_anvil(15,40,15,50,"PSI_SMITH_01");
	ta_smith_cool(15,50,16,0,"PSI_SMITH_01");
	ta_smith_sharp(16,0,16,10,"PSI_SMITH_01");
	
	ta_standaround(16,10,16,30,"PSI_SMITH_01");
	ta_smith_fire(16,30,16,40,"PSI_SMITH_01");
	ta_smith_anvil(16,40,16,50,"PSI_SMITH_01");
	ta_smith_cool(16,50,17,0,"PSI_SMITH_01");
	ta_smith_sharp(17,0,17,10,"PSI_SMITH_01");
	
	ta_standaround(17,10,17,30,"PSI_SMITH_01");
	ta_smith_fire(17,30,17,40,"PSI_SMITH_01");
	ta_smith_anvil(17,40,17,50,"PSI_SMITH_01");
	ta_smith_cool(17,50,18,0,"PSI_SMITH_01");
	ta_smith_sharp(18,0,18,10,"PSI_SMITH_01");
	
	ta_standaround(18,10,18,30,"PSI_SMITH_01");
	ta_smith_fire(18,30,18,40,"PSI_SMITH_01");
	ta_smith_anvil(18,40,18,50,"PSI_SMITH_01");
	ta_smith_cool(18,50,19,0,"PSI_SMITH_01");
	ta_smith_sharp(19,0,19,10,"PSI_SMITH_01");
	
	ta_standaround(19,10,19,30,"PSI_SMITH_01");
	ta_smith_fire(19,30,19,40,"PSI_SMITH_01");
	ta_smith_anvil(19,40,19,50,"PSI_SMITH_01");
	ta_smith_cool(19,50,20,0,"PSI_SMITH_01");
	ta_smith_sharp(20,0,20,10,"PSI_SMITH_01");
	
	ta_standaround(20,10,20,30,"PSI_SMITH_01");
	ta_smith_fire(20,30,20,40,"PSI_SMITH_01");
	ta_smith_anvil(20,40,20,50,"PSI_SMITH_01");
	ta_smith_cool(20,50,21,0,"PSI_SMITH_01");
	ta_smith_sharp(21,0,21,10,"PSI_SMITH_01");
	
	ta_standaround(21,10,21,30,"PSI_SMITH_01");
	ta_smith_fire(21,30,21,40,"PSI_SMITH_01");
	ta_smith_anvil(21,40,21,50,"PSI_SMITH_01");
	ta_smith_cool(21,50,22,0,"PSI_SMITH_01");
	ta_smith_sharp(22,0,22,10,"PSI_SMITH_01");
	
	ta_standaround(22,10,22,30,"PSI_SMITH_01");
	ta_smith_fire(22,30,22,40,"PSI_SMITH_01");
	ta_smith_anvil(22,40,22,50,"PSI_SMITH_01");
	ta_smith_cool(21,50,22,0,"PSI_SMITH_01");
	ta_smith_sharp(22,0,22,10,"PSI_SMITH_01");
	
	ta_standaround(22,10,23,0,"PSI_SMITH_01");
	ta_sleep(23,0,8,40,"PSI_26_HUT_IN");
};

func void rtn_prepareritual_1351()
{
};

func void rtn_omfull_1351()
{
};

func void rtn_fmtaken_1351()
{
};

func void rtn_orcassault_1351()
{
};

