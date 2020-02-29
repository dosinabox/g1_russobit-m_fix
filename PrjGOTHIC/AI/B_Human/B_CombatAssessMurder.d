
func void b_combatassessmurder()
{
	printdebugnpc(PD_ZS_FRAME,"B_CombatAssessMurder");
	printglobals(PD_ZS_CHECK);
	if(Npc_CanSeeNpc(self,other))
	{
		printdebugnpc(PD_ZS_CHECK,"B_CombatAssessMurder seen");
		if(c_npcishuman(other) && c_npcishuman(victim))
		{
			printdebugnpc(PD_ZS_CHECK,"B_CombatAssessMurder seen // Both human");
			b_assessandmemorize(NEWS_MURDER,NEWS_SOURCE_WITNESS,self,other,victim);
			if(Npc_IsInState(self,zs_proclaimandpunish))
			{
				printdebugnpc(PD_ZS_CHECK,"...NSC ist in ZS_ProclaimAndPunish!");
				if(Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(hero))
				{
					printdebugnpc(PD_ZS_CHECK,"...Getöteter ist auch eigenes Ziel!");
					b_fullstop(self);
					AI_ContinueRoutine(self);
				};
			};
		};
		if((npc_gettempattitude(self,victim) == ATT_FRIENDLY) && !c_npcishuman(victim))
		{
			printdebugnpc(PD_ZS_CHECK,"B_CombatAssessMurder seen // friendly to victim ::");
			Npc_SetTempAttitude(self,ATT_HOSTILE);
		};
	}
	else if(c_npcishuman(other) && c_npcishuman(victim))
	{
		printdebugnpc(PD_ZS_CHECK,"B_CombatAssessMurder // only heard");
		b_assessandmemorize(NEWS_MURDER,NEWS_SOURCE_WITNESS,self,NULL,victim);
	};
};

