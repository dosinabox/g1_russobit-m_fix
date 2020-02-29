
func void zs_assessmonster()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_AssessMonster");
	c_zsinit();
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_refusetalk);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,zs_assesssurprise);
	Npc_SetPercTime(self,0.5);
	printglobals(PD_ZS_CHECK);
	if(c_npcisguard(self) || c_npcisguardarcher(self) || c_npcisboss(self))
	{
		printdebugnpc(PD_ZS_CHECK,"...NSC ist WACHE(NK/FK) oder BOSS!");
		b_fullstop(self);
		b_sayoverlay(self,NULL,"$DieMonster");
		Npc_SetTarget(self,other);
		AI_StartState(self,zs_attack,0,"");
		return;
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK," ...NSC ist wede WACHE noch BOSS!");
		if(c_amistronger(self,other))
		{
			printdebugnpc(PD_ZS_CHECK," ...aber trotzdem stärker als das Monster!");
			b_fullstop(self);
			b_drawweapon(self,other);
			return;
		}
		else
		{
			printdebugnpc(PD_ZS_CHECK," ...und noch dazu schwächer als das Monster!");
			b_fullstop(self);
			b_whirlaround(self,other);
			Npc_SetTarget(self,other);
			b_sayoverlay(self,NULL,"$ShitWhatAMonster");
			Npc_GetTarget(self);
			AI_StartState(self,zs_flee,0,"");
		};
	};
};

func int zs_assessmonster_loop()
{
	var int distance;
	printdebugnpc(PD_ZS_LOOP,"ZS_AssessMonster_Loop");
	distance = Npc_GetDistToNpc(self,other);
	if(Npc_GetStateTime(self) > 1)
	{
		printdebugnpc(PD_ZS_CHECK,"...1 Sekunden in der Loop -> Waffencheck!");
		b_smartturntonpc(self,other);
		b_selectweapon(self,other);
		Npc_SetStateTime(self,0);
	};
	if(Npc_IsInFightMode(self,FMODE_FAR) || Npc_IsInFightMode(self,FMODE_MAGIC))
	{
		Npc_SetTarget(self,other);
		AI_StartState(self,zs_attack,0,"");
	};
	if(distance < HAI_DIST_ATTACK_MONSTER)
	{
		printdebugnpc(PD_ZS_CHECK,"...Monster ist jetzt zu nahe herangekommen!");
		Npc_SetTarget(self,other);
		b_sayoverlay(self,NULL,"$DieMonster");
		AI_StartState(self,zs_attack,0,"");
	}
	else if(distance > HAI_DIST_ABORT_ASSESS_MONSTER)
	{
		printdebugnpc(PD_ZS_CHECK,"...Monster ist wieder weit genug weg!");
		return LOOP_END;
	}
	else if(c_npcisdown(other))
	{
		printdebugnpc(PD_ZS_CHECK,"...Monster kampfunfähig!");
		return LOOP_END;
	}
	else
	{
		return LOOP_CONTINUE;
	};
};

func void zs_assessmonster_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_AssessMonster_End");
	b_removeweapon(self);
	AI_ContinueRoutine(self);
};

