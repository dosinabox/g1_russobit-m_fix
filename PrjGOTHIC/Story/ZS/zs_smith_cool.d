
func void zs_smith_cool()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Smith_Cool");
	b_setperception(self);
	b_startusemob(self,"BSCOOL");
};

func void zs_smith_cool_loop()
{
	var int randomizer;
	printdebugnpc(PD_TA_LOOP,"ZS_Smith_Cool_Loop");
	randomizer = Hlp_Random(20);
	if(Npc_GetStateTime(self) >= (100 + randomizer))
	{
		b_interruptmob("BSCOOL");
	};
	AI_Wait(self,1);
};

func void zs_smith_cool_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Smith_Cool_End");
	b_stopusemob(self,"BSCOOL");
};

