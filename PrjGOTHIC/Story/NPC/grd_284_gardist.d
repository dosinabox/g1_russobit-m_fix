
instance GRD_284_GARDIST(NPC_DEFAULT)
{
	name[0] = NAME_GARDIST;
	guild = GIL_GRD;
	npctype = NPCTYPE_GUARD;
	level = 30;
	voice = 7;
	id = 284;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 280;
	attribute[ATR_HITPOINTS] = 280;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",15,1,grd_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
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
	daily_routine = rtn_fmstart_284;
};


func void rtn_fmstart_284()
{
	ta_guardpalisade(0,0,13,0,"FM_167");
	ta_guardpalisade(13,0,0,0,"FM_167");
};

