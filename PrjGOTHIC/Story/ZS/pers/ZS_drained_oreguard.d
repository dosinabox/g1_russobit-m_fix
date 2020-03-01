
func void zs_drained_oreguard()
{
	//AI_PlayAni(self,"S_VICTIM_SLE");
	if(!c_bodystatecontains(self,BS_LIE))
	{
		AI_PlayAniBS(self,"T_STAND_2_VICTIM_SLE",BS_LIE);
	};
};

func void zs_drained_oreguard_loop()
{
	AI_Wait(self,1);
};

func void zs_drained_oreguard_end()
{
};

