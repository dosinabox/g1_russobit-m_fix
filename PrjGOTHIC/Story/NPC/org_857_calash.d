
instance ORG_857_CALASH(NPC_DEFAULT)
{
	name[0] = "Калаш";
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORG;
	level = 11;
	voice = 2;
	id = 857;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 172;
	attribute[ATR_HITPOINTS] = 172;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_Pony",8,1,org_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItem(self,itforice);
	CreateInvItem(self,itfoloaf);
	CreateInvItems(self,itminugget,5);
	CreateInvItem(self,itfobooze);
	CreateInvItem(self,itkelockpick);
	EquipItem(self,itmw_1h_mace_war_01);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,10);
	daily_routine = rtn_prestart_857;
};


func void rtn_prestart_857()
{
	ta_position(0,0,12,0,"OM_85");
	ta_position(12,0,24,0,"OM_85");
};

func void rtn_start_857()
{
	ta_position(0,0,12,0,"OM_85");
	ta_position(12,0,24,0,"OM_85");
};

func void rtn_omfull_857()
{
	ta_position(0,0,12,0,"OM_85");
	ta_position(12,0,24,0,"OM_85");
};

