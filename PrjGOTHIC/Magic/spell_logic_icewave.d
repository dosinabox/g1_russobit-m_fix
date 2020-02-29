
func int spell_logic_icewave(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_IceWave");
	if(manainvested >= SPL_SENDCAST_ICEWAVE)
	{
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

