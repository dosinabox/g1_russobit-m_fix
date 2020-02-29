
func int spell_logic_icecube(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_IceCube");
	if(manainvested >= SPL_SENDCAST_ICECUBE)
	{
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

