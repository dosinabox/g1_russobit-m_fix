
func void zs_babe_sitaround()
{
	printdebugnpc(PD_TA_FRAME,"ZS_BabeSitAround");
	AI_UnequipArmor(self);
	b_setbabedefaultperceptions();
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == 0)
	{
		AI_GotoWP(self,self.wp);
	};
	
};

func int zs_babe_sitaround_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_BabeSitAround_Loop");
	if(!c_bodystatecontains(self,BS_SIT))
	{
		if(Wld_IsMobAvailable(self,"CHAIR"))
		{
			AI_UseMob(self,"CHAIR",1);
		};
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_babe_sitaround_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_BabeSitAround_End");
	AI_UseMob(self,"CHAIR",-1);
};

