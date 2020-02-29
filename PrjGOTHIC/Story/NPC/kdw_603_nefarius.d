
instance KDW_603_NEFARIUS(NPC_DEFAULT)
{
	name[0] = "Нефариус";
	npctype = NPCTYPE_MAIN;
	guild = GIL_KDW;
	level = 25;
	voice = 4;
	id = 603;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 35;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 340;
	attribute[ATR_HITPOINTS] = 340;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Psionic",8,1,kdw_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,5);
	EquipItem(self,itarrunethunderball);
	CreateInvItem(self,itfo_potion_health_02);
	CreateInvItem(self,itfo_potion_mana_02);
	EquipItem(self,schutzring_total1);
	EquipItem(self,ring_der_magie);
	CreateInvItems(self,itfo_plants_flameberry_01,2);
	daily_routine = rtn_start_603;
};


func void rtn_start_603()
{
	ta_practicemagic(4,0,23,0,"NC_PLACE02");
	ta_sleep(23,0,4,0,"NC_KDW05_IN");
};

func void rtn_orealert_603()
{
	ta_guard(4,0,23,0,"NC_LOWER_CAVE_01");
	ta_guard(23,0,4,0,"NC_LOWER_CAVE_01");
};

