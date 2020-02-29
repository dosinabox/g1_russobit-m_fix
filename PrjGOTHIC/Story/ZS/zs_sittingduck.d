
func void zs_sittingduck()
{
	printdebugnpc(PD_TA_FRAME,"ZS_SittingDuck");
	self.senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
};

func void zs_sittingduck_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_SittingDuck_Loop");
	AI_Wait(self,1);
};

func void zs_sittingduck_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_SittingDuck_End");
};

