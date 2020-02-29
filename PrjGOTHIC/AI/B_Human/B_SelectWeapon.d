
func void b_fillquiver(var C_NPC slf)
{
	var int addedammo;
	var C_ITEM readiedweapon;
	printdebugnpc(PD_ZS_DETAIL,"B_FillQuiver");
	readiedweapon = Npc_GetReadiedWeapon(slf);
	if(readiedweapon.munition == itamarrow)
	{
		printdebugnpc(PD_ZS_DETAIL,"...aktive Waffe benutzt Pfeile!");
		addedammo = 20 - c_npchasammo(slf,itamarrow);
		CreateInvItems(slf,itamarrow,addedammo);
		printdebugint(PD_ZS_DETAIL,"...hinzugefügte Pfeile: ",addedammo);
	}
	else if(readiedweapon.munition == itambolt)
	{
		printdebugnpc(PD_ZS_DETAIL,"...aktive Waffe benutzt Bolzen!");
		addedammo = 20 - c_npchasammo(slf,itambolt);
		CreateInvItems(slf,itambolt,addedammo);
		printdebugint(PD_ZS_DETAIL,"...hinzugefügte Bolzen: ",addedammo);
	}
	else
	{
		printdebugnpc(PD_ZS_DETAIL,"...ERROR: aktive Waffe hat KEINE gültige Munitionsart!!!");
	};
};

func int b_equipanddrawbestmeleeweapon(var C_NPC slf)
{
	printdebugnpc(PD_ZS_FRAME,"B_EquipAndDrawBestMeleeWeapon");
	if(Npc_IsInFightMode(slf,FMODE_MAGIC))
	{
		printdebugnpc(PD_ZS_CHECK,"...vorher Zauber wegstecken!");
		AI_UnreadySpell(slf);
	};
	if(c_npchasweapon(slf,ITEM_KAT_NF))
	{
		if(!Npc_HasReadiedMeleeWeapon(slf))
		{
			printdebugnpc(PD_ZS_CHECK,"...noch keine Nahkampfwaffe gezogen!");
			AI_StopAim(slf);
			b_fullstop(slf);
			AI_RemoveWeapon(slf);
			AI_EquipBestMeleeWeapon(slf);
			AI_ReadyMeleeWeapon(slf);
		};
		return TRUE;
	};
	return FALSE;
};

func int b_equipanddrawbestrangedweapon(var C_NPC slf)
{
	printdebugnpc(PD_ZS_FRAME,"B_EquipAndDrawBestRangedWeapon");
	if(Npc_IsInFightMode(slf,FMODE_MAGIC))
	{
		printdebugnpc(PD_ZS_CHECK,"...vorher Zauber wegstecken!");
		AI_UnreadySpell(slf);
	};
	if(Npc_HasRangedWeaponWithAmmo(slf))
	{
		printdebugnpc(PD_ZS_CHECK,"...Fernkampfwaffe mit Ammo vorhanden!");
		if(!Npc_HasReadiedRangedWeapon(slf))
		{
			printdebugnpc(PD_ZS_CHECK,"...noch keine Fernkampfwaffe gezogen!");
			b_fullstop(slf);
			AI_RemoveWeapon(slf);
			AI_EquipBestRangedWeapon(slf);
			AI_ReadyRangedWeapon(slf);
		}
		else if(slf.fight_tactic == FAI_HUMAN_RANGED)
		{
			b_fillquiver(slf);
		};
		return TRUE;
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"...KEINE Fernkampfwaffe mit Ammo vorhanden!");
	};
	return FALSE;
};

func void b_drawspell(var C_NPC slf,var int spell,var int mana)
{
	var int manaleft;
	var int manamax;
	var int manarefill;
	printdebugnpc(PD_ZS_FRAME,"B_DrawSpell");
	if(Npc_IsInFightMode(slf,FMODE_MAGIC))
	{
		printdebugnpc(PD_ZS_CHECK,"...bereits im Magiemodus!");
		if(Npc_GetActiveSpell(slf) != spell)
		{
			printdebugnpc(PD_ZS_CHECK,"...dieser Zauber liegt noch nicht auf der Hand!");
			AI_UnreadySpell(slf);
		};
		AI_ReadySpell(slf,spell,mana);
	}
	else
	{
		if(Npc_IsInFightMode(slf,FMODE_MELEE) || Npc_IsInFightMode(slf,FMODE_FIST))
		{
			AI_RemoveWeapon(slf);
		};
		if(Npc_IsInFightMode(slf,FMODE_FAR))
		{
			AI_StopAim(slf);
			AI_RemoveWeapon(slf);
		};
		printdebugnpc(PD_ZS_CHECK,"...noch nicht im Magiemodus!");
		AI_ReadySpell(slf,spell,mana);
	};
	if(slf.fight_tactic == FAI_HUMAN_MAGE)
	{
		printdebugnpc(PD_ZS_CHECK,"...Magier-Kampftaktik!");
		manaleft = slf.attribute[ATR_MANA];
		manamax = slf.attribute[ATR_MANA_MAX];
		if(manaleft < (manamax / 2))
		{
			printdebugint(PD_ZS_CHECK,"...Mana übrig: ",manaleft);
			manarefill = (manamax / 2) - manaleft;
			Npc_ChangeAttribute(slf,ATR_MANA,manarefill);
			printdebugint(PD_ZS_CHECK,"...Mana hinzugefügt: ",manarefill);
		};
	};
};

func void b_selectweapon(var C_NPC slf,var C_NPC oth)
{
	printdebugnpc(PD_ZS_FRAME,"B_SelectWeapon");
	if((slf.fight_tactic == FAI_HUMAN_MAGE) && (slf.attribute[ATR_MANA] > 0))
	{
		printdebugnpc(PD_ZS_CHECK,"...NSC ist ein Magier!");
		if(c_npchasspell(slf,SPL_SUMMONDEMON) && (Npc_GetDistToNpc(slf,oth) > 1200))
		{
			printdebugnpc(PD_ZS_CHECK,"...Summon Demon!");
			Npc_PerceiveAll(slf);
			if(!Wld_DetectNpc(slf,summonedbynpc_demon,zs_mm_attack,GIL_DEMON))
			{
				b_drawspell(slf,SPL_SUMMONDEMON,SPL_SENDCAST_SUMMONDEMON);
				return;
			}
			else
			{
				printdebugnpc(PD_ZS_CHECK,"...gibt aber schon einen!");
			};
		};
		if(c_npchasspell(slf,SPL_SUMMONGOLEM) && (Npc_GetDistToNpc(slf,oth) > 1000))
		{
			printdebugnpc(PD_ZS_CHECK,"...Summon Golem!");
			Npc_PerceiveAll(slf);
			if(!Wld_DetectNpc(slf,summonedbynpc_stonegolem,zs_mm_attack,GIL_GOLEM))
			{
				b_drawspell(slf,SPL_SUMMONGOLEM,SPL_SENDCAST_SUMMONGOLEM);
				return;
			}
			else
			{
				printdebugnpc(PD_ZS_CHECK,"...gibt aber schon einen!");
			};
		};
		if(c_npchasspell(slf,SPL_SUMMONSKELETON) && (Npc_GetDistToNpc(slf,oth) > 800))
		{
			printdebugnpc(PD_ZS_CHECK,"...Summon Skeleton!");
			Npc_PerceiveAll(slf);
			if(!Wld_DetectNpc(slf,summonedbynpc_skeleton,zs_mm_attack,GIL_SKELETON))
			{
				b_drawspell(slf,SPL_SUMMONSKELETON,SPL_SENDCAST_SUMMONSKELETON);
				return;
			}
			else
			{
				printdebugnpc(PD_ZS_CHECK,"...gibt aber schon welche!");
			};
		};
		if(c_npchasspell(slf,SPL_ICECUBE) && !Npc_IsInState(oth,zs_magicfreeze))
		{
			printdebugnpc(PD_ZS_CHECK,"...Icecube!");
			b_drawspell(slf,SPL_ICECUBE,SPL_SENDCAST_ICECUBE);
			return;
		}
		else if(c_npchasspell(slf,SPL_ICECUBE) && c_npcismonstermage(slf) && (Npc_GetDistToNpc(slf,oth) < SPL_RANGE_ICEATTACK) && !Npc_IsInState(oth,zs_magicfreeze))
		{
			printdebugnpc(PD_ZS_CHECK,"...Ice-Attack von Monstern!");
			b_drawspell(slf,SPL_ICECUBE,SPL_SENDCAST_ICECUBE);
			return;
		}
		else if(c_npchasspell(slf,SPL_CHAINLIGHTNING) && (Npc_GetDistToNpc(slf,oth) < SPL_RANGE_CHAINLIGHTNING))
		{
			printdebugnpc(PD_ZS_CHECK,"...Chainlightning!");
			b_drawspell(slf,SPL_CHAINLIGHTNING,1);
			return;
		}
		else if(c_npchasspell(slf,SPL_SLEEP) && !Npc_IsInState(oth,zs_magicsleep) && (Npc_GetDistToNpc(slf,oth) < SPL_RANGE_SLEEP))
		{
			printdebugnpc(PD_ZS_CHECK,"...Schlaf!");
			b_drawspell(slf,SPL_SLEEP,SPL_SENDCAST_SLEEP);
			return;
		}
		else if(c_npchasspell(slf,SPL_WINDFIST) && (Npc_GetDistToNpc(slf,oth) < SPL_RANGE_WINDFIST))
		{
			printdebugnpc(PD_ZS_CHECK,"...Windfist!");
			if((Npc_GetDistToNpc(slf,oth) > SPL_RANGE_WINDFIST) && (slf.attribute[ATR_MANA] >= SPL_SENDCAST_WINDFIST))
			{
				printdebugnpc(PD_ZS_CHECK,"...großer!");
				b_drawspell(slf,SPL_WINDFIST,SPL_SENDCAST_WINDFIST);
			}
			else if((Npc_GetDistToNpc(slf,oth) > (SPL_RANGE_WINDFIST / 2)) && (slf.attribute[ATR_MANA] >= (SPL_SENDCAST_WINDFIST / 2)))
			{
				printdebugnpc(PD_ZS_CHECK,"...mittlerer!");
				b_drawspell(slf,SPL_WINDFIST,SPL_SENDCAST_WINDFIST / 2);
			}
			else
			{
				printdebugnpc(PD_ZS_CHECK,"...kleiner!");
				b_drawspell(slf,SPL_WINDFIST,1);
			};
			return;
		}
		else if(c_npchasspell(slf,SPL_FIREBALL))
		{
			printdebugnpc(PD_ZS_CHECK,"...Fireball!");
			if((Npc_GetDistToNpc(slf,oth) > 1500) && (slf.attribute[ATR_MANA] >= SPL_SENDCAST_FIREBALL))
			{
				printdebugnpc(PD_ZS_CHECK,"...großer!");
				b_drawspell(slf,SPL_FIREBALL,SPL_SENDCAST_FIREBALL);
			}
			else if((Npc_GetDistToNpc(slf,oth) > 800) && (slf.attribute[ATR_MANA] >= (SPL_SENDCAST_FIREBALL / 2)))
			{
				printdebugnpc(PD_ZS_CHECK,"...mittlerer!");
				b_drawspell(slf,SPL_FIREBALL,SPL_SENDCAST_FIREBALL / 2);
			}
			else
			{
				printdebugnpc(PD_ZS_CHECK,"...kleiner!");
				b_drawspell(slf,SPL_FIREBALL,1);
			};
			return;
		}
		else if(c_npchasspell(slf,SPL_FIRESTORM))
		{
			printdebugnpc(PD_ZS_CHECK,"...Fireball!");
			if((Npc_GetDistToNpc(slf,oth) > 1500) && (slf.attribute[ATR_MANA] >= SPL_SENDCAST_FIRESTORM))
			{
				printdebugnpc(PD_ZS_CHECK,"...großer!");
				b_drawspell(slf,SPL_FIRESTORM,SPL_SENDCAST_FIREBALL);
			}
			else if((Npc_GetDistToNpc(slf,oth) > 800) && (slf.attribute[ATR_MANA] >= (SPL_SENDCAST_FIRESTORM / 2)))
			{
				printdebugnpc(PD_ZS_CHECK,"...mittlerer!");
				b_drawspell(slf,SPL_FIRESTORM,SPL_SENDCAST_FIRESTORM / 2);
			}
			else
			{
				printdebugnpc(PD_ZS_CHECK,"...kleiner!");
				b_drawspell(slf,SPL_FIRESTORM,1);
			};
			return;
		}
		else if(c_npchasspell(slf,SPL_FIREBOLT))
		{
			printdebugnpc(PD_ZS_CHECK,"...Firebolt!");
			b_drawspell(slf,SPL_FIREBOLT,SPL_SENDCAST_FIREBOLT);
			return;
		}
		else if(c_npchasspell(slf,SPL_THUNDERBALL))
		{
			printdebugnpc(PD_ZS_CHECK,"...Thunderball!");
			if((Npc_GetDistToNpc(slf,oth) > 1500) && (slf.attribute[ATR_MANA] >= SPL_SENDCAST_THUNDERBALL))
			{
				printdebugnpc(PD_ZS_CHECK,"...großer!");
				b_drawspell(slf,SPL_THUNDERBALL,SPL_SENDCAST_THUNDERBALL);
			}
			else if((Npc_GetDistToNpc(slf,oth) > 800) && (slf.attribute[ATR_MANA] >= (SPL_SENDCAST_THUNDERBALL / 2)))
			{
				printdebugnpc(PD_ZS_CHECK,"...mittlerer!");
				b_drawspell(slf,SPL_THUNDERBALL,SPL_SENDCAST_THUNDERBALL / 2);
			}
			else
			{
				printdebugnpc(PD_ZS_CHECK,"...kleiner!");
				b_drawspell(slf,SPL_THUNDERBALL,1);
			};
			return;
		}
		else if(c_npchasspell(slf,SPL_THUNDERBOLT))
		{
			printdebugnpc(PD_ZS_CHECK,"...Thundebolt!");
			b_drawspell(slf,SPL_THUNDERBOLT,SPL_SENDCAST_THUNDERBOLT);
			return;
		}
		else if(c_npchasspell(slf,SPL_PYROKINESIS))
		{
			printdebugnpc(PD_ZS_CHECK,"...Pyrokinesis!");
			b_drawspell(slf,SPL_PYROKINESIS,10);
			return;
		}
		else if(c_npchasspell(slf,SPL_BREATHOFDEATH))
		{
			printdebugnpc(PD_ZS_CHECK,"...Breath of Death!");
			b_drawspell(slf,SPL_BREATHOFDEATH,SPL_SENDCAST_BREATHOFDEATH);
			return;
		};
	};
	printdebugnpc(PD_ZS_CHECK,"...Waffenbasierte Kampftaktik!");
	if((Npc_GetDistToNpc(slf,oth) < HAI_DIST_MELEE) && (slf.fight_tactic != FAI_HUMAN_RANGED))
	{
		printdebugnpc(PD_ZS_CHECK,"...Gegner in Nahkampfreichweite & kein purer Fernkämpfer!");
		if(b_equipanddrawbestmeleeweapon(slf))
		{
			return;
		};
		printdebugnpc(PD_ZS_CHECK,"...keine Nahkampfwaffe im Inv -> Faustkampf!");
		AI_ReadyMeleeWeapon(slf);
		return;
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"...Gegner in Fernkampfreichweite oder NSC ist ein purer Fernkämpfer!");
		if(b_equipanddrawbestrangedweapon(slf))
		{
			return;
		};
		if(b_equipanddrawbestmeleeweapon(slf))
		{
			return;
		};
		if(!b_fetchweapon())
		{
			printdebugnpc(PD_ZS_CHECK,"...keine Waffe gefunden -> Faustkampf!");
			AI_ReadyMeleeWeapon(slf);
			return;
		};
	};
};

