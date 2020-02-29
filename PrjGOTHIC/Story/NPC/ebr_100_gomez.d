
instance EBR_100_GOMEZ(NPC_DEFAULT)
{
	name[0] = "Гомез";
	npctype = NPCTYPE_MAIN;
	guild = GIL_EBR;
	level = 100;
	voice = 11;
	id = 100;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 110;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 440;
	attribute[ATR_HITPOINTS] = 440;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",85,4,ebr_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,2);
	EquipItem(self,innos_zorn);
	CreateInvItem(self,itke_gomez_01);
	EquipItem(self,amulett_der_macht);
	EquipItem(self,schutzring_total2);
	fight_tactic = FAI_HUMAN_MASTER;
	daily_routine = rtn_prestart_100;
};


func void rtn_prestart_100()
{
	ta_ebr_hangaround(0,0,8,0,"OCC_BARONS_GREATHALL_THRONE");
	ta_ebr_hangaround(8,0,0,0,"OCC_BARONS_GREATHALL_THRONE");
};

func void rtn_start_100()
{
	ta_sitaround(0,0,8,0,"OCC_BARONS_UPSTAIRS_LEFT_BACK_ROOM_LEFT_FRONT");
	ta_ebr_hangaround(8,0,0,0,"OCC_BARONS_GREATHALL_THRONE");
};

func void rtn_ot_100()
{
	ta_stay(7,0,20,0,"OCC_BARONS_DANCE");
	ta_stay(20,0,7,0,"OCC_BARONS_DANCE");
};

