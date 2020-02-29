
func void b_assesswarn()
{
	printdebugnpc(PD_ZS_FRAME,"B_AssessWarn");
	printglobals(PD_ZS_CHECK);
	printattitudes(PD_ZS_CHECK);
	Npc_PercDisable(self,PERC_ASSESSWARN);
	if(!c_npcishuman(other))
	{
		printdebugnpc(PD_ZS_CHECK,"B_AssessWarn Monster");
		AI_Standup(self);
		Npc_SetTarget(self,other);
		Npc_GetTarget(self);
		AI_StartState(self,zs_assessmonster,0,"");
	}
	else if(!c_npcishuman(victim))
	{
		printdebugnpc(PD_ZS_CHECK,"B_AssessWarn Monster");
		AI_Standup(self);
		Npc_SetTarget(self,victim);
		Npc_GetTarget(self);
		AI_StartState(self,zs_assessmonster,0,"");
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"B_AssessWarn Human");
		b_fullstop(self);
		AI_StartState(self,zs_assesswarn,0,"");
	};
};

