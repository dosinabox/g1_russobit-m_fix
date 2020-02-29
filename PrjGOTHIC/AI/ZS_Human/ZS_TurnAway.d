
func void zs_turnaway()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_TurnAway");
	c_zsinit();
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	b_removeweapon(self);
	AI_TurnAway(self,hero);
	b_say(self,NULL,"$LookAway");
};

func int zs_turnaway_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_TurnAway_Loop");
	if(Npc_GetStateTime(self) > HAI_TIME_TURNAWAY)
	{
		printdebugnpc(PD_ZS_CHECK,"...TurnAway-Zeit abgelaufen!");
		return LOOP_END;
	};
	AI_Wait(self,1);
	AI_TurnAway(self,hero);
	return LOOP_CONTINUE;
};

