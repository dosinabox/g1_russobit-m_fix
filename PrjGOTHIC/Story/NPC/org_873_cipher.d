
instance ORG_873_CIPHER(NPC_DEFAULT)
{
	name[0] = "Сайфер";
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORG;
	level = 8;
	voice = 12;
	id = 873;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 136;
	attribute[ATR_HITPOINTS] = 136;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",90,2,org_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	b_give_cipherchapter1crap();
	EquipItem(self,itmw_1h_mace_03);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	daily_routine = rtn_start_873;
};


func void rtn_start_873()
{
	ta_sleep(3,5,8,0,"NC_HUT24_IN");
	ta_standaround(8,0,3,5,"NC_TAVERN_BAR");
};

