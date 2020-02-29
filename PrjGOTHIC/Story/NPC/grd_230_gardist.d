
instance GRD_230_GARDIST(NPC_DEFAULT)
{
	name[0] = NAME_GARDIST;
	npctype = NPCTYPE_GUARD;
	flags = NPC_FLAG_IMMORTAL;
	guild = GIL_GRD;
	level = 20;
	voice = 6;
	id = 230;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",19,0,grd_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,itmw_1h_sword_02);
	EquipItem(self,itrw_crossbow_01);
	CreateInvItems(self,itambolt,30);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	daily_routine = rtn_start_230;
};


func void rtn_start_230()
{
	ta_guardwheelopen(7,55,19,55,"OCC_MAINGATE_VWHEEL");
	ta_guardwheelopen(19,55,7,55,"OCC_MAINGATE_VWHEEL");
};

func void rtn_forgetspell_230()
{
	ta_sitaround(0,0,24,0,"OCC_CENTER_1");
};

func void rtn_omfull_230()
{
	ta_guardpassage(21,0,6,0,"OCR_MAINGATE_RIGHT_GUARD");
	ta_sleep(6,0,15,0,"OCC_MERCS_UPPER_RIGHT_ROOM_BACK");
	ta_standaround(15,0,16,0,"OCC_MERCS_RIGHT_ROOM_FRONT");
	ta_smoke(16,0,18,0,"OCC_GATE_CAMPFIRE_1");
	ta_sitaround(18,0,21,0,"OCC_GATE_CAMPFIRE_1");
};

func void rtn_fmtaken_230()
{
	ta_guardwheelclosed(7,0,20,0,"OCC_MAINGATE_VWHEEL");
	ta_guardwheelclosed(20,0,7,0,"OCC_MAINGATE_VWHEEL");
};

