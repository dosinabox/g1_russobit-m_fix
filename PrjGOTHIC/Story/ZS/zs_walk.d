
func void zs_walk()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Walk");
	b_setperception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"WALK"))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"WALK_A_"))
	{
		AI_GotoFP(self,"WALK_A_");
	}
	else if(Wld_IsFPAvailable(self,"WALK_B_"))
	{
		AI_GotoFP(self,"WALK_B_");
	};
};

func void zs_walk_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_Walk_Loop");
	if(Npc_IsOnFP(self,"WALK_A_") && Wld_IsFPAvailable(self,"WALK_B_"))
	{
		AI_GotoFP(self,"WALK_B_");
	}
	else if(Npc_IsOnFP(self,"WALK_B_") && Wld_IsFPAvailable(self,"WALK_A_"))
	{
		AI_GotoFP(self,"WALK_A_");
	};
	AI_Wait(self,1);
};

func void zs_walk_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Walk_End");
};

