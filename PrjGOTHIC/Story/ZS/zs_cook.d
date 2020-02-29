
func void zs_cook()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Cook");
	b_setperception(self);
	if(!c_bodystatecontains(self,BS_MOBINTERACT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == 0)
		{
			AI_GotoWP(self,self.wp);
		};
		AI_UseMob(self,"CAULDRON",1);
	};
};

func void zs_cook_loop()
{
	var int randomizer;
	printdebugnpc(PD_TA_LOOP,"ZS_Cook_Loop");
	randomizer = Hlp_Random(20);
	if(Npc_GetStateTime(self) >= (100 + randomizer))
	{
		b_interruptmob("COOK");
	};
	AI_Wait(self,1);
};

func void zs_cook_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Cook_End");
	AI_UseMob(self,"CAULDRON",-1);
};

