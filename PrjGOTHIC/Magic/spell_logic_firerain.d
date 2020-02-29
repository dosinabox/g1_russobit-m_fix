
func int spell_logic_firerain(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Firerain");
	if(manainvested == 1)
	{
		return SPL_NEXTLEVEL;
	};
	if(manainvested >= SPL_SENDCAST_FIRERAIN)
	{
		return SPL_SENDCAST;
	};
	return SPL_RECEIVEINVEST;
};

