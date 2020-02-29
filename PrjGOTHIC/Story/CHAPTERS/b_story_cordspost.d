
func void b_story_cordspost()
{
	var C_NPC gorn;
	gorn = Hlp_GetNpc(pc_fighter);
	Npc_ExchangeRoutine(gorn,"GuardNC");
	b_exchangeroutine(sld_709_cord,"FMTaken");
	b_exchangeroutine(sld_735_soeldner,"FMTaken");
	b_exchangeroutine(sld_736_soeldner,"FMTaken");
};

