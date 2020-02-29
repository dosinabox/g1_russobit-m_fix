
func void zs_flee()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Flee");
	printglobals(PD_ZS_CHECK);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	c_zsinit();
	AI_SetWalkMode(self,NPC_RUN);
	Mdl_ApplyOverlayMds(self,"HUMANS_FLEE.MDS");
	if(Npc_IsPlayer(other))
	{
		Npc_SetTempAttitude(self,ATT_HOSTILE);
	};
};

func int zs_flee_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_Flee_Loop");
	if(!Hlp_IsValidNpc(other))
	{
		printdebugnpc(PD_ZS_CHECK,"...Gegner nicht mehr gültig!");
		return LOOP_END;
	}
	else if(Npc_GetDistToNpc(self,other) > HAI_DIST_ABORT_FLEE)
	{
		printdebugnpc(PD_ZS_CHECK,"...Gegner weit genug weg -> Flucht abbrechen!");
		return LOOP_END;
	}
	else if(c_npcisdown(other))
	{
		printdebugnpc(PD_ZS_CHECK,"...Gegner nicht mehr kampffähig!");
		return LOOP_END;
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"...Gegner noch zu nah dran!");
		Npc_SetTarget(self,other);
		Npc_GetTarget(self);
		AI_Flee(self);
		AI_Wait(self,1);
	};
	return LOOP_CONTINUE;
};

func void zs_flee_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Flee_End");
	Mdl_RemoveOverlayMds(self,"HUMANS_FLEE.MDS");
	b_lookaround();
	AI_StartState(self,zs_healself,1,"");
};

