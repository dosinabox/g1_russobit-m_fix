
instance SFB_1000_SENYAN(NPC_DEFAULT)
{
	name[0] = "Сеньян";
	npctype = NPCTYPE_MAIN;
	guild = GIL_SFB;
	level = 3;
	voice = 1;
	id = 1000;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Psionic",42,1,sfb_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itminugget,2);
	CreateInvItem(self,itmi_stuff_plate_01);
	EquipItem(self,itmwpickaxe);
	daily_routine = rtn_start_1000;
};


func void rtn_start_1000()
{
	ta_standaround(10,5,3,5,"NC_TAVERN_ROOM06");
	ta_standaround(3,5,10,5,"NC_TAVERN_ROOM06");
};

