
func void zs_movenpcwait()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_MoveNpcWait");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,b_assessenterroom);
	c_lookatnpc(self,other);
};

func void zs_movenpcwait_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_MoveNpcWait_Loop");
	if(Npc_GetStateTime(self) > 2)
	{
		if(Npc_IsWayBlocked(self) && (Npc_GetDistToNpc(self,other) < 200) && (other.aivar[AIV_INVINCIBLE] == FALSE))
		{
			b_drawweapon(self,other);
			b_say(self,other,"$YOUDEAFORWHAT");
			AI_StartState(self,zs_movenpcwait1,0,"");
			return;
		}
		else
		{
			AI_ContinueRoutine(self);
			return;
		};
	};
	AI_Wait(self,1);
};

func void zs_movenpcwait_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_MoveNpcWait_End");
};

func void zs_movenpcwait1()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_MoveNpcWait1");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,b_assessenterroom);
};

func void zs_movenpcwait1_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_MoveNpcWait1_Loop");
	if(Npc_GetStateTime(self) > 2)
	{
		if(Npc_IsWayBlocked(self) && (Npc_GetDistToNpc(self,other) < 200) && (other.aivar[AIV_INVINCIBLE] == FALSE))
		{
			Npc_SetTempAttitude(self,ATT_HOSTILE);
			b_say(self,other,"$YOUASKEDFORIT");
			Npc_SetTarget(self,other);
			AI_StartState(self,zs_attack,1,"");
			return;
		}
		else
		{
			c_stoplookat(self);
			AI_ContinueRoutine(self);
			return;
		};
	};
	AI_Wait(self,1);
};

func void zs_movenpcwait1_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_MoveNpcWait1_End");
	b_removeweapon(self);
};

func void zs_movenpcfriendlywait()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_MoveNpcFriendlyWait");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,b_assessenterroom);
	c_lookatnpc(self,other);
};

func void zs_movenpcfriendlywait_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_MoveNpcFriendlyWait_Loop");
	if(!Npc_IsWayBlocked(self) || (Npc_GetDistToNpc(self,other) > 200))
	{
		printdebugnpc(PD_ZS_CHECK,"...weg wieder frei!");
		AI_ContinueRoutine(self);
		return;
	};
	AI_Wait(self,1);
};

func void zs_movenpcfriendlywait_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_MoveNpcFriendlyWait_End");
	c_stoplookat(self);
};

