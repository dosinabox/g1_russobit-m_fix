
func void b_assessfightsound()
{
	printdebugnpc(PD_ZS_FRAME,"B_AssessFightSound");
	if(c_npcismonster(other) && c_npcishuman(victim))
	{
		printdebugnpc(PD_ZS_FRAME,"...Monster greift Mensch an!");
		if((Npc_GetAttitude(self,victim) == ATT_FRIENDLY) || (Npc_GetAttitude(self,victim) == ATT_NEUTRAL))
		{
			if(Npc_CanSeeNpcFreeLOS(self,other) && (Npc_GetDistToNpc(self,other) < HAI_DIST_ASSESS_MONSTER))
			{
				AI_StartState(self,zs_assessmonster,0,"");
				return;
			};
			return;
		}
		else
		{
			b_smartturntonpc(self,victim);
			printattitudes(PD_ZS_CHECK);
			b_assessfighter();
			return;
		};
	}
	else if(c_npcismonster(victim) && c_npcishuman(other))
	{
		printdebugnpc(PD_ZS_CHECK,"...Mensch greift Monster an!");
		if((Npc_GetAttitude(self,other) == ATT_FRIENDLY) || (Npc_GetAttitude(self,other) == ATT_NEUTRAL))
		{
			if(Npc_CanSeeNpcFreeLOS(self,other))
			{
				Npc_SetTarget(self,victim);
				Npc_GetTarget(self);
				AI_StartState(self,zs_assessmonster,0,"");
				return;
			};
			return;
		}
		else
		{
			b_smartturntonpc(self,victim);
			printattitudes(PD_ZS_CHECK);
			b_assessfighter();
			return;
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(victim))
	{
		printdebugnpc(PD_ZS_CHECK,"...NSC selbst wurde getroffen!");
		b_fullstop(self);
		AI_StartState(self,zs_reacttodamage,0,"");
		return;
	};
	if(c_chargewasattacked(self,victim,other))
	{
		printdebugnpc(PD_ZS_CHECK,"...NSC ist Wache und ein Schützling wurde attackiert!");
		if(Npc_GetPermAttitude(victim,other) == ATT_FRIENDLY)
		{
			printdebugnpc(PD_ZS_CHECK,"...war nur 'friendly fire'!");
			return;
		}
		else
		{
			printglobals(PD_ZS_CHECK);
			printdebugnpc(PD_ZS_CHECK,"...und der ist auch sauer bzw. flieht!");
			b_fullstop(self);
			Npc_SetTarget(self,other);
			b_whirlaround(self,other);
			b_drawweapon(self,other);
			AI_StartState(self,zs_proclaimandpunish,0,"");
			return;
		};
	}
	else if(c_npcisboss(self) || c_npcisguard(self) || c_npcisguardarcher(self))
	{
		printdebugnpc(PD_ZS_CHECK,"...NSC gehört zu BOSS-Gilde!");
		b_smartturntonpc(self,victim);
		b_assessfighter();
		return;
	}
	else if(Npc_GetDistToNpc(self,victim) < PERC_DIST_WATCHFIGHT && self.id != 328 && self.id != 888 && self.id != 889)
	{
		printdebugnpc(PD_ZS_CHECK,"...Opfer in WatchFight-Range!");
		b_whirlaround(self,victim);
		AI_StartState(self,zs_watchfight,0,"");
		return;
	};
};

