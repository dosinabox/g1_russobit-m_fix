
func void b_story_friendofurshak()
{
	var C_NPC urshak;
	CreateInvItem(hero,itmi_orctalisman);
	urshak = Hlp_GetNpc(orc_2200_shaman);
	urshak.name[0] = "г№-иръ";
	FRIENDOFURSHAK = TRUE;
};

