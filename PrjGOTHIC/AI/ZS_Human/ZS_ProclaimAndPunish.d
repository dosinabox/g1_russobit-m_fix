
func void zs_proclaimandpunish()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_ProclaimAndPunish");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_combatreacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSMURDER,b_combatassessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,b_combatassessdefeat);
	Npc_PercEnable(self,PERC_MOVENPC,b_stopgotohero);
	if(self.aivar[AIV_WASDEFEATEDBYSC] && !c_npcisboss(self) && (Wld_GetGuildAttitude(self.guild,other.guild) != ATT_HOSTILE) && (Npc_GetPermAttitude(self,other) != ATT_HOSTILE))
	{
		printdebugnpc(PD_ZS_CHECK,"...NSC wurde schon mal vom SC besiegt!");
		b_removeweapon(self);
		AI_StartState(self,zs_turnaway,0,"");
		return;
	};
	if((Npc_IsInFightMode(self,FMODE_FAR) || Npc_IsInFightMode(self,FMODE_MAGIC)) && (Npc_GetDistToNpc(self,hero) > PERC_DIST_DIALOG))
	{
		Npc_SetTarget(self,hero);
		AI_StartState(self,zs_attack,0,"");
	};
	AI_SetWalkMode(self,NPC_RUN);
};

func int zs_proclaimandpunish_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_ProclaimAndPunish_Loop");
	if(Npc_GetStateTime(self) > HAI_TIME_PURSUIT)
	{
		printdebugnpc(PD_ZS_CHECK,"...Verfolgung dauert schon zu lange!");
		AI_ContinueRoutine(self);
	}
	else if(Npc_GetDistToNpc(self,hero) > PERC_DIST_DIALOG)
	{
		printdebugnpc(PD_ZS_CHECK,"...noch NICHT in Dialogreichweite!");
		AI_GotoNpc(self,hero);
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"...IN Dialogreichweite!");
		b_fullstop(self);
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void zs_proclaimandpunish_end()
{
	var int murder_news;
	var C_NPC murder_victim;
	printdebugnpc(PD_ZS_FRAME,"ZS_ProclaimAndPunish_End");
	if(c_npcisdown(hero))
	{
		printdebugnpc(PD_ZS_CHECK,"...SC mittlerweile am Boden!");
		return;
	};
	if(Npc_WasInState(self,zs_assessenemy))
	{
		murder_news = Npc_HasNews(self,NEWS_MURDER,hero,NULL);
		if(murder_news)
		{
			printdebugnpc(PD_ZS_CHECK,"...SC hat getötet...");
			murder_victim = Npc_GetNewsVictim(self,murder_news);
			if(Npc_GetAttitude(self,murder_victim) == ATT_FRIENDLY)
			{
				printdebugnpc(PD_ZS_CHECK,"...und zwar einen Freund des NSCs!");
				b_sayoverlay(self,hero,"$YouKilledOneOfUs");
			};
		}
		else if(Wld_GetGuildAttitude(self.guild,hero.guild) == ATT_HOSTILE)
		{
			printdebugnpc(PD_ZS_CHECK,"...SC ist Todfeind!");
			b_sayoverlay(self,hero,"$DieMortalEnemy");
		}
		else if(Npc_HasNews(self,NEWS_THEFT,hero,self))
		{
			printdebugnpc(PD_ZS_CHECK,"...SC hat vom NSC geklaut!");
			b_sayoverlay(self,hero,"$DIRTYTHIEF");
		}
		else if(Npc_HasNews(self,NEWS_DEFEAT,self,hero))
		{
			printdebugnpc(PD_ZS_CHECK,"...Normaler Angriff (SC ist schon mal besiegt worden)!");
			b_sayoverlay(self,hero,"$YOUSTILLNOTHAVEENOUGH");
		}
		else
		{
			printdebugnpc(PD_ZS_CHECK,"...Normaler Angriff (SC wurde noch nicht besiegt)!");
			b_sayoverlay(self,hero,"$NowWait");
		};
	}
	else if(c_getattackreason(self) == AIV_AR_INTRUDER)
	{
		printdebugnpc(PD_ZS_CHECK,"...SC hat Durchgang durchbrochen!");
		b_sayoverlay(self,hero,"$NowWaitIntruder");
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"...SC greift Schützling einer Wache an !");
		b_sayoverlay(self,hero,"$YouAttackedMyCharge");
	};
	Npc_SetTarget(self,hero);
	AI_StartState(self,zs_attack,0,"");
};

