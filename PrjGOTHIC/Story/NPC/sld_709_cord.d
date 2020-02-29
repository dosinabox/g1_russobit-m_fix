
instance SLD_709_CORD(NPC_DEFAULT)
{
	name[0] = "Корд";
	npctype = NPCTYPE_MAIN;
	guild = GIL_SLD;
	level = 18;
	voice = 14;
	id = 709;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 256;
	attribute[ATR_HITPOINTS] = 256;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",104,1,sld_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	EquipItem(self,cords_spalter);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,23);
	CreateInvItems(self,itforice,7);
	CreateInvItems(self,itfoloaf,7);
	CreateInvItems(self,itfomutton,4);
	CreateInvItems(self,itminugget,15);
	CreateInvItems(self,itfobooze,5);
	CreateInvItems(self,itlstorch,5);
	CreateInvItems(self,itfo_potion_health_02,8);
	CreateInvItem(self,itmi_stuff_barbknife_01);
	CreateInvItem(self,itmi_stuff_amphore_01);
	daily_routine = rtn_start_709;
};


func void rtn_start_709()
{
	ta_sleep(21,0,7,0,"NC_HUT09_IN");
	ta_boss(7,0,21,0,"NC_WATERFALL_TOP01_MOVEMENT");
};

func void rtn_fmtaken_709()
{
	ta_stay(0,0,23,0,"OW_PATH_075");
	ta_stay(23,0,24,0,"OW_PATH_075");
};

func void rtn_fmtakenback_709()
{
	ta_stayneutral(5,0,17,0,"FMC_HUT10_OUT");
	ta_stayneutral(17,0,5,0,"FMC_HUT10_OUT");
};
