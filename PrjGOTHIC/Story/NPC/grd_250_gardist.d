
instance GRD_250_GARDIST(NPC_DEFAULT)
{
	name[0] = NAME_GARDIST;
	npctype = NPCTYPE_GUARD;
	flags = NPC_FLAG_IMMORTAL;
	guild = GIL_GRD;
	level = 15;
	voice = 6;
	id = 250;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Thief",1,2,grd_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	CreateInvItem(self,itmw_1h_sword_02);
	CreateInvItem(self,itrw_crossbow_01);
	CreateInvItems(self,itambolt,30);
	CreateInvItem(self,itfocheese);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	CreateInvItem(self,itlstorch);
	daily_routine = rtn_start_250;
};


func void rtn_start_250()
{
	ta_guardwheelopen(22,0,8,0,"OW_OM_ENTRANCE02_WHEEL_USE");
	ta_guardwheelopen(8,0,22,0,"OW_OM_ENTRANCE02_WHEEL_USE");
};

func void rtn_fmtaken_250()
{
	ta_guardwheelclosed(22,0,8,0,"OW_OM_ENTRANCE02_WHEEL_USE");
	ta_guardwheelclosed(8,0,22,0,"OW_OM_ENTRANCE02_WHEEL_USE");
};

