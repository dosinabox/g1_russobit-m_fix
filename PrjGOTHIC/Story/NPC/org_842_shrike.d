
instance ORG_842_SHRIKE(NPC_DEFAULT)
{
	name[0] = "״נאיך";
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORG;
	level = 6;
	voice = 7;
	id = 842;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 136;
	attribute[ATR_HITPOINTS] = 136;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_Thief",9,1,org_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itkelockpick,2);
	CreateInvItems(self,itminugget,15);
	CreateInvItems(self,itforice,7);
	CreateInvItems(self,itfobooze,3);
	CreateInvItems(self,itlstorch,2);
	CreateInvItems(self,itfo_potion_health_01,2);
	CreateInvItem(self,itmi_stuff_barbknife_01);
	CreateInvItem(self,itmi_stuff_cup_01);
	CreateInvItem(self,itfomutton);
	CreateInvItem(self,itfoloaf);
	CreateInvItem(self,itat_teeth_01);
	EquipItem(self,itmw_1h_mace_02);
	EquipItem(self,itrw_bow_small_02);
	CreateInvItems(self,itamarrow,20);
	daily_routine = rtn_prestart_842;
};


func void rtn_prestart_842()
{
	ta_sleep(23,30,8,0,"NC_HUT01_IN");
	ta_repairhut(8,0,23,30,"NC_HUT01_OUT");
};

func void rtn_start_842()
{
	ta_sleep(23,30,8,0,"NC_HUT18_IN");
	ta_smoke(8,0,23,30,"NC_PATH09");
};

