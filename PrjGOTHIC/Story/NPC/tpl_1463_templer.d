
instance TPL_1463_TEMPLER(NPC_DEFAULT)
{
	name[0] = NAME_TEMPLER;
	npctype = NPCTYPE_GUARD;
	guild = GIL_TPL;
	level = 17;
	flags = 0;
	voice = 13;
	id = 1463;
	attribute[ATR_STRENGTH] = 71;
	attribute[ATR_DEXTERITY] = 71;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 5;
	attribute[ATR_HITPOINTS] = 5;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",64,4,tpl_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,itmw_2h_sword_light_02);
	CreateInvItem(self,itfosoup);
	daily_routine = rtn_start_1463;
};


func void rtn_start_1463()
{
	ta_sittingduck(0,0,12,0,"OW_PATH_198_ORCGRAVEYARD8");
	ta_sittingduck(12,0,24,0,"OW_PATH_198_ORCGRAVEYARD8");
};

