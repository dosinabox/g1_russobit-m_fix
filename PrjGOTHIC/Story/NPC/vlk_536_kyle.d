
instance VLK_536_KYLE(NPC_DEFAULT)
{
	name[0] = "Кайл";
	npctype = NPCTYPE_MAIN;
	guild = GIL_VLK;
	level = 3;
	voice = 10;
	id = 536;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Bald",72,1,vlk_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItem(self,itmi_stuff_plate_01);
	EquipItem(self,itmwpickaxe);
	CreateInvItem(self,itlstorch);
	CreateInvItem(self,itfo_potion_water_01);
	daily_routine = rtn_start_536;
};


func void rtn_start_536()
{
	ta_sleep(22,0,8,0,"OCR_HUT_68");
	ta_stand(8,0,22,0,"OCR_HUT_68_BACK");
};

