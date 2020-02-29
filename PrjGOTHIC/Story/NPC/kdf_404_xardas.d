
instance KDF_404_XARDAS(NPC_DEFAULT)
{
	name[0] = "Ксардас";
	npctype = NPCTYPE_FRIEND;
	guild = GIL_DMB;
	level = 50;
	voice = 14;
	id = 404;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 1;
	attribute[ATR_DEXTERITY] = 1;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",82,1,dmb_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	EquipItem(self,itarrune_2_2_fireball);
	//CreateInvItems(self,itarscrollsummondemon,2);
	daily_routine = rtn_start_404;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
};


func void rtn_start_404()
{
	ta_readbook_xardas(6,0,8,0,"DT_E3_07");
	ta_readbook_xardas(8,0,6,0,"DT_E3_07");
};

func void rtn_study_404()
{
	//ta_stay(21,0,6,0,"DT_PLATFORM_02");
	ta_readbook_xardas(6,0,9,0,"DT_E3_07");
	ta_readbook_xardas(9,0,10,0,"DT_E3_05");
	ta_readbook_xardas(10,0,11,0,"DT_E3_07");
	ta_readbook_xardas(11,0,13,0,"DT_E3_04");
	ta_readbook_xardas(13,0,15,0,"DT_E3_07");
	ta_readbook_xardas(15,0,17,0,"DT_E3_05");
	ta_readbook_xardas(17,0,21,0,"DT_E3_07");
	ta_readbook_xardas(21,0,6,0,"DT_E3_04");
};

