
instance TPL_1439_GORNADRAK(NPC_DEFAULT)
{
	name[0] = "Гор На Драк";
	npctype = NPCTYPE_MAIN;
	guild = GIL_TPL;
	level = 21;
	voice = 9;
	id = 1439;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 292;
	attribute[ATR_HITPOINTS] = 292;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",63,2,tpl_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	EquipItem(self,itmw_2h_sword_light_04);
	CreateInvItem(self,itfosoup);
	CreateInvItem(self,itmijoint_1);
	daily_routine = rtn_start_1439;
};


func void rtn_start_1439()
{
	ta_smalltalk(6,0,14,0,"PSI_WALK_05");
	ta_smalltalk(14,0,6,0,"OW_OM_ENTRANCE02");
};

func void rtn_fmtaken_1439()
{
	ta_smalltalk(6,0,14,0,"PSI_WALK_05");
	ta_smalltalk(14,0,6,0,"PSI_WALK_05");
};

