
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
	self.aivar[AIV_MOVINGMOB] = 1;
};

func int zs_waitforpassage_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_WaitForPassage_Loop");
	if(Npc_IsWayBlocked(self))
	{
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"...Path is no longer blocked!");
		return LOOP_END;
	};
	var string door;
	door = Npc_GetDetectedMob(self);
	PrintDebugNpc(PD_ZS_Check,ConcatStrings("...mob: ",door));
	if(Hlp_StrCmp(door,"DOOR"))
	{
		if(Wld_GetMobState(self,door) == 0)
		{
			Npc_ClearAIQueue(self);
			AI_UseMob(self,door,1);
			AI_UseMob(self,door,-1);
		};
	};
	AI_Wait(self,0.5);
	return LOOP_CONTINUE;
};

func void zs_waitforpassage_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_WaitForPassage_End");
	self.aivar[AIV_MOVINGMOB] = 0;
};

