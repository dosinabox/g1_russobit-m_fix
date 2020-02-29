
func int spell_processmana_release(var int manainvested)
{
	if(Npc_GetActiveSpell(self) == SPL_FIREBALL)
	{
		return SPL_SENDCAST;
	};
	if(Npc_GetActiveSpell(self) == SPL_FIRESTORM)
	{
		return SPL_SENDCAST;
	};
	if(Npc_GetActiveSpell(self) == SPL_THUNDERBALL)
	{
		return SPL_SENDCAST;
	};
	if(Npc_GetActiveSpell(self) == SPL_WINDFIST)
	{
		return SPL_SENDCAST;
	};
	if(Npc_GetActiveSpell(self) == SPL_STORMFIST)
	{
		return SPL_SENDCAST;
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEKINESIS)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_HEAL)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_CHAINLIGHTNING)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_PYROKINESIS)
	{
		Npc_SendSinglePerc(self,other,PERC_ASSESSSTOPMAGIC);
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_LIGHT)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_FIREBOLT)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_FIRERAIN)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_THUNDERBOLT)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_BREATHOFDEATH)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_NEW1)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORT1)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORT2)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORT3)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORT4)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORT5)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_TRF_BLOODFLY)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_TRF_CRAWLER)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_TRF_LURKER)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_TRF_MEATBUG)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_TRF_MOLERAT)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_TRF_ORCDOG)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_TRF_SCAVENGER)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_TRF_SHADOWBEAST)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_TRF_SNAPPER)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_TRF_WARAN)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_TRF_WOLF)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_ICECUBE)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_ICEWAVE)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_SUMMONDEMON)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_SUMMONSKELETON)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_SUMMONGOLEM)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_ARMYOFDARKNESS)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_DESTROYUNDEAD)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_CHARM)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_SLEEP)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_CONTROL)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_BERZERK)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_SHRINK)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_MASSDEATH)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpell(self) == SPL_FEAR)
	{
		return SPL_SENDSTOP;
	};
	return SPL_SENDSTOP;
};

