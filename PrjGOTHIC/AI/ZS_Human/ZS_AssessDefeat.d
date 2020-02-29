
func void zs_assessdefeat()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_AssessDefeat");
	c_zsinit();
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSMURDER,zs_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,zs_assesssurprise);
	printglobals(PD_ZS_CHECK);
	if(Npc_CanSeeNpcFreeLOS(self,other))
	{
		if(c_npcismonster(other))
		{
			printdebugnpc(PD_ZS_CHECK,"...Sieg von oder über Monster!");
			AI_StartState(self,zs_assessmonster,0,"");
			return;
		}
		else if(c_npcismonster(victim))
		{
			printdebugnpc(PD_ZS_CHECK,"...Sieg an Monster!");
			b_whirlaround(self,victim);
			return;
		};
		b_fullstop(self);
		AI_TurnToNPC(self,other);
		c_lookatnpc(self,other);
		b_assessandmemorize(NEWS_DEFEAT,NEWS_SOURCE_WITNESS,self,other,victim);
		if(c_chargewasattacked(self,victim,other))
		{
			printdebugnpc(PD_ZS_CHECK,"...NSC ist Wache und ein Schützling wurde besiegt!");
			b_drawweapon(self,other);
			AI_StartState(self,zs_proclaimandpunish,0,"");
			return;
		}
		else if(npc_gettempattitude(self,other) == ATT_HOSTILE)
		{
			b_assessenemy();
		}
		else if((npc_gettempattitude(self,victim) == ATT_ANGRY) || (npc_gettempattitude(self,victim) == ATT_HOSTILE))
		{
			printdebugnpc(PD_ZS_CHECK,"...NSC ist angry/hostile zu Besiegtem!");
			b_say(self,NULL,"$HEDESERVEDIT");
			c_stoplookat(self);
		}
		else if(npc_gettempattitude(self,other) == ATT_FRIENDLY)
		{
			printdebugnpc(PD_ZS_CHECK,"...NSC ist friendly/neutral zum Sieger!");
			b_say(self,other,"$ITWASAGOODFIGHT");
		}
		else
		{
			printdebugnpc(PD_ZS_CHECK,"...Default!");
			b_say(self,NULL,"$HEDEFEATEDHIM");
		};
		AI_Wait(self,1);
		c_stoplookat(self);
	};
};

