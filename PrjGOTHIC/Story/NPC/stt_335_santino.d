
instance STT_335_SANTINO(NPC_DEFAULT)
{
	name[0] = "Сантино";
	npctype = NPCTYPE_MAIN;
	guild = GIL_STT;
	level = 7;
	voice = 7;
	id = 335;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 18;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 124;
	attribute[ATR_HITPOINTS] = 124;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_Bald",12,1,stt_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itfo_potion_water_01,5);
	CreateInvItems(self,itkelockpick,5);
	CreateInvItems(self,itminugget,50);
	CreateInvItems(self,itlstorch,10);
	CreateInvItems(self,itfobeer,7);
	CreateInvItems(self,itfo_potion_mana_01,5);
	CreateInvItems(self,itfo_potion_health_01,5);
	CreateInvItems(self,itamarrow,100);
	CreateInvItems(self,itambolt,100);
	daily_routine = rtn_start_335;
};


func void rtn_start_335()
{
	ta_stay(0,0,12,0,"OM_202");
	ta_stay(12,0,24,0,"OM_202");
};

