
instance NOV_1341_NOVIZE(NPC_DEFAULT)
{
	name[0] = NAME_NOVIZE;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_NOV;
	level = 14;
	flags = 0;
	voice = 2;
	id = 1341;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 208;
	attribute[ATR_HITPOINTS] = 208;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_FatBald",27,1,nov_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_mace_01);
	daily_routine = rtn_start_1341;
};


func void rtn_start_1341()
{
	ta_meditate(6,27,23,52,"PSI_TEMPLE_NOVIZE_PR4_MOVEMENT");
	ta_sleep(23,52,6,27,"PSI_8_HUT_IN");
};

func void rtn_ritual_1341()
{
	ta_stay(18,0,21,0,"PSI_TEMPLE_NOVIZE_PR2");
	ta_stay(21,0,18,0,"PSI_TEMPLE_NOVIZE_PR2");
};

