
instance GUR_1201_CORKALOM(NPC_DEFAULT)
{
	name[0] = "Кор Галом";
	npctype = NPCTYPE_FRIEND;
	guild = GIL_GUR;
	level = 30;
	voice = 10;
	id = 1201;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,0,"Hum_Head_Psionic",19,0,gur_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,4);
	EquipItem(self,kaloms_schwert);
	CreateInvItem(self,itarrunesleep);
	daily_routine = rtn_start_1201;
	fight_tactic = FAI_HUMAN_MAGE;
};


func void rtn_start_1201()
{
	ta_potionalchemy(15,0,22,0,"PSI_LABOR_IN");
	ta_potionalchemy(22,0,15,0,"PSI_LABOR_IN");
};

func void rtn_callsleeper_1201()
{
	ta_stay(0,0,12,0,"PSI_TEMPLE_STAIRS_RIGHT");
	ta_stay(12,0,24,0,"PSI_TEMPLE_STAIRS_RIGHT");
};

func void rtn_care_1201()
{
	ta_readbook(0,0,12,0,"PSI_TEMPLE_ROOMS_IN_02");
	ta_readbook(12,0,24,0,"PSI_TEMPLE_ROOMS_IN_02");
};

func void rtn_flee_1201()
{
	ta_stay(0,0,12,0,"WP_INTRO01");
	ta_stay(12,0,24,0,"WP_INTRO01");
};

