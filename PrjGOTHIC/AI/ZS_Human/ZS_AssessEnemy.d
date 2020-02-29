
func void zs_assessenemy()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_AssessEnemy");
	c_zsinit();
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSMURDER,b_combatassessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,b_combatassessdefeat);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,zs_assesssurprise);
	b_fullstop(self);
	b_whirlaround(self,other);
	if(c_npcisguard(self) || c_npcisguardarcher(self) || c_npcisboss(self) || (self.npctype == NPCTYPE_FRIEND))
	{
		if(c_amiweaker(self,other) || (Npc_IsPlayer(other) && self.aivar[AIV_WASDEFEATEDBYSC]))
		{
			b_callcomrades();
		};
		if(Npc_IsPlayer(other))
		{
			b_drawweapon(self,other);
			AI_StartState(self,zs_proclaimandpunish,0,"");
			return;
		}
		else
		{
			Npc_SetTarget(self,other);
			AI_StartState(self,zs_attack,0,"");
			return;
		};
	}
	else if((Npc_IsPlayer(other) && self.aivar[AIV_WASDEFEATEDBYSC]) || c_amiweaker(self,other))
	{
		b_callguards();
		AI_StartState(self,zs_flee,0,"");
		return;
	}
	else if(Npc_IsPlayer(other))
	{
		b_drawweapon(self,other);
		AI_StartState(self,zs_proclaimandpunish,0,"");
		return;
	}
	else
	{
		Npc_SetTarget(self,other);
		AI_StartState(self,zs_attack,0,"");
		return;
	};
};

