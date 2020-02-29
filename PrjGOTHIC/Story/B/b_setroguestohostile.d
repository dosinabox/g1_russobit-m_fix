
func void b_setroguestohostile()
{
	var C_NPC renyu;
	var C_NPC killian;
	var C_NPC jacko;
	var C_NPC weg1501;
	var C_NPC weg1502;
	var C_NPC weg1503;
	var C_NPC weg1504;
	weg1501 = Hlp_GetNpc(non_1501_wegelagerer);
	Npc_SetTempAttitude(weg1501,ATT_HOSTILE);
	Npc_SetAttitude(weg1501,ATT_HOSTILE);
	weg1502 = Hlp_GetNpc(non_1502_wegelagerer);
	Npc_SetTempAttitude(weg1502,ATT_HOSTILE);
	Npc_SetAttitude(weg1502,ATT_HOSTILE);
	weg1503 = Hlp_GetNpc(non_1503_wegelagerer);
	Npc_SetTempAttitude(weg1503,ATT_HOSTILE);
	Npc_SetAttitude(weg1503,ATT_HOSTILE);
	weg1504 = Hlp_GetNpc(non_1504_wegelagerer);
	Npc_SetTempAttitude(weg1504,ATT_HOSTILE);
	Npc_SetAttitude(weg1504,ATT_HOSTILE);
};

