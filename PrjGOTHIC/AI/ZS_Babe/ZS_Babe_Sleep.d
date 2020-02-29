
func void zs_babe_sleep()
{
	printdebugnpc(PD_TA_FRAME,"ZS_BabeSleep");
	AI_UnequipArmor(self);
	b_setbabedefaultperceptions();
	AI_SetWalkMode(self,NPC_WALK);
	if(!c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT))
	{
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == 0)
		{
			AI_GotoWP(self,self.wp);
		};
		AI_UseMob(self,"BED",1);
		AI_UseMob(self,"BEDHIGH",1);
		AI_UseMob(self,"BEDLOW",1);
	};
};

func void zs_babe_sleep_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_BabeSleep_Loop");
	Mdl_StartFaceAni(self,"S_EYESCLOSED",1,-1);
	AI_Wait(self,1);
};

func void zs_babe_sleep_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_BabeSleep_End");
	AI_UseMob(self,"BED",-1);
	AI_UseMob(self,"BEDHIGH",-1);
	AI_UseMob(self,"BEDLOW",-1);
	b_resetfaceexpression(self);
};

