
func int spell_logic_thunderball(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Thunderball");
	if((manainvested == ((SPL_SENDCAST_THUNDERBALL * 3) / 10)) || (manainvested == ((SPL_SENDCAST_THUNDERBALL * 5) / 10)) || (manainvested == ((SPL_SENDCAST_THUNDERBALL * 8) / 10)))
	{
		return SPL_NEXTLEVEL;
	};
	if(manainvested >= SPL_SENDCAST_THUNDERBALL)
	{
		return SPL_SENDCAST;
	};
	return SPL_RECEIVEINVEST;
};

