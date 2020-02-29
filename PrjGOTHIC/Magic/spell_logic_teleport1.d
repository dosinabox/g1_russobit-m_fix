
func int spell_logic_teleport1(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Teleport1");
	if(manainvested >= SPL_SENDCAST_TELEPORT)
	{
		AI_Teleport(self,"OCC_CHAPEL_UPSTAIRS");
		AI_PlayAni(self,"T_HEASHOOT_2_STAND");
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

