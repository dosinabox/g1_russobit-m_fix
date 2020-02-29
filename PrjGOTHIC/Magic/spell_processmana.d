
func int spell_processmana(var int manainvested)
{
	printdebugnpc(PD_MAGIC,"Spell_ProcessMana called");
	printdebugint(PD_MAGIC,"### MAGIC ###-> invested Mana:",manainvested);
	printdebugint(PD_MAGIC,"### MAGIC ###-> Spell-Level:",Npc_GetActiveSpellLevel(self));
	if(Npc_GetActiveSpell(self) == SPL_LIGHT)
	{
		return spell_logic_light(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_FIREBOLT)
	{
		return spell_logic_firebolt(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_FIREBALL)
	{
		return spell_logic_fireball(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_FIRESTORM)
	{
		return spell_logic_firestorm(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_FIRERAIN)
	{
		return spell_logic_firerain(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORT1)
	{
		return spell_logic_teleport1(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORT2)
	{
		return spell_logic_teleport2(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORT3)
	{
		return spell_logic_teleport3(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORT4)
	{
		return spell_logic_teleport4(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORT5)
	{
		return spell_logic_teleport5(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_HEAL)
	{
		return spell_logic_heal(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TRF_BLOODFLY)
	{
		return spell_logic_trf_bloodfly(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TRF_CRAWLER)
	{
		return spell_logic_trf_crawler(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TRF_LURKER)
	{
		return spell_logic_trf_lurker(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TRF_MEATBUG)
	{
		return spell_logic_trf_meatbug(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TRF_MOLERAT)
	{
		return spell_logic_trf_molerat(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TRF_ORCDOG)
	{
		return spell_logic_trf_orcdog(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TRF_SCAVENGER)
	{
		return spell_logic_trf_scavenger(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TRF_SHADOWBEAST)
	{
		return spell_logic_trf_shadowbeast(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TRF_SNAPPER)
	{
		return spell_logic_trf_snapper(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TRF_WARAN)
	{
		return spell_logic_trf_waran(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TRF_WOLF)
	{
		return spell_logic_trf_wolf(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_CHAINLIGHTNING)
	{
		return spell_logic_chainlightning(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_THUNDERBOLT)
	{
		return spell_logic_thunderbolt(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_THUNDERBALL)
	{
		return spell_logic_thunderball(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_ICECUBE)
	{
		return spell_logic_icecube(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_ICEWAVE)
	{
		return spell_logic_icewave(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_SUMMONDEMON)
	{
		return spell_logic_summondemon(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_SUMMONSKELETON)
	{
		return spell_logic_summonskeleton(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_SUMMONGOLEM)
	{
		return spell_logic_summongolem(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_ARMYOFDARKNESS)
	{
		return spell_logic_armyofdarkness(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_MASSDEATH)
	{
		return spell_logic_massdeath(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_DESTROYUNDEAD)
	{
		return spell_logic_destroyundead(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_WINDFIST)
	{
		return spell_logic_windfist(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_STORMFIST)
	{
		return spell_logic_stormfist(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEKINESIS)
	{
		return spell_logic_telekinesis(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_CHARM)
	{
		return spell_logic_charm(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_SLEEP)
	{
		return spell_logic_sleep(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_PYROKINESIS)
	{
		return spell_logic_pyrokinesis(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_CONTROL)
	{
		return spell_logic_control(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_FEAR)
	{
		return spell_logic_fear(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_BERZERK)
	{
		return spell_logic_berzerk(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_BREATHOFDEATH)
	{
		return spell_logic_breathofdeath(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_NEW1)
	{
		return spell_logic_new1(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_SHRINK)
	{
		return spell_logic_shrink(manainvested);
	};
};

