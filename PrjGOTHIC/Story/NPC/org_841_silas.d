
instance ORG_841_SILAS(NPC_DEFAULT)
{
	name[0] = "Силас";
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORG;
	level = 15;
	voice = 6;
	id = 841;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",5,1,org_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	b_give_silaschapter1food();
	EquipItem(self,silas_axt);
	//EquipItem(self,itrw_bow_long_01);
	//CreateInvItems(self,itamarrow,100);
	daily_routine = rtn_start_841;
};


func void rtn_start_841()
{
	ta_boss(10,0,3,0,"NC_TAVERN_ROOM04");
	ta_sleep(3,0,10,0,"NC_TAVERN_BACKROOM09");
};

