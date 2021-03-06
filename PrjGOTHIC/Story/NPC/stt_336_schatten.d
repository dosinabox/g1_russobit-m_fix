
instance STT_336_SCHATTEN(NPC_DEFAULT)
{
	name[0] = NAME_SCHATTEN;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_STT;
	level = 5;
	voice = 10;
	id = 336;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Pony",56,1,stt_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_sword_short_01);
	EquipItem(self,itrw_bow_small_05);
	CreateInvItems(self,itamarrow,15);
	CreateInvItem(self,itfo_potion_water_01);
	CreateInvItem(self,itfobeer);
	daily_routine = rtn_fmstart_336;
};


func void rtn_fmstart_336()
{
	ta_sitaround(0,0,13,0,"FM_162");
	ta_sitaround(13,0,0,0,"FM_162");
};

