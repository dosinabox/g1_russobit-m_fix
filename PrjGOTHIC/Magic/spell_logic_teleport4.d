
func int spell_logic_teleport4(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Teleport4");
	if(KAPITEL < 5)
	{
		if(Npc_GetDistToWP(self,"GRYD_060") > 600)
		{
			return SPL_DONTINVEST;
		};
		if(manainvested >= SPL_SENDCAST_TELEPORT)
		{
			AI_Teleport(self,"GRYD_072");
			AI_PlayAni(self,"T_HEASHOOT_2_STAND");
			return SPL_SENDCAST;
		};
		return SPL_NEXTLEVEL;
	}
	else if(manainvested >= SPL_SENDCAST_TELEPORT)
	{
		AI_Teleport(self,"OW_SLEEPERENTRANCE");
		AI_PlayAni(self,"T_HEASHOOT_2_STAND");
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

