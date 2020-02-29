
func int c_pcisinmyroom()
{
	var C_NPC owner;
	var int portalowner;
	printdebugnpc(PD_ZS_FRAME,"C_PCIsInMyRoom");
	owner = Wld_GetPlayerPortalOwner();
	portalowner = Wld_GetPlayerPortalGuild();
	if((self == owner) || (Wld_GetGuildAttitude(self.guild,portalowner) == ATT_FRIENDLY))
	{
		return 1;
	};
	return 0;
};

func int c_pcinmyroomisthief()
{
	var C_NPC portalowner;
	var int portalownerguild;
	printdebugnpc(PD_ZS_FRAME,"C_PCInMyRoomIsThief");
	portalowner = Wld_GetPlayerPortalOwner();
	portalownerguild = Wld_GetPlayerPortalGuild();
	if(Npc_CanSeeNpcFreeLOS(self,hero))
	{
		if((self == portalowner) || (Wld_GetGuildAttitude(self.guild,portalownerguild) == ATT_FRIENDLY))
		{
			if((Wld_GetGuildAttitude(hero.guild,portalownerguild) != ATT_FRIENDLY) && (self.npctype != NPCTYPE_FRIEND) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (portalownerguild != GIL_NONE))
			{
				return 1;
			};
			if((portalownerguild == GIL_EBR) && (hero.guild != GIL_GRD) && (hero.guild != GIL_KDF))
			{
				return 1;
			};
		};
	};
	return 0;
};
