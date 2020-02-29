
instance VLK_517_BUDDLER(NPC_DEFAULT)
{
	name[0] = NAME_BUDDLER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_VLK;
	level = 2;
	voice = 1;
	id = 517;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Pony",0,1,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_club_01);
	CreateInvItem(self,itfo_potion_water_01);
	CreateInvItem(self,itmi_stuff_barbknife_01);
	daily_routine = rtn_start_517;
};


func void rtn_start_517()
{
	ta_sleep(23,30,7,0,"OCR_HUT_46");
	ta_smalltalk(7,0,11,0,"OCR_OUTSIDE_HUT_47_SMALT2");
	ta_sitaround(11,0,13,0,"OCR_OUTSIDE_MCAMP_01");
	ta_smalltalk(13,0,16,0,"OCR_OUTSIDE_HUT_47_SMALT2");
	ta_sitaround(16,0,23,30,"OCR_OUTSIDE_MCAMP_01");
};

