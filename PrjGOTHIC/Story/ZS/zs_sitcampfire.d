
func void zs_sitcampfire()
{
	guardperception();
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_assesssc);
	if(!c_bodystatecontains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,self.wp);
		if(Wld_IsFPAvailable(self,"FP_CAMPFIRE"))
		{
			AI_GotoFP(self,"FP_CAMPFIRE");
		}
		else
		{
			AI_StartState(self,zs_stand,0,"");
		};
		self.aivar[AIV_HANGAROUNDSTATUS] = 1;
		AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
	};
	AI_AlignToFP(self);
};

func void zs_sitcampfire_loop()
{
};

func void zs_sitcampfire_end()
{
	AI_PlayAni(self,"T_SIT_2_STAND");
};

