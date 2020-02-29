
instance TPL_1431_TEMPLER(NPC_DEFAULT)
{
	name[0] = NAME_TEMPLER;
	npctype = NPCTYPE_GUARD;
	guild = GIL_TPL;
	level = 12;
	voice = 13;
	id = 1431;
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 25;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 184;
	attribute[ATR_HITPOINTS] = 184;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,0,"Hum_Head_Bald",15,1,tpl_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,itmw_2h_sword_light_02);
	CreateInvItem(self,itfosoup);
	CreateInvItem(self,itmijoint_1);
	daily_routine = rtn_start_1431;
};


func void rtn_start_1431()
{
	ta_guardpassage(21,0,8,0,"PSI_TEMPLE_GUARD_03");
	ta_guardpassage(8,0,21,0,"PSI_TEMPLE_GUARD_03");
};

func void rtn_remove_1431()
{
	ta_stay(23,0,7,45,"WP_INTRO01");
	ta_stay(7,45,23,0,"WP_INTRO01");
};

