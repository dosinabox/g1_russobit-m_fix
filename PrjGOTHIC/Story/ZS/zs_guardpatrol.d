
func void zs_guardpatrol()
{
	printdebugnpc(PD_TA_FRAME,"ZS_GuardPatrol");
	guardperception();
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Hlp_StrCmp(self.wp,Npc_GetNearestWP(self)))
	{
		AI_GotoWP(self,self.wp);
	};
};

func void zs_guardpatrol_loop()
{
	var string hlpwp1;
	var string hlpwp2;
	var int varianzcounter;
	var int hlprand;
	printdebugnpc(PD_TA_LOOP,"ZS_GuardPatrol_Loop");
	AI_GotoWP(self,Npc_GetNearestWP(self));
	if(varianzcounter >= 2)
	{
		AI_GotoWP(self,self.wp);
	}
	else
	{
		hlpwp1 = Npc_GetNearestWP(self);
		printdebugnpc(PD_TA_DETAIL,hlpwp1);
		hlpwp2 = Npc_GetNextWP(self);
		printdebugnpc(PD_TA_DETAIL,hlpwp2);
		AI_GotoWP(self,hlpwp1);
		AI_GotoWP(self,hlpwp2);
		hlprand = Hlp_Random(10000);
		if(!Hlp_StrCmp(Npc_GetNearestWP(self),hlpwp1) && !Hlp_StrCmp(Npc_GetNearestWP(self),hlpwp2))
		{
			printdebugnpc(PD_TA_DETAIL,"Gehe zum dritten WP");
			AI_GotoWP(self,Npc_GetNearestWP(self));
			if(hlprand != 666)
			{
				AI_PlayAni(self,"T_SEARCH");
			};
		}
		else
		{
			printdebugnpc(PD_TA_DETAIL,"Gehe zum zweiten WP");
			AI_GotoWP(self,Npc_GetNextWP(other));
			AI_PlayAni(self,"T_SEARCH");
			AI_Wait(self,10);
			AI_PlayAni(self,"T_SEARCH");
			AI_GotoWP(self,Npc_GetNearestWP(self));
		};
		varianzcounter += 1;
	};
	AI_Wait(self,1);
};

func void zs_guardpatrol_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_GuardPatrol_End");
};

