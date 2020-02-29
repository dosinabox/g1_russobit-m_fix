
func void zs_observeperson()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_ObservePerson");
	c_zsinit();
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSMURDER,zs_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,zs_assessdefeat);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,b_assesstheft);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,b_observeintruder);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	Npc_PercEnable(self,PERC_ASSESSCALL,zs_reacttocall);
	c_lookatnpc(self,other);
};

func int zs_observeperson_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_ObservePerson_Loop");
	if(Npc_GetStateTime(self) > 5)
	{
		return 1;
	};
	return 0;
};

func void zs_observeperson_end()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_ObservePerson_End");
	c_stoplookat(self);
};

