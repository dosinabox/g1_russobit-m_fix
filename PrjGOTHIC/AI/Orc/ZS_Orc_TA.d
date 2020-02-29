
func void b_orc_idle_ani()
{
	var int ani;
	ani = Hlp_Random(130);
	if(ani < 10)
	{
		AI_PlayAni(self,"T_PERCEPTION");
	}
	else if(ani < 20)
	{
		AI_PlayAni(self,"T_WARN");
	}
	else if(ani < 30)
	{
		AI_PlayAni(self,"T_ANGRY");
	}
	else if(ani < 40)
	{
		AI_PlayAni(self,"T_FRIGHTEND");
	}
	else if(ani < 50)
	{
		AI_PlayAni(self,"T_HAPPY");
	}
	else if(ani < 60)
	{
		AI_PlayAni(self,"T_DIALOGGESTURE_01");
	}
	else if(ani < 70)
	{
		AI_PlayAni(self,"T_DIALOGGESTURE_02");
	}
	else if(ani < 80)
	{
		AI_PlayAni(self,"T_DIALOGGESTURE_03");
	}
	else if(ani < 90)
	{
		AI_PlayAni(self,"T_DIALOGGESTURE_04");
	}
	else if(ani < 100)
	{
		AI_PlayAni(self,"T_DIALOGGESTURE_05");
	}
	else if(ani < 110)
	{
		AI_PlayAni(self,"T_DIALOGGESTURE_06");
	}
	else if(ani < 120)
	{
		AI_PlayAni(self,"T_DIALOGGESTURE_07");
	}
	else if(ani < 130)
	{
		AI_PlayAni(self,"T_DIALOGGESTURE_08");
	};
	AI_Wait(self,1);
};

func void zs_orc_stonemill()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Orc_Stonemill");
	if(Npc_GetBodyState(self) != BS_MOBINTERACT)
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == 0)
		{
			AI_GotoWP(self,self.wp);
		};
	};
	orcdefaultpercdoing();
};

func void zs_orc_stonemill_loop()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Orc_Stonemill_Loop");
	AI_UseMob(self,"STONEMILL",1);
	//AI_UseMob(self,"STONEMILL",0);
	AI_UseMob(self,"STONEMILL",-1);
};

func void zs_orc_stonemill_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Orc_Stonemill_End");
	Npc_ClearAIQueue(self);
	AI_UseMob(self,"STONEMILL",-1);
};

func void zs_orc_stomper()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Orc_Stomper");
	if(Npc_GetBodyState(self) != BS_MOBINTERACT)
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == 0)
		{
			AI_GotoWP(self,self.wp);
		};
	};
	orcdefaultpercdoing();
};

func void zs_orc_stomper_loop()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Orc_Stomper_Loop");
	AI_UseMob(self,"STOMPER",1);
	//AI_UseMob(self,"STOMPER",0);
	AI_UseMob(self,"STOMPER",-1);
};

func void zs_orc_stomper_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Orc_Stomper_End");
	Npc_ClearAIQueue(self);
	AI_UseMob(self,"STOMPER",-1);
};

func void zs_orc_eat()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Orc_Eat");
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"STAND"))
	{
		AI_GotoWP(self,self.wp);
	};
	orcdefaultperc();
};

func int zs_orc_eat_loop()
{
	var float pause;
	printdebugnpc(PD_ZS_FRAME,"ZS_Orc_Eat_Loop");
	b_gotofp(self,"STAND");
	b_orc_itemeat();
	pause = IntToFloat(Hlp_Random(5) + 2);
	AI_Wait(self,pause);
	return 0;
};

func void zs_orc_eat_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Eat_End");
	Npc_ClearAIQueue(self);
};

func void zs_orc_sleep()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Orc_Sleep");
	if(!c_bodystatecontains(self,BS_MOBINTERACT))
	{
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == 0)
		{
			AI_GotoWP(self,self.wp);
		};
		AI_UnequipWeapons(self);
		AI_UseMob(self,"BEDLOW",1);
	};
	orclightsleepperc();
};

func int zs_orc_sleep_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_ORC_Sleep_Loop");
	if(c_bodystatecontains(self,BS_MOBINTERACT))
	{
	};
	return 0;
};

func void zs_orc_sleep_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Orc_Sleep_End");
	Npc_ClearAIQueue(self);
	AI_UseMob(self,"BEDLOW",-1);
	b_say(self,NULL,"$AWAKE");
	AI_EquipBestMeleeWeapon(self);
	AI_EquipBestRangedWeapon(self);
};

func void zs_orc_pray()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Orc_Pray");
	orcdefaultpercdoing();
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"PREY"))
	{
		AI_GotoWP(self,self.wp);
	};
};

func void zs_orc_pray_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_Orc_Pray_Loop");
	b_gotofp(self,"PREY");
	if(Npc_GetBodyState(self) != BS_SIT)
	{
		AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
	}
	else
	{
		AI_PlayAniBS(self,"T_PRAY_RANDOM",BS_SIT);
	};
	AI_Wait(self,1);
};

func void zs_orc_pray_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Orc_Pray_End");
	Npc_ClearAIQueue(self);
	AI_PlayAniBS(self,"T_PRAY_2_STAND",BS_STAND);
};

func void zs_orc_drum()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Orc_Drum");
	if(Npc_GetBodyState(self) != BS_MOBINTERACT)
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == 0)
		{
			AI_GotoWP(self,self.wp);
		};
		AI_UseMob(self,"DRUM",1);
	};
	//orcdefaultpercdoing();
	orcdefaultperc();
};

func int zs_orc_drum_loop()
{
	var int random;
	printdebugnpc(PD_ZS_LOOP,"ZS_Orc_Drum_Loop");
	if(Npc_GetBodyState(self) == BS_MOBINTERACT_INTERRUPT)
	{
		random = Hlp_Random(15);
		if(random < 5)
		{
			AI_PlayAniBS(self,"T_ORCDRUM_RANDOM_1",BS_MOBINTERACT_INTERRUPT);
		}
		else if(random < 10)
		{
			AI_PlayAniBS(self,"T_ORCDRUM_RANDOM_2",BS_MOBINTERACT_INTERRUPT);
		}
		else
		{
			AI_PlayAniBS(self,"T_ORCDRUM_RANDOM_3",BS_MOBINTERACT_INTERRUPT);
		};
	};
	return LOOP_CONTINUE;
};

func int zs_orc_drum_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Orc_Drum_End");
	Npc_ClearAIQueue(self);
	return AI_UseMob(self,"DRUM",-1);
};

func void zs_orc_speech()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Orc_Speech");
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"STAND"))
	{
		AI_GotoWP(self,self.wp);
	};
	orcdefaultperc();
};

func void zs_orc_speech_loop()
{
	var int ani;
	printdebugnpc(PD_ZS_LOOP,"ZS_Orc_Speech_Loop");
	b_gotofp(self,"STAND");
	ani = Hlp_Random(30);
	if(ani == 1)
	{
		AI_PlayAni(self,"T_DIALOGGESTURE_01");
	}
	else if(ani == 2)
	{
		AI_PlayAni(self,"T_DIALOGGESTURE_02");
	}
	else if(ani == 3)
	{
		AI_PlayAni(self,"T_DIALOGGESTURE_03");
	}
	else if(ani == 4)
	{
		AI_PlayAni(self,"T_DIALOGGESTURE_04");
	}
	else if(ani == 5)
	{
		AI_PlayAni(self,"T_DIALOGGESTURE_05");
	}
	else if(ani == 6)
	{
		AI_PlayAni(self,"T_DIALOGGESTURE_06");
	}
	else if(ani == 7)
	{
		AI_PlayAni(self,"T_DIALOGGESTURE_07");
	}
	else if(ani == 8)
	{
		AI_PlayAni(self,"T_DIALOGGESTURE_08");
	};
	AI_Wait(self,1);
};

func void zs_orc_speech_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Orc_Speech_End");
	Npc_ClearAIQueue(self);
};

func void zs_orc_gotowp()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Orc_GotoWP");
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	orcdefaultperc();
};

func void zs_orc_gotowp_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_Orc_GotoWP_Loop");
	if(Hlp_Random(250) < 10)
	{
		b_orc_idle_ani();
	};
};

func void zs_orc_gotowp_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Orc_GotoWP_End");
	Npc_ClearAIQueue(self);
};

func void zs_orc_walkaround()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Orc_WalkAround");
	orcdefaultperc();
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"FP_ORC_STAND"))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"FP_ORC_STAND_A"))
	{
		AI_GotoFP(self,"FP_ORC_STAND_A");
	}
	else if(Wld_IsFPAvailable(self,"FP_ORC_STAND_B"))
	{
		AI_GotoFP(self,"FP_ORC_STAND_B");
	}
	else if(Wld_IsFPAvailable(self,"FP_ORC_STAND_C"))
	{
		AI_GotoFP(self,"FP_ORC_STAND_C");
	};
	AI_AlignToFP(self);
};

func void zs_orc_walkaround_loop()
{
	var string wp1;
	var string wp2;
	var float f;
	printdebugnpc(PD_TA_LOOP,"ZS_Orc_WalkAround_Loop");
	wp1 = Npc_GetNearestWP(self);
	wp2 = Npc_GetNextWP(self);
	if(!Hlp_StrCmp(wp1,self.wp) && (Hlp_Random(10) < 5))
	{
		printdebugnpc(PD_ZS_FRAME,"ZS_Orc_WalkAround: Goto Nearest");
		AI_GotoWP(self,wp1);
		self.wp = wp1;
	}
	else if(!Hlp_StrCmp(wp2,self.wp))
	{
		printdebugnpc(PD_ZS_FRAME,"ZS_Orc_WalkAround: Goto Next");
		AI_GotoWP(self,wp2);
		self.wp = wp2;
	};
	if(Hlp_Random(80) < 10)
	{
		printdebugnpc(PD_ZS_FRAME,"ZS_Orc_WalkAround: Idle Ani");
		b_orc_idle_ani();
		AI_Wait(self,2);
		return;
	};
	if(Hlp_Random(50) < 5)
	{
		printdebugnpc(PD_ZS_FRAME,"ZS_Orc_WalkAround: Wait");
		f = IntToFloat(Hlp_Random(4));
		AI_Wait(self,f);
	};
};

func void zs_orc_walkaround_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Orc_WalkAround_End");
	Npc_ClearAIQueue(self);
};

func void zs_orc_drinkalcohol()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Orc_DrinkAlcohol");
	orcdefaultperc();
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"STAND"))
	{
		AI_GotoWP(self,self.wp);
	};
};

func int zs_orc_drinkalcohol_loop()
{
	var float pause;
	printdebugnpc(PD_ZS_FRAME,"ZS_Orc_DrinkAlcohol_Loop");
	b_gotofp(self,"STAND");
	b_orc_itempotion();
	pause = IntToFloat(Hlp_Random(5) + 2);
	AI_Wait(self,pause);
	return 0;
};

func void zs_orc_drinkalcohol_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_DrinkAlcohol_End");
	Npc_ClearAIQueue(self);
};

func void zs_orc_dance()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Orc_Dance");
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"DANCE"))
	{
		AI_GotoWP(self,self.wp);
	};
	//orcdefaultpercdoing();
	orcdefaultperc();
};

func void zs_orc_dance_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_Orc_Dance_Loop");
	b_gotofp(self,"DANCE");
	if(Hlp_Random(10) < 5)
	{
		printdebugnpc(PD_ZS_FRAME,"ZS_Orc_Dance_Loop: T_DANCE");
		AI_PlayAni(self,"T_DANCE");
	}
	else
	{
		printdebugnpc(PD_ZS_FRAME,"ZS_Orc_Dance_Loop: T_DANCE_RANDOM_1");
		AI_PlayAni(self,"T_DANCE_RANDOM_1");
	};
};

func void zs_orc_dance_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Orc_Dance_End");
	Npc_ClearAIQueue(self);
	AI_Standup(self);
};

func void zs_orc_eatanddrink()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Orc_EatAndDrink");
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"STAND"))
	{
		AI_GotoWP(self,self.wp);
	};
	orcdefaultperc();
};

func void zs_orc_eatanddrink_loop()
{
	var float pause;
	printdebugnpc(PD_ZS_FRAME,"ZS_Orc_EatAndDrink_Loop");
	b_gotofp(self,"STAND");
	if(Hlp_Random(10) < 5)
	{
		b_orc_itemeat();
	}
	else
	{
		b_orc_itempotion();
	};
	pause = IntToFloat(Hlp_Random(5) + 2);
	AI_Wait(self,pause);
};

func void zs_orc_eatanddrink_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Orc_EatAndDrink_End");
	Npc_ClearAIQueue(self);
};

func void zs_orc_guardsleepy()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Orc_GuardSleepy");
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"SIT"))
	{
		AI_GotoWP(self,self.wp);
	};
	orcdefaultperc();
};

func void zs_orc_guardsleepy_loop()
{
	var float sleep;
	printdebugnpc(PD_ZS_FRAME,"ZS_Orc_GuardSleepy_Loop");
	b_gotofp(self,"SIT");
	if(!c_bodystatecontains(self,BS_SIT) && (Hlp_Random(500) < 10))
	{
		printdebugnpc(PD_ZS_FRAME,"ZS_Orc_GuardSleepy_Loop: stehende Ani");
		b_orc_idle_ani();
		return;
	};
	if(!c_bodystatecontains(self,BS_SIT) && (Hlp_Random(600) < 10))
	{
		printdebugnpc(PD_ZS_FRAME,"ZS_Orc_GuardSleepy_Loop: hinsetzen");
		AI_PlayAniBS(self,"T_STAND_2_GUARDSIT",BS_SIT);
		AI_Wait(self,2);
		return;
	};
	if(c_bodystatecontains(self,BS_SIT) && (Hlp_Random(700) < 10))
	{
		printdebugnpc(PD_ZS_FRAME,"ZS_Orc_GuardSleepy_Loop: einschlafen im Sitzen");
		AI_PlayAniBS(self,"T_GUARDSIT_2_GUARDSLEEP",BS_SIT);
		sleep = IntToFloat(Hlp_Random(5) + 15);
		AI_Wait(self,sleep);
		AI_PlayAniBS(self,"T_GUARDSLEEP_2_GUARDSIT",BS_SIT);
		return;
	};
};

func void zs_orc_guardsleepy_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Orc_GuardSleepy_End");
};

func void zs_orc_guard()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Orc_Guard");
	orcdefaultperc();
	b_fullstop(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"FP_ORC_GUARD"))
	{
		AI_GotoWP(self,self.wp);
	};
};

func void zs_orc_guard_loop()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Orc_Guard_Loop");
	b_gotofp(self,"FP_ORC_GUARD");
	AI_AlignToFP(self);
	AI_Wait(self,1);
};

func void zs_orc_guard_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_Orc_Guard_End");
	Npc_ClearAIQueue(self);
};

func void zs_orc_sitonfloor()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Orc_SitOnFloor");
	Npc_ClearAIQueue(self);
	if(Npc_GetBodyState(self) != BS_SIT)
	{
		printdebugnpc(PD_ZS_FRAME,"ZS_Orc_SitOnFloor: sitzt nicht....");
		AI_SetWalkMode(self,NPC_WALK);
		if(!Npc_IsOnFP(self,"FP_ORC_SIT"))
		{
			AI_GotoWP(self,self.wp);
		};
		if(Wld_IsFPAvailable(self,"FP_ORC_SIT_A_"))
		{
			AI_GotoFP(self,"FP_ORC_SIT_A_");
		}
		else if(Wld_IsFPAvailable(self,"FP_ORC_SIT_B_"))
		{
			AI_GotoFP(self,"FP_ORC_SIT_B_");
		}
		else if(Wld_IsFPAvailable(self,"FP_ORC_SIT"))
		{
			AI_GotoFP(self,"FP_ORC_SIT");
		};
		AI_PlayAniBS(self,"T_STAND_2_GUARDSIT",BS_SIT);
	};
	orcdefaultperc();
};

func void zs_orc_sitonfloor_loop()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Orc_SitOnFloor_Loop");
	if(Npc_GetBodyState(self) == BS_SIT)
	{
	};
};

func void zs_orc_sitonfloor_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_Orc_SitOnFloor_End");
	Npc_ClearAIQueue(self);
	AI_PlayAniBS(self,"T_GUARDSIT_2_STAND",BS_STAND);
};

