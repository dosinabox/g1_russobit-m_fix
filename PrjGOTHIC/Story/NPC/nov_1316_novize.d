
instance NOV_1316_NOVIZE(NPC_DEFAULT)
{
	name[0] = NAME_NOVIZE;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_NOV;
	level = 3;
	voice = 2;
	id = 1316;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",32,1,nov_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_hatchet_01);
	CreateInvItem(self,itmw_1h_sledgehammer_01);
	daily_routine = rtn_start_1316;
};


func void rtn_start_1316()
{
	ta_standaround(7,50,8,20,"PSI_SMITH_1_2");
	ta_smith_fire(8,20,8,30,"PSI_SMITH_01");
	ta_smith_anvil(8,30,8,40,"PSI_SMITH_01");
	ta_smith_cool(8,40,8,50,"PSI_SMITH_01");
	ta_smith_sharp(8,50,8,55,"PSI_SMITH_01");
	
	ta_standaround(8,55,9,20,"PSI_SMITH_1_2");
	ta_smith_fire(9,20,9,30,"PSI_SMITH_01");
	ta_smith_anvil(9,30,9,40,"PSI_SMITH_01");
	ta_smith_cool(9,40,9,50,"PSI_SMITH_01");
	ta_smith_sharp(9,50,9,55,"PSI_SMITH_01");
	
	ta_standaround(9,55,10,20,"PSI_SMITH_1_2");
	ta_smith_fire(10,20,10,30,"PSI_SMITH_01");
	ta_smith_anvil(10,30,10,40,"PSI_SMITH_01");
	ta_smith_cool(10,40,10,50,"PSI_SMITH_01");
	ta_smith_sharp(10,50,10,55,"PSI_SMITH_01");
	
	ta_standaround(10,55,11,20,"PSI_SMITH_1_2");
	ta_smith_fire(11,20,11,30,"PSI_SMITH_01");
	ta_smith_anvil(11,30,11,40,"PSI_SMITH_01");
	ta_smith_cool(11,40,11,50,"PSI_SMITH_01");
	ta_smith_sharp(11,50,11,55,"PSI_SMITH_01");
	
	ta_standaround(11,55,12,20,"PSI_SMITH_1_2");
	ta_smith_fire(12,20,12,30,"PSI_SMITH_01");
	ta_smith_anvil(12,30,12,40,"PSI_SMITH_01");
	ta_smith_cool(12,40,12,50,"PSI_SMITH_01");
	ta_smith_sharp(12,50,12,55,"PSI_SMITH_01");
	
	ta_standaround(12,55,13,20,"PSI_SMITH_1_2");
	ta_smith_fire(13,20,13,30,"PSI_SMITH_01");
	ta_smith_anvil(13,30,13,40,"PSI_SMITH_01");
	ta_smith_cool(13,40,13,50,"PSI_SMITH_01");
	ta_smith_sharp(13,50,13,55,"PSI_SMITH_01");
	
	ta_standaround(13,55,14,20,"PSI_SMITH_1_2");
	ta_smith_fire(14,20,14,30,"PSI_SMITH_01");
	ta_smith_anvil(14,30,14,40,"PSI_SMITH_01");
	ta_smith_cool(14,40,14,50,"PSI_SMITH_01");
	ta_smith_sharp(14,50,14,55,"PSI_SMITH_01");
	
	ta_standaround(14,55,15,20,"PSI_SMITH_1_2");
	ta_smith_fire(15,20,15,30,"PSI_SMITH_01");
	ta_smith_anvil(15,30,15,40,"PSI_SMITH_01");
	ta_smith_cool(15,40,15,50,"PSI_SMITH_01");
	ta_smith_sharp(15,50,15,55,"PSI_SMITH_01");
	
	ta_standaround(15,55,16,20,"PSI_SMITH_1_2");
	ta_smith_fire(16,20,16,30,"PSI_SMITH_01");
	ta_smith_anvil(16,30,16,40,"PSI_SMITH_01");
	ta_smith_cool(16,40,16,50,"PSI_SMITH_01");
	ta_smith_sharp(16,50,16,55,"PSI_SMITH_01");
	
	ta_standaround(16,55,17,20,"PSI_SMITH_1_2");
	ta_smith_fire(17,20,17,30,"PSI_SMITH_01");
	ta_smith_anvil(17,30,17,40,"PSI_SMITH_01");
	ta_smith_cool(17,40,17,50,"PSI_SMITH_01");
	ta_smith_sharp(17,50,17,55,"PSI_SMITH_01");
	
	ta_standaround(17,55,18,20,"PSI_SMITH_1_2");
	ta_smith_fire(18,20,18,30,"PSI_SMITH_01");
	ta_smith_anvil(18,30,18,40,"PSI_SMITH_01");
	ta_smith_cool(18,40,18,50,"PSI_SMITH_01");
	ta_smith_sharp(18,50,18,55,"PSI_SMITH_01");
	
	ta_standaround(18,55,19,20,"PSI_SMITH_1_2");
	ta_smith_fire(19,20,19,30,"PSI_SMITH_01");
	ta_smith_anvil(19,30,19,40,"PSI_SMITH_01");
	ta_smith_cool(19,40,19,50,"PSI_SMITH_01");
	ta_smith_sharp(19,50,19,55,"PSI_SMITH_01");
	
	ta_standaround(19,55,20,20,"PSI_SMITH_1_2");
	ta_smith_fire(20,20,20,30,"PSI_SMITH_01");
	ta_smith_anvil(20,30,20,40,"PSI_SMITH_01");
	ta_smith_cool(20,40,20,50,"PSI_SMITH_01");
	ta_smith_sharp(20,50,20,55,"PSI_SMITH_01");
	
	ta_standaround(20,55,21,20,"PSI_SMITH_1_2");
	ta_smith_fire(21,20,21,30,"PSI_SMITH_01");
	ta_smith_anvil(21,30,21,40,"PSI_SMITH_01");
	ta_smith_cool(21,40,21,50,"PSI_SMITH_01");
	ta_smith_sharp(21,50,21,55,"PSI_SMITH_01");
	
	ta_standaround(21,55,22,20,"PSI_SMITH_1_2");
	ta_smith_fire(22,20,22,30,"PSI_SMITH_01");
	ta_smith_anvil(21,30,21,40,"PSI_SMITH_01");
	ta_smith_cool(21,40,21,50,"PSI_SMITH_01");
	ta_smith_sharp(21,50,21,55,"PSI_SMITH_01");
	
	ta_standaround(21,55,22,40,"PSI_SMITH_1_2");
	ta_sleep(22,40,7,50,"PSI_22_HUT_IN");
};

func void rtn_prepareritual_1316()
{
};

func void rtn_omfull_1316()
{
};

func void rtn_fmtaken_1316()
{
};

func void rtn_orcassault_1316()
{
};

