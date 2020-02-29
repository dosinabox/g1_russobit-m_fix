
var int _str_message_wheel_stucks_again;

func int mc_oldmine_asghan()
{
	printdebugnpc(PD_ITEM_MOBSI,"MC_OLDMINE_ASGHAN");
	if(Npc_KnowsInfo(hero,grd_263_asghan_open_now) && (_STR_MESSAGE_WHEEL_STUCKS_AGAIN == 0))
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

