
instance GRD_276_BRUECKENWACHE(NPC_DEFAULT)
{
	name[0] = NAME_BRUECKENWACHE;
	npctype = NPCTYPE_OW_GUARD;
	guild = GIL_GRD;
	level = 10;
	voice = 7;
	id = 276;
	attribute[ATR_STRENGTH] = 35;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Psionic",2,1,grd_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,itmw_1h_sword_01);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	daily_routine = rtn_start_276;
};


func void rtn_start_276()
{
	ta_guard(6,0,21,0,"OW_PATH_1_1");
	ta_guard(21,0,6,0,"OW_PATH_1_1");
};

func void rtn_fmtaken_276()
{
	ta_guard(6,0,21,0,"OW_PATH_1_15");
	ta_guard(21,0,6,0,"OW_PATH_1_15");
};

