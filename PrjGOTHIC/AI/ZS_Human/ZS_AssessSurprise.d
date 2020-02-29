
func void zs_assesssurprise()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_AssessSurprise");
	c_zsinit();
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,b_observeintruder);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	if(Npc_GetDistToNpc(self,other) < PERC_DIST_DIALOG)
	{
		printdebugnpc(PD_ZS_CHECK,"ZS_AssessSurprise dist Flee");
		b_whirlaround(self,other);
		b_say(self,other,"$WHATSTHAT");
		if(Npc_GetAttitude(self,other) == ATT_HOSTILE)
		{
			printdebugnpc(PD_ZS_CHECK,"...Überrascher ist feindlich!");
			b_assessenemy();
		}
		else
		{
			printdebugnpc(PD_ZS_CHECK,"...Überrascher ist NICHT feindlich!");
			b_assesssc();
		};
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,">= Dist Flee");
		AI_QuickLook(self,other);
		if(npc_gettempattitude(self,other) == ATT_HOSTILE)
		{
			b_assessenemy();
		};
	};
	AI_ContinueRoutine(self);
};

