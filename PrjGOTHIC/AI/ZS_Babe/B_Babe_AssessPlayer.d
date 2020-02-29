
func void b_babe_assessplayer()
{
	if((Npc_GetDistToNpc(self,other) < PERC_DIST_FLEE) && Npc_CanSeeNpcFreeLOS(self,other))
	{
		AI_StartState(self,zs_babe_assessplayer,0,"");
	}
	else
	{
		return;
	};
};

