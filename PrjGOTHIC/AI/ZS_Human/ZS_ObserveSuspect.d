
func void zs_observesuspect()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_ObserveSuspect");
	c_zsinit();
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_assessfighter);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,b_observeintruder);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_assessthreat);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,b_assessusemob);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,b_assessenterroom);
	AI_TurnToNPC(self,other);
	AI_LookAtNpc(self,other);
	AI_PointAtNpc(self,other);
	b_say(self,other,"$WHATSTHISSUPPOSEDTOBE");
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,self,other);
	if((npc_gettempattitude(self,other) == ATT_HOSTILE) || (Npc_GetPermAttitude(self,other) == ATT_HOSTILE))
	{
		b_assessenemy();
		return;
	};
	b_assesssc();
	AI_StopPointAt(self);
};

func int zs_observesuspect_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_ObserveSuspect_Loop");
	b_smartturntonpc(self,other);
	if((Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT) || !c_bodystatecontains(other,BS_SNEAK))
	{
		printdebugnpc(PD_ZS_LOOP,"... loop end");
		return LOOP_END;
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_observesuspect_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_ObserveSuspect_End");
	AI_StopPointAt(self);
	c_stoplookat(self);
	AI_TurnToNPC(self,other);
	AI_ContinueRoutine(self);
};

