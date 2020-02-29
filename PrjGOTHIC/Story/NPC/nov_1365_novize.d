
instance NOV_1365_NOVIZE(NPC_DEFAULT)
{
	name[0] = NAME_MADNOVICE;
	npctype = NPCTYPE_MAIN;
	guild = GIL_GUR;
	level = 30;
	flags = 0;
	voice = 3;
	id = 1365;
	attribute[ATR_STRENGTH] = 115;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	protection[PROT_BLUNT] = 1000;
	protection[PROT_EDGE] = 1000;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 80;
	protection[PROT_MAGIC] = 50;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_FatBald",117,2,nov_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	CreateInvItem(self,itmw_2h_staff_02);
	daily_routine = rtn_ot_1365;
};


func void rtn_start_1365()
{
	ta_meditate(24,0,6,0,"TPL_408");
	ta_meditate(6,0,24,0,"TPL_408");
};

func void rtn_ot_1365()
{
	ta_otmeditate(24,0,6,0,"TPL_390");
	ta_otmeditate(6,0,24,0,"TPL_390");
};

