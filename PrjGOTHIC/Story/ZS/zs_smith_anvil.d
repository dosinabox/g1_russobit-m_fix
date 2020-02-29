
func void zs_smith_anvil()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Smith_Anvil");
	b_setperception(self);
	b_startusemob(self,"BSANVIL");
};

func void zs_smith_anvil_loop()
{
	var int randomizer;
	printdebugnpc(PD_TA_LOOP,"ZS_Smith_Anvil_Loop");
	randomizer = Hlp_Random(20);
	if(Npc_GetStateTime(self) >= (100 + randomizer))
	{
		b_interruptmob("BSANVIL");
	};
	AI_Wait(self,1);
};

func void zs_smith_anvil_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Smith_Anvil_End");
	b_stopusemob(self,"BSANVIL");
};

