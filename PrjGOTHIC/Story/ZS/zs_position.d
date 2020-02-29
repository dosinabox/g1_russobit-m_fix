
func void zs_position()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Position");
	c_zsinit();
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_friendlyattack);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_assesscaster);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSMURDER,zs_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,zs_assessdefeat);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,b_assesstheft);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_assesssc);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
};

func void zs_position_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_Position_Loop");
	AI_Wait(self,1);
	b_smartturntonpc(self,hero);
};

func void zs_position_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Position_End");
};

func void b_friendlyassesscall()
{
	printdebugnpc(PD_ZS_FRAME,"B_FriendlyAssessCall");
	AI_TurnToNPC(self,other);
	AI_PlayAni(self,"T_COMEOVERHERE");
};

func void b_friendlyattack()
{
	printdebugnpc(PD_ZS_FRAME,"B_FriendlyAttack");
	b_fullstop(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_friendlyattack,0,"");
};

func void zs_friendlyattack()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_FriendlyAttack");
	c_zsinit();
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSREMOVEWEAPON,b_friendlyattackremoveweapon);
	Npc_GetTarget(self);
	b_drawweapon(self,other);
	c_lookatnpc(self,other);
};

func int zs_friendlyattack_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_FriendlyAttack_Loop");
	Npc_GetTarget(self);
	if(Npc_IsInState(other,zs_unconscious))
	{
		printglobals(PD_ZS_CHECK);
		b_say(self,other,"$LETSFORGETOURLITTLEFIGHT");
		return 1;
	};
	Npc_GetNextTarget(self);
	AI_Attack(self);
	Npc_GetTarget(self);
	if(!Hlp_IsValidNpc(other))
	{
		printdebugnpc(PD_ZS_FRAME,"...'other' invalid");
		return 1;
	};
	if(Npc_GetDistToNpc(self,other) > 1000)
	{
		printdebugnpc(PD_ZS_FRAME,"...SC weiter als 10m entfernt!");
		if(Npc_IsInFightMode(other,FMODE_FAR) || Npc_IsInFightMode(other,FMODE_MAGIC))
		{
			printdebugnpc(PD_ZS_FRAME,"...SC hat Fernkampfwaffe oder Magie!");
			AI_SetWalkMode(self,NPC_RUN);
			AI_GotoNpc(self,other);
		}
		else
		{
			printdebugnpc(PD_ZS_FRAME,"...SC hat Nahkampfwaffe");
			b_say(self,other,"$LETSFORGETOURLITTLEFIGHT");
			return 1;
		};
	};
	if(Npc_IsInFightMode(other,FMODE_NONE))
	{
		printdebugnpc(PD_ZS_FRAME,"...SC hat keine Waffe mehr in der Hand!");
		b_say(self,other,"$LETSFORGETOURLITTLEFIGHT");
		return 1;
	};
	return 0;
};

func void zs_friendlyattack_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_FriendlyAttack_End");
	c_stoplookat(self);
	AI_RemoveWeapon(self);
};

func void b_friendlyattackremoveweapon()
{
	printdebugnpc(PD_ZS_FRAME,"B_FriendlyAttackRemoveWeapon");
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	b_say(self,other,"$LETSFORGETOURLITTLEFIGHT");
	AI_ContinueRoutine(self);
};

func void b_followmode()
{
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_checkdisttoplayer);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_friendlyattack);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_assesscaster);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSMURDER,zs_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,zs_assessdefeat);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,b_assesstheft);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	Npc_PercEnable(self,PERC_ASSESSCALL,b_friendlyassesscall);
	Npc_SetPercTime(self,1);
	AI_SetWalkMode(self,NPC_RUN);
	AI_GotoWP(self,self.wp);
};

func void zs_followmode()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_FollowMode");
	b_followmode();
};

func void b_checkdisttoplayer()
{
	printdebugnpc(PD_ZS_FRAME,"B_CheckDistToPlayer");
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
	}
	else if(Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT)
	{
		printdebugnpc(PD_ZS_CHECK,"...SC zu weit weg!");
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		AI_TurnToNPC(self,other);
		b_say(self,other,"$CATCHUP");
		AI_StartState(self,zs_followmodewait,1,"");
	};
};

func void zs_followmodewait()
{
	printdebugnpc(PD_ZS_CHECK,"ZS_FollowModeWait");
	c_zsinit();
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_checkdisttoplayer);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_friendlyattack);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_assesscaster);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSMURDER,zs_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,zs_assessdefeat);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,b_assesstheft);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	Npc_PercEnable(self,PERC_ASSESSCALL,b_friendlyassesscall);
};

func void zs_followmodewait_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_FollowModeWait_Loop");
	if(Npc_GetDistToNpc(self,other) < 700)
	{
		AI_ContinueRoutine(self);
	};
};

func void zs_followmodewait_end()
{
	printdebugnpc(PD_ZS_CHECK,"ZS_FollowModeWait_End");
};

