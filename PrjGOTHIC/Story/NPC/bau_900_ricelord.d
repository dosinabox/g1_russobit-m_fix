
instance BAU_900_RICELORD(NPC_DEFAULT)
{
	name[0] = "Лорд";
	npctype = NPCTYPE_MAIN;
	guild = GIL_BAU;
	level = 10;
	voice = 12;
	id = 900;
	attribute[ATR_STRENGTH] = 36;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 170;
	attribute[ATR_HITPOINTS] = 170;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	Mdl_SetVisualBody(self,"Hum_Body_CookSmith",1,1,"Hum_Head_FatBald",91,0,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	CreateInvItems(self,itforice,10);
	CreateInvItem(self,itfowine);
	CreateInvItems(self,itminugget,40);
	EquipItem(self,heerscherstab);
	CreateInvItem(self,itmi_alchemy_moleratlubric_01);
	EquipItem(self,ring_des_lebens);
	daily_routine = rtn_start_900;
};


func void rtn_start_900()
{
	ta_boss(7,0,20,0,"NC_RICELORD");
	ta_sitaround(20,0,24,0,"NC_RICELORD_SIT");
	ta_sleep(24,0,7,0,"NC_RICEBUNKER_10");
};

