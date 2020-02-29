
func void zs_hostileguard()
{
	printdebugnpc(PD_TA_FRAME,"ZS_HostileGuard");
	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	guardperception();
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_assesssc);
	self.senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	self.senses_range = 2500;
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	b_initarmor();
};

func void zs_hostileguard_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_HostileGuard_Loop");
	b_gotofp(self,"GUARD");
	b_playarmor();
	AI_Wait(self,0.5);
};

func void zs_hostileguard_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_HostileGuard_End");
	b_exitarmor();
};

