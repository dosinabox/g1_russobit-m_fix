
instance SLD_700_LEE(NPC_DEFAULT)
{
	name[0] = "ห่";
	npctype = NPCTYPE_MAIN;
	guild = GIL_SLD;
	level = 50;
	voice = 8;
	id = 700;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Pony",88,0,sld_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	EquipItem(self,lees_axt);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	CreateInvItems(self,itforice,8);
	CreateInvItems(self,itfoloaf,5);
	CreateInvItems(self,itfomutton,4);
	CreateInvItems(self,itminugget,25);
	CreateInvItems(self,itfobooze,5);
	CreateInvItems(self,itlstorch,5);
	CreateInvItems(self,itfo_potion_health_02,10);
	daily_routine = rtn_start_700;
	fight_tactic = FAI_HUMAN_MASTER;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
};


func void rtn_start_700()
{
	ta_sleep(1,0,7,0,"NC_SMALL_CAVE_CENTER");
	ta_smalltalk(7,0,19,0,"NC_SMALL_CAVE_CENTER");
	ta_readbook(19,0,1,0,"NC_SMALL_CAVE_READBOOK");
};

func void rtn_damnpast_700()
{
	ta_boss(23,0,6,0,"NC_DAM2");
	ta_boss(6,0,23,0,"NC_DAM2");
};

func void rtn_pcsld_700()
{
	ta_guidepc(23,0,6,0,"NC_DAM");
	ta_guidepc(6,0,23,0,"NC_DAM");
};

