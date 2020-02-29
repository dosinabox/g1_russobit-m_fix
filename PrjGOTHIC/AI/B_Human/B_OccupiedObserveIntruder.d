
func void b_occupiedobserveintruder()
{
	printdebugnpc(PD_ZS_FRAME,"B_OccupiedObserveIntruder");
	if(!c_npcishuman(other))
	{
		printdebugnpc(PD_ZS_FRAME,"...Nsc ist Monster!");
		b_assessfighter();
	};
	if(Npc_GetDistToNpc(self,other) < PERC_DIST_CLOSE)
	{
		printdebugnpc(PD_ZS_FRAME,"... Eindringling zu nahe!");
		if(other.guild != GIL_MEATBUG)
		{
			printdebugnpc(PD_ZS_FRAME,"...und kein Meatbug!");
			AI_QuickLook(self,other);
			b_assesssc();
		};
	};
};

