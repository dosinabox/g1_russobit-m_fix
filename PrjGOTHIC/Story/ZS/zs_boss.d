
func void zs_boss()
{
	guardperception();
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_assesssc);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	if(Wld_IsFPAvailable(self,"FP_STAND"))
	{
		AI_GotoFP(self,"FP_STAND");
		AI_AlignToFP(self);
	}
	else
	{
		AI_AlignToWP(self);
	};
	AI_PlayAni(self,"T_STAND_2_HGUARD");
};

func void zs_boss_loop()
{
	var int zufall;
	zufall = Hlp_Random(1000);
	if(zufall >= 950)
	{
		AI_PlayAni(self,"T_HGUARD_2_STAND");
		AI_PlayAni(self,"T_STAND_2_HGUARD");
	}
	else if(zufall >= 600)
	{
		AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
	};
};

func void zs_boss_end()
{
	AI_PlayAni(self,"T_HGUARD_2_STAND");
};

