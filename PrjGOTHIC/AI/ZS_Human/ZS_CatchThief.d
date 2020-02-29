
func void zs_catchthief()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_CatchThief");
	printglobals(PD_ZS_CHECK);
	c_zsinit();
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,b_observeintruder);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	b_assessandmemorize(NEWS_THEFT,NEWS_SOURCE_WITNESS,self,other,self);
	if(self.aivar[AIV_ITEMSCHWEIN] == FALSE)
	{
		b_fullstop(self);
		b_whirlaround(self,other);
	};
	AI_StartState(self,zs_assessenemy,0,"");
};

