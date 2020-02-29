
instance GRD_220_GARDIST(NPC_DEFAULT)
{
	name[0] = NAME_GARDIST;
	npctype = NPCTYPE_GUARD;
	guild = GIL_GRD;
	level = 10;
	voice = 7;
	id = 220;
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
	daily_routine = rtn_start_220;
};


func void rtn_start_220()
{
	ta_practicesword(7,35,20,5,"OCC_CENTER_4_TRAIN2");
	ta_standaround(20,5,0,5,"OCC_SHADOWS_CORNER_MOVEMENT");
	ta_sleep(0,5,7,35,"OCC_MERCS_UPPER_RIGHT_ROOM_BED2");
};

func void rtn_ot_220()
{
	ta_guard(7,0,20,0,"OCC_CHAPEL_UPSTAIRS_LEFT");
	ta_guard(20,0,7,0,"OCC_CHAPEL_UPSTAIRS_LEFT");
};

