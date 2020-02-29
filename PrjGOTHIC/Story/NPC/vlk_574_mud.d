
instance VLK_574_MUD(NPC_DEFAULT)
{
	name[0] = "Мад";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 0;
	voice = 7;
	id = 574;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Pony",109,1,vlk_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	EquipItem(self,itmw_1h_club_01);
	CreateInvItems(self,itminugget,5);
	CreateInvItem(self,itfo_potion_water_01);
	daily_routine = rtn_start_574;
};


func void rtn_start_574()
{
	ta_sleep(23,0,6,0,"OCR_HUT_13");
	ta_sitaround(23,0,6,0,"OCR_OUTSIDE_HUT_13");
};

func void rtn_follow_574()
{
	ta_followpc(23,0,16,0,"OCR_HUT_13");
	ta_followpc(16,0,23,0,"OCR_HUT_13");
};

