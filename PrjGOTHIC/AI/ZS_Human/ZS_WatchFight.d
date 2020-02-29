
func void zs_watchfight()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_WatchFight");
	c_zsinit();
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,zs_assesssurprise);
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSMURDER,zs_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,zs_assessdefeat);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_refusetalk);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_cheerfight);
	AI_RemoveWeapon(self);
	if(Npc_GetDistToNpc(self,victim) > PERC_DIST_WATCHFIGHT)
	{
		printdebugnpc(PD_ZS_CHECK,"...Opfer weiter als PERC_DIST_WATCHFIGHT entfernt!");
		AI_StartState(self,zs_gotofight,0,"");
	};
	if(!Npc_WasInState(self,zs_gotofight))
	{
		printdebugnpc(PD_ZS_CHECK,"...NSC kommt nicht aus ZS_GotoFight!");
		b_say(self,NULL,"$THERESAFIGHT");
	};
	AI_PlayAni(self,"T_STAND_2_WATCHFIGHT");
};

func int zs_watchfight_loop()
{
	var int jubel;
	var int anim;
	printdebugnpc(PD_ZS_LOOP,"ZS_WatchFight_Loop");
	if(Npc_IsDead(other) || Npc_IsDead(victim))
	{
		printdebugnpc(PD_ZS_LOOP,"...Workaraound für nicht ankommende PERC_ASSESSMURDER!");
		return LOOP_END;
	};
	if(Npc_IsInState(other,zs_unconscious) || Npc_IsInState(victim,zs_unconscious))
	{
		printdebugnpc(PD_ZS_LOOP,"...Workaround für nicht ankommende PERC_ASSESSDEFEAT!");
		return LOOP_END;
	};
	if(Npc_IsInState(other,zs_attack) || Npc_IsInState(victim,zs_attack))
	{
		printdebugnpc(PD_ZS_CHECK,"...es wird noch gekämpft!");
		if((Npc_GetDistToNpc(self,other) < PERC_DIST_INTERMEDIAT) || (Npc_GetDistToNpc(self,victim) < PERC_DIST_INTERMEDIAT))
		{
			printdebugnpc(PD_ZS_CHECK,"...Kombatanten sind noch nah genug!");
			jubel = Hlp_Random(100);
			if((jubel < 5) && (Npc_GetStateTime(self) < 3))
			{
				printdebugnpc(PD_ZS_LOOP,"ZS_WatchFight_Loop // Fight in 10m range // cheer");
				AI_TurnToNPC(self,victim);
				b_say(self,NULL,"$HEYHEYHEY");
				return LOOP_CONTINUE;
			};
			anim = Hlp_Random(100);
			if(anim < 5)
			{
				AI_TurnToNPC(self,victim);
				AI_PlayAni(self,"T_WATCHFIGHTRANDOM1");
			}
			else if(anim < 10)
			{
				AI_TurnToNPC(self,victim);
				AI_PlayAni(self,"T_WATCHFIGHTRANDOM2");
			}
			else if(anim < 15)
			{
				AI_TurnToNPC(self,victim);
				AI_PlayAni(self,"T_WATCHFIGHTRANDOM3");
			}
			else if(anim < 20)
			{
				AI_TurnToNPC(self,victim);
				AI_PlayAni(self,"T_WATCHFIGHTRANDOM4");
			};
			if(Npc_GetDistToNpc(self,other) < PERC_DIST_WATCHFIGHT)
			{
				printdebugnpc(PD_ZS_LOOP,"... zu nahe an 'other'!");
				AI_TurnToNPC(self,other);
				AI_Dodge(self);
				return LOOP_CONTINUE;
			}
			else if(Npc_GetDistToNpc(self,victim) < PERC_DIST_WATCHFIGHT)
			{
				printdebugnpc(PD_ZS_LOOP,"... zu nahe an 'other'!");
				AI_TurnToNPC(self,victim);
				AI_Dodge(self);
				return LOOP_CONTINUE;
			};
		}
		else
		{
			printdebugnpc(PD_ZS_CHECK,"...Kombatanten sind zu weit weg!");
			AI_TurnToNPC(self,victim);
			AI_StartState(self,zs_gotofight,0,"");
			return LOOP_CONTINUE;
		};
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"...es wird nicht mehr gekämpft!");
		return LOOP_END;
	};
	AI_TurnToNPC(self,other);
	return LOOP_CONTINUE;
};

func void zs_watchfight_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_WatchFight_End");
	Npc_ClearAIQueue(self);
	AI_PlayAni(self,"T_WATCHFIGHT_2_STAND");
	AI_ContinueRoutine(self);
};

