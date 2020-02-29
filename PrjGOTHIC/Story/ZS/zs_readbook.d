
func void zs_readbook()
{
	printdebugnpc(PD_TA_FRAME,"ZS_ReadBook");
	b_setperception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!c_bodystatecontains(self,BS_MOBINTERACT))
	{
		AI_GotoWP(self,self.wp);
		AI_UseMob(self,"BOOK",1);
	};
};

func void zs_readbook_loop()
{
	var int randomizer;
	printdebugnpc(PD_TA_LOOP,"ZS_ReadBook_Loop");
	randomizer = Hlp_Random(20);
	if(Npc_GetStateTime(self) >= (100 + randomizer))
	{
		b_interruptmob("BOOK");
	};
	AI_Wait(self,1);
};

func void zs_readbook_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_ReadBook_End");
	AI_UseMob(self,"BOOK",-1);
};

