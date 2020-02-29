
func int spell_logic_windfist(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Windfist");
	if((manainvested == ((SPL_SENDCAST_WINDFIST * 3) / 10)) || (manainvested == ((SPL_SENDCAST_WINDFIST * 5) / 10)) || (manainvested == ((SPL_SENDCAST_WINDFIST * 8) / 10)))
	{
		return SPL_NEXTLEVEL;
	};
	if(manainvested >= SPL_SENDCAST_WINDFIST)
	{
		return SPL_SENDCAST;
	};
	return SPL_RECEIVEINVEST;
};

