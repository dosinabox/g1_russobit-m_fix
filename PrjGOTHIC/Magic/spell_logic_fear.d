
func int spell_logic_fear(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Fear");
	if(manainvested >= SPL_SENDCAST_FEAR)
	{
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

