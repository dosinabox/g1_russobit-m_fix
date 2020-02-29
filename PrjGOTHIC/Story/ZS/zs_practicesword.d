
func void zs_practicesword()
{
	printdebugnpc(PD_TA_FRAME,"ZS_PracticeSword");
	if(!Npc_HasItems(self,itmw_trainsword))
	{
		CreateInvItem(self,itmw_trainsword);
	};
	b_setperception(self);
	AI_UnequipWeapons(self);
	AI_EquipBestMeleeWeapon(self);
	AI_EquipBestRangedWeapon(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Hlp_StrCmp(self.wp,Npc_GetNearestWP(self)))
	{
		AI_GotoWP(self,self.wp);
	};
	AI_ReadyMeleeWeapon(self);
};

func void zs_practicesword_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_PracticeSword_Loop");
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	AI_PlayAni(self,"T_1HSFREE");
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

