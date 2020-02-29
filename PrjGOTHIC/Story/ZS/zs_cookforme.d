
func void zs_cookforme()
{
	printdebugnpc(PD_TA_FRAME,"ZS_CookForMe");
	b_setperception(self);
	if(!c_bodystatecontains(self,BS_MOBINTERACT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == 0)
		{
			AI_GotoWP(self,self.wp);
		};
		AI_UseMob(self,"PAN",1);
	};
};

func void zs_cookforme_loop()
{
	var int randomizer;
	printdebugnpc(PD_TA_LOOP,"ZS_CookForMe_Loop");
	randomizer = Hlp_Random(20);
	if(Npc_GetStateTime(self) >= (100 + randomizer))
	{
		b_interruptmob("PAN");
	};
	AI_Wait(self,1);
};

func void zs_cookforme_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_CookForMe_End");
	AI_UseMob(self,"PAN",-1);
	AI_UseItem(self,itfomutton);
};

