
instance SLD_704_BLADE(NPC_DEFAULT)
{
	name[0] = "Αλειδ";
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_SLD;
	level = 18;
	voice = 11;
	id = 704;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 70;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 256;
	attribute[ATR_HITPOINTS] = 256;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Pony",47,2,sld_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	EquipItem(self,itmw_1h_mace_war_03);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,22);
	CreateInvItems(self,itfoloaf,5);
	CreateInvItems(self,itfomutton,4);
	CreateInvItems(self,itminugget,18);
	CreateInvItems(self,itlstorch,5);
	CreateInvItems(self,itfo_potion_health_02,5);
	daily_routine = rtn_start_704;
};


func void rtn_start_704()
{
	ta_sleep(23,0,7,30,"NC_HUT10_IN");
	ta_smalltalk(7,30,23,0,"NC_HUT09_OUT");
};

func void rtn_fmtaken_704()
{
	ta_smalltalk(23,0,7,30,"OW_PATH_069");
	ta_smalltalk(7,30,23,0,"OW_PATH_069");
};

