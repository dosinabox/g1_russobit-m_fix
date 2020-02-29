
instance ORG_843_SHARKY(NPC_DEFAULT)
{
	name[0] = "Шарки";
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORG;
	level = 8;
	voice = 10;
	id = 843;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 136;
	attribute[ATR_HITPOINTS] = 136;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",6,1,org_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	b_give_sharkychapter1weapons();
	CreateInvItems(self,itkelockpick,15);
	CreateInvItems(self,itminugget,50);
	CreateInvItems(self,itforice,10);
	CreateInvItems(self,itfobooze,5);
	CreateInvItems(self,itlstorch,5);
	CreateInvItems(self,itfo_potion_health_01,5);
	daily_routine = rtn_start_843;
};


func void rtn_start_843()
{
	ta_sleep(3,0,8,0,"NC_HUT25_IN");
	ta_sitaround(8,0,0,0,"NC_HUT25_OUT");
	ta_standaround(0,0,3,0,"NC_TAVERN_BAR");
};

