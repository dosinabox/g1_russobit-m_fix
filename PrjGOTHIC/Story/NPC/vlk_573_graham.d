
instance VLK_573_GRAHAM(NPC_DEFAULT)
{
	name[0] = "Грехем";
	npctype = NPCTYPE_MAIN;
	guild = GIL_VLK;
	level = 4;
	voice = 2;
	id = 573;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Fighter",67,1,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_mace_light_01);
	CreateInvItem(self,itfo_potion_water_01);
	CreateInvItem(self,itwrommap);
	CreateInvItems(self,itwrworldmap,2);
	CreateInvItem(self,itwrocmap);
	CreateInvItem(self,itwrpinup);
	daily_routine = rtn_start_573;
};


func void rtn_start_573()
{
	ta_sleep(22,30,6,0,"OCR_HUT_76");
	ta_sitaround(6,0,7,0,"OCR_OUTSIDE_HUT_76");
	ta_standaround(7,0,11,0,"OCR_OUSIDE_HUT_77_INSERT");
	ta_washself(11,0,11,30,"OCR_LAKE_4");
	ta_repairhut(11,30,12,0,"OCR_OUTSIDE_HUT_76");
	ta_boss(12,0,18,0,"OCR_HUT_76");
	ta_sitcampfire(18,0,22,30,"OCR_OUSIDE_HUT_77_INSERT");
};

