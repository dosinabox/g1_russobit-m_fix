
instance NOV_1303_NYRAS(NPC_DEFAULT)
{
	name[0] = "Нирас";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 6;
	voice = 3;
	id = 1303;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 24;
	attribute[ATR_DEXTERITY] = 13;
	attribute[ATR_MANA_MAX] = 12;
	attribute[ATR_MANA] = 12;
	attribute[ATR_HITPOINTS_MAX] = 132;
	attribute[ATR_HITPOINTS] = 132;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_FatBald",22,1,nov_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_mace_04);
	CreateInvItems(self,itminugget,15);
	CreateInvItems(self,itforice,5);
	CreateInvItems(self,itfobooze,3);
	CreateInvItems(self,itmijoint_1,1);
	daily_routine = rtn_start_1303;
};


func void rtn_start_1303()
{
	ta_smalltalk(8,0,23,0,"PSI_3_HUT_EX");
	ta_sleep(23,0,8,0,"PSI_4_HUT_IN");
};

func void rtn_prepareritual_1303()
{
	ta_stay(0,0,7,0,"WP_CIRCLE_01");
	ta_stay(7,0,24,0,"WP_CIRCLE_01");
};

func void rtn_hide_1303()
{
	ta_sitaround(0,0,7,0,"OW_FOGTOWER_TOP");
	ta_sitaround(7,0,24,0,"OW_FOGTOWER_TOP");
};

