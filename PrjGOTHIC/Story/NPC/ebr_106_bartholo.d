
instance EBR_106_BARTHOLO(NPC_DEFAULT)
{
	name[0] = "Бартоло";
	npctype = NPCTYPE_MAIN;
	guild = GIL_EBR;
	level = 70;
	voice = 12;
	id = 106;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 65;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 388;
	attribute[ATR_HITPOINTS] = 388;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",11,3,ebr_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	aivar[43] = TRUE;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,2);
	EquipItem(self,prankenhieb);
	CreateInvItem(self,itke_storage_01);
	b_give_bartholochapter1food();
	daily_routine = rtn_start_106;
	fight_tactic = FAI_HUMAN_MASTER;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	aivar[AIV_ITEMSCHWEIN] = TRUE;
};


func void rtn_start_106()
{
	ta_sleep(1,0,8,0,"OCC_BARONS_UPSTAIRS_RIGHT_BACK_ROOM_RIGHT");
	ta_stand(8,0,15,55,"OCC_BARONS_RIGHT_ROOM_BACK");
	ta_playtune(15,55,22,0,"OCC_BARONS_GREATHALL_RIGHT_BACK");
	ta_standaround(22,0,1,0,"OCC_BARONS_GREATHALL_LEFT_BACK");
};

func void rtn_ot_106()
{
	ta_guard(10,0,22,0,"OCC_CHAPEL_STAIRCASE_TOP");
	ta_guard(22,0,10,0,"OCC_CHAPEL_STAIRCASE_TOP");
};

