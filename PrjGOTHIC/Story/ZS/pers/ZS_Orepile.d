
func void zs_orepile()
{
	b_setperception(self);
	printdebugnpc(PD_TA_FRAME,"ZS_Orepile");
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
};

func void zs_orepile_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_Orepile_Loop");
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NC_PATH_TO_PIT_03"))
	{
		AI_GotoWP(self,"NC_PATH_AROUND_PIT_02");
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"NC_PATH_AROUND_PIT_02"))
	{
		AI_GotoWP(self,"NC_PATH_AROUND_PIT_04");
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"NC_PATH_AROUND_PIT_04"))
	{
		AI_GotoWP(self,"NC_PATH_AROUND_PIT_06");
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"NC_PATH_AROUND_PIT_06"))
	{
		AI_GotoWP(self,"NC_PATH_TO_PIT_03");
	};
	AI_SetWalkMode(self,NPC_WALK);
	AI_AlignToWP(self);
	AI_LookAt(self,"FP_OREPILE_CENTER");
	c_stoplookat(self);
	AI_Wait(self,3);
};

func void zs_orepile_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Orepile");
};

