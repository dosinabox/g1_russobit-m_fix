
instance VLK_529_BUDDLER(NPC_DEFAULT)
{
	name[0] = NAME_BUDDLER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_VLK;
	level = 2;
	voice = 2;
	id = 529;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Psionic",71,1,vlk_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nailmace_01);
	CreateInvItem(self,itmwpickaxe);
	daily_routine = rtn_start_529;
};


func void rtn_start_529()
{
	ta_sleep(22,0,6,0,"OCR_HUT_69");
	ta_boss(6,0,6,30,"OCR_OUTSIDE_HUT_69");
	ta_smalltalk(6,30,12,0,"OCR_OUTSIDE_HUT_69");
	ta_stand(12,0,13,0,"OCR_OUTSIDE_HUT_69");
	ta_smalltalk(13,0,16,0,"OCR_OUTSIDE_HUT_69");
	ta_standaround(16,0,22,0,"OCR_OUTSIDE_HUT_69");
};

