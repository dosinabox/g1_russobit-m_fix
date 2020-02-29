
func int c_wantitem()
{
	var int itemvalue;
	var int levelbewertung;
	var int selfguild;
	var int bodyguild;
	var int itemguild;
	printdebugnpc(PD_ZS_DETAIL,"C_WantItem");
	itemvalue = item.value;
	levelbewertung = self.level * 10;
	selfguild = Npc_GetTrueGuild(self);
	bodyguild = Npc_GetTrueGuild(other);
	itemguild = item.ownerguild;
	if(Hlp_IsValidItem(item))
	{
		printdebugstring(PD_ZS_DETAIL,"...'item':",item.name);
		if(Npc_OwnedByNpc(item,self) || Npc_OwnedByGuild(item,selfguild))
		{
			printdebugnpc(PD_ZS_DETAIL,"...'item' gehört NSC oder seiner Gilde -> JA!");
			return TRUE;
		};
		if(item.flags == ITEM_MISSION)
		{
			printdebugnpc(PD_ZS_DETAIL,"...'item' ist Missionsgegenstand -> NEIN!");
			return FALSE;
		}
		else if((item.mainflag == ITEM_KAT_ARMOR) && ((bodyguild == itemguild) || (selfguild != itemguild)))
		{
			printdebugnpc(PD_ZS_DETAIL,"...'item' ist Rüstung und geht micht nichts an -> NEIN!");
			return FALSE;
		}
		else if((item.mainflag == ITEM_KAT_RUNE) && !c_npcismage(self))
		{
			printdebugnpc(PD_ZS_DETAIL,"...'item' ist eine Rune/Scroll und Nsc ist kein Magier -> NEIN!");
			return FALSE;
		}
		else if(Hlp_IsItem(item,itminugget))
		{
			printdebugnpc(PD_ZS_DETAIL,"...'item' ist Erz -> JA!");
			return TRUE;
		}
		else
		{
			printdebugint(PD_ZS_DETAIL,"...itemvalue:",itemvalue);
			printdebugint(PD_ZS_DETAIL,"...levelbewertung:",levelbewertung);
			if(itemvalue > levelbewertung)
			{
				printdebugnpc(PD_ZS_DETAIL,"...'item' ist wertvoll genug um interessant zu sein -> JA!");
				return TRUE;
			}
			else
			{
				printdebugnpc(PD_ZS_DETAIL,"...'item' ist zu billig -> NEIN!");
				return FALSE;
			};
		};
	}
	else
	{
		printdebugnpc(PD_ZS_DETAIL,"...'item' ist ungültig -> NEIN!");
		return FALSE;
	};
};

