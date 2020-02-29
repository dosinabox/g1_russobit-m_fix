
instance GRD_293_GARDIST(NPC_DEFAULT)
{
	name[0] = NAME_GARDIST;
	guild = GIL_GRD;
	npctype = NPCTYPE_GUARD;
	level = 30;
	voice = 10;
	id = 293;
	aivar[43] = TRUE;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 70;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 280;
	attribute[ATR_HITPOINTS] = 280;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",18,2,grd_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,itmw_1h_sword_03);
	CreateInvItem(self,itfomutton);
	CreateInvItems(self,itminugget,20);
	CreateInvItem(self,itfo_potion_health_01);
	CreateInvItem(self,itlstorch);
	daily_routine = rtn_fmstart_293;
};


func void rtn_fmstart_293()
{
	ta_guard(0,0,13,0,"FM_84");
	ta_guard(13,0,0,0,"FM_84");
};

