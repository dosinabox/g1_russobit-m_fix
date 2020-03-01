
func int c_preytopredator(var C_NPC prey,var C_NPC predator)
{
	printdebugnpc(PD_MST_FRAME,"C_PreyToPredator");
	if(prey.guild == GIL_SCAVENGER)
	{
		if(predator.guild == GIL_SNAPPER)
		{
			return 1;
		};
	};
	if(prey.guild == GIL_MOLERAT)
	{
		if(predator.guild == GIL_WOLF)
		{
			return 1;
		};
	};
	return 0;
};

func void b_mm_desynchronize()
{
	var int msec;
	printdebugnpc(PD_MST_FRAME,"B_MM_DeSynchronize");
	msec = Hlp_Random(1000);
	AI_Waitms(self,msec);
};

func void b_mm_observeintruder()
{
	printdebugnpc(PD_MST_FRAME,"B_MM_ObserveIntruder");
	if(Npc_GetDistToNpc(self,other) <= self.aivar[AIV_HIGHWAYMEN])
	{
		Npc_SetTarget(self,other);
		Npc_ClearAIQueue(self);
		AI_StartState(self,zs_mm_attack,0,"");
	};
};

func void b_mm_assessbody()
{
	printdebugnpc(PD_MST_FRAME,"B_MM_AssessBody");
	if(self.aivar[AIV_PLUNDERED] == PRIO_PREY)
	{
		if(Npc_GetDistToNpc(self,other) < self.aivar[AIV_PCISSTRONGER])
		{
			if(c_preytopredator(other,self))
			{
				Npc_ClearAIQueue(self);
				AI_StartState(self,zs_mm_eatbody,0,"");
			};
		};
	};
};

func void zs_mm_eatbody()
{
	printdebugnpc(PD_MST_FRAME,"ZS_MM_EatBody");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_mm_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,b_mm_observeintruder);
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_mm_observeintruder);
	AI_GotoNpc(self,other);
	AI_TurnToNPC(self,other);
	AI_PlayAni(self,"T_STAND_2_EAT");
};

func int zs_mm_eatbody_loop()
{
	printdebugnpc(PD_MST_LOOP,"ZS_MM_EatBody_loop");
	if(!Hlp_IsValidNpc(other))
	{
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void zs_mm_eatbody_end()
{
	printdebugnpc(PD_MST_FRAME,"ZS_MM_EatBody_end");
	AI_PlayAni(self,"T_EAT_2_STAND");
};

func void b_mm_assessenemy()
{
	printdebugnpc(PD_MST_FRAME,"B_MM_AssessEnemy");
	if((Npc_GetDistToNpc(self,other) < self.aivar[AIV_PCISSTRONGER]) && Npc_CanSeeNpcFreeLOS(self,other))
	{
		if(c_preytopredator(other,self))
		{
			Npc_SetTarget(self,other);
			Npc_ClearAIQueue(self);
			AI_StartState(self,zs_mm_attack,0,"");
		}
		else if(c_preytopredator(self,other))
		{
			Npc_SetTarget(self,other);
			Npc_ClearAIQueue(self);
			AI_StartState(self,zs_mm_flee,0,"");
		}
		else if(Wld_GetGuildAttitude(self.guild,other.guild) != ATT_HOSTILE)
		{
			return;
		}
		else
		{
			Npc_ClearAIQueue(self);
			AI_StartState(self,zs_mm_assessenemy,0,"");
		};
	};
};

func void zs_mm_assessenemy()
{
	printdebugnpc(PD_MST_FRAME,"ZS_MM_AssessEnemy");
	Npc_SetPercTime(self,2);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_mm_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,b_mm_reacttoothersdamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSBODY,b_mm_assessbody);
	if(self.aivar[AIV_FINDABLE] == HUNTER)
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
		AI_PlayAni(self,"T_WARN");
		AI_SetWalkMode(self,NPC_WALK);
	};
	if((self.aivar[AIV_FINDABLE] == PASSIVE) || (self.aivar[AIV_FINDABLE] == PACKHUNTER))
	{
		AI_Standup(self);
		AI_LookAtNpc(self,other);
	};
};

func int zs_mm_assessenemy_loop()
{
	printdebugnpc(PD_MST_LOOP,"ZS_MM_AssessEnemy_loop");
	if(Npc_GetDistToNpc(self,other) > self.aivar[AIV_PCISSTRONGER])
	{
		return 1;
	};
	if((Npc_GetDistToNpc(self,other) <= self.aivar[AIV_PCISSTRONGER]) && (Npc_GetDistToNpc(self,other) > self.aivar[AIV_BEENATTACKED]))
	{
		if((self.aivar[AIV_FINDABLE] == PASSIVE) || (self.aivar[AIV_FINDABLE] == PACKHUNTER))
		{
			if(!Npc_CanSeeNpc(self,other))
			{
				AI_TurnToNPC(self,other);
			};
		};
		if(self.aivar[AIV_FINDABLE] == HUNTER)
		{
			AI_GotoNpc(self,other);
		};
	};
	if((Npc_GetDistToNpc(self,other) <= self.aivar[AIV_BEENATTACKED]) && (Npc_GetDistToNpc(self,other) > self.aivar[AIV_HIGHWAYMEN]))
	{
		if((self.aivar[AIV_FINDABLE] == PASSIVE) || (self.aivar[AIV_FINDABLE] == PACKHUNTER))
		{
			if(Npc_GetStateTime(self) > self.aivar[AIV_HAS_ERPRESSED])
			{
				Npc_SetTarget(self,other);
				Npc_ClearAIQueue(self);
				AI_StartState(self,zs_mm_attack,0,"");
			}
			else
			{
				AI_TurnToNPC(self,other);
				AI_PlayAni(self,"T_WARN");
				Npc_SendPassivePerc(self,PERC_ASSESSWARN,other,self);
			};
		};
		if(self.aivar[AIV_FINDABLE] == HUNTER)
		{
			AI_GotoNpc(self,other);
		};
	}
	else
	{
		Npc_SetStateTime(self,0);
	};
	if(Npc_GetDistToNpc(self,other) <= self.aivar[AIV_HIGHWAYMEN])
	{
		Npc_SetTarget(self,other);
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		AI_StartState(self,zs_mm_attack,0,"");
	};
	return 0;
};

func void zs_mm_assessenemy_end()
{
	printdebugnpc(PD_MST_FRAME,"ZS_MM_AssessEnemy_end");
	AI_StopLookAt(self);
};

func void b_mm_reacttodamage()
{
	printdebugnpc(PD_MST_FRAME,"B_MM_ReactToDamage");
	printglobals(PD_MST_CHECK);
	self.aivar[AIV_PLUNDERED] = PRIO_ATTACKER;
	if(c_preytopredator(self,other))
	{
		printdebugnpc(PD_MST_FRAME,"...Monster ist Beute");
		Npc_SetTarget(self,other);
		Npc_ClearAIQueue(self);
		Npc_PercDisable(self,PERC_ASSESSENEMY);
		AI_StartState(self,zs_mm_flee,0,"");
	}
	else
	{
		printdebugnpc(PD_MST_FRAME,"...Monster ist Jäger");
		Npc_SetTarget(self,other);
		Npc_ClearAIQueue(self);
		Npc_PercDisable(self,PERC_ASSESSENEMY);
		AI_StartState(self,zs_mm_attack,0,"");
	};
};

func void b_mm_reacttoothersdamage()
{
	printdebugnpc(PD_MST_FRAME,"B_MM_ReactToOthersDamage");
	b_mm_desynchronize();
	if(c_preytopredator(self,other))
	{
		Npc_SetTarget(self,other);
		Npc_ClearAIQueue(self);
		AI_StartState(self,zs_mm_flee,0,"");
	};
	if((Wld_GetGuildAttitude(self.guild,victim.guild) == ATT_FRIENDLY) && (Wld_GetGuildAttitude(self.guild,other.guild) != ATT_FRIENDLY))
	{
		Npc_SetTarget(self,other);
		Npc_ClearAIQueue(self);
		AI_StartState(self,zs_mm_attack,0,"");
	};
	if((Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY) && (Wld_GetGuildAttitude(self.guild,victim.guild) != ATT_FRIENDLY))
	{
		Npc_SetTarget(self,victim);
		Npc_ClearAIQueue(self);
		AI_StartState(self,zs_mm_attack,0,"");
	};
};

func void b_mm_reacttocombatdamage()
{
	printdebugnpc(PD_MST_FRAME,"B_MM_ReactToCombatDamage");
	self.aivar[AIV_PLUNDERED] = PRIO_ATTACKER;
	if(c_preytopredator(self,other))
	{
		Npc_SetTarget(self,other);
		Npc_ClearAIQueue(self);
		AI_StartState(self,zs_mm_flee,0,"");
	};
	if(other == hero)
	{
		Npc_SetTarget(self,other);
	};
};

func void zs_mm_attack()
{
	printdebugnpc(PD_MST_FRAME,"ZS_MM_Attack");
	printglobals(PD_MST_DETAIL);
	if(c_npcismonstermage(self))
	{
		b_fullstop(self);
		AI_StartState(self,zs_mm_attackmage,0,"");
		return;
	};
	if(other.aivar[AIV_INVINCIBLE])
	{
		AI_ContinueRoutine(self);
	};
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_mm_reacttocombatdamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSBODY,b_mm_assessbody);
	if(self.aivar[AIV_MOVINGMOB] == TRUE)
	{
		Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_mm_summonedbypcassessothersdamage);
	};
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_RUN);
	Npc_GetTarget(self);
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,other,self);
};

func int zs_mm_attack_loop()
{
	printdebugnpc(PD_MST_LOOP,"ZS_MM_Attack_Loop");
	if(other.attribute[ATR_HITPOINTS] <= 0)
	{
		b_mm_assessbody();
		return 1;
	};
	Npc_GetTarget(self);
	if(Hlp_IsValidNpc(other) && !c_npcisdown(other))
	{
		printdebugnpc(PD_MST_LOOP,"...Ziel vorhanden!");
		if(c_bodystatecontains(other,BS_RUN) || c_bodystatecontains(other,BS_JUMP))
		{
			printdebugnpc(PD_MST_LOOP,"...Ziel läuft oder springt!");
			if(Npc_GetStateTime(self) > self.aivar[AIV_BEGGAR])
			{
				printdebugnpc(PD_MST_CHECK,"...Ziel schon zu lange verfolgt!");
				return 1;
			};
		}
		else if(c_bodystatecontains(other,BS_SWIM) || c_bodystatecontains(other,BS_DIVE))
		{
			if(self.aivar[AIV_OBSERVEINTRUDER] == FALSE)
			{
				return 1;
			};
		}
		else
		{
			Npc_SetStateTime(self,0);
		};
		if(other.aivar[AIV_INVINCIBLE] == FALSE)
		{
			AI_Attack(self);
		};
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"...Ziel ist ungültig oder kampf-unfähig!");
		if(self.aivar[AIV_FINDABLE] == HUNTER)
		{
			Npc_ClearAIQueue(self);
			AI_StartState(self,zs_mm_eatbody,0,"");
		}
		else
		{
			Npc_PerceiveAll(self);
			Npc_GetNextTarget(self);
			printglobals(PD_ZS_DETAIL);
			if(Hlp_IsValidNpc(other) && !c_npcisdown(other))
			{
				printdebugstring(PD_MST_CHECK,"...neues Ziel gefunden: ",other.name);
			}
			else
			{
				printdebugnpc(PD_MST_CHECK,"...kein Neues Ziel vorhanden!");
				return LOOP_END;
			};
		};
	};
	return LOOP_CONTINUE;
};

func void zs_mm_attack_end()
{
	printdebugnpc(PD_MST_FRAME,"ZS_MM_Attack_End");
	self.aivar[AIV_PLUNDERED] = PRIO_PREY;
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	AI_PlayAni(self,"T_WARN");
	AI_Wait(self,1);
};

func void zs_mm_flee()
{
	printdebugnpc(PD_MST_FRAME,"ZS_MM_Flee");
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_RUN);
};

func int zs_mm_flee_loop()
{
	printdebugnpc(PD_MST_LOOP,"ZS_MM_Flee_Loop");
	if(Npc_GetDistToNpc(self,other) < 2000)
	{
		AI_Flee(self);
		return 0;
	}
	else
	{
		self.wp = Npc_GetNearestWP(self);
	};
	return 1;
};

func void zs_mm_flee_end()
{
	printdebugnpc(PD_MST_FRAME,"ZS_MM_Flee_End");
};

func void b_mm_assesswarn()
{
	printdebugnpc(PD_MST_FRAME,"B_MM_AssessWarn");
	if(c_preytopredator(self,other))
	{
		Npc_SetTarget(self,other);
		Npc_ClearAIQueue(self);
		AI_StartState(self,zs_mm_flee,0,"");
	};
	if((Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY) && (self.aivar[AIV_FINDABLE] == PACKHUNTER))
	{
		if(Npc_IsInState(other,zs_mm_attack))
		{
			Npc_SetTarget(self,victim);
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			AI_StartState(self,zs_mm_attack,0,"");
		}
		else
		{
			AI_SetWalkMode(self,NPC_RUN);
			AI_GotoNpc(self,other);
			if(Wld_DetectNpc(self,victim,NOFUNC,-1))
			{
				AI_StartState(self,zs_mm_assessenemy,0,"");
			};
		};
	};
};

func void zs_mm_allscheduler()
{
	printdebugnpc(PD_MST_FRAME,"ZS_MM_AllScheduler");
	if(Wld_IsTime(self.aivar[AIV_WARNTARGET],0,self.aivar[AIV_LASTHITBYRANGEDWEAPON],0) || (self.aivar[AIV_WARNTARGET] == ONLYROUTINE))
	{
		AI_StartState(self,zs_mm_rtn_sleep,1,"");
	}
	else if(Wld_IsTime(self.aivar[AIV_HASBEENDEFEATEDINPORTALROOM],0,self.aivar[AIV_HANGAROUNDSTATUS],0) || (self.aivar[AIV_HASBEENDEFEATEDINPORTALROOM] == ONLYROUTINE))
	{
		AI_StartState(self,zs_mm_rtn_rest,1,"");
	}
	else if(Wld_IsTime(self.aivar[AIV_TRIGGER3],0,self.aivar[AIV_GUARDMEMORY],0) || (self.aivar[AIV_TRIGGER3] == ONLYROUTINE))
	{
		AI_StartState(self,zs_mm_rtn_roam,1,"");
	}
	else if(Wld_IsTime(self.aivar[AIV_GUARDITERATOR],0,self.aivar[AIV_FIGHTSPEACHFLAG],0) || (self.aivar[AIV_GUARDITERATOR] == ONLYROUTINE))
	{
		AI_StartState(self,zs_mm_rtn_eatground,1,"");
	}
	else if(Wld_IsTime(self.aivar[AIV_ITEMSTATUS],0,self.aivar[AIV_ITEMFREQ],0) || (self.aivar[AIV_ITEMSTATUS] == ONLYROUTINE))
	{
		AI_StartState(self,zs_mm_rtn_wusel,1,"");
	}
	else
	{
		AI_StartState(self,zs_mm_rtn_default,1,"");
	};
};

func void zs_mm_rtn_default()
{
	printdebugnpc(PD_MST_FRAME,"ZS_MM_Rtn_Default");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_mm_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,b_mm_reacttoothersdamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_mm_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_mm_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSBODY,b_mm_assessbody);
	AI_AlignToWP(self);
};

func void zs_mm_rtn_default_loop()
{
	printdebugnpc(PD_MST_LOOP,"ZS_MM_Rtn_Default_loop");
};

func void zs_mm_rtn_default_end()
{
	printdebugnpc(PD_MST_FRAME,"ZS_MM_Rtn_Default_end");
};

func void b_mm_assessenemy_sleep()
{
	printdebugnpc(PD_MST_FRAME,"B_MM_AssessEnemy_Sleep");
	if(c_bodystatecontains(self,BS_LIE))
	{
		if(Npc_GetDistToNpc(self,other) < 200)
		{
			b_mm_assessenemy();
		};
	}
	else
	{
		b_mm_assessenemy();
	};
};

func void b_mm_assessquietsound_sleep()
{
	printdebugnpc(PD_MST_FRAME,"B_MM_AssessQuietSound_Sleep");
	if(Npc_GetDistToNpc(self,other) <= self.aivar[AIV_BEENATTACKED])
	{
		if(Wld_GetGuildAttitude(self.guild,other.guild) == ATT_HOSTILE)
		{
			b_mm_assessenemy();
		};
	};
};

func void zs_mm_rtn_sleep()
{
	printdebugnpc(PD_MST_FRAME,"ZS_MM_Rtn_Sleep");
	Npc_SetPercTime(self,2);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_mm_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_mm_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,b_mm_reacttoothersdamage);
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,b_mm_assessquietsound_sleep);
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_mm_assessenemy_sleep);
	AI_SetWalkMode(self,NPC_WALK);
	b_mm_desynchronize();
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"FP_SLEEP"))
	{
		AI_GotoFP(self,"FP_SLEEP");
	};
	AI_PlayAni(self,"T_PERCEPTION");
	AI_PlayAniBS(self,"T_STAND_2_SLEEP",BS_LIE);
};

func void zs_mm_rtn_sleep_loop()
{
	printdebugnpc(PD_MST_LOOP,"ZS_MM_Rtn_Sleep_loop");
	if(!Wld_IsTime(self.aivar[AIV_WARNTARGET],0,self.aivar[AIV_LASTHITBYRANGEDWEAPON],0) && (self.aivar[AIV_WARNTARGET] != ONLYROUTINE))
	{
		AI_StartState(self,zs_mm_allscheduler,1,"");
	};
};

func void zs_mm_rtn_sleep_end()
{
	printdebugnpc(PD_MST_FRAME,"ZS_MM_Rtn_Sleep_end");
	AI_PlayAniBS(self,"T_SLEEP_2_STAND",BS_STAND);
};

func void zs_mm_rtn_roam()
{
	printdebugnpc(PD_MST_FRAME,"ZS_MM_Rtn_Roam");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_mm_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,b_mm_reacttoothersdamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_mm_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_mm_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSBODY,b_mm_assessbody);
	AI_SetWalkMode(self,NPC_WALK);
	b_mm_desynchronize();
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
};

func void zs_mm_rtn_roam_loop()
{
	var int randommove;
	printdebugnpc(PD_MST_LOOP,"ZS_MM_Rtn_Roam_loop");
	if(!Wld_IsTime(self.aivar[AIV_TRIGGER3],0,self.aivar[AIV_GUARDMEMORY],0) && (self.aivar[AIV_TRIGGER3] != ONLYROUTINE))
	{
		AI_StartState(self,zs_mm_allscheduler,1,"");
	};
	if(Hlp_Random(100) <= 20)
	{
		if(Wld_IsNextFPAvailable(self,"FP_ROAM"))
		{
			AI_GotoNextFP(self,"FP_ROAM");
		}
		else
		{
			AI_GotoWP(self,Npc_GetNearestWP(self));
//			AI_GotoWP(self,Npc_GetNextWP(self));
		};
	}
	else
	{
		randommove = Hlp_Random(2);
		if(randommove == 0)
		{
			AI_PlayAni(self,"R_ROAM1");
		};
		if(randommove == 1)
		{
			AI_PlayAni(self,"R_ROAM2");
		};
		if(randommove == 2)
		{
			AI_PlayAni(self,"R_ROAM3");
		};
	};
};

func void zs_mm_rtn_roam_end()
{
	printdebugnpc(PD_MST_FRAME,"ZS_MM_Rtn_Roam_end");
};

func void zs_mm_rtn_rest()
{
	printdebugnpc(PD_MST_FRAME,"ZS_MM_Rtn_Rest");
	Npc_SetPercTime(self,2);
	self.aivar[AIV_PLUNDERED] = PRIO_PREY;
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_mm_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,b_mm_reacttoothersdamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_mm_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_mm_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSBODY,b_mm_assessbody);
	AI_SetWalkMode(self,NPC_WALK);
	b_mm_desynchronize();
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"FP_ROAM"))
	{
		AI_GotoFP(self,"FP_ROAM");
	};
};

func void zs_mm_rtn_rest_loop()
{
	var int randommove;
	printdebugnpc(PD_MST_LOOP,"ZS_MM_Rtn_Rest_Loop");
	if(!Wld_IsTime(self.aivar[AIV_HASBEENDEFEATEDINPORTALROOM],0,self.aivar[AIV_HANGAROUNDSTATUS],0) && (self.aivar[AIV_HASBEENDEFEATEDINPORTALROOM] != ONLYROUTINE))
	{
		AI_StartState(self,zs_mm_allscheduler,1,"");
	};
	if(Hlp_Random(1000) <= 5)
	{
		randommove = Hlp_Random(2);
		AI_Standup(self);
		if(randommove == 0)
		{
			AI_PlayAni(self,"R_ROAM1");
		};
		if(randommove == 1)
		{
			AI_PlayAni(self,"R_ROAM2");
		};
		if(randommove == 2)
		{
			AI_PlayAni(self,"R_ROAM3");
		};
	};
};

func void zs_mm_rtn_rest_end()
{
	printdebugnpc(PD_MST_FRAME,"ZS_MM_Rtn_Rest_End");
	AI_PlayAni(self,"T_REST_2_STAND");
};

func void zs_mm_rtn_eatground()
{
	printdebugnpc(PD_MST_FRAME,"ZS_MM_Rtn_EatGround");
	Npc_SetPercTime(self,2);
	self.aivar[AIV_PLUNDERED] = PRIO_PREY;
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_mm_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,b_mm_reacttoothersdamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_mm_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_mm_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSBODY,b_mm_assessbody);
	AI_SetWalkMode(self,NPC_WALK);
	b_mm_desynchronize();
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"FP_ROAM"))
	{
		AI_GotoFP(self,"FP_ROAM");
	};
	AI_PlayAni(self,"T_STAND_2_EAT");
	Mdl_ApplyRandomAni(self,"S_EAT","R_ROAM1");
	Mdl_ApplyRandomAni(self,"S_EAT","R_ROAM2");
	Mdl_ApplyRandomAni(self,"S_EAT","R_ROAM3");
	Mdl_ApplyRandomAniFreq(self,"S_EAT",8);
};

func void zs_mm_rtn_eatground_loop()
{
	printdebugnpc(PD_MST_LOOP,"ZS_MM_Rtn_EatGround_Loop");
	if(!Wld_IsTime(self.aivar[AIV_GUARDITERATOR],0,self.aivar[AIV_FIGHTSPEACHFLAG],0) && (self.aivar[AIV_GUARDITERATOR] != ONLYROUTINE))
	{
		AI_StartState(self,zs_mm_allscheduler,1,"");
	};
};

func void zs_mm_rtn_eatground_end()
{
	printdebugnpc(PD_MST_FRAME,"ZS_MM_Rtn_EatGround_End");
	AI_PlayAni(self,"T_EAT_2_STAND");
};

func void zs_mm_rtn_wusel()
{
	printdebugnpc(PD_MST_FRAME,"ZS_MM_Rtn_Wusel");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_mm_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,b_mm_reacttoothersdamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_mm_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_mm_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSBODY,b_mm_assessbody);
	AI_SetWalkMode(self,NPC_RUN);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
};

func void zs_mm_rtn_wusel_loop()
{
	var int randommove;
	printdebugnpc(PD_MST_LOOP,"ZS_MM_Rtn_Wusel_loop");
	if(!Wld_IsTime(self.aivar[AIV_ITEMSTATUS],0,self.aivar[AIV_ITEMFREQ],0) && (self.aivar[AIV_ITEMSTATUS] != ONLYROUTINE))
	{
		AI_StartState(self,zs_mm_allscheduler,1,"");
	};
	if(Hlp_Random(100) <= 20)
	{
		if(Wld_IsNextFPAvailable(self,"FP_ROAM"))
		{
			AI_GotoNextFP(self,"FP_ROAM");
		}
		else
		{
			AI_GotoWP(self,Npc_GetNearestWP(self));
//			AI_GotoWP(self,Npc_GetNextWP(self));
		};
	}
	else
	{
		randommove = Hlp_Random(2);
		if(randommove == 0)
		{
			AI_PlayAni(self,"R_ROAM1");
		};
		if(randommove == 1)
		{
			AI_PlayAni(self,"R_ROAM2");
		};
		if(randommove == 2)
		{
			AI_PlayAni(self,"R_ROAM3");
		};
	};
};

func void zs_mm_rtn_wusel_end()
{
	printdebugnpc(PD_MST_FRAME,"ZS_MM_Rtn_Wusel_end");
};

func void zs_mm_summoned()
{
	printdebugnpc(PD_MST_FRAME,"ZS_MM_Summoned");
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSENEMY,zs_mm_attack);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	AI_Standup(self);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	Npc_SetAttitude(self,ATT_HOSTILE);
};

func int zs_mm_summoned_loop()
{
	printdebugnpc(PD_MST_LOOP,"ZS_MM_Summoned_loop");
	printglobals(PD_MST_DETAIL);
	if(Npc_GetNextTarget(self))
	{
		printdebugnpc(PD_MST_CHECK,"...neuer Gegner gefunden");
		Npc_SetTarget(self,other);
		Npc_ClearAIQueue(self);
		AI_StartState(self,zs_mm_attack,0,"");
	}
	else if(Npc_GetStateTime(self) > 5)
	{
		return LOOP_END;
	}
	else
	{
		AI_TurnToNPC(self,other);
	};
	return LOOP_CONTINUE;
};

func void zs_mm_summoned_end()
{
	printdebugnpc(PD_MST_FRAME,"ZS_MM_Summoned_End");
	Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute);
};

func void zs_mm_minecrawler_omgate()
{
    Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_mm_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,b_mm_reacttoothersdamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_mm_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_mm_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSBODY,b_mm_assessbody);
    self.wp = "OM_CAVE3_19";
    b_mm_desynchronize();
    AI_SetWalkMode(self,NPC_RUN);
    AI_GotoWP(self,self.wp);
    AI_StartState(self,zs_mm_rtn_wusel,1,"");
};
