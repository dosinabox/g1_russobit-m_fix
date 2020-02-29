
func void zs_guardwheelclosed()
{
	printdebugnpc(PD_TA_FRAME,"ZS_GuardWheelClosed");
	guardperception();
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	if(Wld_GetMobState(self,"VWHEEL") == 0)
	{
		printdebugnpc(PD_TA_CHECK,"...Tor offen!");
		AI_UseMob(self,"VWHEEL",1);
		AI_UseMob(self,"VWHEEL",-1);
		AI_AlignToWP(self);
	};
};

func int zs_guardwheelclosed_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_GuardWheelClosed_Loop");
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
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_guardwheelclosed_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_GuardWheelClosed_End");
};

