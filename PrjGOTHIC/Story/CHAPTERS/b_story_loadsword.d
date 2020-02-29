
func void b_story_loadsword()
{
	var C_NPC milten;
	b_logentry(CH5_URIZIEL," сардас подготовил заклинание. “еперь мне нужно найти сильный источник магической энергии.   счастью, в колонии есть такой источник, а те, кто им владеет, наход€тс€ передо мной в долгу...");
	b_givexp(XP_RETURNEDFROMSUNKENTOWER);
	CreateInvItem(hero,scroll4milten);
	milten = Hlp_GetNpc(pc_mage);
	Npc_ExchangeRoutine(milten,"LSWait");
	LOADSWORD = TRUE;
};

