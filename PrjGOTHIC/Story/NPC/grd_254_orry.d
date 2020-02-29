
instance GRD_254_ORRY(NPC_DEFAULT)
{
	name[0] = "־ננט";
	npctype = NPCTYPE_MAIN;
	guild = GIL_GRD;
	level = 10;
	voice = 6;
	id = 254;
	attribute[ATR_STRENGTH] = 35;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Psionic",14,1,grd_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,itmw_1h_sword_01);
	EquipItem(self,itrw_crossbow_01);
	CreateInvItems(self,itambolt,30);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	daily_routine = rtn_start_254;
};


func void rtn_start_254()
{
	ta_guardpalisade(0,0,23,0,"OW_PATH_1_16_B");
	ta_guardpalisade(23,0,24,0,"OW_PATH_1_16_B");
};

func void rtn_omfull_254()
{
};

func void rtn_fmtaken_254()
{
};

func void rtn_orcassault_254()
{
};

