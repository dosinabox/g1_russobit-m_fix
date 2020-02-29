
func void zs_dead()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Dead");
	printglobals(PD_ZS_CHECK);
	c_zsinit();
	self.aivar[AIV_PLUNDERED] = FALSE;
	if(Npc_IsPlayer(other) || (c_npcishuman(other) && other.aivar[AIV_PARTYMEMBER]) || (c_npcismonster(other) && other.aivar[AIV_MOVINGMOB]))
	{
		b_deathxp();
	};
	if(c_npcismonster(self))
	{
		b_givedeathinv();
	};
	b_checkdeadmissionnpcs();
	b_respawn(self);
};

