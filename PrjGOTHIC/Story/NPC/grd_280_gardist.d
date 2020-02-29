
instance GRD_280_GARDIST(NPC_DEFAULT)
{
	name[0] = NAME_GARDIST;
	npctype = NPCTYPE_GUARD;
	flags = NPC_FLAG_IMMORTAL;
	guild = GIL_GRD;
	level = 20;
	voice = 6;
	id = 230;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",19,0,grd_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,itmw_1h_sword_02);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	daily_routine = rtn_start_280;
};


func void rtn_start_280()
{
	ta_guardwheelopen(6,25,23,10,"OCC_GATE_VWHEEL");
	ta_guardwheelopen(23,10,6,25,"OCC_GATE_VWHEEL");
};

func void rtn_fmtaken_280()
{
	ta_guardwheelclosed(7,0,20,0,"OCC_GATE_VWHEEL");
	ta_guardwheelclosed(20,0,7,0,"OCC_GATE_VWHEEL");
};

