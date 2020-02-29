
func void zs_babe_sitaround()
{
	printdebugnpc(PD_TA_FRAME,"ZS_BabeSitAround");
	AI_UnequipArmor(self);
	b_setbabedefaultperceptions();
	AI_SetWalkMode(self,NPC_WALK);
	if(!c_bodystatecontains(self,BS_SIT))
	{
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == 0)
		{
			AI_GotoWP(self,self.wp);
		};
		AI_UseMob(self,"CHAIR",1);
	};
};

func void zs_babe_sitaround_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_BabeSitAround_Loop");
	AI_Wait(self,1);
};

func void zs_babe_sitaround_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_BabeSitAround_End");
	AI_UseMob(self,"CHAIR",-1);
};

