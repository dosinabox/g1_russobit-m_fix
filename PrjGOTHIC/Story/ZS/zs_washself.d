
func void zs_washself()
{
	printdebugnpc(PD_TA_FRAME,"ZS_WashSelf");
	b_setperception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"Что?"))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"WASH"))
	{
		AI_GotoFP(self,"WASH");
		AI_AlignToFP(self);
		AI_PlayAni(self,"T_STAND_2_WASH");
	};
};

func void zs_washself_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_WashSelf_Loop");
	AI_Wait(self,1);
};

func void zs_washself_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_WashSelf_End");
	AI_PlayAni(self,"T_WASH_2_STAND");
};

