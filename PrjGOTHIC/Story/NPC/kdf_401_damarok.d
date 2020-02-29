
instance KDF_401_DAMAROK(NPC_DEFAULT)
{
	name[0] = "Дамарок";
	npctype = NPCTYPE_MAIN;
	guild = GIL_KDF;
	level = 27;
	voice = 14;
	id = 401;
	attribute[ATR_STRENGTH] = 35;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 364;
	attribute[ATR_HITPOINTS] = 364;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_FatBald",5,1,kdf_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	CreateInvItem(self,itarrunefireball);
	CreateInvItems(self,itfo_potion_health_02,3);
	CreateInvItems(self,itfo_potion_health_01,4);
	EquipItem(self,schutzamulett_geschosse);
	CreateInvItem(self,itmi_stuff_oldcoin_02);
	daily_routine = rtn_start_401;
};


func void rtn_start_401()
{
	ta_sitcampfire(19,1,7,1,"OCC_CHAPEL_MAGE_01");
	ta_potionalchemy(7,1,19,1,"OCC_CHAPEL_RIGHT_ROOM");
};

func void rtn_kdfritual_401()
{
	ta_position(8,0,20,0,"OCC_CHAPEL_MAGE_04");
	ta_position(20,0,8,0,"OCC_CHAPEL_MAGE_04");
};

