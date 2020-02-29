
instance TPL_1432_TEMPLER(NPC_DEFAULT)
{
	name[0] = NAME_TEMPLER;
	npctype = NPCTYPE_GUARD;
	guild = GIL_TPL;
	level = 17;
	voice = 8;
	id = 1432;
	attribute[ATR_STRENGTH] = 85;
	attribute[ATR_DEXTERITY] = 65;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 244;
	attribute[ATR_HITPOINTS] = 244;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",59,2,tpl_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,itmw_2h_sword_light_02);
	CreateInvItem(self,itfosoup);
	CreateInvItem(self,itmijoint_1);
	daily_routine = rtn_start_1432;
};


func void rtn_start_1432()
{
	ta_guardpassage(21,0,8,0,"PSI_TEMPLE_GUARD_04");
	ta_guardpassage(8,0,21,0,"PSI_TEMPLE_GUARD_04");
};

func void rtn_prepareritual_1432()
{
	ta_guardpassage(21,0,8,0,"PSI_TEMPLE_GUARD_04");
	ta_guardpassage(8,0,21,0,"PSI_TEMPLE_GUARD_04");
};

func void rtn_omfull_1432()
{
	ta_guardpassage(21,0,8,0,"PSI_TEMPLE_GUARD_04");
	ta_guardpassage(8,0,21,0,"PSI_TEMPLE_GUARD_04");
};

func void rtn_fmtaken_1432()
{
	ta_guardpassage(21,0,8,0,"PSI_TEMPLE_GUARD_04");
	ta_guardpassage(8,0,21,0,"PSI_TEMPLE_GUARD_04");
};

func void rtn_orcassault_1432()
{
	ta_guardpassage(21,0,8,0,"PSI_TEMPLE_GUARD_04");
	ta_guardpassage(8,0,21,0,"PSI_TEMPLE_GUARD_04");
};

