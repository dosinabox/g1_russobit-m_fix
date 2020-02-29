
instance KDW_604_CRONOS(NPC_DEFAULT)
{
	name[0] = "Кронос";
	npctype = NPCTYPE_MAIN;
	flags = NPC_FLAG_IMMORTAL | NPC_FLAG_FRIEND;
	guild = GIL_KDW;
	level = 28;
	voice = 8;
	id = 604;
	attribute[ATR_STRENGTH] = 1;
	attribute[ATR_DEXTERITY] = 1;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 376;
	attribute[ATR_HITPOINTS] = 376;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Thief",7,1,kdw_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,5);
	EquipItem(self,itarruneicecube);
	EquipItem(self,itarrunechainlightning);
	CreateInvItem(self,alchemybook);
	b_give_cronoschapter1runes();
	daily_routine = rtn_start_604;
};


func void rtn_start_604()
{
	ta_sleep(2,0,5,0,"NC_KDW02_IN");
	ta_orepile(5,0,2,0,"NC_PATH_TO_PIT_03");
};

func void rtn_orealert_604()
{
	ta_guard(1,0,4,0,"NC_KDW05+06_OUT");
	ta_guard(4,0,1,0,"NC_KDW05+06_OUT");
};

