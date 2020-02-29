
instance TPL_1405_GORNARAN(NPC_DEFAULT)
{
	name[0] = "Гор На Ран";
	npctype = NPCTYPE_MAIN;
	guild = GIL_TPL;
	level = 17;
	flags = 0;
	voice = 13;
	id = 1405;
	attribute[ATR_STRENGTH] = 85;
	attribute[ATR_DEXTERITY] = 65;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 244;
	attribute[ATR_HITPOINTS] = 244;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",0,1,tpl_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,itmw_2h_sword_light_02);
	EquipItem(self,itrw_crossbow_01);
	CreateInvItems(self,itambolt,30);
	CreateInvItem(self,itfosoup);
	CreateInvItem(self,itmijoint_1);
	daily_routine = rtn_start_1405;
};


func void rtn_start_1405()
{
	ta_guardpalisade(0,0,12,0,"PSI_GUARD3");
	ta_guardpalisade(12,0,24,0,"PSI_GUARD3");
};

func void rtn_remove_1405()
{
	ta_stay(0,0,12,0,"WP_INTRO01");
	ta_stay(12,0,24,0,"WP_INTRO01");
};

instance TPL_1490_GORNARAN(NPC_DEFAULT)
{
	name[0] = "Гор На Ран";
	npctype = NPCTYPE_MAIN;
	guild = GIL_TPL;
	level = 25;
	flags = 0;
	voice = 13;
	id = 1490;
	attribute[ATR_STRENGTH] = 85;
	attribute[ATR_DEXTERITY] = 65;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 244;
	attribute[ATR_HITPOINTS] = 244;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",0,1,tpl_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,itmw_2h_sword_light_02);
	EquipItem(self,itrw_crossbow_01);
	CreateInvItems(self,itambolt,30);
	CreateInvItem(self,itfosoup);
	CreateInvItem(self,itmijoint_1);
	daily_routine = rtn_start_1490;
};

func void rtn_start_1490()
{
	ta_position(0,0,12,0,"TPL_012");
	ta_position(12,0,24,0,"TPL_012");
};

func void rtn_hostile_1490()
{
	ta_hostileguard(0,0,12,0,"TPL_012");
	ta_hostileguard(12,0,24,0,"TPL_012");
};

