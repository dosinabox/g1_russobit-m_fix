
instance TPL_1462_TEMPLER(NPC_DEFAULT)
{
	name[0] = NAME_MADTEMPLAR2;
	npctype = NPCTYPE_GUARD;
	guild = GIL_GUR;
	level = 100;
	voice = 1;
	id = 1462;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 65;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	protection[PROT_BLUNT] = 1000;
	protection[PROT_EDGE] = 1000;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 80;
	protection[PROT_MAGIC] = 80;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",117,2,tpl_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	CreateInvItem(self,itmw_2h_sword_light_02);
	CreateInvItem(self,itfosoup);
	CreateInvItem(self,itmijoint_1);
	CreateInvItem(self,itfo_potion_health_02);
	daily_routine = rtn_ot_1462;
};


func void rtn_start_1462()
{
	ta_hostileguard(9,0,21,0,"TPL_408");
	ta_hostileguard(21,0,9,0,"TPL_408");
};

func void rtn_ot_1462()
{
	ta_hostileguard(9,0,21,0,"TPL_278");
	ta_hostileguard(21,0,9,0,"TPL_278");
};

