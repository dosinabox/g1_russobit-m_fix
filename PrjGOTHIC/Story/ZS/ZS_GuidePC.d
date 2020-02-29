
func void b_guidepc_assessplayer()
{
	printdebugnpc(PD_TA_CHECK,"B_GuidePC_AssessPlayer");
	printglobals(PD_TA_CHECK);
	if(Npc_GetDistToNpc(self,hero) > PERC_DIST_DIALOG)
	{
		printdebugnpc(PD_TA_CHECK,"...Spieler zu weit entfernt!");
		b_fullstop(self);
		b_smartturntonpc(self,hero);
	}
	else if(Npc_CanSeeNpc(self,hero))
	{
		b_assesssc();
	};
};

func void b_guidepc_assesscall()
{
	printdebugnpc(PD_ZS_FRAME,"B_GuidePC_AssessCall");
	AI_TurnToNPC(self,other);
	AI_PlayAni(self,"T_COMEOVERHERE");
};

func void zs_guidepc()
{
	printdebugnpc(PD_TA_FRAME,"ZS_GuidePC");
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_guidepc_assessplayer);
	Npc_SetPercTime(self,1);
	self.senses_range = HAI_DIST_ASSESS_MONSTER;
	self.senses = SENSE_SMELL | SENSE_SEE | SENSE_HEAR;
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSMURDER,zs_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,zs_assessdefeat);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	Npc_PercEnable(self,PERC_ASSESSCALL,b_guidepc_assesscall);
};

func int zs_guidepc_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_GuidePC_Loop");
	printglobals(PD_TA_CHECK);
	if(Npc_GetDistToNpc(self,hero) > PERC_DIST_DIALOG)
	{
		b_guidepc_assessplayer();
	}
	else if(Npc_GetDistToWP(self,self.wp) > PERC_DIST_DIALOG)
	{
		printdebugnpc(PD_TA_CHECK,"...Ziel noch zu weit entfernt!");
		if(!c_bodystatecontains(self,BS_SWIM))
		{
			AI_SetWalkMode(self,NPC_RUN);
		};
		AI_StopLookAt(self);
		AI_GotoWP(self,self.wp);
	}
	else
	{
		b_smartturntonpc(self,hero);
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func int zs_guidepc_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_GuidePC_End");
	self.senses_range = hero.senses_range;
	self.senses = hero.senses;
};

