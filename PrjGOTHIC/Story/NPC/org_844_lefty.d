
instance ORG_844_LEFTY(NPC_DEFAULT)
{
	name[0] = "Лефти";
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORG;
	level = 8;
	voice = 7;
	id = 844;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 136;
	attribute[ATR_HITPOINTS] = 136;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",37,2,org_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itkelockpick,1);
	CreateInvItems(self,itminugget,10);
	CreateInvItems(self,itforice,2);
	CreateInvItems(self,itfo_potion_water_01,5);
	CreateInvItem(self,itfobooze);
	CreateInvItems(self,itfo_potion_health_01,3);
	EquipItem(self,itmw_1h_mace_03);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	daily_routine = rtn_wait_844;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
};


func void rtn_start_844()
{
	ta_sitcampfire(19,0,8,0,"NC_PATH86_MOVEMENT");
	ta_smalltalk(8,0,19,0,"NC_PATH53");
};

func void rtn_wait_844()
{
	ta_sitcampfire(19,0,8,0,"NC_PATH86_MOVEMENT");
	ta_boss(8,0,19,0,"NC_PATH86");
};

