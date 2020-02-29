
func int spell_logic_firestorm(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Firestorm");
	if((manainvested == ((SPL_SENDCAST_FIRESTORM * 3) / 10)) || (manainvested == ((SPL_SENDCAST_FIRESTORM * 5) / 10)) || (manainvested == ((SPL_SENDCAST_FIRESTORM * 8) / 10)))
	{
		return SPL_NEXTLEVEL;
	};
	if(manainvested >= SPL_SENDCAST_FIRESTORM)
	{
		return SPL_SENDCAST;
	};
	return SPL_RECEIVEINVEST;
};

