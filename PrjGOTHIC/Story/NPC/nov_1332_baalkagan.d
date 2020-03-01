
instance NOV_1332_BAALKAGAN(NPC_DEFAULT)
{
	name[0] = "Идол Каган";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NOV;
	level = 9;
	voice = 13;
	id = 1332;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 148;
	attribute[ATR_HITPOINTS] = 148;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",29,1,nov_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_axe_old_01);
	CreateInvItems(self,itmijoint_1,10);
	CreateInvItems(self,itmijoint_2,20);
	CreateInvItems(self,itmijoint_3,20);
	daily_routine = rtn_start_1332;
};


func void rtn_start_1332()
{
	ta_standaround(0,0,7,30,"NC_PATH_PEASANT_OUTSIDE11");
	ta_smalltalk(7,30,0,0,"NC_PLACE06");
};

func void rtn_ch5_1332()
{
	ta_standaround(0,0,7,30,"NC_PATH_PEASANT_OUTSIDE11");
	ta_smalltalk(7,30,16,0,"NC_PLACE06");
	ta_smalltalk(16,0,17,0,"NC_TAVERN_SIDE02");
	ta_smalltalk(17,0,0,0,"NC_PLACE06");
};

