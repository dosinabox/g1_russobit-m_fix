
instance TPL_1414_TEMPLER(NPC_DEFAULT)
{
	name[0] = NAME_TEMPLER;
	npctype = NPCTYPE_GUARD;
	guild = GIL_TPL;
	level = 12;
	voice = 13;
	id = 1414;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 25;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 184;
	attribute[ATR_HITPOINTS] = 184;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,0,"Hum_Head_Bald",15,1,tpl_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,itmw_2h_sword_light_01);
	CreateInvItem(self,itfosoup);
	CreateInvItem(self,itmijoint_1);
	daily_routine = rtn_start_1414;
};


func void rtn_start_1414()
{
	ta_sleep(23,55,5,55,"PSI_18_HUT_IN");
	ta_practicesword(5,55,23,55,"PSI_TRAINING_3");
};

func void rtn_remove_1414()
{
	ta_stay(23,0,16,0,"WP_INTRO01");
	ta_stay(16,0,23,0,"WP_INTRO01");
};

