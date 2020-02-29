
func int spell_logic_teleport3(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Teleport3");
	if(manainvested >= SPL_SENDCAST_TELEPORT)
	{
		AI_Teleport(self,"DT_E2_06");
		AI_PlayAni(self,"T_HEASHOOT_2_STAND");
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

