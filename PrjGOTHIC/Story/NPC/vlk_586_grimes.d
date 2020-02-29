
instance VLK_586_GRIMES(NPC_DEFAULT)
{
	name[0] = "ֳנאילס";
	npctype = NPCTYPE_MAIN;
	guild = GIL_VLK;
	level = 5;
	voice = 4;
	id = 586;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Thief",110,2,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItem(self,itfo_potion_water_01);
	EquipItem(self,itmwpickaxe);
	daily_routine = rtn_start_586;
};


func void rtn_start_586()
{
	ta_pickore(8,0,18,0,"OM_PICKORE_02");
	ta_roastscavenger(18,0,23,0,"OM_CAVE1_48");
	ta_sitaround(23,0,8,0,"OM_CAVE1_48");
};

