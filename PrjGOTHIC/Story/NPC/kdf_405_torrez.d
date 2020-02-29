
instance KDF_405_TORREZ(NPC_DEFAULT)
{
	name[0] = "Торрез";
	npctype = NPCTYPE_MAIN;
	guild = GIL_KDF;
	level = 26;
	voice = 4;
	id = 405;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_MANA_MAX] = 85;
	attribute[ATR_MANA] = 85;
	attribute[ATR_HITPOINTS_MAX] = 352;
	attribute[ATR_HITPOINTS] = 352;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Thief",5,4,kdf_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	EquipItem(self,itarrunefireball);
	CreateInvItem(self,itmi_stuff_oldcoin_02);
	b_give_torrezchapter1runes();
	daily_routine = rtn_start_405;
};


func void rtn_start_405()
{
	ta_sitcampfire(22,5,6,55,"OCC_CHAPEL_MAGE_05");
	ta_smalltalk(6,55,22,5,"OCC_CENTER_2");
};

func void rtn_kdfritual_405()
{
	ta_position(8,0,20,0,"OCC_CHAPEL_MAGE_02");
	ta_position(20,0,8,0,"OCC_CHAPEL_MAGE_02");
};

