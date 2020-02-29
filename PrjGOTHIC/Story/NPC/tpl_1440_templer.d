
instance TPL_1440_TEMPLER(NPC_DEFAULT)
{
	name[0] = NAME_TEMPLER;
	npctype = NPCTYPE_GUARD;
	guild = GIL_TPL;
	level = 17;
	flags = 0;
	voice = 13;
	id = 1440;
	attribute[ATR_STRENGTH] = 85;
	attribute[ATR_DEXTERITY] = 65;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 244;
	attribute[ATR_HITPOINTS] = 244;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",64,1,tpl_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,itmw_2h_sword_light_01);
	CreateInvItem(self,itfosoup);
	CreateInvItem(self,itmijoint_1);
	daily_routine = rtn_start_1440;
};


func void rtn_start_1440()
{
	ta_smalltalk(6,0,14,0,"PSI_SWAMP_MOVEMENT");
	ta_smalltalk(14,0,6,0,"OW_OM_ENTRANCE02");
};

func void rtn_fmtaken_1440()
{
	ta_smalltalk(6,0,14,0,"PSI_SWAMP_MOVEMENT");
	ta_smalltalk(14,0,6,0,"PSI_SWAMP_MOVEMENT");
};

