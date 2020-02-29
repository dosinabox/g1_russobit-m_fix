
func void b_orcguard_observeintruder()
{
	if(Npc_HasReadiedWeapon(other) || Npc_IsInFightMode(other,FMODE_FIST))
	{
		printdebugnpc(PD_ORC_FRAME,"B_OrcGuard_ObserveIntruder: Mensch ist im Kampf-Modus -> TempAtt +1");
		b_orc_drawweapon();
	};
	Npc_ClearAIQueue(self);
	AI_StandupQuick(self);
	AI_StartState(self,zs_orcguard_observeintruder,0,"");
};

func void b_orcwarrior_observeintruder()
{
	if(Npc_HasReadiedWeapon(other) || Npc_IsInFightMode(other,FMODE_FIST))
	{
		printdebugnpc(PD_ORC_FRAME,"B_OrcWarrior_ObserveIntruder: Mensch ist im Kampf-Modus -> TempAtt +1");
		b_orc_drawweapon();
	};
	if(Npc_GetAttitude(self,other) == ATT_HOSTILE)
	{
		printdebugnpc(PD_ORC_FRAME,"B_OrcWarrior_ObserveIntruder: Mensch & HOSTILE");
		if(Npc_GetDistToNpc(self,other) < 2000)
		{
			Npc_ClearAIQueue(self);
			AI_StandupQuick(self);
			AI_StartState(self,zs_orc_attack,0,"");
		};
		return;
	}
	else if(Npc_GetAttitude(self,other) == ATT_ANGRY)
	{
		printdebugnpc(PD_ORC_FRAME,"B_OrcWarrior_ObserveIntruder: Mensch & ANGRY");
		if(Npc_GetDistToNpc(self,other) < 1200)
		{
			Npc_ClearAIQueue(self);
			AI_StandupQuick(self);
			AI_TurnToNPC(self,other);
			AI_StartState(self,zs_orcwarrior_observeintruder,0,"");
		};
		return;
	}
	else if(Npc_GetAttitude(self,other) == ATT_NEUTRAL)
	{
		printdebugnpc(PD_ORC_FRAME,"B_OrcWarrior_ObserveIntruder: Mensch & NEUTRAL");
		if(Npc_GetDistToNpc(self,other) < 800)
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			AI_TurnToNPC(self,other);
			AI_StartState(self,zs_orcwarrior_observeintruder,0,"");
		};
		return;
	}
	else if(Npc_GetAttitude(self,other) == ATT_FRIENDLY)
	{
		printdebugnpc(PD_ORC_FRAME,"B_OrcWarrior_ObserveIntruder: Mensch & NEUTRAL");
		if(Npc_GetDistToNpc(self,other) < 400)
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			AI_TurnToNPC(self,other);
			AI_StartState(self,zs_orcwarrior_observeintruder,0,"");
		};
		return;
	};
};

func void b_orcscout_observeintruder()
{
	if(Npc_HasReadiedWeapon(other) || Npc_IsInFightMode(other,FMODE_FIST))
	{
		printdebugnpc(PD_ORC_FRAME,"B_OrcScout_ObserveIntruder: Mensch ist im Kampf-Modus -> TempAtt +1");
		b_orc_drawweapon();
	};
	if(Npc_GetAttitude(self,other) == ATT_HOSTILE)
	{
		printdebugnpc(PD_ORC_FRAME,"B_OrcScout_ObserveIntruder: Mensch & HOSTILE");
		if(Npc_GetDistToNpc(self,other) < 1000)
		{
			Npc_ClearAIQueue(self);
			AI_StandupQuick(self);
			AI_StartState(self,zs_orc_attack,0,"");
		};
		return;
	}
	else if(Npc_GetAttitude(self,other) == ATT_ANGRY)
	{
		printdebugnpc(PD_ORC_FRAME,"B_OrcScout_ObserveIntruder: Mensch & ANGRY");
		if(Npc_GetDistToNpc(self,other) < 600)
		{
			Npc_ClearAIQueue(self);
			AI_StandupQuick(self);
			AI_TurnToNPC(self,other);
			AI_StartState(self,zs_orcscout_observeintruder,0,"");
		};
		return;
	}
	else if(Npc_GetAttitude(self,other) == ATT_NEUTRAL)
	{
		printdebugnpc(PD_ORC_FRAME,"B_OrcScout_ObserveIntruder: Mensch & NEUTRAL");
		if(Npc_GetDistToNpc(self,other) < 400)
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			AI_TurnToNPC(self,other);
			AI_StartState(self,zs_orcscout_observeintruder,0,"");
		};
		return;
	}
	else if(Npc_GetAttitude(self,other) == ATT_FRIENDLY)
	{
		printdebugnpc(PD_ORC_FRAME,"B_OrcScout_ObserveIntruder: Mensch & NEUTRAL");
		if(Npc_GetDistToNpc(self,other) < 200)
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			AI_TurnToNPC(self,other);
			AI_StartState(self,zs_orcscout_observeintruder,0,"");
		};
		return;
	};
};

func void b_orcshaman_observeintruder()
{
	if(Npc_HasReadiedWeapon(other) || Npc_IsInFightMode(other,FMODE_FIST))
	{
		printdebugnpc(PD_ORC_FRAME,"B_OrcShaman_ObserveIntruder: Mensch ist im Kampf-Modus -> TempAtt +1");
		b_orc_drawweapon();
	};
	if(Npc_GetAttitude(self,other) == ATT_HOSTILE)
	{
		printdebugnpc(PD_ORC_FRAME,"B_OrcShaman_ObserveIntruder: Mensch & HOSTILE");
		if(Npc_GetDistToNpc(self,other) < 1500)
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			AI_StartState(self,zs_orc_attack,0,"");
		};
		return;
	}
	else if(Npc_GetAttitude(self,other) == ATT_ANGRY)
	{
		printdebugnpc(PD_ORC_FRAME,"B_OrcShaman_ObserveIntruder: Mensch & ANGRY");
		if(Npc_GetDistToNpc(self,other) < 1000)
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			AI_TurnToNPC(self,other);
			AI_StartState(self,zs_orcshaman_observeintruder,0,"");
		};
		return;
	}
	else if(Npc_GetAttitude(self,other) == ATT_NEUTRAL)
	{
		printdebugnpc(PD_ORC_FRAME,"B_OrcShaman_ObserveIntruder: Mensch & NEUTRAL");
		if(Npc_GetDistToNpc(self,other) < 400)
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			AI_TurnToNPC(self,other);
			AI_StartState(self,zs_orcshaman_observeintruder,0,"");
		};
		return;
	}
	else if(Npc_GetAttitude(self,other) == ATT_FRIENDLY)
	{
		printdebugnpc(PD_ORC_FRAME,"B_OrcShaman_ObserveIntruder: Mensch & NEUTRAL");
		if(Npc_GetDistToNpc(self,other) < 200)
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			AI_TurnToNPC(self,other);
			AI_StartState(self,zs_orcshaman_observeintruder,0,"");
		};
		return;
	};
};

func void b_orc_observeintruder()
{
	if((other.guild > GIL_SEPERATOR_ORC) || (other.guild == GIL_ORCDOG))
	{
		printdebugnpc(PD_ORC_FRAME,"B_Orc_ObserveIntruder: Orc oder Hund -> ignore");
		return;
	};
	if(!Npc_CanSeeNpc(self,other) && c_bodystatecontains(other,BS_SNEAK))
	{
		printdebugnpc(PD_ORC_FRAME,"B_Orc_ObserveIntruder: kann niemand sehen und schleicht -> ignore");
		return;
	};
	if((other.guild > GIL_SEPERATOR_HUM) && (other.guild < GIL_SEPERATOR_ORC))
	{
		printdebugnpc(PD_ORC_FRAME,"B_Orc_ObserveIntruder: Monster!");
		AI_QuickLook(self,other);
		if((other.guild != GIL_ORCDOG) && (other.guild != GIL_MEATBUG))
		{
			printdebugnpc(PD_ORC_FRAME,"B_Orc_ObserveIntruder: Monster: !OrcDog && !MeatBug -> Angriff");
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			AI_StartState(self,zs_orc_attack,0,"");
		};
		return;
	};
	if(other.guild < GIL_SEPERATOR_HUM)
	{
		if(self.npctype == NPCTYPE_GUARD)
		{
			b_orcguard_observeintruder();
		};
		if(self.guild == GIL_ORCWARRIOR)
		{
			b_orcwarrior_observeintruder();
		};
		if(self.guild == GIL_ORCSCOUT)
		{
			b_orcscout_observeintruder();
		};
		if(self.guild == GIL_ORCSHAMAN)
		{
			b_orcshaman_observeintruder();
		};
	};
};

func void zs_orcguard_observeintruder()
{
	printdebugnpc(PD_ORC_FRAME,"ZS_OrcGuard_ObserveIntruder");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_orc_assessdamage);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_orc_drawweapon);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,zs_orc_watchfight);
	Npc_PercEnable(self,PERC_ASSESSMURDER,b_orc_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,b_orc_assessdefeat);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_orc_assesssomethingevil);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_orc_assesssomethingevil);
	self.aivar[AIV_OBSERVEINTRUDER] = 0;
	self.aivar[AIV_WARNTARGET] = 0;
	printdebugnpc(PD_ORC_FRAME,"B_OrcGuard_ObserveIntruder: Waechter sieht Player");
	if((Npc_GetDistToNpc(self,other) > 900) && (Npc_GetAttitude(self,other) != ATT_FRIENDLY))
	{
		printdebugnpc(PD_ORC_FRAME,"B_OrcGuard_ObserveIntruder: Waechter tutet ins Horn -> TORÖÖÖÖ!");
		b_orc_itemhorn();
	};
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,self,self);
};

func int zs_orcguard_observeintruder_loop()
{
	printdebugnpc(PD_ORC_FRAME,"ZS_OrcGuard_ObserveIntruder_Loop:");
	printdebugnpc(PD_ORC_FRAME,"ZS_OrcGUARD_ObserveIntruder_Loop: Waechter!");
	if(!Npc_HasReadiedWeapon(self))
	{
		printdebugnpc(PD_ORC_FRAME,"ZS_OrcGuard_ObserveIntruder_Loop: Ork-Waechter zieht Waffe");
		AI_TurnToNPC(self,other);
		AI_EquipBestMeleeWeapon(self);
		AI_DrawWeapon(self);
	};
	if(Npc_GetDistToNpc(self,other) > 1500)
	{
		self.aivar[AIV_WARNTARGET] = 1;
	}
	else
	{
		self.aivar[AIV_WARNTARGET] = 0;
	};
	if(Npc_GetAttitude(self,other) == ATT_HOSTILE)
	{
		printdebugnpc(PD_ORC_FRAME,"ZS_OrcGuard_ObserveIntruder: HOSTILE");
		b_say(self,other,"$DIE");
		AI_StartState(self,zs_orc_attack,1,"");
		return 1;
	}
	else if((Npc_GetAttitude(self,other) == ATT_ANGRY) && (self.aivar[AIV_WARNTARGET] == 0))
	{
		printdebugnpc(PD_ORC_FRAME,"ZS_OrcGuard_ObserveIntruder: ANGRY");
		b_orc_smartturn();
		if((Npc_GetDistToNpc(self,other) < 500) && ((self.aivar[AIV_OBSERVEINTRUDER] == 1) || (Npc_GetStateTime(self) > 6)))
		{
			printdebugnpc(PD_ORC_FRAME,"ZS_OrcGuard_ObserveIntruder: ANGRY: Angriff 1");
			b_say(self,other,"$DIE");
			AI_StartState(self,zs_orc_attack,1,"");
		}
		else if((Npc_GetDistToNpc(self,other) < 1500) && (self.aivar[AIV_OBSERVEINTRUDER] == 0))
		{
			printdebugnpc(PD_ORC_FRAME,"ZS_OrcGuard_ObserveIntruder: ANGRY: Waffe ziehen");
			self.aivar[AIV_OBSERVEINTRUDER] = 1;
			b_say(self,other,"$LOOKINGFORTROUBLEEH");
		}
		else if((self.aivar[AIV_OBSERVEINTRUDER] == 1) && (Npc_GetStateTime(self) > 6))
		{
			printdebugnpc(PD_ORC_FRAME,"ZS_OrcGuard_ObserveIntruder: ANGRY: Angriff 2");
			b_say(self,other,"$DIE");
			AI_StartState(self,zs_orc_attack,1,"");
		};
		return 0;
	}
	else if((Npc_GetAttitude(self,other) == ATT_NEUTRAL) && (self.aivar[AIV_WARNTARGET] == 0))
	{
		printdebugnpc(PD_ORC_FRAME,"ZS_OrcGuard_ObserveIntruder: NEUTRAL");
		b_orc_smartturn();
		if((Npc_GetDistToNpc(self,other) < 300) && (self.aivar[AIV_OBSERVEINTRUDER] > 0))
		{
			if(self.aivar[AIV_OBSERVEINTRUDER] != 2)
			{
				self.aivar[AIV_OBSERVEINTRUDER] = 2;
				AI_Wait(self,3);
			}
			else if(Npc_GetStateTime(self) > 10)
			{
				printdebugnpc(PD_ORC_FRAME,"ZS_OrcGuard_ObserveIntruder: NEUTRAL: Angriff");
				AI_StartState(self,zs_orc_attack,1,"");
			};
		}
		else if((Npc_GetDistToNpc(self,other) < 500) && (self.aivar[AIV_OBSERVEINTRUDER] == 0))
		{
			self.aivar[AIV_OBSERVEINTRUDER] = 1;
			printdebugnpc(PD_ORC_FRAME,"ZS_OrcGuard_ObserveIntruder: NEUTRAL: Waffe ziehen");
			if(!Npc_HasReadiedWeapon(self))
			{
				AI_EquipBestMeleeWeapon(self);
				AI_DrawWeapon(self);
			};
			b_say(self,other,"$LOOKINGFORTROUBLEEH");
		}
		else if(Npc_GetStateTime(self) > 15)
		{
			return 1;
		};
		return 0;
	}
	else if(Npc_GetAttitude(self,other) == ATT_FRIENDLY)
	{
		printdebugnpc(PD_ORC_FRAME,"ZS_OrcGuard_ObserveIntruder: FRIENDLY");
		b_orc_smartturn();
		if((Npc_GetDistToNpc(self,other) < 300) && (self.aivar[AIV_OBSERVEINTRUDER] != 1))
		{
			self.aivar[AIV_OBSERVEINTRUDER] = 1;
			b_say(self,other,"$WHAT");
		};
		if(Npc_GetDistToNpc(self,other) > 700)
		{
			return 1;
		};
		return 0;
	}
	else if(Npc_GetDistToNpc(self,other) > 2000)
	{
		return 1;
	};
	return 0;
};

func void zs_orcguard_observeintruder_end()
{
	printdebugnpc(PD_ORC_FRAME,"ZS_OrcGuard_ObserveIntruder_End");
	if(Npc_HasReadiedWeapon(self))
	{
		AI_RemoveWeapon(self);
	};
	AI_StopLookAt(self);
	AI_ContinueRoutine(self);
};

func void zs_orcwarrior_observeintruder()
{
	printdebugnpc(PD_ORC_FRAME,"ZS_OrcWarrior_ObserveIntruder");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_orc_assessdamage);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_orc_drawweapon);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,zs_orc_watchfight);
	Npc_PercEnable(self,PERC_ASSESSMURDER,b_orc_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,b_orc_assessdefeat);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_orc_assesssomethingevil);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_orc_assesssomethingevil);
	self.aivar[AIV_OBSERVEINTRUDER] = 0;
	self.aivar[AIV_WARNTARGET] = 0;
};

func int zs_orcwarrior_observeintruder_loop()
{
	printdebugnpc(PD_ORC_FRAME,"ZS_OrcWarrior_ObserveIntruder_Loop:");
	if(Npc_GetAttitude(self,other) == ATT_HOSTILE)
	{
		printdebugnpc(PD_ORC_FRAME,"ZS_OrcWarrior_ObserveIntruder: HOSTILE");
		b_say(self,other,"$DIE");
		AI_StartState(self,zs_orc_attack,1,"");
		return 1;
	}
	else if((Npc_GetAttitude(self,other) == ATT_ANGRY) && (self.aivar[AIV_WARNTARGET] == 0))
	{
		printdebugnpc(PD_ORC_FRAME,"ZS_OrcWarrior_ObserveIntruder: ANGRY");
		b_orc_smartturn();
		if((Npc_GetDistToNpc(self,other) < 500) && ((self.aivar[AIV_OBSERVEINTRUDER] == 1) || (Npc_GetStateTime(self) > 6)))
		{
			printdebugnpc(PD_ORC_FRAME,"ZS_OrcWarrior_ObserveIntruder: ANGRY: Angriff 1");
			b_say(self,other,"$DIE");
			AI_StartState(self,zs_orc_attack,1,"");
		}
		else if((Npc_GetDistToNpc(self,other) < 1500) && (self.aivar[AIV_OBSERVEINTRUDER] == 0))
		{
			printdebugnpc(PD_ORC_FRAME,"ZS_OrcWarrior_ObserveIntruder: ANGRY: Waffe ziehen");
			if(!Npc_HasReadiedWeapon(self))
			{
				AI_EquipBestMeleeWeapon(self);
				AI_DrawWeapon(self);
			};
			self.aivar[AIV_OBSERVEINTRUDER] = 1;
			b_say(self,other,"$LOOKINGFORTROUBLEEH");
		}
		else if((self.aivar[AIV_OBSERVEINTRUDER] == 1) && (Npc_GetStateTime(self) > 6))
		{
			printdebugnpc(PD_ORC_FRAME,"ZS_OrcWarrior_ObserveIntruder: ANGRY: Angriff 2");
			b_say(self,other,"$DIE");
			AI_StartState(self,zs_orc_attack,1,"");
		}
		else if(Npc_GetDistToNpc(self,other) > 1500)
		{
			return 1;
		};
		return 0;
	}
	else if((Npc_GetAttitude(self,other) == ATT_NEUTRAL) && (self.aivar[AIV_WARNTARGET] == 0))
	{
		printdebugnpc(PD_ORC_FRAME,"ZS_OrcWarrior_ObserveIntruder: NEUTRAL");
		b_orc_smartturn();
		if((Npc_GetDistToNpc(self,other) < 300) && (self.aivar[AIV_OBSERVEINTRUDER] > 0))
		{
			if(self.aivar[AIV_OBSERVEINTRUDER] != 2)
			{
				self.aivar[AIV_OBSERVEINTRUDER] = 2;
				AI_Wait(self,3);
			}
			else if(Npc_GetStateTime(self) > 10)
			{
				printdebugnpc(PD_ORC_FRAME,"ZS_OrcWarrior_ObserveIntruder: NEUTRAL: Angriff");
				AI_StartState(self,zs_orc_attack,1,"");
			};
		}
		else if((Npc_GetDistToNpc(self,other) < 500) && (self.aivar[AIV_OBSERVEINTRUDER] == 0))
		{
			self.aivar[AIV_OBSERVEINTRUDER] = 1;
			printdebugnpc(PD_ORC_FRAME,"ZS_OrcWarrior_ObserveIntruder: NEUTRAL: Waffe ziehen");
			if(!Npc_HasReadiedWeapon(self))
			{
				AI_EquipBestMeleeWeapon(self);
				AI_DrawWeapon(self);
			};
			b_say(self,other,"$LOOKINGFORTROUBLEEH");
		}
		else if(Npc_GetStateTime(self) > 15)
		{
			return 1;
		};
		return 0;
	}
	else if(Npc_GetAttitude(self,other) == ATT_FRIENDLY)
	{
		printdebugnpc(PD_ORC_FRAME,"ZS_OrcWarrior_ObserveIntruder: FRIENDLY");
		b_orc_smartturn();
		if((Npc_GetDistToNpc(self,other) < 300) && (self.aivar[AIV_OBSERVEINTRUDER] != 1))
		{
			self.aivar[AIV_OBSERVEINTRUDER] = 1;
			b_say(self,other,"$WHAT");
		};
		if(Npc_GetDistToNpc(self,other) > 700)
		{
			return 1;
		};
		return 0;
	}
	else if(Npc_GetDistToNpc(self,other) > 2000)
	{
		return 1;
	};
	return 0;
};

func void zs_orcwarrior_observeintruder_end()
{
	printdebugnpc(PD_ORC_FRAME,"ZS_OrcWarrior_ObserveIntruder_End");
	if(Npc_HasReadiedWeapon(self))
	{
		AI_RemoveWeapon(self);
	};
	AI_StopLookAt(self);
	AI_ContinueRoutine(self);
};

func void zs_orcscout_observeintruder()
{
	printdebugnpc(PD_ORC_FRAME,"ZS_OrcScout_ObserveIntruder");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_orc_assessdamage);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_orc_drawweapon);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,zs_orc_watchfight);
	Npc_PercEnable(self,PERC_ASSESSMURDER,b_orc_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,b_orc_assessdefeat);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_orc_assesssomethingevil);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_orc_assesssomethingevil);
	self.aivar[AIV_OBSERVEINTRUDER] = 0;
	self.aivar[AIV_WARNTARGET] = 0;
};

func int zs_orcscout_observeintruder_loop()
{
	printdebugnpc(PD_ORC_FRAME,"ZS_OrcScout_ObserveIntruder_Loop:");
	if((Npc_GetAttitude(self,other) == ATT_HOSTILE) && (Npc_GetDistToNpc(self,other) < 1000))
	{
		printdebugnpc(PD_ORC_FRAME,"ZS_OrcScout_ObserveIntruder: HOSTILE");
		b_say(self,other,"$DIE");
		AI_StartState(self,zs_orc_attack,1,"");
		return 1;
	}
	else if((Npc_GetAttitude(self,other) == ATT_ANGRY) && (self.aivar[AIV_WARNTARGET] == 0))
	{
		printdebugnpc(PD_ORC_FRAME,"ZS_OrcScout_ObserveIntruder: ANGRY");
		b_orc_smartturn();
		if((Npc_GetDistToNpc(self,other) < 300) && ((self.aivar[AIV_OBSERVEINTRUDER] == 1) || (Npc_GetStateTime(self) > 6)))
		{
			printdebugnpc(PD_ORC_FRAME,"ZS_OrcScout_ObserveIntruder: ANGRY: Angriff 1");
			b_say(self,other,"$DIE");
			AI_StartState(self,zs_orc_attack,1,"");
		}
		else if((Npc_GetDistToNpc(self,other) < 400) && (self.aivar[AIV_OBSERVEINTRUDER] == 0))
		{
			printdebugnpc(PD_ORC_FRAME,"ZS_OrcScout_ObserveIntruder: ANGRY: Waffe ziehen");
			if(!Npc_HasReadiedWeapon(self))
			{
				AI_EquipBestMeleeWeapon(self);
				AI_DrawWeapon(self);
			};
			self.aivar[AIV_OBSERVEINTRUDER] = 1;
			b_say(self,other,"$LOOKINGFORTROUBLEEH");
		}
		else if((self.aivar[AIV_OBSERVEINTRUDER] == 1) && (Npc_GetStateTime(self) > 6))
		{
			printdebugnpc(PD_ORC_FRAME,"ZS_OrcScout_ObserveIntruder: ANGRY: Angriff 2");
			b_say(self,other,"$DIE");
			AI_StartState(self,zs_orc_attack,1,"");
		}
		else if(Npc_GetDistToNpc(self,other) > 600)
		{
			return 1;
		};
		return 0;
	}
	else if((Npc_GetAttitude(self,other) == ATT_NEUTRAL) && (self.aivar[AIV_WARNTARGET] == 0))
	{
		printdebugnpc(PD_ORC_FRAME,"ZS_OrcScout_ObserveIntruder: NEUTRAL");
		b_orc_smartturn();
		if((Npc_GetDistToNpc(self,other) < 200) && (self.aivar[AIV_OBSERVEINTRUDER] > 0))
		{
			if(self.aivar[AIV_OBSERVEINTRUDER] != 2)
			{
				self.aivar[AIV_OBSERVEINTRUDER] = 2;
				AI_Wait(self,3);
			}
			else if(Npc_GetStateTime(self) > 10)
			{
				printdebugnpc(PD_ORC_FRAME,"ZS_OrcScout_ObserveIntruder: NEUTRAL: Angriff");
				AI_StartState(self,zs_orc_attack,1,"");
			};
		}
		else if((Npc_GetDistToNpc(self,other) < 400) && (self.aivar[AIV_OBSERVEINTRUDER] == 0))
		{
			self.aivar[AIV_OBSERVEINTRUDER] = 1;
			printdebugnpc(PD_ORC_FRAME,"ZS_OrcScout_ObserveIntruder: NEUTRAL: Waffe ziehen");
			b_say(self,other,"$LOOKINGFORTROUBLEEH");
		}
		else if(Npc_GetStateTime(self) > 15)
		{
			return 1;
		};
		return 0;
	}
	else if(Npc_GetAttitude(self,other) == ATT_FRIENDLY)
	{
		printdebugnpc(PD_ORC_FRAME,"ZS_OrcScout_ObserveIntruder: FRIENDLY");
		b_orc_smartturn();
		if((Npc_GetDistToNpc(self,other) < 300) && (self.aivar[AIV_OBSERVEINTRUDER] != 1))
		{
			self.aivar[AIV_OBSERVEINTRUDER] = 1;
			b_say(self,other,"$WHAT");
		};
		if(Npc_GetDistToNpc(self,other) > 400)
		{
			return 1;
		};
		return 0;
	}
	else if(Npc_GetDistToNpc(self,other) > 2000)
	{
		return 1;
	};
	return 0;
};

func void zs_orcscout_observeintruder_end()
{
	printdebugnpc(PD_ORC_FRAME,"ZS_OrcScout_ObserveIntruder_End");
	if(Npc_HasReadiedWeapon(self))
	{
		AI_RemoveWeapon(self);
	};
	AI_StopLookAt(self);
	AI_ContinueRoutine(self);
};

func void zs_orcshaman_observeintruder()
{
	printdebugnpc(PD_ORC_FRAME,"ZS_OrcShaman_ObserveIntruder");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_orc_assessdamage);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_orc_drawweapon);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,zs_orc_watchfight);
	Npc_PercEnable(self,PERC_ASSESSMURDER,b_orc_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,b_orc_assessdefeat);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_orc_assesssomethingevil);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_orc_assesssomethingevil);
	self.aivar[AIV_OBSERVEINTRUDER] = 0;
	self.aivar[AIV_WARNTARGET] = 0;
};

func int zs_orcshaman_observeintruder_loop()
{
	printdebugnpc(PD_ORC_FRAME,"ZS_OrcShaman_ObserveIntruder_Loop:");
	if((Npc_GetAttitude(self,other) == ATT_HOSTILE) && (Npc_GetDistToNpc(self,other) < 1500))
	{
		printdebugnpc(PD_ORC_FRAME,"ZS_OrcShaman_ObserveIntruder: HOSTILE");
		b_say(self,other,"$DIE");
		AI_StartState(self,zs_orc_attack,1,"");
		return 1;
	}
	else if((Npc_GetAttitude(self,other) == ATT_ANGRY) && (self.aivar[AIV_WARNTARGET] == 0))
	{
		printdebugnpc(PD_ORC_FRAME,"ZS_OrcShaman_ObserveIntruder: ANGRY");
		b_orc_smartturn();
		if((Npc_GetDistToNpc(self,other) < 500) && ((self.aivar[AIV_OBSERVEINTRUDER] == 1) || (Npc_GetStateTime(self) > 6)))
		{
			printdebugnpc(PD_ORC_FRAME,"ZS_OrcShaman_ObserveIntruder: ANGRY: Angriff 1");
			b_say(self,other,"$DIE");
			AI_StartState(self,zs_orc_attack,1,"");
		}
		else if((Npc_GetDistToNpc(self,other) < 1500) && (self.aivar[AIV_OBSERVEINTRUDER] == 0))
		{
			printdebugnpc(PD_ORC_FRAME,"ZS_OrcShaman_ObserveIntruder: ANGRY: Waffe ziehen");
			if(!Npc_HasReadiedWeapon(self))
			{
				AI_EquipBestMeleeWeapon(self);
				AI_DrawWeapon(self);
			};
			self.aivar[AIV_OBSERVEINTRUDER] = 1;
			b_say(self,other,"$LOOKINGFORTROUBLEEH");
		}
		else if((self.aivar[AIV_OBSERVEINTRUDER] == 1) && (Npc_GetStateTime(self) > 6))
		{
			printdebugnpc(PD_ORC_FRAME,"ZS_OrcShaman_ObserveIntruder: ANGRY: Angriff 2");
			b_say(self,other,"$DIE");
			AI_StartState(self,zs_orc_attack,1,"");
		};
		return 0;
	}
	else if((Npc_GetAttitude(self,other) == ATT_NEUTRAL) && (self.aivar[AIV_WARNTARGET] == 0))
	{
		printdebugnpc(PD_ORC_FRAME,"ZS_OrcShaman_ObserveIntruder: NEUTRAL");
		b_orc_smartturn();
		if((Npc_GetDistToNpc(self,other) < 300) && (self.aivar[AIV_OBSERVEINTRUDER] > 0))
		{
			if(self.aivar[AIV_OBSERVEINTRUDER] != 2)
			{
				self.aivar[AIV_OBSERVEINTRUDER] = 2;
				AI_Wait(self,3);
			}
			else if(Npc_GetStateTime(self) > 10)
			{
				printdebugnpc(PD_ORC_FRAME,"ZS_OrcShaman_ObserveIntruder: NEUTRAL: Angriff");
				AI_StartState(self,zs_orc_attack,1,"");
			};
		}
		else if((Npc_GetDistToNpc(self,other) < 1000) && (self.aivar[AIV_OBSERVEINTRUDER] == 0))
		{
			self.aivar[AIV_OBSERVEINTRUDER] = 1;
			printdebugnpc(PD_ORC_FRAME,"ZS_OrcShaman_ObserveIntruder: NEUTRAL: Waffe ziehen");
			if(!Npc_HasReadiedWeapon(self))
			{
				AI_EquipBestMeleeWeapon(self);
				AI_DrawWeapon(self);
			};
			b_say(self,other,"$LOOKINGFORTROUBLEEH");
		}
		else if(Npc_GetStateTime(self) > 15)
		{
			return 1;
		};
		return 0;
	}
	else if(Npc_GetAttitude(self,other) == ATT_FRIENDLY)
	{
		printdebugnpc(PD_ORC_FRAME,"ZS_OrcShaman_ObserveIntruder: FRIENDLY");
		b_orc_smartturn();
		if((Npc_GetDistToNpc(self,other) < 300) && (self.aivar[AIV_OBSERVEINTRUDER] != 1))
		{
			self.aivar[AIV_OBSERVEINTRUDER] = 1;
			b_say(self,other,"$WHAT");
		};
		if(Npc_GetDistToNpc(self,other) > 400)
		{
			return 1;
		};
		return 0;
	}
	else if(Npc_GetDistToNpc(self,other) > 2000)
	{
		return 1;
	};
	return 0;
};

func void zs_orcshaman_observeintruder_end()
{
	printdebugnpc(PD_ORC_FRAME,"ZS_OrcShaman_ObserveIntruder_End");
	if(Npc_HasReadiedWeapon(self))
	{
		AI_RemoveWeapon(self);
	};
	AI_StopLookAt(self);
	AI_ContinueRoutine(self);
};

