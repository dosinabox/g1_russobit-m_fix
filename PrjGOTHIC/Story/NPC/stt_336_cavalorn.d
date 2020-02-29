
instance STT_336_CAVALORN(NPC_DEFAULT)
{
	name[0] = "Кавалорн";
	npctype = NPCTYPE_MAIN;
	guild = GIL_STT;
	level = 5;
	voice = 12;
	id = 336;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_Psionic",10,2,stt_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	b_give_cavalornchapter1weapons();
	//EquipItem(self,itmw_1h_sword_short_02);
	//EquipItem(self,itrw_bow_small_02);
	EquipItem(self,tr_m_cavalorn);
	EquipItem(self,tr_r_cavalorn);
	CreateInvItems(self,itamarrow,16);
	CreateInvItem(self,itfo_potion_water_01);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itkelockpick,5);
	daily_routine = rtn_start_336;
};


func void rtn_start_336()
{
	ta_sleep(23,0,6,30,"OW_SAWHUT_SLEEP_01");
	ta_standaround(6,30,21,0,"OW_SAWHUT_SLEEP_01");
	ta_sitcampfire(21,0,23,0,"OW_CAVALORN_01");
};

