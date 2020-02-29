
instance EBR_110_SERAPHIA(NPC_DEFAULT)
{
	name[0] = "Серафия";
	npctype = NPCTYPE_MAIN;
	guild = GIL_BAB;
	level = 1;
	voice = 16;
	id = 110;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	Mdl_SetVisual(self,"Babe.MDS");
	Mdl_SetVisualBody(self,"Bab_body_Naked0",2,1,"Bab_Head_Hair1",2,DEFAULT,-1);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItem(self,itmibrush);
	CreateInvItem(self,itmiwedel);
	daily_routine = rtn_start_110;
};


func void rtn_start_110()
{
	ta_babe_sweep(0,1,8,30,"OCC_BARONS_GREATHALL_CENTER_LEFT");
	ta_babe_fan(8,30,0,1,"OCC_BARONS_GREATHALL_BERATER");
};

func void rtn_flee_110()
{
	ta_stay(0,0,12,0,"WP_INTRO01");
	ta_stay(12,0,24,0,"WP_INTRO01");
};

