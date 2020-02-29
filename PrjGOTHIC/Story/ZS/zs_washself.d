
func void zs_washself()
{
	b_setperception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"WASH"))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"WASH"))
	{
		AI_GotoFP(self,"WASH");
		AI_AlignToFP(self);
		AI_PlayAni(self,"T_STAND_2_WASH");
	};
};

func void zs_washself_loop()
{
	AI_Wait(self,1);
};

func void zs_washself_end()
{
	AI_PlayAni(self,"T_WASH_2_STAND");
};

