
instance GRD_217_TORWACHE(NPC_DEFAULT)
{
	name[0] = NAME_TORWACHE;
	npctype = NPCTYPE_MAIN;
	guild = GIL_GRD;
	level = 15;
	voice = 6;
	id = 217;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Psionic",14,1,grd_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_sword_01);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	daily_routine = rtn_start_217;
};


func void rtn_start_217()
{
	ta_guard(6,0,14,0,"OCR_NORTHGATE_RIGHT_GUARD");
	ta_guard(14,0,6,0,"OCR_NORTHGATE_RIGHT_GUARD");
};

func void rtn_fmtaken_217()
{
	ta_stayneutral(6,0,14,0,"OCR_NORTHGATE_RIGHT_GUARD");
	ta_stayneutral(14,0,6,0,"OCR_NORTHGATE_RIGHT_GUARD");
};

func void rtn_fmtaken2_217()
{
	ta_guard(6,0,14,0,"OCR_NORTHGATE_RIGHT_GUARD");
	ta_guard(14,0,6,0,"OCR_NORTHGATE_RIGHT_GUARD");
};

