
instance EBR_108_VELAYA(NPC_DEFAULT)
{
	name[0] = "Велайя";
	npctype = NPCTYPE_MAIN;
	guild = GIL_BAB;
	level = 1;
	voice = 16;
	id = 108;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	Mdl_SetVisual(self,"BABE.MDS");
	Mdl_SetVisualBody(self,"Bab_body_Naked0",0,1,"Bab_Head_Hair1",0,DEFAULT,-1);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItem(self,itmibrush);
	CreateInvItem(self,itmiwedel);
	daily_routine = rtn_start_108;
};


func void rtn_start_108()
{
	ta_babe_sleep(1,0,10,0,"OCC_BARONS_UPSTAIRS_LEFT_BACK_ROOM_LEFT_BACK");
	ta_babe_sitaround(10,0,11,0,"OCC_BARONS_UPSTAIRS_LEFT_BACK_ROOM_FRONT");
	ta_bathing_babe(11,0,14,0,"OCC_BARONS_UPSTAIRS_LEFT_BACK_ROOM_FRONT");
	ta_babe_sitaround(14,0,16,0,"OCC_BARONS_UPSTAIRS_LEFT_BACK_ROOM_FRONT");
	ta_bathing_babe(16,0,19,0,"OCC_BARONS_UPSTAIRS_LEFT_BACK_ROOM_FRONT");
	ta_babe_sitaround(19,0,1,0,"OCC_BARONS_UPSTAIRS_LEFT_BACK_ROOM_FRONT");
};

func void rtn_flee_108()
{
	ta_stay(0,0,12,0,"WP_INTRO01");
	ta_stay(12,0,24,0,"WP_INTRO01");
};

