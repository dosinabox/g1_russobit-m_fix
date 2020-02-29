
func void zs_observeintruder()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_ObserveIntruder");
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_assesscaster);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSMURDER,zs_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,zs_assessdefeat);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,b_assesstheft);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,zs_assesssurprise);
	Npc_PercEnable(self,PERC_OBSERVESUSPECT,b_observesuspect);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,b_assessenterroom);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,b_assessusemob);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	if(c_npcisinfightmode(other))
	{
		printdebugnpc(PD_ZS_CHECK,"...Eindringling ist im Kampfmodus!");
		b_assessfighter();
		return;
	}
	else if(c_bodystatecontains(other,BS_SNEAK))
	{
		printdebugnpc(PD_ZS_CHECK,"...Eindringling schleicht!");
		b_observesuspect();
		return;
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"...Eindringling ist NICHT im Kampfmodus und schleicht nicht!");
		AI_TurnToNPC(self,other);
		AI_StartState(self,zs_observeintruderwaitneutral,1,"");
		return;
	};
	AI_ContinueRoutine(self);
};

func void zs_observeintruderwaitneutral()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_ObserveIntruderWaitNeutral");
	Npc_PercEnable(self,PERC_ASSESSENEMY,zs_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,b_assessfighter);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_assesscaster);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_assesswarn);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,b_assesstheft);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,b_assessenterroom);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,b_assessusemob);
	Npc_PercEnable(self,PERC_OBSERVESUSPECT,b_observesuspect);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	Npc_PercEnable(self,PERC_ASSESSCALL,zs_reacttocall);
};

func int zs_observeintruderwaitneutral_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_ObserveIntruderWaitNeutral_Loop");
	if(Npc_GetDistToNpc(self,other) > 150)
	{
		return LOOP_END;
	};
	if(other.aivar[AIV_INVINCIBLE])
	{
		return LOOP_END;
	};
	if(Npc_GetStateTime(self) > 1)
	{
		if(self.guild == GIL_EBR)
		{
			b_say(self,other,"$WHATDIDYOUINTHERE");
		}
		else if(self.guild == GIL_GUR)
		{
			if(other.guild == GIL_NOV || other.guild == GIL_TPL)
			{
				b_say(self,other,"$SECTGREETINGS");
			};
		}
		else
		{
			b_say(self,other,"$WHATDOYOUWANT");
		};
		AI_StartState(self,zs_observeintruderwaitneutral2,0,"");
	};
	b_smartturntonpc(self,other);
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_observeintruderwaitneutral_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_ObserveIntruderWaitNeutral_End");
	c_stoplookat(self);
	AI_TurnToNPC(self,other);
};

func void zs_observeintruderwaitneutral2()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_ObserveIntruderWaitNeutral2");
	Npc_PercEnable(self,PERC_ASSESSENEMY,zs_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,b_assessfighter);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_assesscaster);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_assesswarn);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,b_assesstheft);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,b_assessenterroom);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,b_assessusemob);
	Npc_PercEnable(self,PERC_OBSERVESUSPECT,b_observesuspect);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	Npc_PercEnable(self,PERC_ASSESSCALL,zs_reacttocall);
};

func int zs_observeintruderwaitneutral2_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_ObserveIntruderWaitNeutral2_Loop");
	if(Npc_GetDistToNpc(self,other) > 150)
	{
		return LOOP_END;
	};
	if(other.aivar[AIV_INVINCIBLE])
	{
		return LOOP_END;
	};
	if(Npc_GetStateTime(self) > 3)
	{
		if(self.guild == GIL_EBR)
		{
			b_say(self,other,"$GETOUTOFHERE");
		}
		else if(self.guild != GIL_GUR)
		{
			b_say(self,other,"$ISAIDWHATDOYOUWANT");
		};
		return LOOP_END;
	};
	b_smartturntonpc(self,other);
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_observeintruderwaitneutral2_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_ObserveIntruderIntruderWaitNeutral2_End");
	c_stoplookat(self);
	AI_TurnToNPC(self,other);
};

