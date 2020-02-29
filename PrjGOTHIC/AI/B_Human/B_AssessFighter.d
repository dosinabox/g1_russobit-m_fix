
func void b_assessfighter()
{
	printdebugnpc(PD_ZS_FRAME,"B_AssessFighter");
	if(self.npctype == NPCTYPE_ROGUE)
	{
		b_setroguestohostile();
	};
	if(c_npcishuman(other))
	{
		printdebugnpc(PD_ZS_FRAME,"...'fighter' ist Mensch!");
		if(Npc_IsInCutscene(other))
		{
			printdebugnpc(PD_ZS_CHECK,"...Waffenziehender in Cutscene!");
			return;
		};
		if(Npc_IsInState(other,zs_magicsleep))
		{
			printdebugnpc(PD_ZS_CHECK,"...SC in magischem Schlaf!");
			return;
		};
		if(!Npc_IsPlayer(other))
		{
			printdebugnpc(PD_ZS_CHECK,"...NSC ist kein Spieler!");
			return;
		}
		else if(Npc_IsInState(self,zs_guardpassage))
		{
			b_checkforimportantinfo(self,other);
		};
		if(Npc_IsInFightMode(other,FMODE_FIST))
		{
			printdebugnpc(PD_ZS_CHECK,"...Fighter hat nur Fäuste 'gezogen'!");
			return;
		};
		if(c_npctypeisfriend(self,other) || (Npc_GetAttitude(self,other) == ATT_FRIENDLY))
		{
			printdebugnpc(PD_ZS_CHECK,"...NSC ist NPCTYPE_FRIEND oder ATT_FRIENDLY!");
			return;
		};
		if(other.aivar[AIV_INVINCIBLE] == TRUE)
		{
			printdebugnpc(PD_ZS_CHECK,"...Fighter ist im Dialog!");
			return;
		};
		if(Npc_IsInFightMode(other,FMODE_MELEE) && (!c_npcisguarding(self)))
		{
			printdebugnpc(PD_ZS_CHECK,"...Fighter führt Nahkampfwaffe!");
			if(Npc_GetDistToNpc(self,other) < HAI_DIST_MELEE)
			{
				printdebugnpc(PD_ZS_CHECK,"...und ist in Nahkampfreichweite");
				b_fullstop(self);
				Npc_SetTarget(self,other);
				Npc_GetTarget(self);
				AI_StartState(self,zs_assessfighter,0,"");
				return;
			};
		};
		if(Npc_IsInFightMode(other,FMODE_FAR) && (!c_npcisguarding(self)))
		{
			printdebugnpc(PD_ZS_CHECK,"...Fighter führt Fernkampfwaffe!");
			if(Npc_GetDistToNpc(self,other) < HAI_DIST_RANGED)
			{
				printdebugnpc(PD_ZS_CHECK,"...und ist in Fernkampfreichweite!");
				b_fullstop(self);
				AI_StartState(self,zs_assessfighter,0,"");
				return;
			};
		};
		if(Npc_IsInFightMode(other,FMODE_MAGIC) && (!c_npcisguarding(self)))
		{
			printdebugnpc(PD_ZS_CHECK,"...Fighter führt Zauberspruch!");
			if((Npc_GetDistToNpc(self,other) < HAI_DIST_RANGED) && (Npc_GetActiveSpellCat(other) == SPELL_BAD))
			{
				printdebugnpc(PD_ZS_CHECK,"...und zwar einen Kampfzauber & innerhalb Fernkampfreichweite!");
				b_fullstop(self);
				AI_StartState(self,zs_assessfighter,0,"");
				return;
			}
			else if((Npc_IsInState(self,zs_guardpassage) || Npc_WasInState(self,zs_guardpassage)) && ((Npc_GetActiveSpell(other) == SPL_SLEEP) || (Npc_GetActiveSpell(other) == SPL_CHARM)))
			{
				printdebugnpc(PD_ZS_CHECK,"...Schlaf-/Charmezauber von Durchgangswache gesehen!");
				b_fullstop(self);
				AI_StartState(self,zs_assessfighter,0,"");
				return;
			};
		};
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"... 'fighter' ist Monster/Orc!");
		if(c_npcisdangerousmonster(self,other))
		{
			printdebugnpc(PD_ZS_CHECK,"... 'fighter' ist gefährliches Monster!");
			if(Npc_GetDistToNpc(self,other) < HAI_DIST_ASSESS_MONSTER)
			{
				b_fullstop(self);
				AI_StartState(self,zs_assessmonster,0,"");
				return;
			};
		};
	};
};

