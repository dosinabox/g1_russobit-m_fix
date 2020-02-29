
instance GRD_265_GARDIST(NPC_DEFAULT)
{
	name[0] = NAME_GARDIST;
	npctype = NPCTYPE_GUARD;
	guild = GIL_GRD;
	level = 10;
	voice = 7;
	id = 265;
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
	fight_tactic = FAI_HUMAN_RANGED;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItem(self,itmw_1h_sword_01);
	CreateInvItem(self,itrw_crossbow_01);
	CreateInvItems(self,itambolt,30);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	CreateInvItems(self,itlstorch,2);
	CreateInvItems(self,itfo_potion_health_01,1);
	CreateInvItem(self,itfomutton);
	CreateInvItem(self,itfoloaf);
	CreateInvItem(self,itat_teeth_01);
	CreateInvItem(self,itat_claws_01);
	daily_routine = rtn_start_265;
};


func void rtn_start_265()
{
	ta_stand(7,30,22,30,"OCR_OUTSIDE_HUT_48");
	ta_sleep(22,30,7,30,"OCR_OUTSIDE_SMALLTALK_49");
};

