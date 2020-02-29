
instance KDF_400_RODRIGUEZ(NPC_DEFAULT)
{
	name[0] = "Родригес";
	npctype = NPCTYPE_MAIN;
	guild = GIL_KDF;
	level = 25;
	voice = 12;
	id = 400;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 340;
	attribute[ATR_HITPOINTS] = 340;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Pony",6,1,kdf_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,4);
	EquipItem(self,itarrune_2_1_firebolt);
	daily_routine = rtn_start_400;
};


func void rtn_start_400()
{
	ta_sleep(22,0,7,0,"OCC_CHAPEL_LEFT_ROOM");
	ta_smalltalk(7,0,22,0,"OCC_CENTER_2");
};

func void rtn_kdfritual_400()
{
	ta_position(8,0,20,0,"OCC_CHAPEL_MAGE_01");
	ta_position(20,0,8,0,"OCC_CHAPEL_MAGE_01");
};

func void rtn_dead_400()
{
	ta_stay(8,0,20,0,"OCC_CELLAR_BAN_ROOM_MAG1");
	ta_stay(20,0,8,0,"OCC_CELLAR_BAN_ROOM_MAG1");
};

