
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
	}
	else
	{
		return 0;
	};
};

