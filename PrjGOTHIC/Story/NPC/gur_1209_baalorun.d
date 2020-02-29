
instance GUR_1209_BAALORUN(NPC_DEFAULT)
{
	name[0] = "ָהמכ ־נאם";
	npctype = NPCTYPE_MAIN;
	guild = GIL_GUR;
	level = 28;
	voice = 12;
	id = 1209;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 376;
	attribute[ATR_HITPOINTS] = 376;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",20,1,gur_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,4);
	EquipItem(self,oruns_keule);
	daily_routine = rtn_start_1209;
	fight_tactic = FAI_HUMAN_MAGE;
};


func void rtn_start_1209()
{
	ta_boss(7,0,0,0,"PSI_PATH_2_6");
	ta_sleep(0,0,7,0,"PSI_TREE_IN");
};

