
instance GRD_262_AARON(NPC_DEFAULT)
{
	name[0] = "ְאנמם";
	npctype = NPCTYPE_MAIN;
	guild = GIL_GRD;
	level = 15;
	voice = 9;
	id = 262;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,2,"Hum_Head_Thief",3,1,grd_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
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
	daily_routine = rtn_start_262;
	fight_tactic = FAI_HUMAN_STRONG;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
};


func void rtn_start_262()
{
	ta_standaround(0,0,12,0,"OM_CAVE1_34");
	ta_standaround(12,0,24,0,"OM_CAVE1_34");
};

func void rtn_trick_262()
{
	ta_stay(0,0,12,0,"OM_CAVE1_47");
	ta_stay(12,0,24,0,"OM_CAVE1_47");
};

