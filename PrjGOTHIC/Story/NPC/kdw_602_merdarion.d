
instance KDW_602_MERDARION(NPC_DEFAULT)
{
	name[0] = "Мердарион";
	npctype = NPCTYPE_MAIN;
	guild = GIL_KDW;
	level = 26;
	voice = 14;
	id = 602;
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 90;
	attribute[ATR_MANA] = 90;
	attribute[ATR_HITPOINTS_MAX] = 352;
	attribute[ATR_HITPOINTS] = 352;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Thief",8,0,kdw_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	CreateInvItem(self,itarrunechainlightning);
	CreateInvItem(self,itfo_potion_health_03);
	CreateInvItems(self,itfo_potion_mana_02,2);
	EquipItem(self,lebensamulett);
	daily_routine = rtn_start_602;
};


func void rtn_start_602()
{
	ta_sleep(23,0,6,0,"NC_KDW01_IN");
	ta_readbook(6,0,23,0,"NC_KDW01_IN");
};

func void rtn_kdwaufnahme_602()
{
	ta_position(1,0,5,0,"NC_KDW_CAVE_STAIRS_MOVEMENT2");
	ta_position(5,0,1,0,"NC_KDW_CAVE_STAIRS_MOVEMENT2");
};

