
func int zs_assessquietsound()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_AssessQuietSound");
	c_zsinit();
	if(hero.guild == GIL_MEATBUG)
	{
		AI_ContinueRoutine(self);
		return 0;
	};
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,zs_assesssurprise);
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSMURDER,zs_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,zs_assessdefeat);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,b_assesstheft);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_refusetalk);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,b_assessenterroom);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,b_assessusemob);
	AI_TurnToNPC(self,other);
	return 1;
};

func int zs_assessquietsound_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_AssessQuietSound_Loop");
	if(Npc_CanSeeNpc(self,other))
	{
		printdebugnpc(PD_ZS_LOOP,"...SC entdeckt!");
		b_assesssc();
		if((Npc_GetDistToNpc(self,other) < PERC_DIST_FLEE) && !other.aivar[AIV_INVINCIBLE])
		{
			printdebugnpc(PD_ZS_LOOP,"...SC in Fluchtradius!");
			Npc_ClearAIQueue(self);
			AI_StartState(self,zs_observeintruder,0,"");
		}
		else
		{
			printdebugnpc(PD_ZS_LOOP,"...SC außerhalb Fluchtradius oder in Gespräch!");
			return LOOP_END;
		};
	}
	else
	{
		printdebugnpc(PD_ZS_LOOP,"...SC immer noch nicht entdeckt!");
		if(Npc_GetStateTime(self) > 5)
		{
			printdebugnpc(PD_ZS_LOOP,"...nach 5 Sekunden genug gewartet!");
			return LOOP_END;
		}
		else
		{
			AI_Wait(self,1);
		};
	};
	return 0;
};

func void zs_assessquietsound_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_AssessQuietSound_End");
};

