
instance EBR_105_RAVEN(NPC_DEFAULT)
{
	name[0] = "Равен";
	npctype = NPCTYPE_MAIN;
	guild = GIL_EBR;
	level = 80;
	voice = 10;
	id = 105;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 388;
	attribute[ATR_HITPOINTS] = 388;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Thief",6,2,ebr_armor_h2);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,2);
	EquipItem(self,rabenrecht);
	CreateInvItem(self,itfo_potion_health_03);
	daily_routine = rtn_prestart_105;
};


func void rtn_prestart_105()
{
	ta_stand(9,0,22,0,"OCC_BARONS_HALLWAY_FRONT");
	ta_stand(22,0,9,0,"OCC_BARONS_HALLWAY_FRONT");
};

func void rtn_guide_105()
{
	ta_guidepc(8,0,20,0,"OCC_BARONS_GREATHALL_CENTER_MOVEMENT");
	ta_guidepc(20,0,8,0,"OCC_BARONS_GREATHALL_CENTER_MOVEMENT");
};

func void rtn_start_105()
{
	ta_sleep(2,0,9,0,"OCC_BARONS_UPSTAIRS_LEFT_FRONT_ROOM_FRONT");
	ta_stand(9,0,22,0,"OCC_BARONS_GREATHALL_RIGHT_FRONT");
	ta_standaround(22,0,2,0,"OCC_BARONS_GREATHALL_LEFT_BACK");
};

func void rtn_ot_105()
{
	ta_guard(7,0,20,0,"OCC_CENTER_1");
	ta_guard(20,0,7,0,"OCC_CENTER_1");
};

