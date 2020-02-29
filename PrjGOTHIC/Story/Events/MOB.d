
var int _str_message_wheel_stucks_again;

func int mc_oldmine_asghan()
{
	printdebugnpc(PD_ITEM_MOBSI,"MC_OLDMINE_ASGHAN");
	if(Npc_KnowsInfo(hero,grd_263_asghan_open_now) && (_STR_MESSAGE_WHEEL_STUCKS_AGAIN >= 0))
	{
		_STR_MESSAGE_WHEEL_STUCKS_AGAIN = 1;
		return TRUE;
	}
	else
	{
		g_printscreen(_STR_MESSAGE_WHEEL_STUCKS);
		return FALSE;
	};
};

func int mc_oldmine_entrance()
{
	printdebugnpc(PD_ITEM_MOBSI,"MC_OLDMINE_ENTRANCE");
	printglobals(PD_ITEM_MOBSI);
	if((KAPITEL >= 4) && Hlp_IsValidNpc(self))
	{
		printdebugnpc(PD_ITEM_MOBSI,"...заблокировано.");
		g_printscreen(_STR_MESSAGE_WHEEL_STUCKS);
		AI_OutputSVM_Overlay(hero,NULL,"SVM_15_PickBroke");
		return FALSE;
	}
	else
	{
		printdebugnpc(PD_ITEM_MOBSI,"...готово к работе.");
		return TRUE;
	};
};

func int mc_monasteryruin_gate()
{
	printdebugnpc(PD_ITEM_MOBSI,"MC_MONASTERYRUIN_GATE");
	if(MONASTERYRUIN_GATEOPEN == FALSE)
	{
		printdebugnpc(PD_ITEM_MOBSI,"...еще не открыто.");
		AI_UseMob(hero,"VWHEEL",1);
		AI_UseMob(hero,"VWHEEL",-1);
		MONASTERYRUIN_GATEOPEN = TRUE;
		return TRUE;
	}
	else
	{
		printdebugnpc(PD_ITEM_MOBSI,"...уже открыто.");
		return TRUE;
	};
};

func int mc_ogy_gate()
{
	printdebugnpc(PD_ITEM_MOBSI,"MC_OGY_GATE");
	if(CORANGAR_GOTOOGY)
	{
		printdebugnpc(PD_ITEM_MOBSI,"...closed");
		return TRUE;
	}
	else
	{
		printdebugnpc(PD_ITEM_MOBSI,"...open");
		g_printscreen(_STR_MESSAGE_WHEEL_STUCKS);
		return FALSE;
	};
};


var int fm_gateopen;

func int mc_fm_gate()
{
	printdebugnpc(PD_ITEM_MOBSI,"MC_FM_GATE");
	if((KAPITEL == 4) && (FM_GATEOPEN == FALSE))
	{
		printdebugnpc(PD_ITEM_MOBSI,"...closed");
		AI_UseMob(hero,"VWHEEL",1);
		AI_UseMob(hero,"VWHEEL",-1);
		FM_GATEOPEN = TRUE;
		b_exchangeroutine(pc_fighter,"WaitFM");
		return TRUE;
	}
	else
	{
		printdebugnpc(PD_ITEM_MOBSI,"...open");
		if(!FM_GATEOPEN)
		{
			g_printscreen(_STR_MESSAGE_WHEEL_STUCKS);
		};
		return FALSE;
	};
};

func int evt_trollschlucht_gate_trigger()
{
	printdebugnpc(PD_ITEM_MOBSI,"EVT_TROLLSCHLUCHT_GATE_TRIGGER");
	if(SATURAS_BRINGFOCI > 0)
	{
		if(TROLL_WHEEL == 0)
		{
			g_printscreen(_STR_MESSAGE_WHEEL_STUCKS);
			TROLL_WHEEL = 1;
			return FALSE;
		}
		else if(TROLL_WHEEL == 1)
		{
			g_printscreen(_STR_MESSAGE_WHEEL_STUCKS);
			return FALSE;
		}
		else if(TROLL_WHEEL == 2)
		{
			AI_UseMob(hero,"VWHEEL",1);
			AI_UseMob(hero,"VWHEEL",-1);
			TROLL_WHEEL = 3;
			Wld_InsertNpc(blackgobbowarrior,"LOCATION_12_13");
			Wld_InsertNpc(blackgobbowarrior,"LOCATION_12_13");
			Wld_InsertNpc(blackgobbowarrior,"LOCATION_12_13");
			Wld_InsertNpc(blackgobbowarrior,"LOCATION_12_13");
			Wld_InsertNpc(blackgobbowarrior,"LOCATION_12_14");
			Wld_InsertNpc(blackgobbowarrior,"LOCATION_12_14");
			Wld_InsertNpc(blackgobbowarrior,"LOCATION_12_14");
			Wld_InsertNpc(blackgobbowarrior,"LOCATION_12_14");
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	}
	else
	{
		g_printscreen(_STR_MESSAGE_WHEEL_STUCKS);
	};
	return FALSE;
};


var int orccity_gateopen;

func int mc_orccity_gate()
{
	printdebugnpc(PD_ITEM_MOBSI,"MC_OrcCity_Gate");
	if((KAPITEL >= 5) && (ORCCITY_GATEOPEN == FALSE))
	{
		printdebugnpc(PD_ITEM_MOBSI,"...closed");
		AI_UseMob(hero,"VWHEEL",1);
		AI_UseMob(hero,"VWHEEL",-1);
		ORCCITY_GATEOPEN = TRUE;
		return TRUE;
	}
	else
	{
		printdebugnpc(PD_ITEM_MOBSI,"...open");
		if(!ORCCITY_GATEOPEN)
		{
			g_printscreen(_STR_MESSAGE_WHEEL_STUCKS);
		};
		return FALSE;
	};
};

func int mc_orccity_sunctum_outergate()
{
	printdebugnpc(PD_ITEM_MOBSI,"MC_OrcCity_Sanctum_OuterGate");
	ORCCITY_SANCTUM_OUTERGATETRIED = TRUE;
	if((KAPITEL >= 5) && Npc_HasItems(hero,itmi_stuff_idol_sleeper_01) && (ORCCITY_SANCTUM_OUTERGATEOPEN == FALSE))
	{
		printdebugnpc(PD_ITEM_MOBSI,"...closed");
		g_printscreen(_STR_MESSAGE_OCLEVER_MOVES);
		AI_UseMob(hero,"LEVER",1);
		AI_UseMob(hero,"LEVER",-1);
		ORCCITY_SANCTUM_OUTERGATEOPEN = TRUE;
		return TRUE;
	}
	else
	{
		printdebugnpc(PD_ITEM_MOBSI,"...open");
		if(!ORCCITY_SANCTUM_OUTERGATEOPEN)
		{
			g_printscreen(_STR_MESSAGE_OCLEVER_STUCKS);
		};
		return FALSE;
	};
};

func int evt_wheel_01_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_01_s0()
{
	Wld_SendUntrigger("EVT_OW_STARTLOCKOUT_MOVER");
	GATE_01_STATE = 0;
};

func void evt_wheel_01_s1()
{
	if(GATE_01_STATE == 1)
	{
		AI_UseMob(hero,"VWHEEL",0);	
	};
	if(GATE_01_STATE == 0)
	{
		Wld_SendTrigger("EVT_OW_STARTLOCKOUT_MOVER");
		GATE_01_STATE = 1;
	};
};

func int evt_wheel_02_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_02_s0()
{
	Wld_SendUntrigger("EVT_OC_MAINGATE01_01");
	GATE_02_STATE = 0;
};

func void evt_wheel_02_s1()
{
	if(GATE_02_STATE == 1)
	{
		AI_UseMob(hero,"VWHEEL",0);	
	};
	if(GATE_02_STATE == 0)
	{
		Wld_SendTrigger("EVT_OC_MAINGATE01_01");
		GATE_02_STATE = 1;
	};
};

func int evt_wheel_03_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_03_s0()
{
	Wld_SendUntrigger("EVT_OC_MAINGATE02_02");
	GATE_03_STATE = 0;
};

func void evt_wheel_03_s1()
{
	if(GATE_03_STATE == 1)
	{
		AI_UseMob(hero,"VWHEEL",0);	
	};
	if(GATE_03_STATE == 0)
	{
		Wld_SendTrigger("EVT_OC_MAINGATE02_02");
		GATE_03_STATE = 1;
	};
};

func int evt_wheel_04_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_04_s0()
{
	Wld_SendUntrigger("EVT_OC_INNERMAINGATE");
	GATE_04_STATE = 0;
};

func void evt_wheel_04_s1()
{
	if(GATE_04_STATE == 1)
	{
		AI_UseMob(hero,"VWHEEL",0);	
	};
	if(GATE_04_STATE == 0)
	{
		Wld_SendTrigger("EVT_OC_INNERMAINGATE");
		GATE_04_STATE = 1;
	};
};
func int evt_wheel_05_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_05_s0()
{
	Wld_SendUntrigger("EVT_NC_LOCKOUT_MOVER_01");
	GATE_05_STATE = 0;
};

func void evt_wheel_05_s1()
{
	if(GATE_05_STATE == 1)
	{
		AI_UseMob(hero,"VWHEEL",0);	
	};
	if(GATE_05_STATE == 0)
	{
		Wld_SendTrigger("EVT_NC_LOCKOUT_MOVER_01");
		GATE_05_STATE = 1;
	};
};

func int evt_wheel_06_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_06_s0()
{
	Wld_SendUntrigger("EVT_NC_MAINGATE01_MOVER");
	GATE_06_STATE = 0;
};

func void evt_wheel_06_s1()
{
	if(GATE_06_STATE == 1)
	{
		AI_UseMob(hero,"VWHEEL",0);	
	};
	if(GATE_06_STATE == 0)
	{
		Wld_SendTrigger("EVT_NC_MAINGATE01_MOVER");
		GATE_06_STATE = 1;
	};
};

func int evt_wheel_07_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_07_s0()
{
	if(kapitel < 4)
	{
		Wld_SendUntrigger("EVT_AM_LOB_GATE_BIG");
		GATE_07_STATE = 0;
	}
	else
	{
		AI_PlayAni(self,"T_VWHEEL_S0_2_STAND");
		AI_Wait(self,0.5);
		AI_PlayAni(self,"T_DONTKNOW");
		AI_OutputSVM(self,self,"$DoesntWork");
	};
};

func void evt_wheel_07_s1()
{
	if(kapitel >= 4)
	{
		AI_PlayAni(self,"T_VWHEEL_S1_2_STAND");
		AI_Wait(self,0.5);
		AI_PlayAni(self,"T_DONTKNOW");
		AI_OutputSVM(self,self,"$DoesntWork");
	}
	else if(GATE_07_STATE == 1)
	{
		AI_UseMob(hero,"VWHEEL",0);	
	}
	else if(GATE_07_STATE == 0)
	{
		Wld_SendTrigger("EVT_AM_LOB_GATE_BIG");
		GATE_07_STATE = 1;
	};
};

func int evt_wheel_d01_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_d01_s0()
{
	Wld_SendUntrigger("CAGEDOORS");
	GATE_D01_STATE = 0;
};

func void evt_wheel_d01_s1()
{
	if(GATE_D01_STATE == 1)
	{
		AI_UseMob(hero,"SWITCH",0);	
	};
	if(GATE_D01_STATE == 0)
	{
		Wld_SendTrigger("CAGEDOORS");
		GATE_D01_STATE = 1;
	};
};

func int evt_wheel_d02_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_d02_s0()
{
	Wld_SendUntrigger("CAGEDOORS_NEW");
	GATE_D02_STATE = 0;
};

func void evt_wheel_d02_s1()
{
	if(GATE_D02_STATE == 1)
	{
		AI_UseMob(hero,"SWITCH",0);	
	};
	if(GATE_D02_STATE == 0)
	{
		Wld_SendTrigger("CAGEDOORS_NEW");
		GATE_D02_STATE = 1;
	};
};

func int evt_wheel_d03_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_d03_s0()
{
	Wld_SendUntrigger("CAGEDOORS_NEW2");
	GATE_D03_STATE = 0;
};

func void evt_wheel_d03_s1()
{
	if(GATE_D03_STATE == 1)
	{
		AI_UseMob(hero,"SWITCH",0);	
	};
	if(GATE_D03_STATE == 0)
	{
		Wld_SendTrigger("CAGEDOORS_NEW2");
		GATE_D03_STATE = 1;
	};
};

//orc prison

func int evt_wheel_d05_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_d05_s0()
{
	if(GATE_D05_STATE == 1)
	{
		Wld_SendUntrigger("EVT_SURF_ORCSECRET_01");
		GATE_D05_STATE = 0;
	}
	else if(GATE_D05_STATE == 0)
	{
		Wld_SendTrigger("EVT_SURF_ORCSECRET_01");
		GATE_D05_STATE = 1;
	};
};

func void evt_wheel_d05_s1()
{
	if(GATE_D05_STATE == 1)
	{
		Wld_SendUntrigger("EVT_SURF_ORCSECRET_01");
		GATE_D05_STATE = 0;
	}
	else if(GATE_D05_STATE == 0)
	{
		Wld_SendTrigger("EVT_SURF_ORCSECRET_01");
		GATE_D05_STATE = 1;
	};
};

func int evt_wheel_d06_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_d06_s0()
{
	if(GATE_D06_STATE == 1)
	{
		Wld_SendUntrigger("EVT_SURF_ORCSECRET_02");
		GATE_D06_STATE = 0;
	}
	else if(GATE_D06_STATE == 0)
	{
		Wld_SendTrigger("EVT_SURF_ORCSECRET_02");
		GATE_D06_STATE = 1;
	};
};

func void evt_wheel_d06_s1()
{
	if(GATE_D06_STATE == 1)
	{
		Wld_SendUntrigger("EVT_SURF_ORCSECRET_02");
		GATE_D06_STATE = 0;
	}
	else if(GATE_D06_STATE == 0)
	{
		Wld_SendTrigger("EVT_SURF_ORCSECRET_02");
		GATE_D06_STATE = 1;
	};
};

func int evt_wheel_08_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_08_s0()
{
	if(GATE_08_STATE == 1)
	{
		AI_PlayAni(self,"T_VWHEEL_S1_2_STAND");
		AI_Wait(self,0.5);
		AI_PlayAni(self,"T_DONTKNOW");
		AI_OutputSVM(self,self,"$DoesntWork");
	};
};

func void evt_wheel_08_s1()
{
	if(GATE_08_STATE == 0)
	{
		Wld_SendTrigger("EVT_OW_FOKUS_GATE_MOVER_01");
		GATE_08_STATE = 1;
		MONASTERYRUIN_GATEOPEN = TRUE;
	};
	
};

func int evt_wheel_09_conditionfunc()
{
	if(ORCCITY_SANCTUM_OUTERGATEOPEN == FALSE && (KAPITEL >= 5) && Npc_HasItems(hero,itmi_stuff_idol_sleeper_01))
	{
		return TRUE;
	}
	else if(ORCCITY_SANCTUM_OUTERGATEOPEN == FALSE && (KAPITEL >= 5) && !Npc_HasItems(hero,itmi_stuff_idol_sleeper_01))
	{
		AI_OutputSVM_Overlay(self,self,"$NeedKey");
	};
};

func void evt_wheel_09_s0()
{
	if(ORCCITY_SANCTUM_OUTERGATEOPEN == FALSE && (KAPITEL >= 5) && Npc_HasItems(hero,itmi_stuff_idol_sleeper_01))
	{
		Wld_SendTrigger("IDOL_FIGG");
		Wld_SendTrigger("EVT_ORC_GATE_02");
		Npc_RemoveInvItem(hero,itmi_stuff_idol_sleeper_01);
		ORCCITY_SANCTUM_OUTERGATEOPEN = TRUE;
	}
	else
	{
		AI_Wait(self,0.5);
		AI_PlayAni(self,"T_DONTKNOW");
		AI_OutputSVM(self,self,"$DoesntWork");
	};
};

func void evt_wheel_09_s1()
{
	if(ORCCITY_SANCTUM_OUTERGATEOPEN == FALSE && (KAPITEL >= 5) && Npc_HasItems(hero,itmi_stuff_idol_sleeper_01))
	{
		Wld_SendTrigger("EVT_ORC_GATE_02");
		Wld_SendTrigger("IDOL_FIGG");
		Npc_RemoveInvItem(hero,itmi_stuff_idol_sleeper_01);
		ORCCITY_SANCTUM_OUTERGATEOPEN = TRUE;
	}
	else
	{
		AI_Wait(self,0.5);
		AI_PlayAni(self,"T_DONTKNOW");
		AI_OutputSVM(self,self,"$DoesntWork");
	};
};


//OGY
func int evt_wheel_10_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_10_s0()
{
	if(CORANGAR_GOTOOGY == TRUE)
	{
		Wld_SendUntrigger("EVT_ORCGRAVYARD_MOVER_01");
		GATE_10_STATE = 0;
	}
	else
	{
		AI_PlayAni(self,"T_VWHEEL_S0_2_STAND");
		AI_Wait(self,0.5);
		AI_PlayAni(self,"T_DONTKNOW");
		AI_OutputSVM(self,self,"$DoesntWork");
	};
};

func void evt_wheel_10_s1()
{
	if(CORANGAR_GOTOOGY == FALSE)
	{
		AI_PlayAni(self,"T_VWHEEL_S1_2_STAND");
		AI_Wait(self,0.5);
		AI_PlayAni(self,"T_DONTKNOW");
		AI_OutputSVM(self,self,"$DoesntWork");
	}
	else if(GATE_10_STATE == 1)
	{
		AI_UseMob(hero,"VWHEEL",0);	
	}
	else if(GATE_10_STATE == 0)
	{
		Wld_SendTrigger("EVT_ORCGRAVYARD_MOVER_01");
		if(CORKALOMLEFT == FALSE)
		{
			b_corkalomleft();
		};
		GATE_10_STATE = 1;
	};
};

//OC Arena
func int evt_wheel_11_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_11_s0()
{
	Wld_SendUntrigger("OC_ARENA_GATE");
	GATE_11_STATE = 0;
};

func void evt_wheel_11_s1()
{
	if(GATE_11_STATE == 1)
	{
		AI_UseMob(hero,"VWHEEL",0);	
	};
	if(GATE_11_STATE == 0)
	{
		Wld_SendTrigger("OC_ARENA_GATE");
		GATE_11_STATE = 1;
	};
};

//orc arena - out
func int evt_wheel_12_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_12_s0()
{
	Wld_SendUntrigger("ORC_ARENA_GATE_OUT");
	GATE_12_STATE = 0;
};

func void evt_wheel_12_s1()
{
	if(GATE_12_STATE == 1)
	{
		AI_UseMob(hero,"VWHEEL",0);	
	};
	if(GATE_12_STATE == 0)
	{
		Wld_SendTrigger("ORC_ARENA_GATE_OUT");
		GATE_12_STATE = 1;
	};
};

//orc arena - in
func int evt_wheel_13_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_13_s0()
{
	Wld_SendUntrigger("ORC_ARENA_GATE_IN");
	GATE_13_STATE = 0;
};

func void evt_wheel_13_s1()
{
	if(GATE_13_STATE == 1)
	{
		AI_UseMob(hero,"VWHEEL",0);	
	};
	if(GATE_13_STATE == 0)
	{
		Wld_SendTrigger("ORC_ARENA_GATE_IN");
		GATE_13_STATE = 1;
	};
};

//AM
func int evt_wheel_d04_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_d04_s0()
{
	AI_PlayAni(self,"T_LEVER_S1_2_STAND");
	AI_OutputSVM_Overlay(hero,NULL,"SVM_15_PickBroke");
};

func void evt_wheel_d04_s1()
{
	if(GATE_D04_STATE == 1)
	{
		AI_PlayAni(self,"T_LEVER_S1_2_STAND");
		AI_OutputSVM_Overlay(hero,NULL,"SVM_15_PickBroke");
	};
	if(GATE_D04_STATE == 0)
	{
		Wld_SendTrigger("AM_GATE");
		GATE_D04_STATE = 1;
	};
};

func void evt_teleportstation_func()
{
	Wld_PlayEffect("SPELLFX_TELEPORT_RING",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_TELEPORT_CAST");
	Npc_ClearAIQueue(hero);
	AI_Teleport(hero,"DT_E1_05");
};

func int ll1_cf()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) < 1)
	{
		PrintScreen(_STR_CANNOTUSE_LOCKS_NO_SKILL,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	}
	else if(Npc_HasItems(hero,itkelockpick))
	{
		return TRUE;
	}
	else
	{
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY_NO_LOCKPICK,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	};
};

func int ll2_cf()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) < 1)
	{
		PrintScreen(_STR_CANNOTUSE_LOCKS_NO_SKILL,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) < 2)
	{
		PrintScreen(_STR_CANNOTUSE_LOCKS_LOW_SKILL,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	}
	else if(Npc_HasItems(hero,itkelockpick))
	{
		return TRUE;
	}
	else
	{
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY_NO_LOCKPICK,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	};
};

func int ll2_itke_gomez_01_cf()
{
	if(Npc_HasItems(hero,itke_gomez_01))
	{
		return TRUE;
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) < 1)
	{
		PrintScreen(_STR_CANNOTUSE_LOCKS_NO_SKILL,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) < 2)
	{
		PrintScreen(_STR_CANNOTUSE_LOCKS_LOW_SKILL,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	}
	else if(Npc_HasItems(hero,itkelockpick))
	{
		return TRUE;
	}
	else
	{
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY_NO_LOCKPICK,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	};
};

func int itke_gomez_01_cf()
{
	if(Npc_HasItems(hero,itke_gomez_01))
	{
		return TRUE;
	}
	else
	{
		AI_OutputSVM_Overlay(self,self,"$NeedKey");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	};
};

func int itke_quentin_cf()
{
	if(Npc_HasItems(hero,itke_quentin))
	{
		return TRUE;
	}
	else
	{
		AI_OutputSVM_Overlay(self,self,"$NeedKey");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	};
};

func int itke_berg_01_cf()
{
	if(Npc_HasItems(hero,itke_berg_01))
	{
		return TRUE;
	}
	else
	{
		AI_OutputSVM_Overlay(self,self,"$NeedKey");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	};
};

func int itke_focus5_cf()
{
	if(Npc_HasItems(hero,itke_focus5))
	{
		return TRUE;
	}
	else
	{
		AI_OutputSVM_Overlay(self,self,"$NeedKey");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	};
};

func int itke_sunkentower_cf()
{
	if(Npc_HasItems(hero,itke_sunkentower))
	{
		return TRUE;
	}
	else
	{
		AI_OutputSVM_Overlay(self,self,"$NeedKey");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	};
};

func int itke_focus4_cf()
{
	if(Npc_HasItems(hero,itke_focus4))
	{
		return TRUE;
	}
	else
	{
		AI_OutputSVM_Overlay(self,self,"$NeedKey");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	};
};

func int itkecavalorn01_cf()
{
	if(Npc_HasItems(hero,itkecavalorn01))
	{
		return TRUE;
	}
	else
	{
		AI_OutputSVM_Overlay(self,self,"$NeedKey");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	};
};

func int itke_freemine_cf()
{
	if(Npc_HasItems(hero,itke_freemine))
	{
		return TRUE;
	}
	else
	{
		AI_OutputSVM_Overlay(self,self,"$NeedKey");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	};
};

func int itke_yberion_cf()
{
	if(Npc_HasItems(hero,itke_yberion))
	{
		return TRUE;
	}
	else
	{
		AI_OutputSVM_Overlay(self,self,"$NeedKey");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	};
};

func int itke_psi_kalom_01_cf()
{
	if(Npc_HasItems(hero,itke_psi_kalom_01))
	{
		return TRUE;
	}
	else
	{
		AI_OutputSVM_Overlay(self,self,"$NeedKey");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	};
};

func int dungeonkey_cf()
{
	if(Npc_HasItems(hero,dungeonkey))
	{
		return TRUE;
	}
	else
	{
		AI_OutputSVM_Overlay(self,self,"$NeedKey");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	};
};

func int itke_gilbert_cf()
{
	if(Npc_HasItems(hero,itke_gilbert))
	{
		return TRUE;
	}
	else
	{
		AI_OutputSVM_Overlay(self,self,"$NeedKey");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	};
};

func int itkey_ob_smith_01_cf()
{
	if(Npc_HasItems(hero,itkey_ob_smith_01))
	{
		return TRUE;
	}
	else
	{
		AI_OutputSVM_Overlay(self,self,"$NeedKey");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	};
};

func int itke_storage_01_cf()
{
	if(Npc_HasItems(hero,itke_storage_01))
	{
		return TRUE;
	}
	else
	{
		AI_OutputSVM_Overlay(self,self,"$NeedKey");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	};
};

func int ll2_itkey_rb_01_cf()
{
	if(Npc_HasItems(hero,itkey_rb_01))
	{
		return TRUE;
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) < 1)
	{
		PrintScreen(_STR_CANNOTUSE_LOCKS_NO_SKILL,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) < 2)
	{
		PrintScreen(_STR_CANNOTUSE_LOCKS_LOW_SKILL,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	}
	else if(Npc_HasItems(hero,itkelockpick))
	{
		return TRUE;
	}
	else
	{
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY_NO_LOCKPICK,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	};
};

func int ll2_orik_key_cf()
{
	if(Npc_HasItems(hero,orik_key))
	{
		return TRUE;
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) < 1)
	{
		PrintScreen(_STR_CANNOTUSE_LOCKS_NO_SKILL,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) < 2)
	{
		PrintScreen(_STR_CANNOTUSE_LOCKS_LOW_SKILL,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	}
	else if(Npc_HasItems(hero,itkelockpick))
	{
		return TRUE;
	}
	else
	{
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY_NO_LOCKPICK,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	};
};

func int ll2_itke_tower_01_cf()
{
	if(Npc_HasItems(hero,itke_tower_01))
	{
		return TRUE;
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) < 1)
	{
		PrintScreen(_STR_CANNOTUSE_LOCKS_NO_SKILL,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) < 2)
	{
		PrintScreen(_STR_CANNOTUSE_LOCKS_LOW_SKILL,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	}
	else if(Npc_HasItems(hero,itkelockpick))
	{
		return TRUE;
	}
	else
	{
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY_NO_LOCKPICK,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	};
};

func int itke_om_02_cf()
{
	if(Npc_HasItems(hero,itke_om_02))
	{
		return TRUE;
	}
	else
	{
		AI_OutputSVM_Overlay(self,self,"$NeedKey");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	};
};

func int itke_om_03_cf()
{
	if(Npc_HasItems(hero,itke_om_03))
	{
		return TRUE;
	}
	else
	{
		AI_OutputSVM_Overlay(self,self,"$NeedKey");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_JOINCAMP,"font_old_10_white.tga",2);
	};
};

