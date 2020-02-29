
func void zs_potionalchemy()
{
	printdebugnpc(PD_TA_FRAME,"ZS_PotionAlchemy");
	b_setperception(self);
	if(!c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == 0)
		{
			AI_GotoWP(self,self.wp);
		};
		AI_UseMob(self,"LAB",1);
	};
};

func void zs_potionalchemy_loop()
{
	var int randomizer;
	printdebugnpc(PD_TA_LOOP,"ZS_PotionAlchemy_Loop");
	randomizer = Hlp_Random(20);
	if(Npc_GetStateTime(self) >= (100 + randomizer))
	{
		b_interruptmob("LAB");
	};
	AI_Wait(self,1);
};

func void zs_potionalchemy_end()
{
	AI_UseMob(self,"LAB",-1);
	printdebugnpc(PD_TA_FRAME,"ZS_PotionAlchemy_End");
};

