
func void zs_clearroom()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_ClearRoom");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,b_clearroomenterroom);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,b_clearroomusemob);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_MOVENPC,b_stopgotohero);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,b_assesstheft);
	c_zsinit();
	b_whirlaround(self,other);
	AI_PointAtNpc(self,other);
	b_say(self,other,"$HEYYOU");
	AI_StopPointAt(self);
	AI_SetWalkMode(self,NPC_RUN);
	Npc_SetTarget(self,other);
	Npc_SetRefuseTalk(hero,10);
};

func int zs_clearroom_loop()
{
	var int portalguild;
	printdebugnpc(PD_ZS_LOOP,"ZS_ClearRoom_Loop");
	Npc_GetTarget(self);
	portalguild = Wld_GetPlayerPortalGuild();
	printguild(PD_ZS_CHECK,portalguild);
	if((portalguild == GIL_NONE) || (Wld_GetGuildAttitude(self.guild,portalguild) != ATT_FRIENDLY) || (Npc_GetAttitude(self,other) == ATT_FRIENDLY))
	{
		b_fullstop(self);
		AI_ContinueRoutine(self);
		return LOOP_END;
	};
	if((Npc_GetDistToNpc(self,other) < PERC_DIST_DIALOG) && Npc_CanSeeNpc(self,other))
	{
		b_fullstop(self);
		return LOOP_END;
	};
	AI_GotoNpc(self,other);
	AI_Wait(self,0.5);
	return LOOP_CONTINUE;
};

func void zs_clearroom_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_ClearRoom_End");
	AI_TurnToNPC(self,other);
	if(c_amistronger(self,other))
	{
		printdebugnpc(PD_ZS_CHECK,"...Nsc ist stärker!");
		b_drawweapon(self,other);
		b_say(self,other,"$GETOUTOFHERE");
		AI_StartState(self,zs_clearroomwait,0,"");
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"...Nsc ist schwächer!");
		b_say(self,other,"$WHYAREYOUINHERE ");
		AI_StartState(self,zs_clearroomwait,0,"");
	};
};

func void zs_clearroomwait()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_ClearRoomWait");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,b_clearroomenterroom);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,b_clearroomusemob);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,b_assesstheft);
	c_zsinit();
};

func void zs_clearroomwait_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_ClearRoomWait_Loop");
	Npc_SetRefuseTalk(hero,10);
	if(Npc_GetStateTime(self) > 8)
	{
		printdebugnpc(PD_ZS_CHECK,"...NSC wartet seit 8 Sekunden!");
		if((Wld_GetPlayerPortalGuild() == GIL_NONE) || (Npc_GetAttitude(self,other) == ATT_FRIENDLY))
		{
			if(c_amistronger(self,other))
			{
				AI_TurnToNPC(self,other);
				b_say(self,other,"$WISEMOVE");
			};
			AI_ContinueRoutine(self);
		}
		else if(c_amistronger(self,other))
		{
			b_say(self,other,"$YOUASKEDFORIT");
			Npc_SetTarget(self,other);
			AI_StartState(self,zs_attack,0,"");
			Npc_SetRefuseTalk(hero,60);
		}
		else
		{
			AI_StartState(self,zs_callguardsonenterroom,0,"");
		};
	};
	AI_Wait(self,1);
};

func void zs_clearroomwait_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_ClearRoomWait_End");
};

func void b_clearroomenterroom()
{
	printdebugnpc(PD_ZS_FRAME,"B_ClearRoomEnterRoom");
	b_fullstop(self);
	if(Npc_CanSeeNpcFreeLOS(self,other))
	{
		printdebugnpc(PD_ZS_CHECK,"...NSC kann SC sehen!");
		if((Wld_GetPlayerPortalGuild() == GIL_NONE) || (Npc_GetAttitude(self,other) == ATT_FRIENDLY))
		{
			printdebugnpc(PD_ZS_CHECK,"...SC nicht mehr im Raum!");
			if(c_amistronger(self,other))
			{
				AI_TurnToNPC(self,other);
				b_say(self,other,"$WISEMOVE");
			};
			AI_ContinueRoutine(self);
		}
		else
		{
			printdebugnpc(PD_ZS_CHECK,"...SC wieder im Raum!");
			if(c_amistronger(self,other))
			{
				printdebugnpc(PD_ZS_CHECK,"...stronger");
				AI_TurnToNPC(self,other);
				b_say(self,other,"$YOUASKEDFORIT");
				Npc_SetTarget(self,other);
				AI_StartState(self,zs_attack,0,"");
			}
			else
			{
				printdebugnpc(PD_ZS_CHECK,"...not stronger--> CallGuards");
				AI_StartState(self,zs_callguardsonenterroom,0,"");
			};
		};
	};
};

func void b_clearroomusemob()
{
	printdebugnpc(PD_ZS_FRAME,"B_ClearRoomUseMob");
	if(Npc_CanSeeNpcFreeLOS(self,other))
	{
		if(Npc_IsDetectedMobOwnedByNpc(other,self) || Npc_IsDetectedMobOwnedByGuild(other,self.guild))
		{
			printdebugnpc(PD_ZS_CHECK,"...MOB gehört NSC oder seiner Gilde!");
			b_fullstop(self);
			Npc_PercDisable(self,PERC_ASSESSUSEMOB);
			b_assessandmemorize(NEWS_THEFT,NEWS_SOURCE_WITNESS,self,other,self);
			if(c_amistronger(self,other))
			{
				b_say(self,other,"$DIRTYTHIEF");
				Npc_SetTarget(self,other);
				AI_StartState(self,zs_attack,0,"");
				Npc_SetRefuseTalk(hero,60);
			}
			else
			{
				AI_StartState(self,zs_callguardsonenterroom,0,"");
			};
		};
	};
};

