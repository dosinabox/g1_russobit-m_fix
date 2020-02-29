
instance VLK_585_ALEPH(NPC_DEFAULT)
{
	name[0] = "Aлеф";
	npctype = NPCTYPE_MAIN;
	guild = GIL_VLK;
	level = 5;
	voice = 5;
	id = 585;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Thief",71,0,vlk_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_nailmace_01);
	CreateInvItem(self,itmwpickaxe);
	CreateInvItems(self,itke_om_03,1);
	EquipItem(self,staerkering);
	CreateInvItem(self,itfobeer);
	CreateInvItem(self,itlstorch);
	daily_routine = rtn_start_585;
};


func void rtn_start_585()
{
	ta_sitaround(4,0,16,0,"OM_PICKORE_05");
	ta_sitaround(16,0,4,0,"OM_PICKORE_05");
};

func void rtn_busy_585()
{
	ta_pickore(16,0,4,0,"OM_PICKORE_05");
	ta_pickore(4,0,16,0,"OM_PICKORE_05");
};

