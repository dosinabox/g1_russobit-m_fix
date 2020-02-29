
func void zs_guardpalisade()
{
	guardperception();
	printdebugnpc(PD_TA_FRAME,"ZS_GuardPalisade");
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	b_initarmor();
};

func void zs_guardpalisade_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_GuardPalisade_Loop");
	if((Npc_GetDistToNpc(self,hero) < HAI_DIST_WATCH) && !c_bodystatecontains(hero,BS_SNEAK))
	{
		b_smartturntonpc(self,hero);
	}
	else
	{
		b_playarmor();
		AI_AlignToWP(self);
	};
	AI_Wait(self,1);
};

func void zs_guardpalisade_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_GuardPalisade_End");
	b_exitarmor();
};

