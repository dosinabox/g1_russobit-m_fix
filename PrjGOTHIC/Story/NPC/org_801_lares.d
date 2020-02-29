
instance ORG_801_LARES(NPC_DEFAULT)
{
	name[0] = "Ларс";
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORG;
	level = 15;
	voice = 11;
	id = 801;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Pony",87,4,org_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	CreateInvItems(self,itkelockpick,3);
	CreateInvItems(self,itminugget,18);
	CreateInvItems(self,itforice,8);
	CreateInvItems(self,itfobooze,3);
	CreateInvItems(self,itlstorch,2);
	CreateInvItems(self,itfo_potion_health_01,3);
	CreateInvItem(self,itmi_stuff_plate_01);
	CreateInvItem(self,itmi_stuff_cup_01);
	CreateInvItem(self,itfomutton);
	CreateInvItem(self,itfoloaf);
	CreateInvItem(self,itat_teeth_01);
	EquipItem(self,lares_axt);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	daily_routine = rtn_start_801;
	aivar[AIV_ITEMSCHWEIN] = TRUE;
};


func void rtn_start_801()
{
	ta_sleep(1,0,7,0,"NC_HUT22_IN");
	ta_standaround(7,0,1,0,"NC_HUT22_IN_MOVEMENT2");
};

