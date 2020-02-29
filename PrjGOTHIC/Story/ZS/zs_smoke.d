
func void zs_smoke()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Smoke");
	b_setperception(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	if(Wld_IsMobAvailable(self,"SMOKE"))
	{
		AI_UseMob(self,"SMOKE",1);
	}
	else if(Wld_IsFPAvailable(self,"STAND"))
	{
		AI_GotoFP(self,"STAND");
		b_choosejoint(self);
	};
};

func int zs_smoke_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_Smoke_Loop");
	//return 0;
	var int smoketime;
	smoketime = Hlp_Random(100);
	if(smoketime >= 80)
	{
		b_playitemrandoms(self);
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_smoke_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Smoke_End");
	if(self.aivar[AIV_ITEMSTATUS] == TA_IT_JOINT)
	{
		AI_UseItemToState(self,itmijoint_1,-1);
	}
	else
	{
		AI_UseMob(self,"SMOKE",-1);
	};
};

