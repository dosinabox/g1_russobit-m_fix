
func void zs_guardwheelopen()
{
	printdebugnpc(PD_TA_FRAME,"ZS_GuardWheelOpen");
	guardperception();
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_RUN);
	AI_GotoWP(self,self.wp);
	if(guardcheckgatestate(self) == 1)
	{
		printdebugnpc(PD_TA_CHECK,"...Tor geschlossen!");
		if(Wld_GetMobState(self,"VWHEEL") == 0)
		{
			AI_UseMob(self,"VWHEEL",1);
		};
		AI_Wait(self,0.5);
		AI_UseMob(self,"VWHEEL",0);
		AI_UseMob(self,"VWHEEL",-1);
		AI_GotoWP(self,self.wp);
	};
};

func int zs_guardwheelopen_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_GuardWheelOpen_Loop");
	if(self.id == 834 && (Npc_GetDistToWP(hero,"OW_PATH_067") > 1600) && FMTAKEN && !Npc_IsDead(self))
	{
		AI_StartState(self,zs_guardwheelclosed,0,"");
	};
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

func void zs_guardwheelopen_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_GuardWheelOpen_End");
	AI_StopLookAt(self);
};

