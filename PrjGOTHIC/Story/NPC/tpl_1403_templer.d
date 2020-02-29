
instance TPL_1403_TEMPLER(NPC_DEFAULT)
{
	name[0] = NAME_TEMPLER;
	npctype = NPCTYPE_GUARD;
	guild = GIL_TPL;
	level = 17;
	flags = 0;
	voice = 8;
	id = 1403;
	attribute[ATR_STRENGTH] = 85;
	attribute[ATR_DEXTERITY] = 65;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 244;
	attribute[ATR_HITPOINTS] = 244;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",60,1,tpl_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_RANGED;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,itmw_2h_sword_light_01);
	EquipItem(self,itrw_crossbow_01);
	CreateInvItems(self,itambolt,30);
	CreateInvItem(self,itfosoup);
	CreateInvItem(self,itmijoint_1);
	daily_routine = rtn_start_1403;
};


func void rtn_start_1403()
{
	ta_guardpalisade(0,0,22,0,"PSI_GUARD2");
	ta_guardpalisade(22,0,24,0,"PSI_GUARD2");
};

func void rtn_prepareritual_1403()
{
	ta_guardpalisade(0,0,22,0,"PSI_GUARD2");
	ta_guardpalisade(22,0,24,0,"PSI_GUARD2");
};

func void rtn_omfull_1403()
{
	ta_guardpalisade(0,0,22,0,"PSI_GUARD2");
	ta_guardpalisade(22,0,24,0,"PSI_GUARD2");
};

func void rtn_fmtaken_1403()
{
	ta_guardpalisade(0,0,22,0,"PSI_GUARD2");
	ta_guardpalisade(22,0,24,0,"PSI_GUARD2");
};

func void rtn_orcassault_1403()
{
	ta_guardpalisade(0,0,22,0,"PSI_GUARD2");
	ta_guardpalisade(22,0,24,0,"PSI_GUARD2");
};

