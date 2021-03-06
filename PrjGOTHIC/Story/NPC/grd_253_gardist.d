
instance GRD_253_GARDIST(NPC_DEFAULT)
{
	name[0] = NAME_GARDIST;
	npctype = NPCTYPE_GUARD;
	guild = GIL_GRD;
	level = 10;
	voice = 7;
	id = 253;
	attribute[ATR_STRENGTH] = 35;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Psionic",14,1,grd_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_sword_01);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	daily_routine = rtn_start_253;
};


func void rtn_start_253()
{
	ta_guard(0,0,1,0,"OCR_OUTSIDE_HUT_63");
	ta_guard(1,0,2,0,"OCR_OUTSIDE_HUT_77_INSERT");
	ta_guard(2,0,3,0,"OCR_OUTSIDE_HUT_63");
	ta_guard(3,0,4,0,"OCR_OUTSIDE_HUT_77_INSERT");
	ta_sleep(4,0,10,0,"OCR_MAINGATE_GUARDROOM");
	ta_smalltalk(10,0,0,0,"OCR_AT_HUT_3");
};

func void rtn_fmtaken_253()
{
	ta_stayneutral(7,0,20,0,"OCR_MAINGATE_OUTSIDE");
	ta_stayneutral(20,0,7,0,"OCR_MAINGATE_OUTSIDE");
};

func void rtn_fmtaken2_253()
{
	ta_stay(7,0,20,0,"OCR_MAINGATE_OUTSIDE");
	ta_stay(20,0,7,0,"OCR_MAINGATE_OUTSIDE");
};

