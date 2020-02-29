
instance NOV_1331_BAALTARAN(NPC_DEFAULT)
{
	name[0] = "ָהמכ ׂ‎נאם";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NOV;
	level = 9;
	voice = 5;
	id = 1331;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 148;
	attribute[ATR_HITPOINTS] = 148;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_FatBald",29,2,nov_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_axe_old_01);
	CreateInvItems(self,itminugget,15);
	CreateInvItems(self,itforice,5);
	CreateInvItems(self,itfobooze,3);
	CreateInvItems(self,itmijoint_1,13);
	CreateInvItem(self,itmi_stuff_oldcoin_01);
	daily_routine = rtn_start_1331;
};


func void rtn_start_1331()
{
	ta_sleep(0,0,8,0,"OCR_HUT_59");
	ta_standaround(8,0,0,0,"OCR_OUTSIDE_HUT_77_INSERT");
};

func void rtn_dead_1331()
{
	ta_stay(8,0,20,0,"OCC_CELLAR_BAN_ROOM_2");
	ta_stay(20,0,8,0,"OCC_CELLAR_BAN_ROOM_2");
};

