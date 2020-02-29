
func void zs_xardasdemon()
{
	printdebugnpc(PD_TA_FRAME,"ZS_XardasDemon");
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_assesssc);
	Npc_PercEnable(self,PERC_ASSESSTALK,zs_talk);
	npc_setpermattitude(self,ATT_FRIENDLY);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
};

func void zs_xardasdemon_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_XardasDemon_Loop");
	AI_Wait(self,1);
};

func void zs_xardasdemon_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_XardasDemon_End");
};

