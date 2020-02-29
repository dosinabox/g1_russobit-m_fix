
func void zs_stayneutral()
{
	printdebugnpc(PD_TA_FRAME,"ZS_StayNeutral");
	Npc_SetAttitude(self,ATT_NEUTRAL);
	Npc_SetTempAttitude(self,ATT_NEUTRAL);
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

func void zs_stayneutral_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_StayNeutral_Loop");
	AI_Wait(self,1);
};

func void zs_stayneutral_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_StayNeutral_End");
	self.senses = hero.senses;
	c_stoplookat(self);
};

