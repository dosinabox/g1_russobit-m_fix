
func int spell_logic_firestorm(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Firestorm");
	if((manainvested >= 1) && (manainvested < SPL_SENDCAST_FIRESTORM))
	{
		return SPL_NEXTLEVEL;
	};
	if(manainvested >= SPL_SENDCAST_FIRESTORM)
	{
		Npc_ChangeAttribute(self,ATR_MANA,+1);
		return SPL_SENDCAST;
	};
	Npc_ChangeAttribute(self,ATR_MANA,-1);
	return SPL_RECEIVEINVEST;
};

