
func void zs_followpc()
{
	printdebugnpc(PD_TA_FRAME,"ZS_FollowPC");
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_followpc_assesssc);
	Npc_SetPercTime(self,1);
	self.senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_assesscaster);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSMURDER,zs_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,zs_assessdefeat);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	Npc_PercEnable(self,PERC_MOVEMOB,b_movemob);
};

func int zs_followpc_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_FollowPC_Loop");
	printglobals(PD_MST_DETAIL);
	if(Npc_GetDistToNpc(self,hero) > HAI_DIST_FOLLOWPC)
	{
		if(!c_bodystatecontains(self,BS_SWIM))
		{
			AI_SetWalkMode(self,NPC_RUN);
		};
		AI_GotoNpc(self,hero);
	}
	else
	{
		b_smartturntonpc(self,hero);
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_followpc_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_FollowPC_End");
	self.senses = hero.senses;
};

func void b_followpc_assesssc()
{
	printdebugnpc(PD_TA_FRAME,"B_FollowPC_AssessSC");
	if(Npc_GetDistToNpc(self,hero) < HAI_DIST_FOLLOWPC)
	{
		printdebugnpc(PD_TA_CHECK,"...SC-Meister jetzt nahe genug!");
		b_fullstop(self);
	};
	if(Npc_CheckInfo(self,1))
	{
		printdebugnpc(PD_TA_CHECK,"...wichtige Info zu vergeben!");
		hero.aivar[AIV_IMPORTANT] = TRUE;
		b_fullstop(other);
		b_fullstop(self);
		AI_StartState(self,zs_talk,0,"");
		return;
	};
};

