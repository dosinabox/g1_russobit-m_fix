
func void zs_assesswarn()
{
	var string nextwp;
	printdebugnpc(PD_ZS_FRAME,"ZS_AssessWarn");
	printglobals(PD_ZS_CHECK);
	c_zsinit();
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_assessfighter);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSMURDER,zs_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,zs_assessdefeat);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,b_assesstheft);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,b_observeintruder);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,b_assessenterroom);
	Npc_SetPercTime(self,1);
	if((victim.aivar[AIV_ITEMSCHWEIN] == TRUE) && (Npc_GetAttitude(self,victim) == ATT_FRIENDLY))
	{
		Npc_SetTarget(self,other);
		AI_StartState(self,zs_attack,0,"");
	}
	else if(c_npcisguard(self) && (Npc_IsInState(victim,zs_callguardsonenterroom) || Npc_WasInState(victim,zs_callguardsonenterroom)) && !Npc_IsInState(self,zs_guardpassage) && (Npc_GetAttitude(self,victim) == ATT_FRIENDLY))
	{
		printdebugnpc(PD_ZS_CHECK,"...verlassener Portalraum gehört Schützling-Gilde!");
		Npc_PercEnable(self,PERC_ASSESSENTERROOM,b_clearroomenterroom);
		b_whirlaround(self,other);
		AI_PointAtNpc(self,other);
		b_say(self,other,"$HEYYOU");
		AI_StopPointAt(self);
		Npc_PercDisable(self,PERC_MOVENPC);
		AI_SetWalkMode(self,NPC_RUN);
		AI_GotoNpc(self,other);
		b_say(self,other,"$WHATDIDYOUINTHERE");
	}
	else if(c_npcisguardarcher(self) && Npc_IsInState(victim,zs_callguardsonenterroom) && (Npc_GetAttitude(self,victim) == ATT_FRIENDLY))
	{
		printdebugnpc(PD_ZS_CHECK,"...Warnung von Schützling, dessen Raum betreten/verlassen wurde!");
		if(other.aivar[AIV_HASBEENDEFEATEDINPORTALROOM] == FALSE)
		{
			b_whirlaround(self,hero);
			AI_PointAtNpc(self,hero);
			b_say(self,hero,"$HEYYOU");
			AI_StopPointAt(self);
			b_drawweapon(self,other);
			b_say(self,hero,"$YOUVIOLATEDFORBIDDENTERRITORY");
			Npc_SetTarget(self,hero);
			AI_StartState(self,zs_attack,0,"");
		}
		else
		{
			printdebugnpc(PD_ZS_CHECK,"Eindringling ist schon bestraft worden");
		};
	}
	else if((c_npcisguard(self) || c_npcisguardarcher(self) || c_npcisboss(self)) && (Npc_WasInState(victim,zs_guardpassage) || Npc_IsInState(victim,zs_guardpassage)) && (Npc_GetAttitude(self,victim) == ATT_FRIENDLY))
	{
		printdebugnpc(PD_ZS_CHECK,"...Warnung von Torwache, deren Durchgang durchbrochen worde");
		b_whirlaround(self,hero);
		b_drawweapon(self,other);
		b_setattackreason(self,AIV_AR_INTRUDER);
		Npc_SetTarget(self,hero);
		Npc_GetTarget(self);
		AI_StartState(self,zs_proclaimandpunish,0,"");
	}
	else if(Npc_IsInState(victim,zs_assessenemy) && (c_npcisguard(self) || c_npcisguardarcher(self)) && (Npc_GetAttitude(self,victim) == ATT_FRIENDLY) && (Npc_GetAttitude(self,other) != ATT_FRIENDLY) && !(Npc_IsPlayer(other) && (self.npctype == NPCTYPE_FRIEND)) && (Npc_GetDistToNpc(self,victim) < HAI_DIST_HELPATTACKEDCHARGES))
	{
		printdebugnpc(PD_ZS_CHECK,"...Warnung vor Feind!");
		AI_StartState(self,zs_assessenemy,0,"");
	}
	else if(c_bodystatecontains(other,BS_SNEAK) && (Npc_GetDistToNpc(self,other) < PERC_DIST_INTERMEDIAT))
	{
		printdebugnpc(PD_ZS_CHECK,"...Spieler schleicht rum und ich bin gewarnt worden");
		Npc_SetTarget(self,other);
		Npc_GetTarget(self);
		AI_StartState(self,zs_observesuspect,0,"");
	}
	else
	{
	};
};

func int zs_assesswarn_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_AssessWarn_Loop");
	AI_Wait(self,2);
	return LOOP_END;
};

func void zs_assesswarn_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_AssessWarn_End");
	if(Npc_CanSeeNpcFreeLOS(self,other))
	{
		printdebugnpc(PD_ZS_CHECK,"ZS_AssessWarn End // Free Los");
		if((npc_gettempattitude(self,other) == ATT_HOSTILE) || (Npc_GetPermAttitude(self,other) == ATT_HOSTILE))
		{
			printdebugnpc(PD_ZS_CHECK,"ZS_AssessWarn End // Free Los // HOSTILE");
			Npc_SetTarget(self,other);
			Npc_GetTarget(self);
			AI_StartState(self,zs_assessenemy,0,"");
			return;
		}
		else if(Npc_HasNews(self,NEWS_MURDER,other,victim) && (Npc_GetGuildAttitude(self,victim) == ATT_FRIENDLY))
		{
			printdebugnpc(PD_ZS_CHECK,"ZS_AssessWarn End // Free Los //Not HOSTILE Kumpel getötet");
			Npc_GetTarget(self);
			AI_StartState(self,zs_assessenemy,0,"");
		}
		else
		{
			printdebugnpc(PD_ZS_CHECK,"ZS_AssessWarn End// Free Los // Not HOSTILE");
			b_assesssc();
			return;
		};
		return;
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"ZS_AssessWarn  End// Can´T See");
		return;
	};
};

