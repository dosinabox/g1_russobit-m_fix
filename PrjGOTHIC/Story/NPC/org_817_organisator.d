
instance ORG_817_ORGANISATOR(NPC_DEFAULT)
{
	name[0] = NAME_ORGANISATOR;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_ORG;
	level = 8;
	voice = 6;
	id = 817;
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
	CreateInvItems(self,itkelockpick,2);
	CreateInvItems(self,itminugget,8);
	CreateInvItem(self,itfomutton);
	EquipItem(self,itmw_1h_mace_03);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	daily_routine = rtn_start_817;
};


func void rtn_start_817()
{
	ta_sleep(23,0,8,0,"NC_HUT13_IN");
	ta_cook(8,0,23,0,"NC_HUT13_OUT");
};

