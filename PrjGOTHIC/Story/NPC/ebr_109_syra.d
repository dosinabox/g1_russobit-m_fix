
instance EBR_109_SYRA(NPC_DEFAULT)
{
	name[0] = "Сэра";
	npctype = NPCTYPE_MAIN;
	guild = GIL_BAB;
	level = 1;
	voice = 18;
	id = 109;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	Mdl_SetVisual(self,"Babe.MDS");
	Mdl_SetVisualBody(self,"Bab_body_Naked0",1,1,"Bab_Head_Hair1",1,DEFAULT,-1);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItem(self,itmibrush);
	CreateInvItem(self,itmiwedel);
	daily_routine = rtn_start_109;
};


func void rtn_start_109()
{
	ta_babe_sweep(22,0,6,0,"OCC_BARONS_LEFT_ROOM_FRONT");
	ta_babe_sweep(6,0,16,0,"OCC_BARONS_RIGHT_ROOM_TABLE");
	ta_babe_dance(16,0,22,0,"OCC_BARONS_DANCE");
};

func void rtn_flee_109()
{
	ta_stay(0,0,12,0,"WP_INTRO01");
	ta_stay(12,0,24,0,"WP_INTRO01");
};

