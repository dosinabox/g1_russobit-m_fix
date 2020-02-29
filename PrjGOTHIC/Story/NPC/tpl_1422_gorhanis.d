
instance TPL_1422_GORHANIS(NPC_DEFAULT)
{
	name[0] = "Гор Ханис";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 12;
	voice = 8;
	id = 1422;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 25;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 184;
	attribute[ATR_HITPOINTS] = 184;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",66,1,tpl_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	EquipItem(self,itmw_1h_sword_01);
	CreateInvItem(self,itfosoup);
	CreateInvItem(self,itmijoint_1);
	CreateInvItem(self,itmi_stuff_oldcoin_02);
	daily_routine = rtn_start_1422;
};


func void rtn_start_1422()
{
	ta_sleep(23,45,7,45,"OCR_HUT_32");
	ta_standaround(7,45,10,5,"OCR_CAMPFIRE_I_1");
	ta_smalltalk(10,5,16,0,"OCR_SMALLTALK_A_OC_ARENA");
	ta_practicesword(16,0,17,15,"OCR_ARENABATTLE");
	ta_sitcampfire(17,15,23,45,"OCR_CAMPFIRE_I_1");
};

