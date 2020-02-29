
instance BAU_940_RIDDLER(NPC_DEFAULT)
{
	name[0] = "Труп";
	npctype = NPCTYPE_MAIN;
	guild = GIL_KDF;
	level = 50;
	voice = 7;
	id = 940;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Pony",110,1,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,5);
	CreateInvItem(self,itarrunefirerain);
	CreateInvItems(self,itminugget,302);
	CreateInvItems(self,itforice,6);
	CreateInvItem(self,lebensamulett);
	CreateInvItem(self,theriddle6);
	CreateInvItems(self,itarscrolltrfbloodfly,2);
	daily_routine = rtn_start_940;
};


func void rtn_start_940()
{
	ta_stand(8,0,20,0,"OW_FOGDUNGEON_36_MOVEMENT");
	ta_stand(20,0,8,0,"OW_FOGDUNGEON_36_MOVEMENT");
};

