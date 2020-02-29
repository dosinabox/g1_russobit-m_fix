
func void zs_herbalchemy()
{
	printdebugnpc(PD_TA_FRAME,"ZS_HerbAlchemy");
	b_setperception(self);
	if(!c_bodystatecontains(self,BS_MOBINTERACT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == 0)
		{
			AI_GotoWP(self,self.wp);
		};
		AI_UseMob(self,"HERB",1);
	};
};

func void zs_herbalchemy_loop()
{
	var int randomizer;
	printdebugnpc(PD_TA_LOOP,"ZS_HerbAlchemy_Loop");
	randomizer = Hlp_Random(20);
	if(Npc_GetStateTime(self) >= (100 + randomizer))
	{
		b_interruptmob("HERB");
	};
	AI_Wait(self,1);
};

func void zs_herbalchemy_end()
{
	AI_UseMob(self,"HERB",-1);
	printdebugnpc(PD_TA_FRAME,"ZS_HerbAlchemy_End");
};

