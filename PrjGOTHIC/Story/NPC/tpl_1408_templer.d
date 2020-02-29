
instance TPL_1408_TEMPLER(NPC_DEFAULT)
{
	name[0] = NAME_TEMPLER;
	npctype = NPCTYPE_GUARD;
	guild = GIL_TPL;
	level = 17;
	flags = 0;
	voice = 8;
	id = 1408;
	attribute[ATR_STRENGTH] = 85;
	attribute[ATR_DEXTERITY] = 65;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 244;
	attribute[ATR_HITPOINTS] = 244;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",65,0,tpl_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_RANGED;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,itmw_2h_sword_light_01);
	EquipItem(self,itrw_crossbow_01);
	CreateInvItems(self,itambolt,30);
	CreateInvItem(self,itfosoup);
	CreateInvItem(self,itmijoint_1);
	daily_routine = rtn_start_1408;
};


func void rtn_start_1408()
{
	ta_guardpalisade(8,0,22,0,"PSI_GUARD_TEMPLE_5_2");
	ta_guardpalisade(22,0,8,0,"PSI_GUARD_TEMPLE_5_2");
};

