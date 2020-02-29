
func void b_stop()
{
	printdebugnpc(PD_ZS_FRAME,"B_Stop");
	printglobals(PD_ZS_CHECK);
	if(Npc_GetDistToNpc(self,other) < PERC_DIST_WATCHFIGHT)
	{
		printdebugnpc(PD_ZS_FRAME,"B_Stop To close");
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		AI_StartState(self,zs_watchfight,0,"");
	};
};

func void zs_gotofight()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_GotoFight");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_stop);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,zs_assesssurprise);
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSMURDER,zs_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,zs_assessdefeat);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_refusetalk);
	Npc_SetPercTime(self,1);
	printglobals(PD_ZS_CHECK);
	AI_GotoNpc(self,victim);
};

func int zs_gotofight_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_GotoFight_Loop");
	if(!Hlp_IsValidNpc(other) || !Hlp_IsValidNpc(victim))
	{
		printdebugnpc(PD_ZS_CHECK,"...Angreifer oder Opfer ungültig!");
		return 1;
	};
	if(Npc_IsDead(other) || Npc_IsDead(victim))
	{
		printdebugnpc(PD_ZS_CHECK,"...Angreifer oder Opfer tot!");
		return 1;
	};
	if(Npc_IsInState(other,zs_unconscious) || Npc_IsInState(victim,zs_unconscious))
	{
		printdebugnpc(PD_ZS_CHECK,"...Angreifer oder Opfer bewußtlos!");
		return 1;
	};
	if(Npc_IsInState(other,zs_flee) || Npc_IsInState(victim,zs_flee))
	{
		printdebugnpc(PD_ZS_CHECK,"...Angreifer oder Opfer in ZS_Flee!");
		return 1;
	};
	AI_Wait(self,1);
	return 0;
};

func void zs_gotofight_end()
{
};

