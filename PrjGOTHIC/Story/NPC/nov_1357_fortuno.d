
instance NOV_1357_FORTUNO(NPC_DEFAULT)
{
	name[0] = "Фортуно";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NOV;
	level = 9;
	voice = 5;
	id = 1357;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 148;
	attribute[ATR_HITPOINTS] = 148;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",27,1,nov_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,fortunos_keule);
	CreateInvItems(self,itmijoint_1,30);
	CreateInvItems(self,itmijoint_2,20);
	CreateInvItems(self,itmijoint_3,10);
	CreateInvItems(self,itminugget,237);
	daily_routine = rtn_start_1357;
};


func void rtn_start_1357()
{
	ta_sleep(1,0,6,0,"PSI_32_HUT_IN");
	ta_stand(6,0,1,0,"PSI_HERB_SHOP");
};

