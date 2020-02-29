
func void zs_playtune()
{
	printdebugnpc(PD_TA_FRAME,"ZS_PlayTune");
	b_setperception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"PLAYTUNE"))
	{
		AI_GotoWP(self,self.wp);
	};
};

func void zs_playtune_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_PlayTune_Loop");
	if(!Npc_HasItems(self,itmilute))
	{
		CreateInvItem(self,itmilute);
	};
	if(!Npc_IsOnFP(self,"PLAYTUNE"))
	{
		AI_GotoFP(self,"PLAYTUNE");
		AI_AlignToFP(self);
	};
	if(!c_bodystatecontains(self,BS_ITEMINTERACT))
	{
		AI_UseItemToState(self,itmilute,1);
	};
};

func void zs_playtune_end()
{
	AI_UseItemToState(self,itmilute,-1);
	printdebugnpc(PD_TA_FRAME,"ZS_PlayTune_End");
};

