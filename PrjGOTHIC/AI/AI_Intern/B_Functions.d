
func void b_gotowpnexttonpc(var C_NPC slf,var C_NPC oth)
{
	var string waypoint;
	printdebugnpc(PD_ZS_DETAIL,"B_GotoWPNextToNpc");
	waypoint = Npc_GetNextWP(oth);
	AI_GotoWP(slf,waypoint);
};

func void b_cantseeturn()
{
	printdebugnpc(PD_ZS_DETAIL,"B_CantSeeTurn");
	if(!c_bodystatecontains(self,BS_SIT) && !Npc_CanSeeNpc(self,other))
	{
		printdebugnpc(PD_ZS_CHECK,"B_CantSeeTurn If");
		AI_TurnToNPC(self,other);
	};
};

func int c_lookatnpc(var C_NPC slf,var C_NPC oth)
{
	AI_LookAtNpc(slf,oth);
	printdebugnpc(PD_ZS_DETAIL,"C_LookAtNpc");
	return 1;
};

func int c_stoplookat(var C_NPC slf)
{
	AI_StopLookAt(slf);
	printdebugnpc(PD_ZS_DETAIL,"C_StopLookAt");
	return 1;
};

func void b_smartturntonpc(var C_NPC slf,var C_NPC oth)
{
	printdebugnpc(PD_ZS_DETAIL,"B_SmartTurnToNpc");
	if(!(c_bodystatecontains(slf,BS_SIT) || c_bodystatecontains(slf,BS_ITEMINTERACT) || c_bodystatecontains(slf,BS_MOBINTERACT) || c_bodystatecontains(slf,BS_MOBINTERACT_INTERRUPT)))
	{
		printdebugnpc(PD_ZS_DETAIL,"...sitzt nicht und ist nicht am Mobsi");
		if(!Npc_CanSeeNpc(slf,oth))
		{
			printdebugnpc(PD_ZS_DETAIL,"...kann Ziel nicht sehen!");
			AI_TurnToNPC(slf,oth);
		}
		else
		{
			c_lookatnpc(slf,oth);
		};
	};
};

func void b_say(var C_NPC slf,var C_NPC oth,var string text)
{
	var string pipe;
	pipe = ConcatStrings("B_Say:",text);
	printdebugnpc(PD_ZS_FRAME,pipe);
	b_smartturntonpc(slf,oth);
	AI_OutputSVM(slf,oth,text);
};

func void b_sayoverlay(var C_NPC slf,var C_NPC oth,var string text)
{
	var string pipe;
	pipe = ConcatStrings("B_SayOverlay:",text);
	printdebugnpc(PD_ZS_FRAME,pipe);
	b_smartturntonpc(slf,oth);
	AI_OutputSVM_Overlay(slf,oth,text);
};

func void b_standup(var C_NPC slf)
{
	printdebugnpc(PD_ZS_DETAIL,"B_StandUp");
	if(c_bodystatecontains(slf,BS_SIT))
	{
		if(slf.aivar[AIV_HANGAROUNDSTATUS] == 1)
		{
			AI_PlayAni(slf,"T_SIT_2_STAND");
			slf.aivar[AIV_HANGAROUNDSTATUS] = 0;
		}
		else if(slf.aivar[AIV_HANGAROUNDSTATUS] == 4)
		{
			AI_UseMob(slf,"SMALL THRONE",-1);
			slf.aivar[AIV_HANGAROUNDSTATUS] = 0;
		}
		else if(slf.aivar[AIV_HANGAROUNDSTATUS] == 2)
		{
			AI_UseMob(slf,"BENCH",-1);
			slf.aivar[AIV_HANGAROUNDSTATUS] = 0;
		}
		else if(slf.aivar[AIV_HANGAROUNDSTATUS] == 3)
		{
			AI_UseMob(slf,"CHAIR",-1);
			slf.aivar[AIV_HANGAROUNDSTATUS] = 0;
		};
	};
};

func void b_callcomrades()
{
	printdebugnpc(PD_ZS_DETAIL,"B_CallComrades");
	b_sayoverlay(self,NULL,"$COMRADESHELP");
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,self,other);
};

func void b_callguards()
{
	printdebugnpc(PD_ZS_DETAIL,"B_CallGuards");
	b_sayoverlay(self,NULL,"$HELP");
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,self,other);
};

func void b_intruderalert(var C_NPC slf,var C_NPC oth)
{
	printdebugnpc(PD_ZS_DETAIL,"B_IntruderAlert");
	b_sayoverlay(slf,NULL,"$IntruderAlert");
	Npc_SendPassivePerc(slf,PERC_ASSESSWARN,slf,oth);
};

func void b_fullstop(var C_NPC npc)
{
	printdebugnpc(PD_ZS_DETAIL,"B_FullStop");
	Npc_ClearAIQueue(npc);
	AI_StandupQuick(npc);
};

func void b_resettempattitude(var C_NPC slf)
{
	printdebugnpc(PD_ZS_DETAIL,"B_ResetTempAttitude");
	Npc_SetTempAttitude(slf,Npc_GetPermAttitude(slf,hero));
};

func void b_whirlaround(var C_NPC slf,var C_NPC oth)
{
	printdebugnpc(PD_ZS_DETAIL,"B_WhirlAround");
	if(Npc_CanSeeNpc(slf,oth))
	{
		printdebugnpc(PD_ZS_DETAIL,"...KANN Ziel sehen!");
		AI_TurnToNPC(slf,oth);
	}
	else
	{
		printdebugnpc(PD_ZS_DETAIL,"...kann Ziel NICHT sehen!");
		AI_WhirlAround(slf,oth);
	};
};

func void b_dropweapon(var C_NPC slf)
{
	var C_ITEM itm;
	var int itemid;
	printdebugnpc(PD_ZS_DETAIL,"B_DropWeapon");
	itm = Npc_GetReadiedWeapon(slf);
	if(Hlp_IsValidItem(itm))
	{
		itemid = Hlp_GetInstanceID(itm);
		printdebugnpc(PD_ZS_DETAIL,itm.name);
		AI_DropItem(slf,itemid);
	};
};

func void b_regaindroppedweapon(var C_NPC slf)
{
	Npc_PerceiveAll(slf);
	if(Wld_DetectItem(slf,ITEM_KAT_NF) || Wld_DetectItem(slf,ITEM_KAT_FF))
	{
		if(!Npc_IsPlayer(slf) && Npc_CanSeeItem(slf,item))
		{
			printdebugnpc(PD_ZS_CHECK,"...NSC hebt seine Waffen wieder auf!");
			AI_TakeItem(slf,item);
			AI_EquipBestMeleeWeapon(slf);
			AI_EquipBestRangedWeapon(slf);
		};
	};
};

func void b_regaindroppedarmor(var C_NPC slf)
{
	Npc_PerceiveAll(slf);
	if(Wld_DetectItem(slf,ITEM_KAT_ARMOR))
	{
		if(!Npc_IsPlayer(slf))
		{
			printdebugnpc(PD_ZS_CHECK,"...NSC hebt seine R�stung wieder auf!");
			AI_TakeItem(slf,item);
			AI_EquipBestArmor(slf);
		};
	};
};

func void b_gotofp(var C_NPC slf,var string fp)
{
	printdebugnpc(PD_TA_LOOP,"B_GotoFP");
	if(!Npc_IsOnFP(self,fp))
	{
		printdebugstring(PD_TA_CHECK,"...nicht auf passendem Freepoint",fp);
		if(Wld_IsNextFPAvailable(self,fp))
		{
			printdebugstring(PD_TA_CHECK,"Gehe zu Freepoint",fp);
			AI_SetWalkMode(self,NPC_WALK);
			AI_GotoNextFP(self,fp);
		};
	};
};

func void b_stopgotohero()
{
	printdebugnpc(PD_ZS_FRAME,"B_StopGotoHero");
	if(Npc_IsPlayer(other))
	{
		printdebugnpc(PD_ZS_DETAIL,"...Kollision mit Spieler!");
		Npc_PercDisable(self,PERC_MOVENPC);
		b_fullstop(self);
	};
};

func void b_setattackreason(var C_NPC slf,var int reason)
{
	printdebugnpc(PD_ZS_DETAIL,"B_SetAttackReason");
	slf.aivar[AIV_ATTACKREASON] = reason;
};

func void b_killnpc(var int npcinstance)
{
	var C_NPC npc;
	var int iteminstance;
	printdebugnpc(PD_ZS_DETAIL,"B_KillNpc");
	npc = Hlp_GetNpc(npcinstance);
	npc.flags = 0;
	CreateInvItem(npc,itmi_stuff_oldcoin_02);
	Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
	if(Npc_GetInvItemBySlot(npc,INV_WEAPON,1))
	{
		printdebugnpc(PD_ZS_DETAIL,"...Waffe in Slot 1 gefunden!");
		iteminstance = Hlp_GetInstanceID(item);
		Npc_RemoveInvItem(npc,iteminstance);
	};
	if(Npc_GetInvItemBySlot(npc,INV_WEAPON,2))
	{
		printdebugnpc(PD_ZS_DETAIL,"...Waffe in Slot 2 gefunden!");
		iteminstance = Hlp_GetInstanceID(item);
		Npc_RemoveInvItem(npc,iteminstance);
	};
};

func void b_usefakescroll()
{
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,hero);
	};
	CreateInvItem(self,fakescroll);
	AI_UseItemToState(self,fakescroll,1);
	AI_Wait(self,3);
	AI_UseItemToState(self,fakescroll,-1);
};

func void b_changeguild(var int npcinstance,var int newguild)
{
	var C_NPC npc;
	printdebugnpc(PD_ZS_DETAIL,"B_ChangeGuild");
	npc = Hlp_GetNpc(npcinstance);
	Npc_SetTrueGuild(npc,newguild);
	npc.guild = newguild;
};

func void b_exchangeroutine(var int npcinstance,var string newroutine)
{
	var C_NPC npc;
	printdebugnpc(PD_ZS_DETAIL,"B_ExchangeRoutine");
	npc = Hlp_GetNpc(npcinstance);
	Npc_ExchangeRoutine(npc,newroutine);
	AI_ContinueRoutine(npc);
};

func void b_setpermattitude(var int npcinstance,var int newattitude)
{
	var C_NPC npc;
	printdebugnpc(PD_ZS_DETAIL,"B_SetPermAttitude");
	npc = Hlp_GetNpc(npcinstance);
	Npc_SetAttitude(npc,newattitude);
	Npc_SetTempAttitude(npc,newattitude);
};

func void b_logentry(var string topic,var string entry)
{
	printdebugnpc(PD_ZS_DETAIL,"B_LogEntry");
	Log_AddEntry(topic,entry);
	PrintScreen(NAME_NEWLOGENTRY,-1,_YPOS_MESSAGE_LOGENTRY,"font_old_10_white.tga",_TIME_MESSAGE_LOGENTRY);
	Snd_Play("LogEntry");
};

func void b_clearimmortal(var int npcinstance)
{
	var C_NPC npc;
	printdebugnpc(PD_ZS_DETAIL,"B_ClearImmortal");
	npc = Hlp_GetNpc(npcinstance);
	npc.flags = 0;
};

func void b_setnpctype(var int npcinstance,var int newnpctype)
{
	var C_NPC npc;
	printdebugnpc(PD_ZS_DETAIL,"B_SetNpcType");
	npc = Hlp_GetNpc(npcinstance);
	npc.npctype = newnpctype;
};

func void b_giveinvitems(var C_NPC giver,var C_NPC taker,var int iteminstance,var int amount)
{
	var string msg;
	printdebugnpc(PD_ZS_DETAIL,"B_GiveInvItems");
	Npc_RemoveInvItems(giver,iteminstance,amount);
	CreateInvItems(taker,iteminstance,amount);
	if(Npc_IsPlayer(giver))
	{
		if(iteminstance == itminugget)
		{
			msg = ConcatStrings(IntToString(amount),_STR_MESSAGE_ORE_GIVEN);
			PrintScreen(msg,-1,_YPOS_MESSAGE_GIVEN,"FONT_OLD_10_WHITE.TGA",_TIME_MESSAGE_GIVEN);
		}
		else if(amount == 1)
		{
			msg = ConcatStrings(IntToString(amount),_STR_MESSAGE_ITEM_GIVEN);
			PrintScreen(msg,-1,_YPOS_MESSAGE_GIVEN,"FONT_OLD_10_WHITE.TGA",_TIME_MESSAGE_GIVEN);
		}
		else
		{
			msg = ConcatStrings(IntToString(amount),_STR_MESSAGE_ITEMS_GIVEN);
			PrintScreen(msg,-1,_YPOS_MESSAGE_GIVEN,"FONT_OLD_10_WHITE.TGA",_TIME_MESSAGE_GIVEN);
		};
	}
	else if(Npc_IsPlayer(taker))
	{
		if(iteminstance == itminugget)
		{
			msg = ConcatStrings(IntToString(amount),_STR_MESSAGE_ORE_TAKEN);
			PrintScreen(msg,-1,_YPOS_MESSAGE_TAKEN,"FONT_OLD_10_WHITE.TGA",_TIME_MESSAGE_TAKEN);
		}
		else if(amount == 1)
		{
			msg = ConcatStrings(IntToString(amount),_STR_MESSAGE_ITEM_TAKEN);
			PrintScreen(msg,-1,_YPOS_MESSAGE_TAKEN,"FONT_OLD_10_WHITE.TGA",_TIME_MESSAGE_TAKEN);
		}
		else
		{
			msg = ConcatStrings(IntToString(amount),_STR_MESSAGE_ITEMS_TAKEN);
			PrintScreen(msg,-1,_YPOS_MESSAGE_TAKEN,"FONT_OLD_10_WHITE.TGA",_TIME_MESSAGE_TAKEN);
		};
	};
};

func int b_checkforimportantinfo(var C_NPC slf,var C_NPC oth)
{
	var C_NPC her;
	var C_NPC rock;
	printdebugnpc(PD_ZS_FRAME,"B_CheckForImportantInfo");
	if((oth.aivar[AIV_INVINCIBLE] == FALSE) && c_npcishuman(oth))
	{
		printdebugnpc(PD_ZS_CHECK,"...SC spricht nicht!");
		her = Hlp_GetNpc(pc_hero);
		rock = Hlp_GetNpc(pc_rockefeller);
		if((Hlp_GetInstanceID(her) != Hlp_GetInstanceID(hero)) && (Hlp_GetInstanceID(rock) != Hlp_GetInstanceID(hero)))
		{
			return FALSE;
		};
		if(Npc_CheckInfo(slf,1))
		{
			printdebugnpc(PD_ZS_CHECK,"...wichtige Info zu vergeben!");
			printdebugnpc(PD_ZS_CHECK,"...SC springt nicht oder NSC ist Durchgangswache!");
			if(!c_bodystatecontains(oth,BS_FALL))
			{
				printdebugnpc(PD_ZS_CHECK,"...f�llt nicht!");
				if(!c_bodystatecontains(oth,BS_SWIM))
				{
					printdebugnpc(PD_ZS_CHECK,"...schwimmt nicht!");
					if(!c_bodystatecontains(oth,BS_DIVE))
					{
						printdebugnpc(PD_ZS_CHECK,"...taucht nicht!");
						hero.aivar[AIV_IMPORTANT] = TRUE;
						b_fullstop(oth);
						if(c_bodystatecontains(slf,BS_SIT) || !Npc_CanSeeNpc(self,hero))
						{
							Npc_ClearAIQueue(slf);
							AI_Standup(slf);
						}
						else
						{
							b_fullstop(slf);
						};
						AI_StartState(slf,zs_talk,0,"");
						Npc_PercDisable(slf,PERC_ASSESSFIGHTER);
						return TRUE;
					};
				};
			};
		};
	};
	return FALSE;
};

func void b_initguildattitudes()
{
	printdebugnpc(PD_ZS_FRAME,"B_InitGuildAttitudes");
	if(KAPITEL <= 3)
	{
		Wld_ExchangeGuildAttitudes("GIL_ATTITUDES");
	}
	else
	{
		Wld_ExchangeGuildAttitudes("GIL_ATTITUDES_FMTAKEN");
	};
};

func void b_practicecombat(var string waypoint)
{
	printdebugnpc(PD_ZS_FRAME,"B_PracticeCombat");
};

func void b_printguildcondition(var int level)
{
	var string msg;
	printdebugnpc(PD_ZS_FRAME,"B_PrintGuildCondition");
	msg = ConcatStrings(_STR_MESSAGE_JOINCAMP,IntToString(level));
	PrintScreen(msg,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",_TIME_MESSAGE_JOINCAMP);
};
