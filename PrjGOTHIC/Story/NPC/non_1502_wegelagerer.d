
instance NON_1502_WEGELAGERER(NPC_DEFAULT)
{
	name[0] = "Бандит";
	npctype = NPCTYPE_ROGUE;
	guild = GIL_NONE;
	level = 9;
	voice = 8;
	id = 1502;
	attribute[ATR_STRENGTH] = 35;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 195;
	attribute[ATR_HITPOINTS] = 195;
	aivar[43] = TRUE;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,3,"Hum_Head_Thief",5,2,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_sword_old_01);
	CreateInvItems(self,itfo_potion_health_01,2);
	CreateInvItems(self,itminugget,43);
	CreateInvItems(self,itfobeer,3);
	daily_routine = rtn_start_1502;
};


func void rtn_start_1502()
{
	ta_sitcampfire(22,0,6,0,"SPAWN_TALL_PATH_BANDITOS2_03");
	ta_smalltalk(6,0,22,0,"SPAWN_TALL_PATH_BANDITOS2_02_04");
};

