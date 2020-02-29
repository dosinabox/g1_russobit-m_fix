
func void zs_practicesword()
{
	printdebugnpc(PD_TA_FRAME,"ZS_PracticeSword");
	b_setperception(self);
	//AI_UnequipWeapons(self);
	AI_EquipBestMeleeWeapon(self);
	AI_EquipBestRangedWeapon(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Hlp_StrCmp(self.wp,Npc_GetNearestWP(self)))
	{
		AI_GotoWP(self,self.wp);
	};
	//AI_DrawWeapon(self);
	AI_ReadyMeleeWeapon(self);
};

func void zs_practicesword_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_PracticeSword_Loop");
	if(Npc_HasReadiedMeleeWeapon(self))
	{
		AI_PlayAni(self,"T_1HSFREE");
		AI_GotoWP(self,self.wp);
		AI_AlignToWP(self);
	}
	else
	{
		AI_RemoveWeapon(self);
		//b_regaindroppedweapon(self);
	};
};

func void zs_practicesword_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_PracticeSword_End");
	b_fullstop(self);
	b_removeweapon(self);
	AI_UnequipWeapons(self);
	AI_EquipBestMeleeWeapon(self);
	AI_EquipBestRangedWeapon(self);
};

