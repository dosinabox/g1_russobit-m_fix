
instance TPL_1407_TEMPLER(NPC_DEFAULT)
{
	name[0] = NAME_TEMPLER;
	npctype = NPCTYPE_GUARD;
	guild = GIL_TPL;
	level = 17;
	flags = 0;
	voice = 13;
	id = 1407;
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
	daily_routine = rtn_start_1407;
};


func void rtn_start_1407()
{
	ta_smalltalk(6,0,7,0,"PSI_SWAMP_6");
	ta_guard(7,0,8,0,"PSI_PATH_9_12");
	ta_smalltalk(8,0,9,0,"PSI_SWAMP_6");
	ta_guard(9,0,10,0,"PSI_PATH_9_12");
	ta_smalltalk(10,0,11,0,"PSI_SWAMP_6");
	ta_guard(11,0,12,0,"PSI_PATH_9_12");
	ta_smalltalk(12,0,13,0,"PSI_SWAMP_6");
	ta_guard(13,0,14,0,"PSI_PATH_9_12");
	ta_smalltalk(14,0,15,0,"PSI_SWAMP_6");
	ta_guard(15,0,16,0,"PSI_PATH_9_12");
	ta_smalltalk(16,0,17,0,"PSI_SWAMP_6");
	ta_guard(17,0,18,0,"PSI_PATH_9_12");
	ta_smalltalk(18,0,19,0,"PSI_SWAMP_6");
	ta_guard(19,0,20,0,"PSI_PATH_9_12");
	ta_smalltalk(20,0,21,0,"PSI_SWAMP_6");
	ta_guard(21,0,22,0,"PSI_PATH_9_12");
	ta_smalltalk(22,0,23,0,"PSI_SWAMP_6");
	ta_guard(23,0,0,0,"PSI_PATH_9_12");
	ta_smalltalk(0,0,1,0,"PSI_SWAMP_6");
	ta_guard(1,0,2,0,"PSI_PATH_9_12");
	ta_smalltalk(2,0,3,0,"PSI_SWAMP_6");
	ta_guard(3,0,4,0,"PSI_PATH_9_12");
	ta_smalltalk(4,0,5,0,"PSI_SWAMP_6");
	ta_guard(5,0,6,0,"PSI_PATH_9_12");
};

