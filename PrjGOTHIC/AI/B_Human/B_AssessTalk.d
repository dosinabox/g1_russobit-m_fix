
func void b_assesstalk()
{
	var C_NPC her;
	var C_NPC rock;
	printdebugnpc(PD_ZS_FRAME,"B_AssessTalk");
	if(Npc_IsInState(self,zs_smoke))
	{
		Npc_ClearAIQueue(self);
		AI_StandupQuick(self);
		AI_StartState(self,zs_talk,0,"");
	}
	else if(c_bodystatecontains(self,BS_MOBINTERACT))
	{
		return;
	};
	her = Hlp_GetNpc(pc_hero);
	rock = Hlp_GetNpc(pc_rockefeller);
	if((Hlp_GetInstanceID(her) != Hlp_GetInstanceID(hero)) && (Hlp_GetInstanceID(rock) != Hlp_GetInstanceID(hero)))
	{
		b_say(self,other,"$NOTNOW");
	}
	else
	{
		Npc_SetPercTime(self,3);
		self.aivar[AIV_INVINCIBLE] = FALSE;
		hero.aivar[AIV_INVINCIBLE] = FALSE;
		hero.aivar[AIV_IMPORTANT] = FALSE;
		Npc_ClearAIQueue(self);
		Npc_SetPercTime(self,1);
		if(!c_bodystatecontains(self,BS_SIT) || !Npc_CanSeeNpc(self,hero))
		{
			AI_StartState(self,zs_talk,1,"");
		}
		else
		{
			AI_StartState(self,zs_talk,0,"");
		};
	};
};

