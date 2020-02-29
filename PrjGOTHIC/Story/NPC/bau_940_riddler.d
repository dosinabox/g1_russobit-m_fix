
instance BAU_940_RIDDLER(NPC_DEFAULT)
{
	name[0] = "Труп";
	npctype = NPCTYPE_MAIN;
	guild = GIL_BAU;
	level = 10;
	voice = 7;
	id = 940;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Pony",110,1,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItems(self,itminugget,302);
	CreateInvItems(self,itforice,6);
	CreateInvItem(self,itfobooze);
	CreateInvItem(self,theriddle6);
	CreateInvItems(self,itarscrolltrfbloodfly,2);
	CreateInvItem(self,lebensamulett);
	daily_routine = rtn_start_940;
};


func void rtn_start_940()
{
	ta_stand(8,0,20,0,"OW_FOGDUNGEON_36_MOVEMENT");
	ta_stand(20,0,8,0,"OW_FOGDUNGEON_36_MOVEMENT");
};

