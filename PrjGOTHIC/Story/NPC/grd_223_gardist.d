
instance GRD_223_GARDIST(NPC_DEFAULT)
{
	name[0] = NAME_GARDIST;
	npctype = NPCTYPE_GUARD;
	guild = GIL_GRD;
	level = 15;
	voice = 13;
	id = 223;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Pony",13,1,grd_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_RANGED;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,2);
	EquipItem(self,itmw_1h_sword_02);
	EquipItem(self,itrw_crossbow_01);
	CreateInvItems(self,itambolt,30);
	CreateInvItem(self,itfocheese);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	CreateInvItem(self,itlstorch);
	daily_routine = rtn_start_223;
};


func void rtn_start_223()
{
	ta_guardpalisade(6,0,23,0,"OCC_BARONS_UPSTAIRS_PROMENADE_LEFT_GUARD");
	ta_guardpalisade(23,0,6,0,"OCC_BARONS_UPSTAIRS_PROMENADE_LEFT_GUARD");
};

func void rtn_ot_223()
{
	ta_guard(7,0,12,0,"OCC_BARONS_UPSTAIRS_PROMENADE_RIGHT_CORNER");
	ta_guard(12,0,19,0,"OCC_BARONS_UPSTAIRS_PROMENADE_LEFT_DOOR");
	ta_guard(19,0,7,0,"OCC_BARONS_UPSTAIRS_PROMENADE_LEFT_CORNER");
};

