
func void zs_babe_flee()
{
	b_fullstop(self);
	printdebugnpc(PD_ZS_FRAME,"ZS_Babe_Flee");
	Npc_PercEnable(self,PERC_MOVEMOB,b_movemob);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	AI_SetWalkMode(self,NPC_RUN);
	b_say(self,NULL,"$HELP");
	AI_UnequipArmor(self);
	if(!Hlp_IsValidNpc(other))
	{
		printdebugnpc(PD_ZS_CHECK,"Other nicht Valid.");
		AI_ContinueRoutine(self);
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"Ich hau lieber ab.");
		Npc_SetTarget(self,other);
		Npc_GetTarget(self);
		AI_Flee(self);
	};
};

func void zs_babe_flee_loop()
{
	var int state_time;
	var string state_time_str;
	printdebugnpc(PD_ZS_LOOP,"ZS_Babe_Flee_Loop");
	AI_Flee(self);
	state_time = Npc_GetStateTime(self);
	state_time_str = IntToString(state_time);
	if(Npc_GetStateTime(self) >= 5)
	{
		AI_ContinueRoutine(self);
	};
};

func void zs_babe_flee_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Babe_Flee_End");
};

