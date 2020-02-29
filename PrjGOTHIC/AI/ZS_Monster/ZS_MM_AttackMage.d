
func void zs_mm_attackmage()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_MM_AttackMage");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_mmm_combatreacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_GetTarget(self);
	b_selectweapon(self,other);
};

func int zs_mm_attackmage_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_MM_AttackMage_Loop");
	Npc_GetTarget(self);
	if(Npc_IsInState(other,zs_unconscious) || Npc_IsDead(other) || Npc_IsInState(other,zs_dead))
	{
		printdebugnpc(PD_ZS_CHECK,"...Ziel bewußtlos oder tot!");
		if(Npc_IsNextTargetAvailable(self))
		{
			Npc_GetNextTarget(self);
			printdebugstring(PD_ZS_CHECK,"...neues Ziel gefunden:",other.name);
		}
		else
		{
			printdebugnpc(PD_ZS_CHECK,"...kein Neues Ziel vorhanden!");
			return LOOP_END;
		};
	};
	if(Npc_GetStateTime(self) >= 3)
	{
		printglobals(PD_MST_DETAIL);
		Npc_ClearAIQueue(self);
		b_selectweapon(self,other);
		Npc_SetStateTime(self,0);
	};
	AI_Attack(self);
	AI_Wait(self,0.2);
	return LOOP_CONTINUE;
};

func void zs_mm_attackmage_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_MM_AttackMage_End");
	b_removeweapon(self);
};

func void b_mmm_combatreacttodamage()
{
	printdebugnpc(PD_ZS_FRAME,"B_MMM_CombatReactToDamage");
	Npc_SetTarget(self,other);
};

