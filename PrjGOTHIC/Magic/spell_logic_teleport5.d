
func int spell_logic_teleport5(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Teleport5");
	if(manainvested >= SPL_SENDCAST_TELEPORT)
	{
		AI_Teleport(self,"PSI_TEMPLE_COURT_GURU");
		AI_PlayAni(self,"T_HEASHOOT_2_STAND");
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

