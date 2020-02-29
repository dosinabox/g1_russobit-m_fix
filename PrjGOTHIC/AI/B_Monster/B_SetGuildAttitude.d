
func void b_setguildattitude(var int fromguild,var int attitude,var int toguild)
{
	if(toguild == GIL_SEPERATOR_HUM)
	{
		Wld_SetGuildAttitude(fromguild,attitude,GIL_NONE);
		Wld_SetGuildAttitude(fromguild,attitude,GIL_EBR);
		Wld_SetGuildAttitude(fromguild,attitude,GIL_SLD);
		Wld_SetGuildAttitude(fromguild,attitude,GIL_STT);
		Wld_SetGuildAttitude(fromguild,attitude,GIL_KDF);
		Wld_SetGuildAttitude(fromguild,attitude,GIL_VLK);
		Wld_SetGuildAttitude(fromguild,attitude,GIL_KDW);
		Wld_SetGuildAttitude(fromguild,attitude,GIL_GRD);
		Wld_SetGuildAttitude(fromguild,attitude,GIL_ORG);
		Wld_SetGuildAttitude(fromguild,attitude,GIL_BAU);
		Wld_SetGuildAttitude(fromguild,attitude,GIL_SFB);
		Wld_SetGuildAttitude(fromguild,attitude,GIL_GUR);
		Wld_SetGuildAttitude(fromguild,attitude,GIL_NOV);
		Wld_SetGuildAttitude(fromguild,attitude,GIL_TPL);
		Wld_SetGuildAttitude(fromguild,attitude,GIL_DMB);
		Wld_SetGuildAttitude(fromguild,attitude,GIL_BAB);
	}
	else if(fromguild == GIL_SEPERATOR_HUM)
	{
		Wld_SetGuildAttitude(GIL_NONE,attitude,toguild);
		Wld_SetGuildAttitude(GIL_EBR,attitude,toguild);
		Wld_SetGuildAttitude(GIL_SLD,attitude,toguild);
		Wld_SetGuildAttitude(GIL_STT,attitude,toguild);
		Wld_SetGuildAttitude(GIL_KDF,attitude,toguild);
		Wld_SetGuildAttitude(GIL_VLK,attitude,toguild);
		Wld_SetGuildAttitude(GIL_KDW,attitude,toguild);
		Wld_SetGuildAttitude(GIL_GRD,attitude,toguild);
		Wld_SetGuildAttitude(GIL_ORG,attitude,toguild);
		Wld_SetGuildAttitude(GIL_BAU,attitude,toguild);
		Wld_SetGuildAttitude(GIL_SFB,attitude,toguild);
		Wld_SetGuildAttitude(GIL_GUR,attitude,toguild);
		Wld_SetGuildAttitude(GIL_NOV,attitude,toguild);
		Wld_SetGuildAttitude(GIL_TPL,attitude,toguild);
		Wld_SetGuildAttitude(GIL_DMB,attitude,toguild);
		Wld_SetGuildAttitude(GIL_BAB,attitude,toguild);
	}
	else
	{
		Wld_SetGuildAttitude(fromguild,attitude,toguild);
	};
};

