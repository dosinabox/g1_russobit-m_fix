
func void zs_babe_sweep()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Babe_Sweep");
	AI_UnequipArmor(self);
	b_setbabedefaultperceptions();
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_HasItems(self,itmibrush) < 1)
	{
		CreateInvItem(self,itmibrush);
	};
	if(!Npc_IsOnFP(self,"SWEEP"))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"SWEEP"))
	{
		AI_GotoFP(self,"SWEEP");
		AI_UseItemToState(self,itmibrush,1);
	};
};

func void zs_babe_sweep_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_Babe_Sweep_Loop");
	AI_Wait(self,1);
};

func void zs_babe_sweep_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Babe_Sweep_End");
	AI_UseItemToState(self,itmibrush,-1);
};

