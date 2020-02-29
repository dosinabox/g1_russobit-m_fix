
instance EBR_102_ARTO(NPC_DEFAULT)
{
	name[0] = "Арто";
	npctype = NPCTYPE_MAIN;
	guild = GIL_EBR;
	level = 80;
	voice = 13;
	id = 102;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 70;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 388;
	attribute[ATR_HITPOINTS] = 388;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",10,1,ebr_armor_h2);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,2);
	EquipItem(self,artos_schwert);
	CreateInvItem(self,itfo_potion_health_03);
	CreateInvItem(self,ring_des_geschicks);
	daily_routine = rtn_start_102;
};


func void rtn_start_102()
{
	ta_sleep(2,5,7,35,"OCC_BARONS_UPPER_RIGHT_ROOM_BED2");
	ta_smalltalk(7,35,21,10,"OCC_BARONS_GREATHALL_CENTER_LEFT");
	ta_standaround(21,10,2,5,"OCC_BARONS_GREATHALL_CENTER_MOVEMENT4");
};

func void rtn_ot_102()
{
	ta_guard(23,0,7,0,"OCC_BARONS_HALLWAY_FRONT");
	ta_guard(23,0,7,0,"OCC_BARONS_HALLWAY_FRONT");
};

