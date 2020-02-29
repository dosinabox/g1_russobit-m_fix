
instance GRD_241_GARDIST(NPC_DEFAULT)
{
	name[0] = NAME_GARDIST;
	npctype = NPCTYPE_GUARD;
	guild = GIL_GRD;
	level = 20;
	voice = 6;
	id = 241;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 280;
	attribute[ATR_HITPOINTS] = 280;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Psionic",2,1,grd_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_RANGED;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,itmw_1h_sword_03);
	EquipItem(self,itrw_crossbow_01);
	CreateInvItems(self,itambolt,30);
	CreateInvItem(self,itfomutton);
	CreateInvItems(self,itminugget,20);
	CreateInvItem(self,itfo_potion_health_01);
	CreateInvItem(self,itlstorch);
	daily_routine = rtn_start_241;
};


func void rtn_start_241()
{
	ta_guardpalisade(6,0,21,0,"OCR_PALISADE_WALK_14");
	ta_guardpalisade(21,0,6,0,"OCR_PALISADE_WALK_14");
};

func void rtn_omfull_241()
{
	ta_guardpatrol(3,0,4,0,"OCR_MAINGATE_SQUARE");
	ta_guardpatrol(4,0,5,0,"OCR_TO_HUT_72");
	ta_guardpatrol(5,0,6,0,"OCR_NORTHGATE_RAMP_ATOP");
	ta_sleep(6,0,14,0,"OCC_MERCS_UPPER_RIGHT_ROOM_FRONT");
	ta_sitaround(14,0,3,0,"OCC_MERCS_RIGHT_ROOM_BACK");
};

func void rtn_fmtaken_241()
{
};

func void rtn_orcassault_241()
{
};

