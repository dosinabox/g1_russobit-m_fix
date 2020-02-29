
func void b_combatassessdefeat()
{
	printdebugnpc(PD_ZS_FRAME,"B_CombatAssessDefeat");
	if(Npc_CanSeeNpcFreeLOS(self,other))
	{
		if(c_npcishuman(other) && c_npcishuman(victim))
		{
			printdebugnpc(PD_ZS_CHECK,"...Mensch besiegt Mensch!");
			b_assessandmemorize(NEWS_DEFEAT,NEWS_SOURCE_WITNESS,self,other,victim);
			if(Npc_IsInState(self,zs_proclaimandpunish))
			{
				printdebugnpc(PD_ZS_CHECK,"...NSC ist in ZS_ProclaimAndPunish!");
				if(Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(hero))
				{
					printdebugnpc(PD_ZS_CHECK,"...Besiegter ist auch eigenes Ziel!");
					b_fullstop(self);
					AI_ContinueRoutine(self);
				};
			};
		};
	};
};

