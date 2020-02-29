
func int spell_logic_massdeath(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Massdeath");
	if(manainvested == 0)
	{
		return SPL_NEXTLEVEL;
	};
	if(manainvested >= SPL_SENDCAST_MASSDEATH)
	{
		return SPL_SENDCAST;
	};
	return SPL_RECEIVEINVEST;
};

