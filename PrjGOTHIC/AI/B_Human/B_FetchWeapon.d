
func int b_fetchweapon()
{
	printdebugnpc(PD_ZS_FRAME,"B_FetchWeapon");
	Npc_PerceiveAll(self);
	if(Wld_DetectItem(self,ITEM_KAT_FF))
	{
		printdebugnpc(PD_ZS_CHECK,"...Fernkampfwaffe gefunden!");
		if(Npc_GetDistToNpc(self,item) < PERC_DIST_INTERMEDIAT)
		{
			c_stoplookat(self);
			AI_SetWalkMode(self,NPC_RUN);
			AI_TakeItem(self,item);
			AI_EquipBestRangedWeapon(self);
			AI_ReadyRangedWeapon(self);
		};
		c_lookatnpc(self,other);
		return 1;
	};
	if(Wld_DetectItem(self,ITEM_KAT_NF))
	{
		printdebugnpc(PD_ZS_CHECK,"...Nahkampfwaffe gefunden!");
		if(Npc_GetDistToNpc(self,item) < PERC_DIST_INTERMEDIAT)
		{
			c_stoplookat(self);
			AI_SetWalkMode(self,NPC_RUN);
			AI_TakeItem(self,item);
			AI_EquipBestMeleeWeapon(self);
			AI_ReadyMeleeWeapon(self);
		};
		c_lookatnpc(self,other);
		return 1;
	};
	return 0;
};

