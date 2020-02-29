
instance KDW_601_MYXIR(NPC_DEFAULT)
{
	name[0] = "Миксир";
	npctype = NPCTYPE_MAIN;
	guild = GIL_KDW;
	level = 24;
	voice = 10;
	id = 601;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 55;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 328;
	attribute[ATR_HITPOINTS] = 328;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Pony",7,4,kdw_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,5);
	EquipItem(self,itarrunethunderbolt);
	CreateInvItem(self,itfo_potion_health_02);
	CreateInvItem(self,itfo_potion_mana_03);
	CreateInvItem(self,itfo_plants_flameberry_01);
	CreateInvItem(self,itfo_plants_ravenherb_01);
	daily_routine = rtn_start_601;
};


func void rtn_start_601()
{
	ta_sleep(1,0,4,0,"NC_KDW03_IN");
	ta_readbook(4,0,1,0,"NC_KDW03_IN");
};

func void rtn_orealert_601()
{
	ta_guard(1,0,4,0,"NC_KDW03+04_OUT");
	ta_guard(4,0,1,0,"NC_KDW03+04_OUT");
};

