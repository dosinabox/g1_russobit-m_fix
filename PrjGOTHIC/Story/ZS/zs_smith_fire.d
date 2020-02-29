
func void zs_smith_fire()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Smith_Fire");
	b_setperception(self);
	b_startusemob(self,"BSFIRE");
};

func void zs_smith_fire_loop()
{
	var int randomizer;
	printdebugnpc(PD_TA_LOOP,"ZS_Smith_Fire_Loop");
	randomizer = Hlp_Random(20);
	if(Npc_GetStateTime(self) >= (100 + randomizer))
	{
		b_interruptmob("BSFIRE");
	};
	AI_Wait(self,1);
};

func void zs_smith_fire_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Smith_Fire_End");
	b_stopusemob(self,"BSFIRE");
};

