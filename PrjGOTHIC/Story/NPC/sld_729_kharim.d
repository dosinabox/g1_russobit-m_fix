
instance SLD_729_KHARIM(NPC_DEFAULT)
{
	name[0] = "Карим";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 11;
	voice = 9;
	id = 729;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 172;
	attribute[ATR_HITPOINTS] = 172;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",9,1,sld_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	EquipItem(self,itmw_1h_mace_02);
	CreateInvItems(self,itforice,7);
	CreateInvItems(self,itfoloaf,5);
	CreateInvItems(self,itfomutton,4);
	CreateInvItems(self,itminugget,19);
	CreateInvItems(self,itfobooze,5);
	CreateInvItems(self,itlstorch,5);
	CreateInvItems(self,itfo_potion_health_01,7);
	CreateInvItem(self,itmi_stuff_barbknife_01);
	CreateInvItem(self,itmi_stuff_amphore_01);
	CreateInvItem(self,itmi_stuff_oldcoin_02);
	daily_routine = rtn_start_729;
};


func void rtn_start_729()
{
	ta_sleep(0,0,7,30,"OCR_HUT_31");
	ta_standaround(7,30,11,0,"OCR_CAMPFIRE_I_2");
	ta_smith_sharp(11,0,14,0,"OCR_OUTSIDE_HUT_31");
	ta_practicesword(14,0,15,0,"OCR_ARENABATTLE");
	ta_standaround(15,0,17,0,"OCR_ARENABATTLE_OUTSIDE");
	ta_sitcampfire(17,0,0,0,"OCR_CAMPFIRE_I_2");
};

func void rtn_guide_729()
{
	ta_guidepc(8,0,20,0,"OCR_ARENABATTLE_TRAIN");
	ta_guidepc(20,0,8,0,"OCR_ARENABATTLE_TRAIN");
};

