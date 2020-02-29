
func void zs_practicebow()
{
	var C_ITEM rangedweapon;
	var float aimtime;
	printdebugnpc(PD_TA_FRAME,"ZS_PracticeBow");
	b_setperception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Hlp_StrCmp(self.wp,Npc_GetNearestWP(self)))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"PRACTICEBOW"))
	{
		AI_GotoFP(self,"PRACTICEBOW");
		AI_AlignToFP(self);
	};
	if(Npc_HasEquippedRangedWeapon(self))
	{
		rangedweapon = Npc_GetEquippedRangedWeapon(self);
		aimtime = IntToFloat(Hlp_Random(2) + 3);
		if(rangedweapon.munition == itambolt)
		{
			if(Npc_HasItems(self,itambolt) == 0)
			{
				CreateInvItem(self,itambolt);
			};
			AI_ReadyRangedWeapon(self);
			AI_PlayAni(self,"T_CBOWWALK_2_CBOWAIM");
			AI_Wait(self,aimtime);
		}
		else if(rangedweapon.munition == itamarrow)
		{
			if(Npc_HasItems(self,itamarrow) == 0)
			{
				CreateInvItem(self,itamarrow);
			};
			AI_ReadyRangedWeapon(self);
			AI_PlayAni(self,"T_BOWWALK_2_BOWAIM");
			AI_Wait(self,aimtime);
		};
	}
	else
	{
		CreateInvItem(self,itambolt);
		CreateInvItem(self,itamarrow);
		AI_EquipBestRangedWeapon(self);
		AI_StartState(self,zs_practicebow_checkequippedweapon,1,"");
	};
};

func void zs_practicebow_loop()
{
	var C_ITEM rangedweapon;
	var float aimtime;
	printdebugnpc(PD_TA_LOOP,"ZS_PracticeBow_Loop");
	rangedweapon = Npc_GetReadiedWeapon(self);
	aimtime = IntToFloat(Hlp_Random(2) + 3);
	self.aivar[AIV_ITEMFREQ] = Hlp_Random(60) + 60;
	if(Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ])
	{
		AI_RemoveWeapon(self);
		b_bored(self);
		AI_Wait(self,1);
		b_bored(self);
		AI_Wait(self,aimtime);
		b_bored(self);
		AI_Wait(self,2);
		AI_StartState(self,zs_practicebow,1,"");
	}
	else if(rangedweapon.munition == itambolt)
	{
		AI_PlayAni(self,"T_CBOWAIM");
		AI_PlayAni(self,"T_CBOWRELOAD");
		Snd_Play3d(self,"CROSSBOWSHOOT");
		AI_Wait(self,aimtime);
	}
	else if(rangedweapon.munition == itamarrow)
	{
		AI_PlayAni(self,"T_BOWAIM");
		AI_PlayAni(self,"T_BOWRELOAD");
		Snd_Play3d(self,"BOWSHOOT");
		AI_Wait(self,aimtime);
	};
};

func void zs_practicebow_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_PracticeBow_End");
	AI_Wait(self,1);
	AI_RemoveWeapon(self);
};

func void zs_practicebow_checkequippedweapon()
{
	Npc_RemoveInvItem(self,itambolt);
	Npc_RemoveInvItem(self,itamarrow);
	if(Npc_HasEquippedRangedWeapon(self))
	{
		AI_StartState(self,zs_practicebow,1,"");
	}
	else
	{
		AI_StartState(self,zs_stand,1,"");
	};
};

