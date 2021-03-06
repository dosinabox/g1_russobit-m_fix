
instance GRD_214_TORWACHE(NPC_DEFAULT)
{
	name[0] = NAME_TORWACHE;
	npctype = NPCTYPE_MAIN;
	guild = GIL_GRD;
	level = 15;
	voice = 7;
	id = 214;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Bald",2,3,grd_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_sword_01);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	daily_routine = rtn_start_214;
};


func void rtn_start_214()
{
	ta_guard(6,0,21,0,"OCR_MAINGATE_LEFT_GUARD");
	ta_guard(21,0,6,0,"OCR_MAINGATE_LEFT_GUARD");
};

func void rtn_fmtaken_214()
{
	ta_stayneutral(6,0,21,0,"OCR_MAINGATE_LEFT_GUARD");
	ta_stayneutral(21,0,6,0,"OCR_MAINGATE_LEFT_GUARD");
};

func void rtn_fmtaken2_214()
{
	ta_guard(6,0,21,0,"OCR_MAINGATE_LEFT_GUARD");
	ta_guard(21,0,6,0,"OCR_MAINGATE_LEFT_GUARD");
};

