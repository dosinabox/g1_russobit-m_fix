
func void zs_orcslave_assessdamage()
{
	printdebugnpc(PD_ORC_FRAME,"ZS_OrcSlave_AssessDamage: Weglaufen ");
	AI_TurnToNPC(self,other);
	AI_Dodge(self);
	AI_PlayAni(self,"T_FRIGHTENED");
	Npc_SetTarget(self,other);
};

func int zs_orcslave_assessdamage_loop()
{
	printdebugnpc(PD_ORC_FRAME,"ZS_OrcSlave_AssessDamage_Loop: Weglaufen ");
	if(Npc_GetDistToNpc(self,other) > 1200)
	{
		return 1;
	};
	AI_Flee(self);
	return 0;
};

func void zs_orcslave_assessdamage_end()
{
	printdebugnpc(PD_ORC_FRAME,"ZS_OrcSlave_AssessDamage_End");
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	AI_ContinueRoutine(self);
};

