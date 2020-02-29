
func void zs_minebellows()
{
	printdebugnpc(PD_TA_FRAME,"ZS_MineBellows");
	b_setperception(self);
	if(!c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == 0)
		{
			AI_GotoWP(self,self.wp);
		};
	};
};

func void zs_minebellows_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_MineBellows_Loop");
	AI_UseMob(self,"BELLOW",1);
	AI_UseMob(self,"BELLOW",0);
};

func void zs_minebellows_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_MineBellows_End");
	AI_UseMob(self,"BELLOW",-1);
};

