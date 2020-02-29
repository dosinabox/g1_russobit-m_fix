
instance TPL_1444_TEMPLER(NPC_DEFAULT)
{
	name[0] = NAME_TEMPLER;
	npctype = NPCTYPE_GUARD;
	guild = GIL_TPL;
	level = 17;
	flags = 0;
	voice = 13;
	id = 1444;
	attribute[ATR_STRENGTH] = 55;
	attribute[ATR_DEXTERITY] = 55;
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
	EquipItem(self,itmw_1h_sword_04);
	CreateInvItem(self,itfosoup);
	CreateInvItem(self,itmijoint_1);
	CreateInvItem(self,itmi_stuff_oldcoin_01);
	daily_routine = rtn_start_1444;
};


func void rtn_start_1444()
{
	ta_sittingduck(0,0,12,0,"GRYD_025");
	ta_sittingduck(12,0,24,0,"GRYD_025");
};

