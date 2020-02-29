
func void zs_preach()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Preach");
	b_setperception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"PREACH"))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"PREACH"))
	{
		AI_GotoFP(self,"PREACH");
		AI_AlignToFP(self);
	};
};

func void zs_preach_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_Preach_Loop");
	AI_Wait(self,1);
};

func void zs_preach_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Preach_End");
};

