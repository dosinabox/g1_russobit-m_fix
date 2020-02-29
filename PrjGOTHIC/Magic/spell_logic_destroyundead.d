
func int spell_logic_destroyundead(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_DestroyUndead");
	if(manainvested >= SPL_SENDCAST_DESTROYUNDEAD)
	{
		return SPL_SENDCAST;
	};
	return SPL_RECEIVEINVEST;
};

