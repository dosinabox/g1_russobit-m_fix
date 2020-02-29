
func void b_assesscaster()
{
	printdebugnpc(PD_ZS_FRAME,"B_AssessCaster");
	printglobals(PD_ZS_CHECK);
	if(!Npc_IsPlayer(other))
	{
		printdebugnpc(PD_ZS_CHECK,"...Zauberer NICHT der Spieler!");
		return;
	};
	if(c_npctypeisfriend(self,other) || (Npc_GetAttitude(self,other) == ATT_FRIENDLY))
	{
		printdebugnpc(PD_ZS_CHECK,"...NSC ist NPCTYPE_FRIEND oder ATT_FRIENDLY!");
		return;
	};
	if(Npc_GetActiveSpellCat(other) == SPELL_BAD)
	{
		printdebugnpc(PD_ZS_CHECK,"...böser Zauber!");
		b_fullstop(self);
		Npc_PercDisable(self,PERC_ASSESSCASTER);
		AI_StartState(self,zs_assessfighter,0,"");
	}
	else if(Npc_GetAttitude(self,other) == ATT_HOSTILE)
	{
		printdebugnpc(PD_ZS_CHECK,"...böser Zauberer!");
		b_fullstop(self);
		AI_StartState(self,zs_assessenemy,0,"");
	}
	else if((Npc_IsInState(self,zs_guardpassage) || Npc_WasInState(self,zs_guardpassage)) && ((Npc_GetActiveSpell(other) == SPL_SLEEP) || (Npc_GetActiveSpell(other) == SPL_CHARM)))
	{
		printdebugnpc(PD_ZS_CHECK,"...Schlaf-/Charmezauber von Durchgangswache gesehen!");
		b_fullstop(self);
		AI_StartState(self,zs_assessenemy,0,"");
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"...neutraler Zauber");
	};
};

