
instance NOV_1338_NOVIZE(NPC_DEFAULT)
{
	name[0] = NAME_NOVIZE;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_NOV;
	level = 14;
	voice = 5;
	id = 1338;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 19;
	attribute[ATR_MANA] = 19;
	attribute[ATR_HITPOINTS_MAX] = 208;
	attribute[ATR_HITPOINTS] = 208;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_FatBald",22,1,nov_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_mace_01);
	daily_routine = rtn_start_1338;
};


func void rtn_start_1338()
{
	ta_meditate(8,0,10,0,"PSI_TEMPLE_COURT_2");
	ta_meditate(10,0,8,0,"PSI_TEMPLE_COURT_2");
};

func void rtn_ritual_1338()
{
	ta_stay(0,0,8,0,"PSI_TEMPLE_NOVIZE_PR6");
	ta_stay(8,0,24,0,"PSI_TEMPLE_NOVIZE_PR6");
};

