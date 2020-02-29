
func void zs_repairhut()
{
	printdebugnpc(PD_TA_FRAME,"ZS_RepairHut");
	b_setperception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT))
	{
		AI_GotoWP(self,self.wp);
		printdebugnpc(PD_TA_CHECK,"...befindet sich nicht im MobInteract!");
		AI_UseMob(self,"REPAIR",1);
	};
};

func void zs_repairhut_loop()
{
	var int repairreaktion;
	var int randomizer;
	printdebugnpc(PD_TA_LOOP,"ZS_RepairHut_Loop");
	if(c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT))
	{
		repairreaktion = Hlp_Random(100);
		if(repairreaktion >= 90)
		{
			AI_PlayAniBS(self,"T_REPAIR_RANDOM_1",BS_MOBINTERACT_INTERRUPT);
		}
		else if(repairreaktion >= 85)
		{
			b_pee(self);
		};
	};
	randomizer = Hlp_Random(20);
	if(Npc_GetStateTime(self) >= (100 + randomizer))
	{
		b_interruptmob("REPAIR");
	};
	AI_Wait(self,1);
};

func void zs_repairhut_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_RepairHut_End");
	AI_UseMob(self,"REPAIR",-1);
};

