
func void zs_berzerk()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Berzerk");
	printglobals(PD_ZS_DETAIL);
	b_fullstop(self);
	b_sayoverlay(self,NULL,"$Berzerk");
	AI_PlayAni(self,"T_PSI_VICTIM");
	AI_SetWalkMode(self,NPC_RUN);
};

func int zs_berzerk_loop()
{
	var int random;
	printdebugnpc(PD_ZS_LOOP,"ZS_Berzerk_Loop");
	if(Npc_GetStateTime(self) > SPL_TIME_BERZERK)
	{
		b_fullstop(self);
		return LOOP_END;
	};
	Npc_GetTarget(self);
	if(Hlp_IsValidNpc(other) && !c_npcisdown(other) && !Npc_IsPlayer(other))
	{
		Npc_GetTarget(self);
		AI_Attack(self);
		AI_Wait(self,0.1);
		if(Hlp_Random(100) < 20)
		{
			b_sayoverlay(self,other,"$Berzerk");
		};
		return LOOP_CONTINUE;
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"...kein gültiges Ziel mehr!");
		Npc_PerceiveAll(self);
		if(Wld_DetectNpcEx(self,-1,NOFUNC,-1,FALSE))
		{
			printdebugnpc(PD_ZS_CHECK,"...Neues Ziel entdeckt!");
			printglobals(PD_ZS_DETAIL);
			Npc_SetTarget(self,other);
			return LOOP_CONTINUE;
		}
		else
		{
			printdebugnpc(PD_ZS_CHECK,"...kein neues Ziel mehr vorhanden!");
			printglobals(PD_ZS_DETAIL);
			AI_GotoWP(self,Npc_GetNearestWP(self));
			b_sayoverlay(self,NULL,"$Berzerk");
			AI_PlayAni(self,"T_SEARCH");
			AI_GotoWP(self,Npc_GetNextWP(self));
			b_sayoverlay(self,NULL,"$Berzerk");
			AI_PlayAni(self,"T_SEARCH");
		};
	};
};

func void zs_berzerk_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Berzerk_End");
	b_sayoverlay(self,NULL,"$Berzerk");
	AI_PlayAni(self,"T_PSI_VICTIM");
	AI_Wait(self,2);
	AI_ContinueRoutine(self);
};

