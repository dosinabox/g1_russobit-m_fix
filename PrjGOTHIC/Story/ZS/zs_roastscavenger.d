
func void zs_roastscavenger()
{
	printdebugnpc(PD_TA_FRAME,"ZS_RoastScavenger");
	b_setperception(self);
	if(!c_bodystatecontains(self,BS_MOBINTERACT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		b_startusemob(self,"BARBQ");
	};
};

func void zs_roastscavenger_loop()
{
	var int randomizer;
	printdebugnpc(PD_TA_LOOP,"ZS_RoastScavenger_Loop");
	randomizer = Hlp_Random(20);
	if(Npc_GetStateTime(self) >= (100 + randomizer))
	{
		b_interruptmob("BARBQ");
	};
	AI_Wait(self,1);
};

func void zs_roastscavenger_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_RoastScavenger_End");
	AI_UseMob(self,"BARBQ",-1);
};

