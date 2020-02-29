
func void b_observeintruder()
{
	printdebugnpc(PD_ZS_FRAME,"B_ObserveIntruder");
	if(other.aivar[AIV_INVINCIBLE])
	{
		printdebugnpc(PD_ZS_CHECK,"...SC im Dialog!");
		return;
	};
	if(self.npctype == NPCTYPE_FRIEND)
	{
		printdebugnpc(PD_ZS_CHECK,"...freundlich gesinnt!");
		return;
	};
	if(Npc_IsInState(self,zs_guardpassage))
	{
		printdebugnpc(PD_ZS_CHECK,"...NSC ist Durchgangswache!");
		return;
	};
	if(c_npcishuman(other))
	{
		printdebugnpc(PD_ZS_CHECK,"...Eindringling ist Mensch!");
		if(Npc_GetAttitude(self,other) == ATT_HOSTILE)
		{
			b_fullstop(self);
			b_assessenemy();
			return;
		};
		if((Npc_GetAttitude(self,other) != ATT_FRIENDLY) && (Npc_CanSeeNpc(self,other) || !c_bodystatecontains(other,BS_SNEAK)))
		{
			printdebugnpc(PD_ZS_CHECK,"...SC ist Mensch und nicht FRIENDLY!");
			AI_StartState(self,zs_observeintruder,1,"");
			return;
		};
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"...Eindringling ist Monster!");
		if(c_npcisdangerousmonster(self,other))
		{
			b_fullstop(self);
			AI_StartState(self,zs_assessmonster,0,"");
		};
	};
};

