
func void zs_bodyguard()
{
	printdebugnpc(PD_TA_FRAME,"ZS_BodyGuard");
	b_setperception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"BODYGUARD"))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"BODYGUARD"))
	{
		AI_GotoFP(self,"BODYGUARD");
		AI_AlignToFP(self);
	};
};

func void zs_bodyguard_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_BodyGuard_Loop");
	AI_Wait(self,1);
};

func void zs_bodyguard_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_BodyGuard_End");
};

