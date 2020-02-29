
instance ORG_855_WOLF(NPC_DEFAULT)
{
	name[0] = "Волк";
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORG;
	level = 11;
	voice = 9;
	id = 855;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 90;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 172;
	attribute[ATR_HITPOINTS] = 172;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",38,1,org_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	b_give_wolfchapter1weapons();
	CreateInvItems(self,itkelockpick,1);
	CreateInvItems(self,itminugget,12);
	CreateInvItems(self,itforice,8);
	CreateInvItems(self,itfobooze,1);
	CreateInvItems(self,itlstorch,1);
	CreateInvItems(self,itfo_potion_health_01,3);
	CreateInvItem(self,itmi_stuff_plate_01);
	CreateInvItem(self,itmi_stuff_barbknife_01);
	CreateInvItem(self,itfomutton);
	CreateInvItem(self,itat_claws_01);
	EquipItem(self,itmw_1h_mace_war_01);
	CreateInvItems(self,itamarrow,20);
	CreateInvItems(self,itfo_wineberrys_01,5);
	daily_routine = rtn_start_855;
};


func void rtn_start_855()
{
	ta_sleep(1,0,7,30,"NC_HUT11_IN");
	ta_boss(7,30,10,30,"NC_HUT11_OUT");
	ta_roastscavenger(10,30,20,30,"NC_PLACE04");
	ta_sitaround(20,30,1,0,"NC_PLACE04");
};

