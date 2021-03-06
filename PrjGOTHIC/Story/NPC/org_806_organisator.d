
instance ORG_806_ORGANISATOR(NPC_DEFAULT)
{
	name[0] = NAME_ORGANISATOR;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_ORG;
	level = 8;
	voice = 7;
	id = 806;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 136;
	attribute[ATR_HITPOINTS] = 136;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",6,1,org_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItem(self,itkelockpick);
	CreateInvItems(self,itminugget,14);
	CreateInvItem(self,itat_teeth_01);
	EquipItem(self,itmw_1h_mace_03);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	daily_routine = rtn_start_806;
};


func void rtn_start_806()
{
	ta_sleep(0,0,7,0,"NC_HUT20_IN");
	ta_washself(7,0,7,30,"NC_WASH_04");
	ta_smalltalk(7,30,0,0,"NC_PLACE06");
};

func void rtn_ch5_806()
{
	ta_sleep(0,0,7,30,"NC_HUT20_IN");
	ta_smalltalk(7,30,16,0,"NC_PLACE06");
	ta_standaround(16,0,17,0,"NC_PLACE06");
	ta_smalltalk(17,0,0,0,"NC_PLACE06");
};

