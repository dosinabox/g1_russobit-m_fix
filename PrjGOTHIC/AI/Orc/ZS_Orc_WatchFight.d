
func int zs_orc_watchfight()
{
	var int i;
	printdebugnpc(PD_ORC_FRAME,"ZS_Orc_WatchFight");
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,b_orc_cheerfight);
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_orc_observeintruder);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_orc_assessdamage);
	Npc_PercEnable(self,PERC_ASSESSMURDER,b_orc_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,b_orc_assessdefeat);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_orc_assesssomethingevil);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_orc_assesssomethingevil);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_orc_assesswarn);
	if((other.guild == GIL_ORCSLAVE) || (victim.guild == GIL_ORCSLAVE))
	{
		printdebugnpc(PD_ORC_FRAME,"ZS_Orc_WatchFight: Orc-Slave -> Abbruch");
		AI_ContinueRoutine(self);
		return 0;
	};
	if(Hlp_Random(20) < 4)
	{
		AI_PointAtNpc(self,other);
		b_say(self,NULL,"$THERESAFIGHT");
	};
	AI_Standup(self);
	if((Npc_GetAttitude(self,other) == ATT_HOSTILE) || (Npc_GetAttitude(self,other) == ATT_ANGRY))
	{
		printdebugnpc(PD_ORC_FRAME,"ZS_Orc_WatchFight: other HOSTILE|ANGRY -> Angriff!");
		AI_StartState(self,zs_orc_attack,0,"");
		return 0;
	};
	if((Npc_GetAttitude(self,victim) == ATT_HOSTILE) || (Npc_GetAttitude(self,victim) == ATT_ANGRY))
	{
		printdebugnpc(PD_ORC_FRAME,"ZS_Orc_WatchFight: victim HOSTILE|ANGRY -> Angriff!");
		i = Hlp_GetInstanceID(victim);
		OTHER = Hlp_GetNpc(i);
		AI_StartState(self,zs_orc_attack,0,"");
		return 0;
	};
	if(Npc_HasReadiedRangedWeapon(other) && (other.guild < GIL_SEPERATOR_ORC) && ((victim.guild > GIL_SEPERATOR_ORC) || (victim.guild == GIL_ORCDOG)))
	{
		AI_StartState(self,zs_orc_attack,0,"");
		return 0;
	};
	Npc_ClearAIQueue(self);
	Npc_SetPercTime(self,1);
	AI_GotoNpc(self,other);
	return 1;
};

func int zs_orc_watchfight_loop()
{
	var int i;
	var int anim;
	printdebugnpc(PD_ORC_LOOP,"ZS_Orc_WatchFight_Loop");
	if((Npc_GetAttitude(self,other) == ATT_HOSTILE) || (Npc_GetAttitude(self,other) == ATT_ANGRY))
	{
		printdebugnpc(PD_ORC_FRAME,"ZS_Orc_WatchFight: other HOSTILE|ANGRY -> Angriff!");
		AI_StartState(self,zs_orc_attack,0,"");
		return 0;
	};
	if((Npc_GetAttitude(self,victim) == ATT_HOSTILE) || (Npc_GetAttitude(self,victim) == ATT_ANGRY))
	{
		printdebugnpc(PD_ORC_FRAME,"ZS_Orc_WatchFight: victim HOSTILE|ANGRY -> Angriff!");
		i = Hlp_GetInstanceID(victim);
		OTHER = Hlp_GetNpc(i);
		AI_StartState(self,zs_orc_attack,0,"");
		return 0;
	};
	if((Npc_GetDistToNpc(self,other) > (PERC_DIST_WATCHFIGHT + 200)) && (Npc_GetDistToNpc(self,other) < (PERC_DIST_WATCHFIGHT * 2)))
	{
		printdebugnpc(PD_ORC_LOOP,"ZS_Orc_WatchFight_Loop: gehe wieder naeher heran");
		Npc_ClearAIQueue(self);
		AI_GotoNpc(self,other);
		AI_Dodge(self);
		return 0;
	};
	if(Npc_GetDistToNpc(self,other) < (PERC_DIST_WATCHFIGHT / 2))
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		AI_Dodge(self);
	};
	AI_TurnToNPC(self,other);
	if(!Hlp_IsValidNpc(other) || !Hlp_IsValidNpc(victim) || Npc_IsDead(other) || Npc_IsDead(victim) || Npc_IsInState(other,zs_unconscious) || Npc_IsInState(victim,zs_unconscious) || !(Npc_IsInFightMode(other,FMODE_FIST) && !Npc_IsInFightMode(other,FMODE_MAGIC) && !Npc_HasReadiedWeapon(other) && !Npc_IsInFightMode(victim,FMODE_FIST) && !Npc_IsInFightMode(victim,FMODE_MAGIC) && !Npc_HasReadiedWeapon(victim)))
	{
		printdebugnpc(PD_ORC_LOOP,"ZS_Orc_WatchFight_Loop: einer der Kaempfer tot oder bewusstlos");
		Npc_ClearAIQueue(self);
		return 1;
	};
	if(Hlp_Random(100) < 10)
	{
		printdebugnpc(PD_ORC_LOOP,"ZS_Orc_WatchFight_Loop: Jubel");
		AI_TurnToNPC(self,other);
		b_say(self,NULL,"$HEYHEYHEY");
	};
	anim = Hlp_Random(100);
	if(anim < 5)
	{
		AI_PlayAni(self,"T_DANCE_RANDOM1");
	}
	else if(anim < 10)
	{
		AI_PlayAni(self,"T_ANGRY");
	}
	else if(anim < 15)
	{
		AI_PlayAni(self,"T_HAPPY");
	}
	else if(anim < 20)
	{
		AI_PlayAni(self,"T_DCBITE");
	};
	return 0;
};

func void zs_orc_watchfight_end()
{
	printdebugnpc(PD_ORC_FRAME,"ZS_Orc_WatchFight_End");
	Npc_ClearAIQueue(self);
	Npc_SetPercTime(self,3);
	AI_Standup(self);
	AI_ContinueRoutine(self);
};

