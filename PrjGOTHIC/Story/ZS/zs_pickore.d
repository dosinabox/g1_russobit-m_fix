
func void zs_pickore()
{
	printdebugnpc(PD_TA_FRAME,"ZS_PickOre");
	b_setperception(self);
	if(self.aivar[AIV_DONTUSEMOB] == 1)
	{
		self.aivar[AIV_DONTUSEMOB] = 0;
	}
	else
	{
		b_startusemob(self,"ORE");
	};
};

func void zs_pickore_loop()
{
	var int randomizer;
	printdebugnpc(PD_TA_LOOP,"ZS_PickOre_Loop");
	printattitudes(PD_TA_LOOP);
	randomizer = Hlp_Random(20);
	if(Npc_GetStateTime(self) >= (100 + randomizer))
	{
		b_interruptmob("ORE");
	};
	AI_Wait(self,1);
};

func void zs_pickore_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_PickOre_End");
	b_stopusemob(self,"ORE");
};

