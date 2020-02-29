
func void zs_testhangaround()
{
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,b_assessenterroom);
	AI_GotoWP(self,self.wp);
};

func void zs_testhangaround_loop()
{
	AI_PlayAni(self,"T_PERCEPTION");
};

func void zs_testhangaround_end()
{
};

func void zs_testperception()
{
	Npc_PercEnable(self,PERC_ASSESSTALK,testprint);
};

func void zs_testperception_loop()
{
	if(Hlp_IsValidNpc(other))
	{
		printdebugs("other valid im TestHang");
	};
	if(Npc_GetStateTime(self) > 20)
	{
		return;
	};
};

func void zs_testperception_end()
{
};

func void testprint()
{
	Print("Perception AN !!!");
	Npc_PercDisable(self,PERC_ASSESSTALK);
};

func void zs_testperception1()
{
	Npc_PercDisable(self,PERC_ASSESSTALK);
};

func void zs_testperception1_loop()
{
	if(Npc_GetDistToNpc(self,other) < 500)
	{
		AI_ContinueRoutine(self);
	};
};

func void zs_testperception1_end()
{
};

