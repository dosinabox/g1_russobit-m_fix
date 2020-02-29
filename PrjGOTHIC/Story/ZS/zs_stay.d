
func void zs_stay()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Stay");
	b_setperception(self);
	self.senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	if(Npc_HasReadiedWeapon(self))
	{
		AI_SetWalkMode(self,NPC_RUN);
	}
	else
	{
		AI_SetWalkMode(self,NPC_WALK);
	};
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
};

func void zs_stay_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_Stay_Loop");
	AI_Wait(self,1);
};

func void zs_stay_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Stay_End");
	self.senses = hero.senses;
	c_stoplookat(self);
};

