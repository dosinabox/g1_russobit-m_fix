
instance NOV_1301_CAINE(NPC_DEFAULT)
{
	name[0] = "Каин";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NOV;
	level = 9;
	voice = 13;
	id = 1301;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 148;
	attribute[ATR_HITPOINTS] = 148;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",21,1,nov_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_axe_old_01);
	CreateInvItems(self,itminugget,5);
	CreateInvItems(self,itforice,2);
	CreateInvItems(self,itfobooze,6);
	daily_routine = rtn_start_1301;
};


func void rtn_start_1301()
{
	ta_sleep(23,0,8,0,"PSI_21_HUT_IN");
	ta_potionalchemy(8,0,9,0,"PSI_LABOR_BASEMENT_1");
	ta_smoke(9,0,10,0,"PSI_21_HUT_EX");
	ta_potionalchemy(10,0,11,0,"PSI_LABOR_BASEMENT_1");
	ta_smoke(11,0,12,0,"PSI_21_HUT_EX");
	ta_potionalchemy(12,0,13,0,"PSI_LABOR_BASEMENT_1");
	ta_smoke(13,0,14,0,"PSI_21_HUT_EX");
	ta_potionalchemy(14,0,15,0,"PSI_LABOR_BASEMENT_1");
	ta_smoke(15,0,16,0,"PSI_21_HUT_EX");
	ta_potionalchemy(16,0,17,0,"PSI_LABOR_BASEMENT_1");
	ta_smoke(17,0,18,0,"PSI_21_HUT_EX");
	ta_potionalchemy(18,0,19,0,"PSI_LABOR_BASEMENT_1");
	ta_smoke(19,0,20,0,"PSI_21_HUT_EX");
	ta_potionalchemy(20,0,21,0,"PSI_LABOR_BASEMENT_1");
	ta_smoke(21,0,22,0,"PSI_21_HUT_EX");
	ta_potionalchemy(22,0,23,0,"PSI_LABOR_BASEMENT_1");
};

