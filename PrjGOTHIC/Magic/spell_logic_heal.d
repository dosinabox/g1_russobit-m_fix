
func int spell_logic_heal(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_Logic_Heal");
	if(self.attribute[ATR_HITPOINTS] == self.attribute[ATR_HITPOINTS_MAX])
	{
		return SPL_SENDSTOP;
	}
	else if(manainvested >= 1)
	{
		if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_HEALING_HP_PER_MP);
			return SPL_NEXTLEVEL;
		};
	};
	return SPL_RECEIVEINVEST;
};

