
func void zs_charlotte_dance()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Charlotte_Dance");
	AI_SetWalkMode(self,NPC_RUN);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
};

func void zs_charlotte_dance_loop()
{
	var int dancestyle;
	printdebugnpc(PD_TA_LOOP,"ZS_Charlotte_Dance_Loop");
	dancestyle = Hlp_Random(9);
	if(dancestyle == 0)
	{
		AI_PlayAni(self,"S_DANCE1");
	};
	if(dancestyle == 1)
	{
		AI_PlayAni(self,"S_DANCE2");
	};
	if(dancestyle == 2)
	{
		AI_PlayAni(self,"S_DANCE3");
	};
	if(dancestyle == 3)
	{
		AI_PlayAni(self,"S_DANCE4");
	};
	if(dancestyle == 4)
	{
		AI_PlayAni(self,"S_DANCE5");
	};
	if(dancestyle == 5)
	{
		AI_PlayAni(self,"S_DANCE6");
	};
	if(dancestyle == 6)
	{
		AI_PlayAni(self,"S_DANCE7");
	};
	if(dancestyle == 7)
	{
		AI_PlayAni(self,"S_DANCE8");
	};
	if(dancestyle == 8)
	{
		AI_PlayAni(self,"S_DANCE9");
	};
	AI_GotoWP(self,self.wp);
};

func void zs_charlotte_dance_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Charlotte_Dance_End");
};

