
func void zs_babe_cry()
{
	b_setbabedefaultperceptions();
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	AI_PlayAniBS(self,"T_STAND_2_CRY",BS_SIT);
};

func void zs_babe_cry_loop()
{
	AI_Wait(self,1);
};

func void zs_babe_cry_end()
{
	AI_PlayAniBS(self,"T_CRY_2_STAND",BS_STAND);
};

