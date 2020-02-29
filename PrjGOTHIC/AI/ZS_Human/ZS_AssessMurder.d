
func void zs_assessmurder()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_AssessMurder");
	c_zsinit();
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,zs_assesssurprise);
	printglobals(PD_ZS_CHECK);
	printattitudes(PD_ZS_CHECK);
	if(Npc_CanSeeNpcFreeLOS(self,other) || Npc_CanSeeNpcFreeLOS(self,victim))
	{
		if(!c_npcishuman(other))
		{
			printdebugnpc(PD_ZS_CHECK,"...Mord von Monster!");
			Npc_SetTarget(self,other);
			Npc_GetTarget(self);
			AI_StartState(self,zs_assessmonster,0,"");
			return;
		}
		else if(!c_npcishuman(victim))
		{
			printdebugnpc(PD_ZS_CHECK,"...Mord an Monster!");
			b_whirlaround(self,victim);
			return;
		};
		printdebugnpc(PD_ZS_CHECK,"ZS_AssessMurder/Npc_CanSeeNpc");
		b_whirlaround(self,other);
		b_assessandmemorize(NEWS_MURDER,NEWS_SOURCE_WITNESS,self,other,victim);
		if(c_chargewasattacked(self,victim,other))
		{
			printdebugnpc(PD_ZS_CHECK,"...NSC ist Wache und ein Schützling wurde gemordet!");
			b_drawweapon(self,other);
			AI_StartState(self,zs_proclaimandpunish,0,"");
			return;
		};
		if(Npc_GetAttitude(self,other) == ATT_HOSTILE)
		{
			printdebugnpc(PD_ZS_CHECK,"...hostile zum Mörder!");
			b_say(self,other,"$HEKILLEDHIM");
			b_assessenemy();
		}
		else if((Npc_GetAttitude(self,victim) == ATT_ANGRY) || (Npc_GetAttitude(self,victim) == ATT_HOSTILE))
		{
			printdebugnpc(PD_ZS_CHECK,"...angry/hostile zu Opfer!");
			b_say(self,other,"$YEAHWELLDONE");
			c_stoplookat(self);
		};
	};
};

