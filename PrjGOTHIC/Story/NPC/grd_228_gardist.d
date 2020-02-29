
instance GRD_228_GARDIST(NPC_DEFAULT)
{
	name[0] = NAME_GARDIST;
	npctype = NPCTYPE_GUARD;
	flags = NPC_FLAG_IMMORTAL;
	guild = GIL_GRD;
	level = 15;
	voice = 7;
	id = 228;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_FatBald",5,1,grd_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,itmw_1h_sword_02);
	EquipItem(self,itrw_crossbow_01);
	CreateInvItems(self,itambolt,30);
	CreateInvItem(self,itfocheese);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	CreateInvItem(self,itlstorch);
	daily_routine = rtn_prestart_228;
};


func void rtn_prestart_228()
{
	ta_guardwheelopen(7,55,19,55,"OCR_NORTHGATE_VWHEEL");
	ta_guardwheelopen(19,55,7,55,"OCR_NORTHGATE_VWHEEL");
};

func void rtn_start_228()
{
	ta_guardwheelopen(7,55,19,55,"OCR_NORTHGATE_VWHEEL");
	ta_guardwheelopen(19,55,7,55,"OCR_NORTHGATE_VWHEEL");
};

func void rtn_omfull_228()
{
	ta_standaround(12,0,13,0,"OCC_MERCS_RIGHT_ROOM_FRONT");
	ta_sitaround(13,0,13,15,"OCC_FIGHTTRAINING");
	ta_practicesword(13,15,18,0,"OCC_FIGHTTRAINING");
	ta_sitaround(18,0,21,0,"OCC_GATE_BEHIND_RIGHT_TOWER");
	ta_guardpassage(21,0,6,0,"OCR_MAINGATE_LEFT_GUARD");
	ta_sleep(6,0,12,0,"OCC_MERCS_UPPER_RIGHT_ROOM_FRONT");
};

func void rtn_fmtaken_228()
{
	ta_guardwheelclosed(7,0,20,0,"OCR_NORTHGATE_VWHEEL");
	ta_guardwheelclosed(20,0,7,0,"OCR_NORTHGATE_VWHEEL");
};

func void rtn_orcassault_228()
{
};

