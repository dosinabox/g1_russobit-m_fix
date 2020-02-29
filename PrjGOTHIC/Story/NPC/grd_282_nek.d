
instance GRD_282_NEK(NPC_DEFAULT)
{
	name[0] = "Убитый стражник";
	npctype = NPCTYPE_MAIN;
	guild = GIL_GRD;
	level = 10;
	voice = 7;
	id = 282;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_FatBald",2,1,grd_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	CreateInvItem(self,neks_amulett);
	CreateInvItems(self,itminugget,10);
	daily_routine = rtn_start_282;
};


func void rtn_start_282()
{
	ta_stand(8,0,20,0,"LOCATION_15_IN_2");
	ta_stand(20,0,8,0,"LOCATION_15_IN_2");
};

