
func void zs_reacttocall()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_ReactToCall");
	c_zsinit();
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSMURDER,zs_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,zs_assessdefeat);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,zs_assesssurprise);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_assesswarn);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,b_assesstheft);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	//if(!Npc_CanSeeNpc(self,hero))
	//{
	//	b_say(hero,self,"$SC_HEYTURNAROUND");
	//	AI_TurnToNPC(self,other);
	//	c_lookatnpc(self,other);
	//	//AI_PlayAni(self,"T_COMEOVERHERE");
	//}
	AI_TurnToNPC(self,other);
	c_lookatnpc(self,other);
	if(npc_gettempattitude(self,other) == ATT_HOSTILE)
	{
		printdebugnpc(PD_ZS_CHECK,"...feindlich!");
		c_stoplookat(self);
		b_assessenemy();
		return;
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"...nicht feindlich!");
		if(c_bodystatecontains(self,BS_WALK) || c_bodystatecontains(self,BS_RUN))
		{
			b_say(hero,self,"$SC_HEYWAITASECOND");
		}
		else
		{
			b_say(hero,self,"$SC_HEYTURNAROUND");
		};
		//b_say(hero,self,"$SC_HEYWAITASECOND");
		//AI_PlayAni(self,"T_COMEOVERHERE");
		AI_StartState(self,zs_reacttocall_wait,0,"");
	};
	AI_ContinueRoutine(self);
};

func void zs_reacttocall_wait()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_ReactToCall_Wait");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,zs_assesssurprise);
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,b_assessfighter);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSMURDER,zs_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,zs_assessdefeat);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,b_assesstheft);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
};

func int zs_reacttocall_wait_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_ReactToCall_Wait_Loop");
	b_smartturntonpc(self,other);
	if(Npc_GetStateTime(self) > 10)
	{
		return 1;
	};
	return 0;
};

func int zs_reacttocall_wait_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_ReactToCall_Wait_End");
	return c_stoplookat(self);
};

