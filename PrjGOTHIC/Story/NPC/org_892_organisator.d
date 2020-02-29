
instance ORG_892_ORGANISATOR(NPC_DEFAULT)
{
	name[0] = NAME_ORGANISATOR;
	npctype = NPCTYPE_MINE_AMBIENT;
	guild = GIL_ORG;
	level = 11;
	voice = 13;
	id = 892;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 172;
	attribute[ATR_HITPOINTS] = 172;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",35,2,org_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itkelockpick,3);
	CreateInvItems(self,itminugget,9);
	CreateInvItems(self,itforice,8);
	CreateInvItems(self,itfobooze,7);
	CreateInvItems(self,itlstorch,2);
	CreateInvItems(self,itfo_potion_health_01,1);
	CreateInvItem(self,itmi_stuff_plate_01);
	CreateInvItem(self,itmi_stuff_cup_01);
	CreateInvItem(self,itfomutton);
	CreateInvItem(self,itat_teeth_01);
	EquipItem(self,itmw_1h_mace_war_01);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	daily_routine = rtn_fmcstart_892;
};


func void rtn_fmcstart_892()
{
	ta_smoke(1,0,13,0,"FMC_HUT11_OUT");
	ta_smoke(13,0,1,0,"FMC_HUT11_OUT");
};

