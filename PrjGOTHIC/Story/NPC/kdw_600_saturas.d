
instance KDW_600_SATURAS(NPC_DEFAULT)
{
	name[0] = "Сатурас";
	npctype = NPCTYPE_FRIEND;
	guild = GIL_KDW;
	level = 29;
	voice = 14;
	id = 600;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 388;
	attribute[ATR_HITPOINTS] = 388;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",7,0,kdw_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,5);
	EquipItem(self,itarrune_3_5_chainlightning);
	EquipItem(self,itarrune_3_3_icecube);
	CreateInvItem(self,itfo_potion_health_01);
	CreateInvItem(self,itfo_potion_mana_01);
	EquipItem(self,schutzamulett_feuer);
	EquipItem(self,machtring);
	CreateInvItem(self,itfo_plants_flameberry_01);
	daily_routine = rtn_start_600;
	fight_tactic = FAI_HUMAN_MAGE;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
};


func void rtn_start_600()
{
	ta_readbook(1,0,5,0,"NC_KDW_CAVE_CENTER");
	ta_readbook(5,0,1,0,"NC_KDW_CAVE_CENTER");
};

