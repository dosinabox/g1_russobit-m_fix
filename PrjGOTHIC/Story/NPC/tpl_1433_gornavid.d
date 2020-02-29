
instance TPL_1433_GORNAVID(NPC_DEFAULT)
{
	name[0] = "Гор На Вид";
	npctype = NPCTYPE_MAIN;
	guild = GIL_TPL;
	level = 17;
	flags = 0;
	voice = 13;
	id = 1433;
	attribute[ATR_STRENGTH] = 85;
	attribute[ATR_DEXTERITY] = 65;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 244;
	attribute[ATR_HITPOINTS] = 244;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",20,1,tpl_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,itmw_2h_sword_light_01);
	CreateInvItem(self,itfosoup);
	CreateInvItem(self,itmijoint_1);
	daily_routine = rtn_start_1433;
};


func void rtn_start_1433()
{
	ta_sitaround(0,0,12,0,"OM_CAVE1_81");
	ta_sitaround(12,0,24,0,"OM_CAVE1_81");
};

func void rtn_gate_1433()
{
	ta_guard(0,0,12,0,"OM_CAVE3_21");
	ta_guard(12,0,24,0,"OM_CAVE3_21");
};

func void rtn_flee_1433()
{
	ta_stay(0,0,12,0,"WP_INTRO01");
	ta_stay(12,0,24,0,"WP_INTRO01");
};

