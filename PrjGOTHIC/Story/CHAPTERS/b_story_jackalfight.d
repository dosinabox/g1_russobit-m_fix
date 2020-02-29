
func void b_story_jackalfight()
{
	var C_NPC jackal;
	b_exchangeroutine(grd_283_gardist,"FMTaken2");
	b_exchangeroutine(grd_285_gardist,"FMTaken2");
	jackal = Hlp_GetNpc(grd_201_jackal);
	Npc_ExchangeRoutine(jackal,"FMTaken2");
	b_setpermattitude(grd_283_gardist,ATT_HOSTILE);
	b_setpermattitude(grd_285_gardist,ATT_HOSTILE);
	b_setpermattitude(grd_201_jackal,ATT_HOSTILE);
};

