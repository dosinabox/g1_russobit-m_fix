
func int spell_logic_stormfist(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Stormfist");
	if((manainvested == ((SPL_SENDCAST_STORMFIST * 3) / 10)) || (manainvested == ((SPL_SENDCAST_STORMFIST * 5) / 10)) || (manainvested == ((SPL_SENDCAST_STORMFIST * 8) / 10)))
	{
		return SPL_NEXTLEVEL;
	};
	if(manainvested >= SPL_SENDCAST_STORMFIST)
	{
		return SPL_SENDCAST;
	};
	return SPL_RECEIVEINVEST;
};

