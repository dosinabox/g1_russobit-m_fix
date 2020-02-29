
instance KDF_402_CORRISTO(NPC_DEFAULT)
{
	name[0] = "Корристо";
	npctype = NPCTYPE_MAIN;
	guild = GIL_KDF;
	level = 30;
	voice = 14;
	id = 402;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Pony",84,1,kdf_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	CreateInvItem(self,itarrunefireball);
	CreateInvItems(self,itfo_potion_health_02,2);
	CreateInvItems(self,itfo_potion_mana_02,2);
	CreateInvItems(self,itfowine,2);
	EquipItem(self,schutzring_magie2_fire2);
	CreateInvItem(self,itmi_stuff_oldcoin_02);
	daily_routine = rtn_start_402;
};


func void rtn_start_402()
{
	ta_sitcampfire(19,5,6,55,"OCC_CHAPEL_MAGE_02");
	ta_readbook(6,55,19,5,"OCC_CHAPEL_UPSTAIRS_RIGHT");
};

func void rtn_kdfritual_402()
{
	ta_position(8,0,20,0,"OCC_CHAPEL_UPSTAIRS");
	ta_position(20,0,8,0,"OCC_CHAPEL_UPSTAIRS");
};

func void rtn_waitforsc_402()
{
	ta_position(8,0,20,0,"OCC_CHAPEL_HALL");
	ta_position(20,0,8,0,"OCC_CHAPEL_HALL");
};

