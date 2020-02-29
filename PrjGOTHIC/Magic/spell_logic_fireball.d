
func int spell_logic_fireball(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Fireball");
	if((manainvested == ((SPL_SENDCAST_FIREBALL * 3) / 10)) || (manainvested == ((SPL_SENDCAST_FIREBALL * 5) / 10)) || (manainvested == ((SPL_SENDCAST_FIREBALL * 8) / 10)))
	{
		return SPL_NEXTLEVEL;
	};
	if(manainvested >= SPL_SENDCAST_FIREBALL)
	{
		return SPL_SENDCAST;
	};
	return SPL_RECEIVEINVEST;
};

