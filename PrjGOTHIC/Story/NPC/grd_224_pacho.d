
instance GRD_224_PACHO(NPC_DEFAULT)
{
	name[0] = "Пако";
	npctype = NPCTYPE_MAIN;
	guild = GIL_GRD;
	level = 10;
	voice = 13;
	id = 224;
	attribute[ATR_STRENGTH] = 35;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_Fighter",4,1,grd_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	CreateInvItem(self,itmw_1h_sword_01);
	CreateInvItem(self,itrw_crossbow_01);
	CreateInvItems(self,itambolt,30);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	daily_routine = rtn_start_224;
	fight_tactic = FAI_HUMAN_STRONG;
};


func void rtn_start_224()
{
	ta_standaround(0,0,12,0,"OW_PATH_018");
	ta_standaround(12,0,24,0,"OW_PATH_018");
};

func void rtn_start2_224()
{
	ta_sit(0,0,12,0,"OW_PATH_018");
	ta_sit(12,0,24,0,"OW_PATH_018");
};

func void rtn_fmtaken_224()
{
	ta_practicesword(0,0,12,0,"OW_PATH_1_16_1");
	ta_practicesword(12,0,24,0,"OW_PATH_1_16_1");
};

