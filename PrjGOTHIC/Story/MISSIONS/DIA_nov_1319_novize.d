
instance NOV_1319_NOVIZE_CALLSLEEPER(C_INFO)
{
	npc = nov_1319_novize;
	condition = nov_1319_novize_callsleeper_condition;
	information = nov_1319_novize_callsleeper_info;
	important = 1;
	permanent = 0;
};


func int nov_1319_novize_callsleeper_condition()
{
	var C_NPC novize;
	var C_NPC kalom;
	novize = Hlp_GetNpc(nov_1319_novize);
	kalom = Hlp_GetNpc(gur_1201_corkalom);
	if((CORKALOM_BRINGBOOK == LOG_SUCCESS) && (Npc_GetDistToWP(novize,"PSI_TEMPLE_COURT_2") < 1000) && c_timeforgreatprayer() && !Npc_KnowsInfo(hero,nov_1320_novize_callsleeper) && !Npc_KnowsInfo(hero,tpl_1431_templer_callsleeper) && !Npc_KnowsInfo(hero,tpl_1430_templer_callsleeper) && (Npc_GetDistToWP(kalom,"PSI_TEMPLE_STAIRS_RIGHT") < 300))
	{
		return TRUE;
	};
};

func void nov_1319_novize_callsleeper_info()
{
	AI_StopProcessInfos(self);
	b_kapitelwechsel(3);
};

