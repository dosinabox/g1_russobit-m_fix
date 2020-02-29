
func void zs_attack()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Attack");
	c_zsinit();
	printglobals(PD_ZS_FRAME);
	Npc_PercEnable(self,PERC_ASSESSMURDER,b_combatassessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,b_combatassessdefeat);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_combatreacttodamage);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,zs_assesssurprise);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSREMOVEWEAPON,b_combatremoveweapon);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,b_combatassessenterroom);
	Npc_PercEnable(self,PERC_CATCHTHIEF,b_combatcatchthief);
	Npc_GetTarget(self);
	b_whirlaround(self,other);
	b_selectweapon(self,other);
	AI_SetWalkMode(self,NPC_RUN);
};

func int zs_attack_loop()
{
	var int countpursuitcycles;
	printdebugnpc(PD_ZS_LOOP,"ZS_Attack_Loop");
	Npc_GetTarget(self);
	printglobals(PD_ZS_DETAIL);
	if(c_npcisdown(other) || !Hlp_IsValidNpc(other))
	{
		printdebugnpc(PD_ZS_CHECK,"...Ziel ist kampf-unfähig oder ungültig!");
		Npc_PerceiveAll(self);
		self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID(other);
		if(Npc_GetNextTarget(self))
		{
			if(Hlp_IsValidNpc(other) && !c_npcisdown(other) && Npc_CanSeeNpcFreeLOS(self,other) && !c_otheristoleratedenemy(self,other))
			{
				printdebugstring(PD_ZS_CHECK,"...neues Ziel gefunden:",other.name);
			}
			else
			{
				printdebugnpc(PD_ZS_CHECK,"...kein Neues Ziel vorhanden!");
				return LOOP_END;
			};
		}
		else
		{
			printdebugnpc(PD_ZS_CHECK,"...KEIN neues Ziel gefunden!");
			return LOOP_END;
		};
	};
	if(Npc_GetStateTime(self) > 2)
	{
		if(!Npc_IsInFightMode(self,FMODE_FAR) && !Npc_IsInFightMode(self,FMODE_MAGIC) && (!Npc_IsInFightMode(other,FMODE_FAR) && !Npc_IsInFightMode(other,FMODE_MAGIC)))
		{
			printdebugnpc(PD_ZS_CHECK,"...WEDER NSC noch Gegner führen Fernkampfwaffen!");
			if((Npc_GetDistToNpc(self,other) > HAI_DIST_ABORT_MELEE) && (self.aivar[AIV_LASTHITBYRANGEDWEAPON] == FALSE))
			{
				printdebugnpc(PD_ZS_CHECK,"...Gegner außerhalb Nahkampfreichweite & letzter Treffer nicht durch Fernkampfwaffe!");
				b_fullstop(self);
				printglobals(PD_ZS_CHECK);
				if(c_npcishuman(other))
				{
					b_assessandmemorize(NEWS_DEFEAT,NEWS_SOURCE_WITNESS,self,self,other);
					if(Npc_GetPermAttitude(self,other) != ATT_HOSTILE)
					{
						AI_PointAtNpc(self,other);
						b_say(self,other,"$RUNCOWARD");
						AI_StopPointAt(self);
					};
				};
				return LOOP_END;
			};
		}
		else
		{
			printdebugnpc(PD_ZS_CHECK,"...entweder NSC oder Gegner FÜHREN Fernkampfwaffen!");
			if(Npc_GetDistToNpc(self,other) > HAI_DIST_ABORT_RANGED)
			{
				printdebugnpc(PD_ZS_CHECK,"...Gegner außerhalb Fernkampfreichweite!");
				b_fullstop(self);
				return LOOP_END;
			};
		};
		countpursuitcycles = countpursuitcycles + 1;
		if(Npc_IsPlayer(other) && (c_bodystatecontains(other,BS_RUN) || c_bodystatecontains(other,BS_JUMP)) && !Npc_IsInFightMode(self,FMODE_FAR) && !Npc_IsInFightMode(self,FMODE_MAGIC) && (c_getattackreason(self) != AIV_AR_INTRUDER))
		{
			if(countpursuitcycles > HAI_TIME_FOLLOW)
			{
				printdebugnpc(PD_ZS_CHECK,"...Gegner rennt schon zu lange weg!");
				b_fullstop(self);
				if(c_npcishuman(other))
				{
					b_assessandmemorize(NEWS_DEFEAT,NEWS_SOURCE_WITNESS,self,self,other);
					if(Npc_GetPermAttitude(self,other) != ATT_HOSTILE)
					{
						AI_PointAtNpc(self,other);
						b_say(self,other,"$RUNCOWARD");
						AI_StopPointAt(self);
					};
					AI_Wait(self,5);
				};
				return LOOP_END;
			};
		}
		else
		{
			countpursuitcycles = 0;
		};
		printglobals(PD_ZS_DETAIL);
		Npc_ClearAIQueue(self);
		b_selectweapon(self,other);
		AI_SetWalkMode(self,NPC_RUN);
		Npc_SetStateTime(self,0);
	};
	if(other.aivar[AIV_INVINCIBLE] == FALSE)
	{
		AI_Attack(self);
	}
	else
	{
		AI_Wait(self,0.5);
	};
	if((self.npctype == NPCTYPE_AMBIENT) || (self.npctype == NPCTYPE_OW_AMBIENT) || (self.npctype == NPCTYPE_MINE_AMBIENT) || (self.fight_tactic == FAI_HUMAN_COWARD))
	{
		if((self.fight_tactic == FAI_HUMAN_COWARD) && (self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2)))
		{
			printdebugnpc(PD_ZS_CHECK,"...coward flees!");
			AI_StartState(self,zs_flee,0,"");
		};
		if((self.fight_tactic == FAI_HUMAN_STRONG) && (self.attribute[ATR_HITPOINTS] < ((self.attribute[ATR_HITPOINTS_MAX] / 4) * 3)))
		{
			printdebugnpc(PD_ZS_CHECK,"...strong flees!");
			AI_StartState(self,zs_flee,0,"");
		};
		if((self.fight_tactic == FAI_HUMAN_MAGE) && (self.attribute[ATR_MANA] < (self.attribute[ATR_MANA_MAX] / 5)))
		{
			printdebugnpc(PD_ZS_CHECK,"...mage flees!");
			AI_StartState(self,zs_flee,0,"");
		};
		if((self.fight_tactic == FAI_HUMAN_RANGED) && (self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 3)))
		{
			printdebugnpc(PD_ZS_CHECK,"...ranged fighter flees!");
			AI_StartState(self,zs_flee,0,"");
		};
	};
	return LOOP_CONTINUE;
};

func void zs_attack_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Attack_End");
	OTHER = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
	printglobals(PD_ZS_CHECK);
	if(Npc_IsInState(other,zs_unconscious) && (self.fight_tactic != FAI_HUMAN_RANGED))
	{
		printdebugnpc(PD_ZS_CHECK,"...Ziel bewußtlos/magisch schlafend und NSC kein purer Fernkämpfer!");
		if(Npc_GetAttitude(self,other) == ATT_FRIENDLY)
		{
			b_removeweapon(self);
			b_say(self,other,"$LETSFORGETOURLITTLEFIGHT");
			c_stoplookat(self);
			AI_StartState(self,zs_healself,1,"");
		};
		if((Npc_GetPermAttitude(self,other) == ATT_HOSTILE) || ((c_getattackreason(self) == AIV_AR_INTRUDER) && Npc_HasNews(self,NEWS_DEFEAT,self,other)))
		{
			printdebugnpc(PD_ZS_CHECK,"...Hostile/Intruder wird gefinished");
			b_fullstop(self);
			printglobals(PD_ZS_CHECK);
			AI_FinishingMove(self,other);
			AI_Wait(self,1);
		}
		else
		{
			printdebugnpc(PD_ZS_CHECK,"...Nicht hostile");
			b_say(self,other,"$NEVERTRYTHATAGAIN");
		};
	};
	b_removeweapon(self);
	c_stoplookat(self);
	b_resettempattitude(self);
	b_setattackreason(self,AIV_AR_NONE);
	if(other.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_PUNISH)
	{
		other.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	};
	if(!c_npcisboss(self) && c_npcishuman(other) && (Npc_IsInState(other,zs_unconscious) || Npc_IsDead(other) || Npc_IsInState(other,zs_magicsleep)))
	{
		if(self.fight_tactic != FAI_HUMAN_RANGED)
		{
			printdebugnpc(PD_ZS_CHECK,"...Plünderbedingungen erüllt!");
			AI_StartState(self,zs_assessbody,1,"");
			return;
		};
	};
	AI_StartState(self,zs_healself,1,"");
};

func void b_combatremoveweapon()
{
	printdebugnpc(PD_ZS_FRAME,"B_CombatRemoveWeapon");
	if(Npc_WasInState(self,zs_assessfighter) || Npc_WasInState(self,zs_assessfighterwait))
	{
		printdebugnpc(PD_ZS_CHECK,"...Angriffsgrund: Waffe nicht weggesteckt!");
		if(self.attribute[ATR_HITPOINTS] == self.attribute[ATR_HITPOINTS_MAX])
		{
			printdebugnpc(PD_ZS_CHECK,"...NSC unverletzt!");
			b_fullstop(self);
			b_resettempattitude(self);
			b_assessremoveweapon();
		};
	};
};

func void b_combatassessenterroom()
{
	printdebugnpc(PD_ZS_FRAME,"B_CombatAssessEnterRoom");
	if((Wld_GetPlayerPortalGuild() == GIL_NONE) && !Npc_HasNews(self,NEWS_THEFT,other,self))
	{
		printdebugnpc(PD_ZS_CHECK,"...SC hat Raum des NSCs verlassen und noch nichts geklaut!");
		if(self.attribute[ATR_HITPOINTS] == self.attribute[ATR_HITPOINTS_MAX])
		{
			printdebugnpc(PD_ZS_CHECK,"...NSC unverletzt!");
			b_fullstop(self);
			b_resettempattitude(self);
			b_assessremoveweapon();
		};
	};
};

func void b_combatcatchthief()
{
	printdebugnpc(PD_ZS_FRAME,"B_CombatAssessTheft");
	b_assessandmemorize(NEWS_THEFT,NEWS_SOURCE_WITNESS,self,other,self);
	b_fullstop(self);
	b_whirlaround(self,other);
	b_sayoverlay(self,other,"$DIRTYTHIEF");
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,0,"");
};

