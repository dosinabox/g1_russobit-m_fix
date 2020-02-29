
instance GRD_221_GARDIST(NPC_DEFAULT)
{
	name[0] = NAME_GARDIST;
	npctype = NPCTYPE_GUARD;
	guild = GIL_GRD;
	level = 10;
	voice = 13;
	id = 221;
	attribute[ATR_STRENGTH] = 35;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Fighter",1,2,grd_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_sword_01);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	daily_routine = rtn_start_221;
};


func void rtn_start_221()
{
	ta_practicesword(7,40,20,10,"OCC_CENTER_4_TRAIN3");
	ta_roastscavenger(20,10,22,10,"OCC_SHADOWS_CORNER_MOVEMENT2");
	ta_standaround(22,10,0,10,"OCC_SHADOWS_CORNER_MOVEMENT");
	ta_sleep(0,10,7,40,"OCC_MERCS_UPPER_RIGHT_ROOM_BED6");
};

func void rtn_ot_221()
{
	ta_guard(7,0,20,0,"OCC_CHAPEL_UPSTAIRS_RIGHT");
	ta_guard(20,0,7,0,"OCC_CHAPEL_UPSTAIRS_RIGHT");
};

