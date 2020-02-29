
const int NEWS_SOURCE_WITNESS = 0;
const int NEWS_SOURCE_GOSSIP = 1;
const int NEWS_MURDER = 200;
const int NEWS_ATTACK = 195;
const int NEWS_THEFT = 190;
const int NEWS_DEFEAT = 185;
const int NEWS_NERVE = 180;
const int NEWS_INTERFERE = 175;
const int NEWS_HASDEFEATED = 170;

func void b_assessandmemorize(var int newsid,var int source,var C_NPC witness,var C_NPC offender,var C_NPC vict)
{
	var int victimguild;
	var int offendertrueguild;
	var int witnessguild;
	var int offenderguild;
	var int ownerguild;
	printdebugnpc(PD_ZS_CHECK,"B_AssessAndMemorize");
	if(!c_npcishuman(witness) || !c_npcishuman(vict) || !c_npcishuman(offender))
	{
		printdebugnpc(PD_ZS_CHECK,"...Täter, Zeuge oder Opfer KEIN Mensch!");
		printglobals(PD_ZS_CHECK);
		return;
	};
	victimguild = Npc_GetTrueGuild(vict);
	offendertrueguild = Npc_GetTrueGuild(offender);
	witnessguild = Npc_GetTrueGuild(witness);
	offenderguild = offender.guild;
	if(newsid == NEWS_MURDER)
	{
		printdebugnpc(PD_ZS_CHECK,"...AssessAndMemMurder");
		Npc_MemoryEntry(witness,source,offender,newsid,vict);
		if(Wld_GetGuildAttitude(witnessguild,victimguild) == ATT_FRIENDLY)
		{
			printdebugnpc(PD_ZS_CHECK,"...AssessAndMemMurder Knows Player // friendly victim");
			if(Npc_IsPlayer(offender))
			{
				printdebugnpc(PD_ZS_CHECK,"...AssessAndMemMurder Knows Player // friendly victim // Player attacks");
				if(Npc_GetPermAttitude(witness,offender) == ATT_ANGRY)
				{
					printdebugnpc(PD_ZS_CHECK,"...AssessAndMemMurder Knows Player // friendly victim // Player attacks // Angry to Plyaer");
					npc_setpermattitude(witness,ATT_HOSTILE);
				}
				else if((Npc_GetPermAttitude(witness,offender) == ATT_FRIENDLY) || (Npc_GetPermAttitude(witness,offender) == ATT_NEUTRAL))
				{
					printdebugnpc(PD_ZS_CHECK,"...AssessAndMemMurder Knows Player // friendly victim // Player attacks // Friend/Neut to Player");
					npc_setpermattitude(witness,ATT_ANGRY);
				};
			};
		};
	}
	else if(newsid == NEWS_THEFT)
	{
		printdebugnpc(PD_ZS_CHECK,"...AssessAndMemTheft");
		ownerguild = item.ownerguild;
		if(!Hlp_IsValidItem(item))
		{
			if(b_comparenpcinstance(witness,vict))
			{
				printdebugnpc(PD_ZS_CHECK,"...AssessAndMemTheft Someone stole me something");
				Npc_MemoryEntry(witness,source,offender,newsid,vict);
				if(Npc_GetPermAttitude(witness,offender) != ATT_HOSTILE)
				{
					printdebugnpc(PD_ZS_CHECK,"...AssessAndMemTheft Someone stole me something and im not hostile");
					if(Npc_IsPlayer(offender))
					{
						printdebugnpc(PD_ZS_CHECK,"...AssessAndMemTheft Player stole me something");
						Npc_SetTempAttitude(witness,ATT_HOSTILE);
						Npc_SetAttitude(witness,ATT_ANGRY);
						if(c_npcisworker(self) && c_amiweaker(self,offender))
						{
							AI_StartState(self,zs_callguards,0,"");
						};
					};
				};
			};
		}
		else
		{
			printdebugnpc(PD_ZS_CHECK,"...AssessAndMemTheft Someone stole another something");
			if(((Wld_GetGuildAttitude(witnessguild,ownerguild) == ATT_FRIENDLY) || (witnessguild == ownerguild)) && (ownerguild != offenderguild))
			{
				printdebugnpc(PD_ZS_CHECK,"...AssessAndMemTheft Someone(wrong guild) stole another (friend or my guild) something");
				if(Npc_IsPlayer(offender))
				{
					Npc_MemoryEntry(witness,source,offender,newsid,vict);
					Npc_SetTempAttitude(witness,ATT_HOSTILE);
					if(c_npcisworker(self) && c_amiweaker(self,offender))
					{
						AI_StartState(self,zs_callguards,0,"");
					};
				};
			};
		};
	}
	else if(newsid == NEWS_DEFEAT)
	{
		printdebugnpc(PD_ZS_CHECK,"...NEWS_DEFEAT");
		Npc_MemoryEntry(witness,source,offender,newsid,vict);
		if(Npc_IsPlayer(offender))
		{
			printdebugnpc(PD_ZS_CHECK,"...Sieger ist SC!");
			if((Wld_GetGuildAttitude(witnessguild,victimguild) == ATT_FRIENDLY) && !b_comparenpcinstance(witness,vict))
			{
				printdebugnpc(PD_ZS_CHECK,"...NSC ist in befreundeter Gilde zum Besiegten!");
				if((npc_gettempattitude(witness,offender) == ATT_ANGRY) && !c_npcisworker(self))
				{
					printdebugnpc(PD_ZS_CHECK,"...permANGRY zum Sieger und weder Buddler, noch Novize, noch Bauer!");
					Npc_SetTempAttitude(witness,ATT_HOSTILE);
				}
				else if((npc_gettempattitude(witness,offender) == ATT_ANGRY) && c_npcisworker(self))
				{
					printdebugnpc(PD_ZS_CHECK,"...AssessAndMemDefeat Player (Angry) is offender victim is my guild or friendly but I,m unimportant guild");
				}
				else if((npc_gettempattitude(witness,offender) == ATT_NEUTRAL) || (Npc_GetPermAttitude(witness,offender) == ATT_FRIENDLY))
				{
					printdebugnpc(PD_ZS_CHECK,"...AssessAndMemDefeat Player(neutral/friendly is offender victim is my guild or friendly");
					Npc_SetTempAttitude(witness,ATT_ANGRY);
				};
			}
			else if(b_comparenpcinstance(witness,vict))
			{
				printdebugnpc(PD_ZS_CHECK,"...AssessAndMemDefeat Player is offender victim is me");
				if(c_npcisworker(self))
				{
					printdebugnpc(PD_ZS_CHECK,"...AssessAndMemDefeat Player is offender victim is me (weak guild)");
					Npc_SetTempAttitude(witness,ATT_ANGRY);
				}
				else if((witnessguild == GIL_KDF) || (witnessguild == GIL_KDW))
				{
					printdebugnpc(PD_ZS_CHECK,"...AssessAndMemDefeat Player is offender victim is me ( mage guild)");
					Npc_SetTempAttitude(witness,ATT_HOSTILE);
				}
				else
				{
					printdebugnpc(PD_ZS_CHECK,"...AssessAndMemDefeat Player is offender victim is me ( other guild)");
					if(npc_gettempattitude(witness,offender) != ATT_HOSTILE)
					{
						printdebugnpc(PD_ZS_CHECK,"...AssessAndMemDefeat Player is offender victim is me ( other guild// not hostile)");
						Npc_SetTempAttitude(witness,ATT_ANGRY);
					};
				};
			};
		}
		else if(Npc_IsPlayer(vict))
		{
			if(npc_gettempattitude(witness,vict) == ATT_HOSTILE)
			{
				if(Npc_GetPermAttitude(witness,vict) == ATT_HOSTILE)
				{
				};
				if(Npc_GetPermAttitude(witness,vict) == ATT_ANGRY)
				{
					Npc_SetTempAttitude(self,ATT_ANGRY);
				};
				if(Npc_GetPermAttitude(witness,vict) == ATT_NEUTRAL)
				{
					Npc_SetTempAttitude(self,ATT_NEUTRAL);
				};
				if(Npc_GetPermAttitude(witness,vict) == ATT_FRIENDLY)
				{
					Npc_SetTempAttitude(self,ATT_FRIENDLY);
				};
			};
		};
	};
};

