
func void b_orcslave_quicklook()
{
	printdebugnpc(PD_ORC_FRAME,"OrcSlave_ObserveIntruder");
	if(Npc_IsPlayer(other) && (Npc_GetDistToNpc(self,other) < PERC_DIST_FLEE) && Npc_CanSeeNpc(self,other))
	{
		printdebugnpc(PD_ORC_FRAME,"OrcSlave_ObserveIntruder: Quicklook");
		Npc_ClearAIQueue(self);
		AI_LookAtNpc(self,other);
		AI_Wait(self,3);
		AI_StopLookAt(self);
	};
	AI_ContinueRoutine(self);
};

