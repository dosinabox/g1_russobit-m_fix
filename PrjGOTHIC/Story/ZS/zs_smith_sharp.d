
func void zs_smith_sharp()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Smith_Sharp");
	b_setperception(self);
	b_startusemob(self,"BSSHARP");
};

func void zs_smith_sharp_loop()
{
	var int randomizer;
	printdebugnpc(PD_TA_LOOP,"ZS_Smith_Sharp_Loop");
	randomizer = Hlp_Random(20);
	if(Npc_GetStateTime(self) >= (100 + randomizer))
	{
		b_interruptmob("BSSHARP");
	};
	AI_Wait(self,1);
};

func void zs_smith_sharp_end()
{
	var int amount;
	printdebugnpc(PD_TA_FRAME,"ZS_Smith_Sharp_End");
	b_stopusemob(self,"BSSHARP");
	amount = Npc_HasItems(self,itmw_1h_sword_01);
	if(amount > 1)
	{
		Npc_RemoveInvItems(self,itmw_1h_sword_01,amount - 1);
	};
};

