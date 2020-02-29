
instance TPL_1431_TEMPLER_CALLSLEEPER(C_INFO)
{
	npc = tpl_1431_templer;
	condition = tpl_1431_templer_callsleeper_condition;
	information = tpl_1431_templer_callsleeper_info;
	important = 1;
	permanent = 0;
};


func int tpl_1431_templer_callsleeper_condition()
{
	var C_NPC templer;
	var C_NPC kalom;
	templer = Hlp_GetNpc(tpl_1431_templer);
	kalom = Hlp_GetNpc(gur_1201_corkalom);
	if((CORKALOM_BRINGBOOK == LOG_SUCCESS) && (Npc_GetDistToWP(templer,"PSI_TEMPLE_STAIRS_1") < 1000) && c_timeforgreatprayer() && !Npc_KnowsInfo(hero,nov_1319_novize_callsleeper) && !Npc_KnowsInfo(hero,nov_1320_novize_callsleeper) && !Npc_KnowsInfo(hero,tpl_1430_templer_callsleeper) && (Npc_GetDistToWP(kalom,"PSI_TEMPLE_STAIRS_RIGHT") < 300))
	{
		return TRUE;
	};
};

func void tpl_1431_templer_callsleeper_info()
{
	AI_StopProcessInfos(self);
	b_kapitelwechsel(3);
};

