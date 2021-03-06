
instance GRD_252_GARDIST(NPC_DEFAULT)
{
	name[0] = NAME_GARDIST;
	npctype = NPCTYPE_GUARD;
	guild = GIL_GRD;
	level = 10;
	voice = 6;
	id = 252;
	attribute[ATR_STRENGTH] = 35;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",19,1,grd_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_sword_01);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	daily_routine = rtn_start_252;
};


func void rtn_start_252()
{
	ta_sleep(23,0,6,0,"OCC_MERCS_LEFT_ROOM_BED2");
	ta_smalltalk(6,0,23,0,"OCR_TO_MAINGATE_INSERT");
};

func void rtn_fmtaken_252()
{
	ta_stayneutral(7,0,20,0,"OCR_MAINGATE_OUTSIDE");
	ta_stayneutral(20,0,7,0,"OCR_MAINGATE_OUTSIDE");
};

func void rtn_fmtaken2_252()
{
	ta_stay(7,0,20,0,"OCR_MAINGATE_OUTSIDE");
	ta_stay(20,0,7,0,"OCR_MAINGATE_OUTSIDE");
};

