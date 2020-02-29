
func void zs_mm_summonedbypc()
{
	printdebugnpc(PD_MST_FRAME,"ZS_MM_SummonedByPC");
	Npc_SetTempAttitude(self,ATT_FRIENDLY);
	Npc_SetAttitude(self,ATT_FRIENDLY);
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_summonedbypc_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_summonedbypc_assesssc);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_mm_summonedbypcassessothersdamage);
	Npc_SetPercTime(self,0.5);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_mm_attack);
	AI_Standup(self);
};

func int zs_mm_summonedbypc_loop()
{
	printdebugnpc(PD_MST_LOOP,"ZS_MM_SummonedByPC_Loop");
	printglobals(PD_MST_DETAIL);
	if(Npc_GetStateTime(self) > self.aivar[AIV_ISLOOKING])
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-1);
		Npc_SetStateTime(self,0);
	};
	if(Npc_GetNextTarget(self))
	{
		printdebugnpc(PD_MST_CHECK,"...neuer Gegner gefunden");
		Npc_SetTarget(self,other);
		Npc_ClearAIQueue(self);
		AI_StartState(self,zs_mm_attack,0,"");
	}
	else if(Npc_GetDistToNpc(self,hero) > self.aivar[AIV_HASDEFEATEDSC])
	{
		AI_GotoNpc(self,hero);
	}
	else if(!Npc_CanSeeNpc(self,hero))
	{
		AI_TurnToNPC(self,hero);
		AI_TurnToNPC(self,hero);
		AI_TurnToNPC(self,hero);
	};
	return LOOP_CONTINUE;
};

func void zs_mm_summonedbypc_end()
{
	printdebugnpc(PD_MST_FRAME,"ZS_MM_SummonedByPC_End");
};

func void b_summonedbypc_assesssc()
{
	printdebugnpc(PD_MST_FRAME,"B_SummonedByPC_AssessSC");
	if(Npc_GetDistToNpc(self,hero) < self.aivar[AIV_HASDEFEATEDSC])
	{
		printdebugnpc(PD_MST_CHECK,"...SC-Meister jetzt nahe genug!");
		b_fullstop(self);
	};
};

func void b_summonedbypc_assessenemy()
{
	printdebugnpc(PD_MST_FRAME,"B_SummonedByPC_AssessEnemy");
	printglobals(PD_MST_CHECK);
	if(!other.aivar[AIV_PARTYMEMBER] && (other.npctype != NPCTYPE_FRIEND))
	{
		AI_StartState(self,zs_mm_attack,0,"");
	};
};

func void b_mm_summonedbypcassessothersdamage()
{
	var C_NPC her;
	var C_NPC rock;
	her = Hlp_GetNpc(pc_hero);
	rock = Hlp_GetNpc(pc_rockefeller);
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(her)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(rock)))
	{
		if(!Npc_IsInState(self,zs_mm_attack))
		{
			Npc_ClearAIQueue(self);
			Npc_SetTarget(self,victim);
			AI_StartState(self,zs_mm_attack,0,"");
		};
	}
	else if((Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(her)) || (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(rock)))
	{
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,zs_mm_attack,0,"");
	};
};

