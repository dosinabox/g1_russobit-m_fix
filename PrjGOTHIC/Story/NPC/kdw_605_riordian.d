
instance KDW_605_RIORDIAN(NPC_DEFAULT)
{
	name[0] = "�������";
	npctype = NPCTYPE_FRIEND;
	guild = GIL_KDW;
	level = 25;
	voice = 14;
	id = 605;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 1;
	attribute[ATR_DEXTERITY] = 1;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 340;
	attribute[ATR_HITPOINTS] = 340;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Bald",9,1,kdw_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,5);
	EquipItem(self,itarrune_3_2_thunderball);
	CreateInvItem(self,alchemybook);
	b_giveriordianchapter1potions();
	daily_routine = rtn_start_605;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
};


func void rtn_start_605()
{
	ta_sleep(1,0,5,0,"NC_KDW06_IN_BED");
	ta_potionalchemy(5,0,22,0,"NC_KDW06_IN");
	ta_readbook(22,0,1,0,"NC_KDW06_IN");
};

func void rtn_foundurshak_605()
{
	ta_practicemagic(1,0,5,0,"NC_KDW_CAVE_STAIRS_MOVEMENT2");
	ta_practicemagic(5,0,1,0,"NC_KDW_CAVE_STAIRS_MOVEMENT2");
};

