
func void zs_orc_attack()
{
	printdebugnpc(PD_ORC_FRAME,"Orc_Attack!");
	Npc_SetTarget(self,other);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSMURDER,b_orc_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,b_orc_assessdefeat);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_RUN);
	if(!Npc_HasReadiedWeapon(self))
	{
		AI_EquipBestMeleeWeapon(self);
		AI_DrawWeapon(self);
	};
};

func int zs_orc_attack_loop()
{
	if(!Hlp_IsValidNpc(other))
	{
		printdebugnpc(PD_ORC_CHECK,"Orc_Attack_Loop: ...Ziel ungültig!");
		return LOOP_END;
	};
	if(c_npcisdown(other))
	{
		printdebugnpc(PD_ORC_CHECK,"Orc_Attack_Loop: Gegner tot");
		return LOOP_END;
	};
	if(Npc_GetTarget(self) && !c_npcisdown(other))
	{
		printdebugnpc(PD_ORC_LOOP,"...Ziel vorhanden!");
		if(c_bodystatecontains(other,BS_RUN))
		{
			printdebugnpc(PD_ORC_LOOP,"...Ziel läuft!");
			if(Npc_GetStateTime(self) > 10)
			{
				printdebugnpc(PD_ORC_CHECK,"...Ziel schon zu lange verfolgt!");
				AI_PointAtNpc(self,other);
				b_say(self,other,"$RUNCOWARD");
				AI_StopPointAt(self);
				return LOOP_END;
			};
		}
		else if(c_bodystatecontains(other,BS_SWIM) || c_bodystatecontains(other,BS_DIVE))
		{
			return LOOP_END;
		}
		else
		{
			Npc_SetStateTime(self,0);
		};
		AI_Attack(self);
	}
	else
	{
		Npc_PerceiveAll(self);
		if(Npc_IsNextTargetAvailable(self))
		{
			if(c_npcisdown(other))
			{
				return LOOP_END;
			}
			else
			{
				Npc_GetNextTarget(self);
			};
		};
	};
	return LOOP_CONTINUE;
};

func void zs_orc_attack_end()
{
	printdebugnpc(PD_ORC_FRAME,"ZS_MM_Attack_End");
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	AI_PlayAni(self,"T_WARN");
	AI_Wait(self,1);
	AI_RemoveWeapon(self);
	AI_ContinueRoutine(self);
};

