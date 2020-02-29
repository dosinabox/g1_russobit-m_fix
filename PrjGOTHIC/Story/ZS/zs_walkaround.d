
func void zs_walkaround()
{
	printdebugnpc(PD_TA_FRAME,"ZS_WalkAround");
	b_setperception(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
};

func void zs_walkaround_loop()
{
	var string hlpwp1;
	var string hlpwp2;
	var int varianzcounter;
	var int hlprand;
	printdebugnpc(PD_TA_LOOP,"ZS_WalkAround_Loop");
	AI_GotoWP(self,Npc_GetNearestWP(self));
	if(varianzcounter == 7)
	{
		AI_GotoWP(self,self.wp);
	}
	else
	{
		hlpwp1 = Npc_GetNearestWP(self);
		hlpwp2 = Npc_GetNextWP(self);
		AI_GotoWP(self,hlpwp1);
		AI_GotoWP(self,hlpwp2);
		hlprand = Hlp_Random(10000);
		if(!Hlp_StrCmp(Npc_GetNearestWP(self),hlpwp1))
		{
			AI_GotoWP(self,Npc_GetNearestWP(self));
			varianzcounter += 1;
			if(hlprand != 666)
			{
				AI_PlayAni(self,"T_SEARCH");
			};
		}
		else
		{
			AI_GotoWP(self,Npc_GetNextWP(other));
			AI_Wait(self,10);
			varianzcounter += 1;
		};
	};
	AI_Wait(self,1);
};

func void zs_walkaround_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_WalkAround_End");
};

