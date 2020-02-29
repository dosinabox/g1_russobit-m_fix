
instance GRD_261_BRANDICK(NPC_DEFAULT)
{
	name[0] = "Брендик";
	npctype = NPCTYPE_MAIN;
	guild = GIL_GRD;
	level = 15;
	voice = 6;
	id = 261;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",13,1,grd_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,2);
	fight_tactic = FAI_HUMAN_RANGED;
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
	daily_routine = rtn_start_261;
};


func void rtn_start_261()
{
	ta_guard(0,0,12,0,"OM_052");
	ta_guard(12,0,0,0,"OM_052");
};

func void rtn_watch_261()
{
	ta_guard(0,0,12,0,"OM_055");
	ta_guard(12,0,0,0,"OM_055");
};

