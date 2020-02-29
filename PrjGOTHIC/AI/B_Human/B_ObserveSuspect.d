
func void b_observesuspect()
{
	printdebugnpc(PD_ZS_FRAME,"B_ObserveSuspect");
	if((self.npctype == NPCTYPE_FRIEND) || (Npc_GetAttitude(self,other) == ATT_FRIENDLY))
	{
		printdebugnpc(PD_ZS_CHECK,"...NSC ist NPCTYPE_FRIEND oder ATT_FRIENDLY");
		return;
	};
	if(Npc_CanSeeNpc(self,other))
	{
		printdebugnpc(PD_ZS_FRAME,"...CanSee");
		Npc_PercDisable(self,PERC_ASSESSWARN);
		Npc_SetTarget(self,other);
		Npc_GetTarget(self);
		AI_StartState(self,zs_observesuspect,0,"");
	};
};

