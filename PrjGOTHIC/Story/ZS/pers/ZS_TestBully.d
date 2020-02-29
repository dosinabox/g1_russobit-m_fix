
func void zs_testbully()
{
	printdebugnpc(PD_TA_FRAME,"ZS_TestBully");
	b_setperception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"BULLY"))
	{
		AI_GotoWP(self,self.wp);
	};
	self.aivar[AIV_ITEMSTATUS] = TA_IT_NONE;
	if(Wld_IsFPAvailable(self,"BULLY_A_"))
	{
		AI_GotoFP(self,"BULLY_A_");
	}
	else if(Wld_IsFPAvailable(self,"BULLY_B_"))
	{
		AI_GotoFP(self,"BULLY_B_");
	}
	else if(Wld_IsFPAvailable(self,"BULLY_C_"))
	{
		AI_GotoFP(self,"BULLY_C_");
	};
	if(Npc_IsOnFP(self,"BULLY"))
	{
		b_chooseapple(self);
	};
};

func int zs_testbully_loop()
{
	var int multireaktion;
	printdebugnpc(PD_TA_LOOP,"ZS_TestBully_Loop");
	multireaktion = Hlp_Random(1000);
	b_playitemrandoms(self);
	AI_Wait(self,1);
	AI_AlignToFP(self);
};

func void zs_testbully_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_TestBully_End");
	b_clearitem(self);
};

