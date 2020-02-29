
func void zs_babe_fan()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Babe_Fan");
	AI_UnequipArmor(self);
	b_setbabedefaultperceptions();
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_HasItems(self,itmiwedel) < 1)
	{
		CreateInvItem(self,itmiwedel);
	};
	if(Wld_IsFPAvailable(self,"FAN"))
	{
		AI_GotoFP(self,"FAN");
		AI_AlignToFP(self);
		AI_UseItemToState(self,itmiwedel,1);
		Mdl_ApplyRandomAni(self,"s_COOLAIR_S1","t_COOLAIR_RANDOM_1");
		Mdl_ApplyRandomAniFreq(self,"s_COOLAIR_S1",5);
	}
	else
	{
		AI_GotoWP(self,self.wp);
		AI_AlignToWP(self);
	};
};

func void zs_babe_fan_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_Babe_Fan_Loop");
};

func void zs_babe_fan_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Babe_Fan_End");
	AI_UseItemToState(self,itmiwedel,-1);
};

