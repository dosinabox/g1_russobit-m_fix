
instance GRD_279_GARDIST(NPC_DEFAULT)
{
	name[0] = NAME_GARDIST;
	npctype = NPCTYPE_GUARD;
	guild = GIL_GRD;
	level = 15;
	voice = 13;
	id = 279;
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
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,2);
	EquipItem(self,itmw_1h_sword_02);
	CreateInvItem(self,itfocheese);
	CreateInvItem(self,itfoapple);
	CreateInvItem(self,itke_weaponry);
	CreateInvItems(self,itminugget,10);
	CreateInvItem(self,itlstorch);
	daily_routine = rtn_start_279;
	aivar[AIV_ITEMSCHWEIN] = TRUE;
};


func void rtn_start_279()
{
	ta_guard(4,0,23,0,"OCC_BARONS_LEFT_ROOM_FRONT");
	ta_standaround(23,0,0,0,"OCC_BARONS_RIGHT_ROOM_TABLE");
	ta_guard(0,0,3,0,"OCC_BARONS_LEFT_ROOM_FRONT");
	ta_standaround(3,0,4,0,"OCC_BARONS_GREATHALL_CENTER_MOVEMENT");
};

