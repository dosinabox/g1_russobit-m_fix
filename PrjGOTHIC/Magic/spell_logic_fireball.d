
func int spell_logic_fireball(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Fireball");
	if((manainvested >= 1) && (manainvested < SPL_SENDCAST_FIREBALL))
	{
		return SPL_NEXTLEVEL;
	};
	if(manainvested >= SPL_SENDCAST_FIREBALL)
	{
		Npc_ChangeAttribute(self,ATR_MANA,+1);
		return SPL_SENDCAST;
	};
	Npc_ChangeAttribute(self,ATR_MANA,-1);
	return SPL_RECEIVEINVEST;
};

