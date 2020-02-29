
func void zs_herbshop()
{
	printdebugnpc(PD_TA_FRAME,"ZS_HerbShop");
	b_setperception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"STAND"))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"SHOP"))
	{
		AI_GotoFP(self,"SHOP");
	};
	if(Npc_IsOnFP(self,"SHOP"))
	{
	};
	AI_AlignToFP(self);
};

func void zs_herbshop_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_HerbShop_Loop");
};

func void zs_herbshop_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_HerbShop_End");
};

