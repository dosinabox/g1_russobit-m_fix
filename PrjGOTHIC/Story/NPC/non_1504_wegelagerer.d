
instance NON_1504_WEGELAGERER(NPC_DEFAULT)
{
	name[0] = "Бандит";
	npctype = NPCTYPE_ROGUE;
	guild = GIL_NONE;
	level = 9;
	voice = 14;
	id = 1504;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 166;
	attribute[ATR_HITPOINTS] = 166;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,0,"Hum_Head_Bald",10,3,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_axe_old_01);
	CreateInvItems(self,itminugget,54);
	CreateInvItems(self,itfo_potion_health_01,2);
	CreateInvItem(self,itfobeer);
	daily_routine = rtn_start_1504;
};


func void rtn_start_1504()
{
	ta_sitcampfire(22,0,6,0,"OW_PATH_BANDITOS01");
	ta_smalltalk(6,0,22,0,"OW_PATH_BANDITOS01");
};

