
func void zs_waitforpassage()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_WaitForPassage");
	c_zsinit();
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,b_observeintruder);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
};

func int zs_waitforpassage_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_WaitForPassage_Loop");
	if(Npc_IsWayBlocked(self))
	{
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"...Weg nicht mehr geblockt!");
		return 1;
	};
	AI_Wait(self,0.5);
};

func void zs_waitforpassage_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_WaitForPassage_End");
};

