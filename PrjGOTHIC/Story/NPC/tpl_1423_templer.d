
instance TPL_1423_TEMPLER(NPC_DEFAULT)
{
	name[0] = NAME_TEMPLER;
	npctype = NPCTYPE_GUARD;
	guild = GIL_TPL;
	level = 17;
	voice = 13;
	id = 1423;
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
	EquipItem(self,itmw_2h_sword_light_02);
	CreateInvItem(self,itfosoup);
	CreateInvItem(self,itmijoint_1);
	daily_routine = rtn_start_1423;
};


func void rtn_start_1423()
{
	ta_guard(6,0,7,0,"PSI_GUARD3_MOVEMENT2");
	ta_smalltalk(7,0,8,0,"PSI_SWAMP_1");
	ta_guard(8,0,9,0,"PSI_GUARD3_MOVEMENT2");
	ta_smalltalk(9,0,10,0,"PSI_SWAMP_1");
	ta_guard(10,0,11,0,"PSI_GUARD3_MOVEMENT2");
	ta_smalltalk(11,0,12,0,"PSI_SWAMP_1");
	ta_guard(12,0,13,0,"PSI_GUARD3_MOVEMENT2");
	ta_smalltalk(13,0,14,0,"PSI_SWAMP_1");
	ta_guard(14,0,15,0,"PSI_GUARD3_MOVEMENT2");
	ta_smalltalk(15,0,16,0,"PSI_SWAMP_1");
	ta_guard(16,0,17,0,"PSI_GUARD3_MOVEMENT2");
	ta_smalltalk(17,0,18,0,"PSI_SWAMP_1");
	ta_guard(18,0,19,0,"PSI_GUARD3_MOVEMENT2");
	ta_smalltalk(19,0,20,0,"PSI_SWAMP_1");
	ta_guard(20,0,21,0,"PSI_GUARD3_MOVEMENT2");
	ta_smalltalk(21,0,22,0,"PSI_SWAMP_1");
	ta_guard(22,0,23,0,"PSI_GUARD3_MOVEMENT2");
	ta_smalltalk(23,0,0,0,"PSI_SWAMP_1");
	ta_guard(0,0,1,0,"PSI_GUARD3_MOVEMENT2");
	ta_smalltalk(1,0,2,0,"PSI_SWAMP_1");
	ta_guard(2,0,3,0,"PSI_GUARD3_MOVEMENT2");
	ta_smalltalk(3,0,4,0,"PSI_SWAMP_1");
	ta_guard(4,0,5,0,"PSI_GUARD3_MOVEMENT2");
	ta_smalltalk(5,0,6,0,"PSI_SWAMP_1");
};

