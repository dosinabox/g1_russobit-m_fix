
func int c_amistronger(var C_NPC slf,var C_NPC oth)
{
	printdebugnpc(PD_ZS_DETAIL,"C_AmIStronger");
	if((2 * slf.level) > oth.level)
	{
		printdebugnpc(PD_ZS_DETAIL,"...yes");
		return TRUE;
	}
	else
	{
		printdebugnpc(PD_ZS_DETAIL,"...no");
	};
	return FALSE;
};

func int c_amiweaker(var C_NPC slf,var C_NPC oth)
{
	printdebugnpc(PD_ZS_DETAIL,"C_AmIWeaker");
	if((2 * slf.level) <= oth.level)
	{
		if(self.guild == GIL_ORCSCOUT || self.guild == GIL_ORCWARRIOR)
		{
			return FALSE;
		}
		if(self.id == 1303)
		{
			return FALSE;
		}
		else if(self.id == 844)
		{
			return FALSE;
		}
		else if(self.id == 336)
		{
			return FALSE;
		}
		else if(self.id == 337)
		{
			return FALSE;
		}
		else if(self.id == 338)
		{
			return FALSE;
		}
		else if(self.id == 246)
		{
			return FALSE;
		}
		else if(self.id == 284)
		{
			return FALSE;
		}
		else if(self.id == 286)
		{
			return FALSE;
		}
		else if(self.id == 287)
		{
			return FALSE;
		}
		else if(self.id == 288)
		{
			return FALSE;
		}
		else if(self.id == 289)
		{
			return FALSE;
		}
		else if(self.id == 290)
		{
			return FALSE;
		}
		else if(self.id == 291)
		{
			return FALSE;
		}
		else if(self.id == 292)
		{
			return FALSE;
		}
		else if(self.id == 293)
		{
			return FALSE;
		}
		else if(self.id == 294)
		{
			return FALSE;
		}
		else if(self.id == 295)
		{
			return FALSE;
		}
		else if(self.id == 296)
		{
			return FALSE;
		}
		else if(self.id == 297)
		{
			return FALSE;
		}
		else if(self.id == 298)
		{
			return FALSE;
		}
		else if(self.id == 299)
		{
			return FALSE;
		}
		else if(self.id == 1490)
		{
			return FALSE;
		}
		else if(self.id == 1333)
		{
			return FALSE;
		}
		else if(self.id == 251)
		{
			return FALSE;
		}
		else if(self.id == 729)
		{
			return FALSE;
		}
		else if(self.id == 1422)
		{
			return FALSE;
		}
		else
		{
			printdebugnpc(PD_ZS_DETAIL,"...yes");
			return TRUE;
		};
	}
	else
	{
		printdebugnpc(PD_ZS_DETAIL,"...no");
	};
	return FALSE;
};

func int c_npcisinfightmode(var C_NPC oth)
{
	printdebugnpc(PD_ZS_CHECK,"C_NpcIsInFightMode");
	if(Npc_IsInFightMode(oth,FMODE_FAR) || Npc_IsInFightMode(oth,FMODE_MELEE) || Npc_IsInFightMode(oth,FMODE_FIST))
	{
		printdebugnpc(PD_ZS_CHECK,"...true");
		return TRUE;
	}
	else if(Npc_IsInFightMode(oth,FMODE_MAGIC))
	{
		if(Npc_GetActiveSpellCat(oth) == SPELL_BAD)
		{
			printdebugnpc(PD_ZS_CHECK,"...true");
			return TRUE;
		}
		else if((Npc_IsInState(self,zs_guardpassage) || Npc_WasInState(self,zs_guardpassage)) && ((Npc_GetActiveSpell(oth) == SPL_SLEEP) || (Npc_GetActiveSpell(oth) == SPL_CHARM)))
		{
			printdebugnpc(PD_ZS_CHECK,"...true");
			return TRUE;
		};
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"...false");
	};
	return FALSE;
};

func int c_npcisinneutralspellmode(var C_NPC oth)
{
	printdebugnpc(PD_ZS_CHECK,"C_NpcIsInNeutralSpellMode");
	if(Npc_IsInFightMode(oth,FMODE_MAGIC) && ((Npc_GetActiveSpellCat(oth) == SPELL_GOOD) || (Npc_GetActiveSpellCat(oth) == SPELL_NEUTRAL)))
	{
		printdebugnpc(PD_ZS_CHECK,"...true");
		return TRUE;
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"...false");
	};
	return FALSE;
};

func int c_npcisdown(var C_NPC slf)
{
	printdebugnpc(PD_ZS_DETAIL,"C_NpcIsDown");
	if(Npc_IsInState(slf,zs_unconscious) || Npc_IsInState(slf,zs_magicsleep) || Npc_IsDead(slf))
	{
		printdebugnpc(PD_ZS_DETAIL,"...true");
		return TRUE;
	}
	else
	{
		printdebugnpc(PD_ZS_DETAIL,"...false");
	};
	return FALSE;
};

func int c_npcishuman(var C_NPC slf)
{
	printdebugnpc(PD_ZS_DETAIL,"C_NpcIsHuman");
	printdebugstring(PD_ZS_DETAIL,"...name: ",slf.name);
	if(slf.guild < GIL_SEPERATOR_HUM)
	{
		printdebugnpc(PD_ZS_DETAIL,"...true");
		return TRUE;
	}
	else
	{
		printdebugnpc(PD_ZS_DETAIL,"...false");
	};
	return FALSE;
};

func int c_npcismonster(var C_NPC slf)
{
	printdebugnpc(PD_ZS_DETAIL,"C_NpcIsMonster");
	printdebugstring(PD_ZS_DETAIL,"...name: ",slf.name);
	if((slf.guild > GIL_SEPERATOR_HUM) && (slf.guild < GIL_SEPERATOR_ORC))
	{
		printdebugnpc(PD_ZS_DETAIL,"...true");
		return TRUE;
	}
	else
	{
		printdebugnpc(PD_ZS_DETAIL,"...false");
	};
	return FALSE;
};

func int c_npcisdangerousmonster(var C_NPC slf,var C_NPC oth)
{
	printdebugnpc(PD_ZS_DETAIL,"C_NpcIsDangerousMonster");
	if(c_npcismonster(oth) && (Wld_GetGuildAttitude(oth.guild,slf.guild) == ATT_HOSTILE) && !oth.aivar[AIV_MOVINGMOB] && !c_npcisdown(oth))
	{
		printdebugnpc(PD_ZS_DETAIL,"...true");
		return TRUE;
	};
	printdebugnpc(PD_ZS_DETAIL,"...false");
	return FALSE;
};

func int c_npcisorc(var C_NPC slf)
{
	printdebugnpc(PD_ZS_DETAIL,"C_NpcIsOrc");
	if(slf.guild > GIL_SEPERATOR_ORC)
	{
		printdebugnpc(PD_ZS_DETAIL,"...true");
		return TRUE;
	}
	else
	{
		printdebugnpc(PD_ZS_DETAIL,"...false");
	};
	return FALSE;
};

func int c_npcismonstermage(var C_NPC slf)
{
	printdebugnpc(PD_ZS_DETAIL,"C_NpcIsMonsterMage");
	if((slf.fight_tactic == FAI_HUMAN_MAGE) && ((slf.guild == GIL_DEMON) || (slf.guild == GIL_ORCSHAMAN) || (slf.guild == GIL_UNDEADORC) || (slf.guild == GIL_GOLEM)))
	{
		printdebugnpc(PD_ZS_DETAIL,"...true");
		return TRUE;
	}
	else
	{
		printdebugnpc(PD_ZS_DETAIL,"...false");
	};
	return FALSE;
};

func void npc_setpermattitude(var C_NPC slf,var int att)
{
	printdebugnpc(PD_ZS_DETAIL,"Npc_SetPermAttitude()");
	Npc_SetAttitude(slf,att);
	Npc_SetTempAttitude(slf,att);
};

func int npc_gettempattitude(var C_NPC slf,var C_NPC oth)
{
	printdebugnpc(PD_ZS_DETAIL,"Npc_GetTempAttitude()");
	return Npc_GetAttitude(slf,oth);
};

func int c_bodystatecontains(var C_NPC slf,var int bodystate)
{
	printdebugnpc(PD_ZS_DETAIL,"C_BodyStateContains()");
	printdebugint(PD_ZS_DETAIL,"bodystate: ",bodystate);
	printdebugint(PD_ZS_DETAIL,"bodystate&(BS_MAX|BS_FLAG_INTERRUPTABLE|BS_FLAG_FREEHANDS): ",bodystate & (BS_MAX | BS_FLAG_INTERRUPTABLE | BS_FLAG_FREEHANDS));
	printdebugint(PD_ZS_DETAIL,"Npc_GetBodyState(slf): ",Npc_GetBodyState(slf));
	printdebugint(PD_ZS_DETAIL,"Npc_GetBodyState(slf)&(BS_MAX|BS_FLAG_INTERRUPTABLE|BS_FLAG_FREEHANDS): ",Npc_GetBodyState(slf) & (BS_MAX | BS_FLAG_INTERRUPTABLE | BS_FLAG_FREEHANDS));
	if((Npc_GetBodyState(slf) & (BS_MAX | BS_FLAG_INTERRUPTABLE | BS_FLAG_FREEHANDS)) == (bodystate & (BS_MAX | BS_FLAG_INTERRUPTABLE | BS_FLAG_FREEHANDS)))
	{
		printdebugnpc(PD_ZS_DETAIL,"...true");
		return TRUE;
	}
	else
	{
		printdebugnpc(PD_ZS_DETAIL,"...false");
	};
	return FALSE;
};

func int c_npctypeisfriend(var C_NPC slf,var C_NPC oth)
{
	printdebugnpc(PD_ZS_DETAIL,"C_NpcTypeIsFriend()");
	if(Npc_IsPlayer(oth) && (slf.npctype == NPCTYPE_FRIEND))
	{
		printdebugnpc(PD_ZS_DETAIL,"...true");
		return TRUE;
	}
	else
	{
		printdebugnpc(PD_ZS_DETAIL,"...false");
	};
	return FALSE;
};

func int c_npcisguard(var C_NPC slf)
{
	printdebugnpc(PD_ZS_DETAIL,"C_NpcIsGuard");
	if((slf.npctype == NPCTYPE_GUARD) || (slf.npctype == NPCTYPE_OW_GUARD) || (slf.npctype == NPCTYPE_MINE_GUARD) || (((slf.npctype == NPCTYPE_MAIN) || (slf.npctype == NPCTYPE_FRIEND)) && ((slf.guild == GIL_GRD) || (slf.guild == GIL_SLD) || (slf.guild == GIL_TPL))))
	{
		if(slf.fight_tactic != FAI_HUMAN_RANGED)
		{
			printdebugnpc(PD_ZS_DETAIL,"...true!");
			return TRUE;
		};
	};
	printdebugnpc(PD_ZS_DETAIL,"...false!");
	return FALSE;
};

func int c_npcisguardarcher(var C_NPC slf)
{
	printdebugnpc(PD_ZS_DETAIL,"C_NpcIsGuardArcher");
	if((slf.npctype == NPCTYPE_GUARD) || (slf.npctype == NPCTYPE_OW_GUARD) || (slf.npctype == NPCTYPE_MINE_GUARD) || (((slf.npctype == NPCTYPE_MAIN) || (slf.npctype == NPCTYPE_FRIEND)) && ((slf.guild == GIL_GRD) || (slf.guild == GIL_SLD) || (slf.guild == GIL_TPL))))
	{
		if(slf.fight_tactic == FAI_HUMAN_RANGED)
		{
			printdebugnpc(PD_ZS_DETAIL,"...true!");
			return TRUE;
		};
	};
	printdebugnpc(PD_ZS_DETAIL,"...false!");
	return FALSE;
};

func int c_npcisboss(var C_NPC slf)
{
	printdebugnpc(PD_ZS_DETAIL,"C_NpcIsBoss");
	if((slf.guild == GIL_EBR) || (slf.guild == GIL_KDF) || (slf.guild == GIL_KDW) || (slf.guild == GIL_GUR))
	{
		printdebugnpc(PD_ZS_DETAIL,"...true");
		return TRUE;
	}
	else
	{
		printdebugnpc(PD_ZS_DETAIL,"...false");
	};
	return FALSE;
};

func int c_npcisworker(var C_NPC slf)
{
	printdebugnpc(PD_ZS_DETAIL,"C_NpcIsWorker");
	if((slf.guild == GIL_VLK) || (slf.guild == GIL_STT) || (slf.guild == GIL_BAU) || (slf.guild == GIL_SFB) || (slf.guild == GIL_ORG) || (slf.guild == GIL_NOV))
	{
		printdebugnpc(PD_ZS_DETAIL,"...true");
		return TRUE;
	}
	else
	{
		printdebugnpc(PD_ZS_DETAIL,"...false");
	};
	return FALSE;
};

func int c_npcismage(var C_NPC slf)
{
	printdebugnpc(PD_ZS_DETAIL,"C_NpcIsMage");
	if(slf.attribute[ATR_MANA_MAX] > 0)
	{
		printdebugnpc(PD_ZS_DETAIL,"...true");
		return TRUE;
	}
	else
	{
		printdebugnpc(PD_ZS_DETAIL,"...false");
	};
	return FALSE;
};

func int c_npcbelongstooldcamp(var C_NPC slf)
{
	printdebugnpc(PD_ZS_DETAIL,"C_NpcBelongsToOldCamp");
	if((slf.guild == GIL_VLK) || (slf.guild == GIL_STT) || (slf.guild == GIL_GRD) || (slf.guild == GIL_KDF) || (slf.guild == GIL_EBR))
	{
		printdebugnpc(PD_ZS_DETAIL,"...TRUE");
		return TRUE;
	}
	else
	{
		printdebugnpc(PD_ZS_DETAIL,"...FALSE");
	};
	return FALSE;
};

func int c_npcbelongstonewcamp(var C_NPC slf)
{
	printdebugnpc(PD_ZS_DETAIL,"C_NpcBelongsToNewCamp");
	if((slf.guild == GIL_BAU) || (slf.guild == GIL_SFB) || (slf.guild == GIL_ORG) || (slf.guild == GIL_SLD) || (slf.guild == GIL_KDW))
	{
		printdebugnpc(PD_ZS_DETAIL,"...TRUE");
		return TRUE;
	}
	else
	{
		printdebugnpc(PD_ZS_DETAIL,"...FALSE");
	};
	return FALSE;
};

func int c_npcbelongstopsicamp(var C_NPC slf)
{
	printdebugnpc(PD_ZS_DETAIL,"C_NpcBelongsToPsiCamp");
	if((slf.guild == GIL_NOV) || (slf.guild == GIL_TPL) || (slf.guild == GIL_GUR))
	{
		printdebugnpc(PD_ZS_DETAIL,"...TRUE");
		return TRUE;
	}
	else
	{
		printdebugnpc(PD_ZS_DETAIL,"...FALSE");
	};
	return FALSE;
};

func int c_chargewasattacked(var C_NPC guard,var C_NPC charge,var C_NPC attacker)
{
	printdebugnpc(PD_ZS_DETAIL,"C_ChargeWasAttacked");
	if(c_npcisguard(guard) || c_npcisguardarcher(guard) || (guard.npctype == NPCTYPE_GUARD) || (guard.npctype == NPCTYPE_MINE_GUARD) || (guard.guild == GIL_EBR))
	{
		printdebugnpc(PD_ZS_DETAIL,"...NSC ist Wache oder FK-Wache!");
		if((Npc_GetAttitude(guard,charge) == ATT_FRIENDLY) && (Npc_GetAttitude(guard,attacker) != ATT_FRIENDLY))
		{
			printdebugnpc(PD_ZS_DETAIL,"...true");
			return TRUE;
		};
	};
	printdebugnpc(PD_ZS_DETAIL,"...false");
	return FALSE;
};

func int c_npchasspell(var C_NPC slf,var int spell)
{
	return Npc_HasSpell(slf,spell);
};

func int c_npchasammo(var C_NPC slf,var int category)
{
	var int count;
	printdebugnpc(PD_ZS_DETAIL,"C_NpcHasAmmo");
	if((category != itamarrow) && (category != itambolt))
	{
		printdebugnpc(PD_ZS_DETAIL,"...ungьltige Kategorie !!!");
		return 0;
	};
	count = Npc_GetInvItemBySlot(slf,INV_WEAPON,1);
	if(Hlp_IsValidItem(item) && (item.mainflag == ITEM_KAT_MUN))
	{
		printdebugint(PD_ZS_DETAIL,"...gefundene Anzahl: ",count);
		if(Hlp_GetInstanceID(item) == category)
		{
			printdebugstring(PD_ZS_DETAIL,"...Munitionstyp: ",item.name);
			return count;
		};
	};
	count = Npc_GetInvItemBySlot(slf,INV_WEAPON,2);
	if(Hlp_IsValidItem(item) && (item.mainflag == ITEM_KAT_MUN))
	{
		printdebugint(PD_ZS_DETAIL,"...gefundene Anzahl: ",count);
		if(Hlp_GetInstanceID(item) == category)
		{
			printdebugstring(PD_ZS_DETAIL,"...Munitionstyp: ",item.name);
			return count;
		};
	};
	count = Npc_GetInvItemBySlot(slf,INV_WEAPON,3);
	if(Hlp_IsValidItem(item) && (item.mainflag == ITEM_KAT_MUN))
	{
		printdebugint(PD_ZS_DETAIL,"...gefundene Anzahl: ",count);
		if(Hlp_GetInstanceID(item) == category)
		{
			printdebugstring(PD_ZS_DETAIL,"...Munitionstyp: ",item.name);
			return count;
		};
	};
	count = Npc_GetInvItemBySlot(slf,INV_WEAPON,4);
	if(Hlp_IsValidItem(item) && (item.mainflag == ITEM_KAT_MUN))
	{
		printdebugint(PD_ZS_DETAIL,"...gefundene Anzahl: ",count);
		if(Hlp_GetInstanceID(item) == category)
		{
			printdebugstring(PD_ZS_DETAIL,"...Munitionstyp: ",item.name);
			return count;
		};
	};
	count = Npc_GetInvItemBySlot(slf,INV_WEAPON,5);
	if(Hlp_IsValidItem(item) && (item.mainflag == ITEM_KAT_MUN))
	{
		printdebugint(PD_ZS_DETAIL,"...gefundene Anzahl: ",count);
		if(Hlp_GetInstanceID(item) == category)
		{
			printdebugstring(PD_ZS_DETAIL,"...Munitionstyp: ",item.name);
			return count;
		};
	};
	count = Npc_GetInvItemBySlot(slf,INV_WEAPON,6);
	if(Hlp_IsValidItem(item) && (item.mainflag == ITEM_KAT_MUN))
	{
		printdebugint(PD_ZS_DETAIL,"...gefundene Anzahl: ",count);
		if(Hlp_GetInstanceID(item) == category)
		{
			printdebugstring(PD_ZS_DETAIL,"...Munitionstyp: ",item.name);
			return count;
		};
	};
	return 0;
};

func int c_npchasweapon(var C_NPC slf,var int category)
{
	printdebugnpc(PD_ZS_FRAME,"C_NpcHasWeapon");
	if((category != ITEM_KAT_NF) && (category != ITEM_KAT_FF))
	{
		printdebugnpc(PD_ZS_CHECK,"...ungьltige Kategorie !!!");
		return FALSE;
	};
	Npc_GetInvItemBySlot(slf,INV_WEAPON,1);
	if(Hlp_IsValidItem(item) && (item.mainflag == category))
	{
		printdebugnpc(PD_ZS_CHECK,"...Waffe in Slot 1 !!!");
		if(category == ITEM_KAT_NF)
		{
			printdebugnpc(PD_ZS_CHECK,"...Nahkampfwaffe gefunden!");
			return TRUE;
		}
		else if(c_npchasammo(slf,item.munition))
		{
			printdebugnpc(PD_ZS_CHECK,"...Fernkampfwaffe mit ausreichend Ammo gefunden!");
			return TRUE;
		};
	};
	Npc_GetInvItemBySlot(slf,INV_WEAPON,2);
	if(Hlp_IsValidItem(item) && (item.mainflag == category))
	{
		printdebugnpc(PD_ZS_CHECK,"...Waffe in Slot 2 !!!");
		if(category == ITEM_KAT_NF)
		{
			printdebugnpc(PD_ZS_CHECK,"...Nahkampfwaffe gefunden!");
			return TRUE;
		}
		else if(c_npchasammo(slf,item.munition))
		{
			printdebugnpc(PD_ZS_CHECK,"...Fernkampfwaffe mit ausreichend Ammo gefunden!");
			return TRUE;
		};
	};
	Npc_GetInvItemBySlot(slf,INV_WEAPON,3);
	if(Hlp_IsValidItem(item) && (item.mainflag == category))
	{
		printdebugnpc(PD_ZS_CHECK,"...Waffe in Slot 3 !!!");
		if(category == ITEM_KAT_NF)
		{
			printdebugnpc(PD_ZS_CHECK,"...Nahkampfwaffe gefunden!");
			return TRUE;
		}
		else if(c_npchasammo(slf,item.munition))
		{
			printdebugnpc(PD_ZS_CHECK,"...Fernkampfwaffe mit ausreichend Ammo gefunden!");
			return TRUE;
		};
	};
	Npc_GetInvItemBySlot(slf,INV_WEAPON,4);
	if(Hlp_IsValidItem(item) && (item.mainflag == category))
	{
		printdebugnpc(PD_ZS_CHECK,"...Waffe in Slot 4 !!!");
		if(category == ITEM_KAT_NF)
		{
			printdebugnpc(PD_ZS_CHECK,"...Nahkampfwaffe gefunden!");
			return TRUE;
		}
		else if(c_npchasammo(slf,item.munition))
		{
			printdebugnpc(PD_ZS_CHECK,"...Fernkampfwaffe mit ausreichend Ammo gefunden!");
			return TRUE;
		};
	};
	Npc_GetInvItemBySlot(slf,INV_WEAPON,5);
	if(Hlp_IsValidItem(item) && (item.mainflag == category))
	{
		printdebugnpc(PD_ZS_CHECK,"...Waffe in Slot 5 !!!");
		if(category == ITEM_KAT_NF)
		{
			printdebugnpc(PD_ZS_CHECK,"...Nahkampfwaffe gefunden!");
			return TRUE;
		}
		else if(c_npchasammo(slf,item.munition))
		{
			printdebugnpc(PD_ZS_CHECK,"...Fernkampfwaffe mit ausreichend Ammo gefunden!");
			return TRUE;
		};
	};
	Npc_GetInvItemBySlot(slf,INV_WEAPON,6);
	if(Hlp_IsValidItem(item) && (item.mainflag == category))
	{
		printdebugnpc(PD_ZS_CHECK,"...Waffe in Slot 6 !!!");
		if(category == ITEM_KAT_NF)
		{
			printdebugnpc(PD_ZS_CHECK,"...Nahkampfwaffe gefunden!");
			return TRUE;
		}
		else if(c_npchasammo(slf,item.munition))
		{
			printdebugnpc(PD_ZS_CHECK,"...Fernkampfwaffe mit ausreichend Ammo gefunden!");
			return TRUE;
		};
	};
	return FALSE;
};

func int c_getattackreason(var C_NPC slf)
{
	printdebugnpc(PD_ZS_DETAIL,"C_GetAttackReason");
	return slf.aivar[AIV_ATTACKREASON];
};

func int c_otheristoleratedenemy(var C_NPC slf,var C_NPC oth)
{
	var C_ITEM weapon;
	var int weaponinstance;
	printdebugnpc(PD_ZS_DETAIL,"C_OtherIsToleratedEnemy");
	if(c_npcisorc(slf))
	{
		printdebugnpc(PD_ZS_DETAIL,"...'self' ist Ork!");
		weapon = Npc_GetReadiedWeapon(oth);
		if(Hlp_IsValidItem(weapon))
		{
			weaponinstance = Hlp_GetInstanceID(weapon);
			printdebugstring(PD_ZS_DETAIL,"...gezogene Waffe von 'other': ",weapon.name);
			if(weaponinstance == ulumulu)
			{
				printdebugnpc(PD_ZS_DETAIL,"...true!");
				return TRUE;
			};
		};
		weapon = Npc_GetEquippedMeleeWeapon(oth);
		if(Hlp_IsValidItem(weapon))
		{
			weaponinstance = Hlp_GetInstanceID(weapon);
			printdebugstring(PD_ZS_DETAIL,"...equippte Waffe von 'other': ",weapon.name);
			if(weaponinstance == ulumulu)
			{
				printdebugnpc(PD_ZS_DETAIL,"...true!");
				return TRUE;
			};
		};
	};
	printdebugnpc(PD_ZS_DETAIL,"...false!");
	return FALSE;
};

func void b_tolerateenemy(var C_NPC slf,var C_NPC oth)
{
	var int npcinstance;
	printdebugnpc(PD_ZS_DETAIL,"B_TolerateEnemy");
	if(c_npcisorc(slf) && (Npc_GetDistToNpc(slf,oth) > HAI_DIST_ASSESSTOLERATEDENEMY))
	{
		printdebugnpc(PD_ZS_DETAIL,"...'self' ist Ork und nah genug dran!");
		npcinstance = Hlp_GetInstanceID(slf);
		if((npcinstance == orcscout) || (npcinstance == orcwarrior1) || (npcinstance == orcwarrior2))
		{
			printdebugnpc(PD_ZS_DETAIL,"...'self' ist anderer Ork!");
			if(!Npc_IsInState(slf,zs_upset))
			{
				printdebugnpc(PD_ZS_DETAIL,"...'self' noch nicht in ZS_FollowPC");
				Npc_ClearAIQueue(slf);
				AI_Standup(slf);
				AI_StartState(slf,zs_upset,1,"");
			};
		}
		else if(npcinstance == orcwarrior3)
		{
			printdebugnpc(PD_ZS_DETAIL,"...'self' ist Ork Tempelkrieger!");
			if(!Npc_IsInState(slf,zs_followpc))
			{
				printdebugnpc(PD_ZS_DETAIL,"...'self' noch nicht in ZS_FollowPC");
				Npc_ClearAIQueue(slf);
				AI_Standup(slf);
				AI_StartState(slf,zs_followpc,1,"");
			};
		};
	};
};

func int c_npcisguarding(var C_NPC slf)
{
	if(slf.id == 872)
	{
		//стражник у старой шахты
		return TRUE;
	};
	if(slf.id == 840 || slf.id == 804)
	{
		//роско и охранник ларса
		return TRUE;
	};
	if(slf.id == 818 || slf.id == 819 || slf.id == 859)
	{
		//ретфорд, дракс и эйдан
		return TRUE;
	};
	if(slf.id == 1442 || slf.id == 1441)
	{
		//стражи юбериона
		return TRUE;
	};
	if(slf.id == 336)
	{
		//кавалорн
		return TRUE;
	};
	if(slf.id == 732 || slf.id == 723)
	{
		//наемники магов воды
		return TRUE;
	};
	if(slf.id == 212 || slf.id == 213)
	{
		//стражники замка
		return TRUE;
	};
	if(slf.id == 218)
	{
		//стражник баронов
		return TRUE;
	};
	if(slf.id == 224)
	{
		//пако
		return TRUE;
	};
	if(slf.id == 998)
	{
		//стражник арены
		return TRUE;
	};
	if(slf.id == 251 || slf.id == 729 || slf.id == 1422)
	{
		//бойцы арены
		return TRUE;
	};
	if(slf.id == 328)
	{
		//сэм
		return TRUE;
	};
	if(slf.id == 726)
	{
		//наемник у руды
		return TRUE;
	};
	if(slf.id == 404 || slf.id == 406)
	{
		//ксардасы
		return TRUE;
	};
	if(slf.id == 100 && KAPITEL >= 4)
	{
		//гомез
		return TRUE;
	};
	if((slf.id == 1433 || slf.id == 1401 || slf.id == 1400) && Npc_KnowsInfo(hero,grd_263_asghan_open_now))
	{
		//гор на вид, гор на кош, гор на бар
		return TRUE;
	};
	if(slf.id == 263 && Npc_KnowsInfo(hero,grd_263_asghan_open_now))
	{
		//асгхан
		return TRUE;
	};
	return FALSE;
};

