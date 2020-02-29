
instance VLK_556_BUDDLER(NPC_DEFAULT)
{
	name[0] = NAME_BUDDLER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_VLK;
	level = 3;
	voice = 1;
	id = 556;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,0,"Hum_Head_Psionic",16,3,vlk_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nailmace_01);
	CreateInvItem(self,itmwpickaxe);
	CreateInvItem(self,itfoloaf);
	CreateInvItem(self,itfobeer);
	CreateInvItem(self,itlstorch);
	daily_routine = rtn_start_556;
};


func void rtn_start_556()
{
	ta_sleep(22,0,8,0,"OCR_HUT_78");
	ta_smalltalk(8,0,22,0,"OCR_OUTSIDE_HUT_79");
};

