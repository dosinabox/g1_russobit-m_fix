
func void zs_pray()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Pray");
	b_setperception(self);
	if(!c_bodystatecontains(self,BS_MOBINTERACT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == 0)
		{
			AI_GotoWP(self,self.wp);
		};
		AI_UseMob(self,"IDOL",1);
	};
};

func void zs_pray_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_Pray_Loop");
	AI_Wait(self,1);
};

func void zs_pray_end()
{
	AI_UseMob(self,"IDOL",-1);
	printdebugnpc(PD_TA_FRAME,"ZS_Pray_End");
};

