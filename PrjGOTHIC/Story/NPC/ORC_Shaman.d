
instance ORC_2200_SHAMAN(MST_DEFAULT_ORCSHAMAN)
{
	name[0] = "Óð-Øàê";
	npctype = NPCTYPE_FRIEND;
	flags = NPC_FLAG_IMMORTAL;
	guild = GIL_NONE;
	level = 25;
	voice = 17;
	id = 2200;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 90;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 25;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 0;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyShaman",DEFAULT,DEFAULT,"Orc_HeadShaman",DEFAULT,DEFAULT,-1);
	Mdl_ApplyOverlayMds(self,"Orc_Shaman.mds");
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,8);
	EquipItem(self,itrworcstaff);
	CreateInvItem(self,itarrune_2_2_fireball);
	daily_routine = rtn_fmtaken_2200;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
};


func void rtn_fmtaken_2200()
{
	ta_stay(7,0,12,0,"CASTLE_06");
	ta_stay(12,0,7,0,"CASTLE_06");
};

func void rtn_leftfm_2200()
{
	ta_stay(7,0,12,0,"SPAWN_OW_WARAN_ORC_01");
	ta_stay(12,0,7,0,"SPAWN_OW_WARAN_ORC_01");
};

