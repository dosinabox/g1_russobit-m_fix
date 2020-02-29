
instance ORG_819_DRAX(NPC_DEFAULT)
{
	name[0] = "�����";
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORG;
	level = 9;
	voice = 6;
	id = 819;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",39,2,org_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itkelockpick,2);
	CreateInvItems(self,itminugget,14);
	CreateInvItems(self,itforice,6);
	CreateInvItems(self,itfobooze,2);
	CreateInvItems(self,itlstorch,3);
	CreateInvItems(self,itfo_potion_health_01,3);
	CreateInvItem(self,itmi_stuff_plate_01);
	CreateInvItem(self,itmi_stuff_cup_01);
	CreateInvItem(self,itfoloaf);
	CreateInvItem(self,itat_claws_01);
	EquipItem(self,itmw_1h_mace_03);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	daily_routine = rtn_start_819;
};


func void rtn_start_819()
{
	ta_smalltalk(5,0,23,0,"OW_PATH_1_5_B");
	ta_boss(23,0,1,0,"OW_PATH_1_5_C");
	ta_sitcampfire(1,0,5,0,"OW_PATH_1_5_C");
};

func void rtn_fmtaken_819()
{
	ta_guard(7,0,18,0,"RND_CH4_02");
	ta_sitcampfire(18,0,7,0,"RND_CH4_01");
};

