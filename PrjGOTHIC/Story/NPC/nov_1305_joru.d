
instance NOV_1305_JORU(NPC_DEFAULT)
{
	name[0] = "Йору";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NOV;
	level = 9;
	flags = 0;
	voice = 7;
	id = 1305;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 148;
	attribute[ATR_HITPOINTS] = 148;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",75,1,nov_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_axe_old_01);
	daily_routine = rtn_start_1305;
};


func void rtn_start_1305()
{
	ta_sleep(23,55,8,5,"PSI_14_HUT_IN");
	ta_teaching(8,5,23,55,"PSI_11_HUT_EX");
};

