
func void zs_upset()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Upset");
	c_zsinit();
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_assesscaster);
};

func int zs_upset_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_Upset_Loop");
	if(c_npcisdown(other))
	{
		printdebugnpc(PD_ZS_LOOP,"...other kampfunfähig!");
		return LOOP_END;
	};
	if(!c_otheristoleratedenemy(self,other))
	{
		printdebugnpc(PD_ZS_LOOP,"...'other' nicht mehr geduldet!");
		return LOOP_END;
	};
	if(Npc_GetDistToNpc(self,other) < HAI_DIST_ASSESSTOLERATEDENEMY)
	{
		printdebugnpc(PD_ZS_CHECK,"...other noch nah genug!");
		AI_TurnToNPC(self,other);
		db_say(self,other,"HeyHeyHey");
		AI_PlayAni(self,"T_ANGRY");
		if(Npc_GetDistToNpc(self,other) < PERC_DIST_WATCHFIGHT)
		{
			printdebugnpc(PD_ZS_LOOP,"... zu nahe an 'other'!");
			AI_TurnToNPC(self,other);
			AI_Dodge(self);
			return LOOP_CONTINUE;
		};
	}
	else
	{
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void zs_upset_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Upset_End");
};

