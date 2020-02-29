
func void zs_speech()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Speech");
	b_setperception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"SPEECH"))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"SPEECH"))
	{
		AI_GotoFP(self,"SPEECH");
	};
	AI_AlignToFP(self);
};

func void zs_speech_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_Speech_Loop");
	AI_Wait(self,1);
};

func void zs_speech_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Speech_End");
};

