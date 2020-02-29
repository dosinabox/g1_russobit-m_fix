
func void zs_guardpassage()
{
	printdebugnpc(PD_TA_FRAME,"ZS_GuardPassage");
	guardperception();
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_assesssc);
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,b_assesssc);
	Npc_PercDisable(self,PERC_OBSERVEINTRUDER);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	b_initarmor();
};

func int zs_guardpassage_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_GuardPassage_Loop");
	if(Npc_GetDistToWP(self,self.wp) > 200)
	{
		AI_SetWalkMode(self,NPC_RUN);
		AI_GotoWP(self,self.wp);
		return LOOP_CONTINUE;
	}
	else if(Npc_GetDistToNpc(self,hero) > HAI_DIST_GUARDPASSAGE_ATTENTION)
	{
		AI_AlignToWP(self);
	};
	b_playarmor();
	AI_Wait(self,0.5);
	return LOOP_CONTINUE;
};

func void zs_guardpassage_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_GuardPassage_End");
	b_exitarmor();
};

