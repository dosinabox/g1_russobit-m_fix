
func int spell_logic_sleep(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Sleep");
	if(c_npcishuman(other))
	{
		if(manainvested >= SPL_SENDCAST_SLEEP)
		{
			AI_StartState(other,zs_magicsleep,0,"");
			return SPL_SENDCAST;
		};
		return SPL_RECEIVEINVEST;
	};
	return SPL_DONTINVEST;
};

