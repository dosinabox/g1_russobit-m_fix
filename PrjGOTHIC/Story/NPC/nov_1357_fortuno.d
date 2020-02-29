
instance NOV_1357_FORTUNO(NPC_DEFAULT)
{
	name[0] = "Фортуно";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NOV;
	level = 9;
	voice = 5;
	id = 1357;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 10;
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
	CreateInvItem(self,alchemybook);
	b_give_fortunochapter1herbs();
	daily_routine = rtn_start_1357;
};


func void rtn_start_1357()
{
	ta_sleep(1,0,6,0,"PSI_32_HUT_IN");
	ta_stand(6,0,1,0,"PSI_HERB_SHOP");
};

func void rtn_lab_1357()
{
	ta_potionalchemy(15,0,22,0,"PSI_LABOR_IN");
	ta_potionalchemy(22,0,15,0,"PSI_LABOR_IN");
};

