
func void zs_reacttodamage()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_ReactToDamage");
	printglobals(PD_ZS_CHECK);
	c_zsinit();
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSMURDER,b_combatassessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,b_combatassessdefeat);
	b_whirlaround(self,other);
	if(self.id == 888 || self.id == 889)
	{
		GOPSTOPPED_BRIDGE = TRUE;
	};
	if(self.id == 574 && Npc_KnowsInfo(hero,dia_mud_firstexit) && MUD_HIT == FALSE)
	{
		MUD_HIT = TRUE;
		//PrintScreen("mud_hit",-1,-1,"font_old_20_white.tga",1);
	};
	if(Hlp_GetInstanceID(org_858_quentin) == Hlp_GetInstanceID(self) || Hlp_GetInstanceID(org_869_raeuber) == Hlp_GetInstanceID(self) || Hlp_GetInstanceID(org_870_raeuber) == Hlp_GetInstanceID(self) || Hlp_GetInstanceID(org_865_raeuber) == Hlp_GetInstanceID(self) || Hlp_GetInstanceID(org_866_raeuber) == Hlp_GetInstanceID(self) || Hlp_GetInstanceID(org_864_raeuber) == Hlp_GetInstanceID(self))
	{
		b_setorg2hostile();
		if(QUENTIN_GANG_QUEST_STARTED == LOG_RUNNING && !Npc_KnowsInfo(hero,dia_raven_quentin))
		{
			QUENTIN_GANG_QUEST_STARTED = LOG_FAILED;
			Log_SetTopicStatus(QUENTIN_GANG,LOG_FAILED);
			b_logentry(QUENTIN_GANG,"“еперь можно забыть о св€з€х с преступным миром!");
		};
	};
	if(self.aivar[AIV_SPECIALCOMBATDAMAGEREACTION])
	{
		b_specialcombatdamagereaction();
	};
	if(Npc_IsInFightMode(other,FMODE_FAR) || Npc_IsInFightMode(other,FMODE_MAGIC))
	{
		self.aivar[AIV_LASTHITBYRANGEDWEAPON] = TRUE;
	}
	else
	{
		self.aivar[AIV_LASTHITBYRANGEDWEAPON] = FALSE;
	};
	if(self.id == 574)
	{
		return;
	};
	if(!c_npcismonster(other))
	{
		if(Npc_IsPlayer(other))
		{
			self.aivar[AIV_BEENATTACKED] = 1;
			if((npc_gettempattitude(self,other) == ATT_FRIENDLY) || (self.npctype == NPCTYPE_FRIEND))
			{
				printdebugnpc(PD_ZS_CHECK,"...NSC FRIENDLY zum Angreifer");
				c_lookatnpc(self,other);
				b_say(self,other,"WHATAREYOUDOING");
				Npc_SetTempAttitude(self,ATT_ANGRY);
				AI_ContinueRoutine(self);
				return;
			}
			else
			{
				printdebugnpc(PD_ZS_CHECK,"...NSC nicht FRIENDLY zum Angreifer!");
				if(Npc_GetPermAttitude(self,other) != ATT_HOSTILE)
				{
					npc_setpermattitude(self,ATT_ANGRY);
				};
				Npc_SetTempAttitude(self,ATT_HOSTILE);
			};
		};
		AI_StartState(self,zs_assessenemy,0,"");
	}
	else
	{
		AI_StartState(self,zs_assessmonster,0,"");
	};
};

