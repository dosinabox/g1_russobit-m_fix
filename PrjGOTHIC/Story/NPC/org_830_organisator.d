
instance ORG_830_ORGANISATOR(NPC_DEFAULT)
{
	name[0] = NAME_TORWACHE;
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORG;
	level = 4;
	voice = 13;
	id = 830;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,0,"Hum_Head_FatBald",12,2,org_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	EquipItem(self,itmw_1h_mace_01);
	CreateInvItems(self,itkelockpick,1);
	CreateInvItems(self,itminugget,10);
	CreateInvItems(self,itforice,7);
	CreateInvItems(self,itmijoint_1,3);
	CreateInvItems(self,itfo_potion_health_01,1);
	CreateInvItem(self,itmi_stuff_plate_01);
	daily_routine = rtn_start_830;
};


func void rtn_start_830()
{
	ta_smoke(8,0,20,0,"OW_PATH_07_21_GUARD_LEFT");
	ta_smoke(20,0,8,0,"OW_PATH_07_21_GUARD_LEFT");
};

func void rtn_fmtaken_830()
{
	ta_practicesword(8,0,20,0,"OW_PATH_068");
	ta_practicesword(20,0,8,0,"OW_PATH_068");
};

