
func void b_drawweapon(var C_NPC slf,var C_NPC oth)
{
	printdebugnpc(PD_ZS_DETAIL,"B_DrawWeapon");
	b_selectweapon(slf,oth);
};

func void b_removeweapon(var C_NPC slf)
{
	printdebugnpc(PD_ZS_DETAIL,"B_RemoveWeapon");
	if(Npc_IsInFightMode(slf,FMODE_MAGIC))
	{
		printdebugnpc(PD_ZS_DETAIL,"... Zauber wegstecken!");
		AI_UnreadySpell(slf);
	}
	else if(Npc_HasReadiedMeleeWeapon(slf))
	{
		printdebugnpc(PD_ZS_DETAIL,"...Nahkampfwaffe gezogen!");
		AI_RemoveWeapon(slf);
	}
	else if(Npc_HasReadiedRangedWeapon(slf))
	{
		printdebugnpc(PD_ZS_DETAIL,"...Nahkampfwaffe gezogen!");
		AI_StopAim(slf);
		AI_RemoveWeapon(slf);
	}
	else
	{
		printdebugnpc(PD_ZS_DETAIL,"...nur Fäuste 'gezogen'!");
		AI_RemoveWeapon(slf);
	};
};

