
func void zs_mchunting()
{
	printdebugnpc(PD_TA_FRAME,"ZS_MCHunting");
	observingperception();
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
};

func void zs_mchunting_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_MCHunting_End");
	if(Wld_DetectNpc(self,-1,NOFUNC,GIL_MINECRAWLER))
	{
		printdebugnpc(PD_TA_CHECK,"MineCrawler detect");
		Npc_SetTarget(self,other);
		Npc_GetTarget(self);
		AI_StartState(self,zs_assessmonster,0,"");
	}
	else
	{
		AI_GotoWP(self,Npc_GetNextWP(self));
		AI_GotoWP(self,Npc_GetNearestWP(self));
	};
};

func void zs_mchunting_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_MCHunting_End");
};

