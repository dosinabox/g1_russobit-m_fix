
func void zs_dead()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Dead");
	printglobals(PD_ZS_CHECK);
	c_zsinit();
	self.aivar[AIV_PLUNDERED] = FALSE;
	if(self.id == 251 && PLAYERINARENA == TRUE)
	{
		PLAYERINARENA = FALSE;
		Wld_SendTrigger("OC_ARENA_GATE");
		b_exchangeroutine(tpl_1422_gorhanis,"START");
		b_exchangeroutine(sld_729_kharim,"START");
	};
	if(self.id == 729 && PLAYERINARENA == TRUE)
	{
		PLAYERINARENA = FALSE;
		Wld_SendTrigger("OC_ARENA_GATE");
		b_exchangeroutine(tpl_1422_gorhanis,"START");
		b_exchangeroutine(grd_251_kirgo,"START");
	};
	if(self.id == 1422 && PLAYERINARENA == TRUE)
	{
		PLAYERINARENA = FALSE;
		Wld_SendTrigger("OC_ARENA_GATE");
		b_exchangeroutine(grd_251_kirgo,"START");
		b_exchangeroutine(sld_729_kharim,"START");
	};
	if(Npc_IsPlayer(self) && PLAYERINARENA == TRUE)
	{
		PLAYERINARENA = FALSE;
		Wld_SendTrigger("OC_ARENA_GATE");
		b_exchangeroutine(tpl_1422_gorhanis,"START");
		b_exchangeroutine(grd_251_kirgo,"START");
		b_exchangeroutine(sld_729_kharim,"START");
	};
	if(Npc_IsPlayer(other) || (c_npcishuman(other) && other.aivar[AIV_PARTYMEMBER]) || (c_npcismonster(other) && other.aivar[AIV_MOVINGMOB]))
	{
		b_deathxp();
	};
	if(c_npcismonster(self))
	{
		b_givedeathinv();
	};
	if(self.guild == GIL_ORCSHAMAN)
	{
		Npc_RemoveInvItem(self,itarrune_2_2_fireball);
	};
	b_checkdeadmissionnpcs();
	b_respawn(self);
};

