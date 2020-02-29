
instance KDF_406_OTXARDAS(NPC_DEFAULT)
{
	name[0] = "Ксардас";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 50;
	voice = 14;
	id = 406;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 55;
	attribute[ATR_DEXTERITY] = 65;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",82,1,dmb_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	CreateInvItems(self,itarscrollsummondemon,20);
	EquipItem(self,itarrunefireball);
	CreateInvItems(self,itfo_potion_health_03,3);
	CreateInvItems(self,itfo_potion_mana_03,3);
	EquipItem(self,amulett_der_erleuchtung);
	EquipItem(self,ring_der_magie);
	EquipItem(self,ring_der_erleuchtung);
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_assesssc);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_assesscaster);
	daily_routine = rtn_start_406;
};


func void rtn_start_406()
{
	ta_intercept(15,0,22,0,"TPL_331");
	ta_intercept(22,0,15,0,"TPL_331");
};

func void rtn_drained_406()
{
	ta_drained_yberion(23,0,7,0,"TPL_331");
	ta_drained_yberion(7,0,23,0,"TPL_331");
};

func void rtn_remove_406()
{
	ta_stay(23,0,7,0,"TPL_408");
	ta_stay(7,0,23,0,"TPL_408");
};

