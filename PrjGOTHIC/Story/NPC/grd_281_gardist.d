
instance GRD_281_GARDIST(NPC_DEFAULT)
{
	name[0] = NAME_GARDIST;
	npctype = NPCTYPE_MAIN;
	guild = GIL_GRD;
	level = 10;
	voice = 7;
	id = 281;
	attribute[ATR_STRENGTH] = 35;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_FatBald",3,3,grd_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_RANGED;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,itmw_1h_sword_01);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	EquipItem(self,itrw_crossbow_01);
	CreateInvItems(self,itambolt,30);
	daily_routine = rtn_start_281;
};


func void rtn_start_281()
{
	ta_guardwheelopen(7,55,19,55,"OW_PATH_1_16_C");
	ta_guardwheelopen(19,55,7,55,"OW_PATH_1_16_C");
};

