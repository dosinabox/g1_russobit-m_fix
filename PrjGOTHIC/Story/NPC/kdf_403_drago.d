
instance KDF_403_DRAGO(NPC_DEFAULT)
{
	name[0] = "Драго";
	npctype = NPCTYPE_MAIN;
	guild = GIL_KDF;
	level = 28;
	voice = 13;
	id = 403;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 376;
	attribute[ATR_HITPOINTS] = 376;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Thief",4,0,kdf_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,4);
	EquipItem(self,itarrunefireball);
	CreateInvItems(self,itfo_potion_health_02,3);
	CreateInvItems(self,itfo_potion_health_01,4);
	EquipItem(self,schutzring_total2);
	daily_routine = rtn_start_403;
};


func void rtn_start_403()
{
	ta_practicemagic(7,10,18,50,"OCC_CHAPEL_MAGE_04");
	ta_standaround(18,50,19,40,"OCC_CENTER_2");
	ta_readbook(19,40,7,10,"OCC_CHAPEL_UPSTAIRS_RIGHT");
};

func void rtn_kdfritual_403()
{
	ta_position(8,0,20,0,"OCC_CHAPEL_MAGE_03");
	ta_position(20,0,8,0,"OCC_CHAPEL_MAGE_03");
};

func void rtn_dead_403()
{
	ta_stay(8,0,20,0,"OCC_CELLAR_BAN_ROOM_MAG4");
	ta_stay(20,0,8,0,"OCC_CELLAR_BAN_ROOM_MAG4");
};

