
func void on_occ_gate_trigger()
{
	var C_NPC wache1;
	var C_NPC wache2;
	printdebugnpc(PD_TA_CHECK,"On_OCC_GATE_Trigger");
	wache1 = Hlp_GetNpc(grd_213_torwache);
	wache1.aivar[AIV_TRIGGER3] = 1;
	wache2 = Hlp_GetNpc(grd_212_torwache);
	wache2.aivar[AIV_TRIGGER3] = 1;
	if(wache1.aivar[AIV_PASSGATE] != TRUE && KAPITEL < 4)
	{
		b_fullstop(wache1);
		AI_StopProcessInfos(wache1);
		b_intruderalert(wache1,other);
		b_setattackreason(wache1,AIV_AR_INTRUDER);
		Npc_SetTarget(wache1,hero);
		AI_StartState(wache1,zs_attack,1,"");
		b_fullstop(wache2);
		AI_StopProcessInfos(wache2);
		b_intruderalert(wache2,other);
		b_setattackreason(wache2,AIV_AR_INTRUDER);
		Npc_SetTarget(wache2,hero);
		AI_StartState(wache2,zs_attack,1,"");
	};
};

func void on_ocr_northgate_trigger()
{
	var C_NPC wache;
	printdebugnpc(PD_TA_CHECK,"On_OCR_NORTHGATE_Trigger");
	wache = Hlp_GetNpc(grd_216_torwache);
	wache.aivar[AIV_TRIGGER3] = 1;
	wache = Hlp_GetNpc(grd_217_torwache);
	wache.aivar[AIV_TRIGGER3] = 1;
};

func void on_ocr_maingate_trigger()
{
	var C_NPC wache;
	printdebugnpc(PD_TA_CHECK,"On_OCR_MAINGATE_Trigger");
	wache = Hlp_GetNpc(grd_215_torwache);
	wache.aivar[AIV_TRIGGER3] = 1;
	wache = Hlp_GetNpc(grd_214_torwache);
	wache.aivar[AIV_TRIGGER3] = 1;
};

func void on_occ_baronsdoor_trigger()
{
	var C_NPC wache1;
	var C_NPC wache2;
	printdebugnpc(PD_TA_CHECK,"On_OCC_BARONSDOOR_Trigger");
	wache1 = Hlp_GetNpc(grd_218_gardist);
	wache1.aivar[AIV_TRIGGER3] = 1;
	wache2 = Hlp_GetNpc(grd_245_gardist);
	wache2.aivar[AIV_TRIGGER3] = 1;
	if(wache1.aivar[AIV_PASSGATE] != TRUE && KAPITEL < 4)
	{
		b_fullstop(wache1);
		AI_StopProcessInfos(wache1);
		b_intruderalert(wache1,other);
		b_setattackreason(wache1,AIV_AR_INTRUDER);
		Npc_SetTarget(wache1,hero);
		AI_StartState(wache1,zs_attack,1,"");
		b_fullstop(wache2);
		AI_StopProcessInfos(wache2);
		b_intruderalert(wache2,other);
		b_setattackreason(wache2,AIV_AR_INTRUDER);
		Npc_SetTarget(wache2,hero);
		AI_StartState(wache2,zs_attack,1,"");
	};
};

func void on_psi_labdoor_trigger()
{
	var C_NPC wache;
	printdebugnpc(PD_TA_CHECK,"ON_PSI_LABDOOR_TRIGGER");
	wache = Hlp_GetNpc(tpl_1406_templer);
	wache.aivar[AIV_TRIGGER3] = 1;
};

func void on_psi_temple_gate_trigger()
{
	var C_NPC wache;
	var C_NPC wache1;
	var C_NPC wache2;
	printdebugnpc(PD_TA_CHECK,"ON_PSI_TEMPLE_GATE_TRIGGER");
	wache = Hlp_GetNpc(tpl_1413_templer);
	wache.aivar[AIV_TRIGGER3] = 1;
	wache = Hlp_GetNpc(tpl_1430_templer);
	wache.aivar[AIV_TRIGGER3] = 1;
	wache = Hlp_GetNpc(tpl_1431_templer);
	wache.aivar[AIV_TRIGGER3] = 1;
	wache = Hlp_GetNpc(tpl_1432_templer);
	wache.aivar[AIV_TRIGGER3] = 1;
	wache1 = Hlp_GetNpc(tpl_1441_templer);
	wache2 = Hlp_GetNpc(tpl_1442_templer);
	if(KAPITEL == 1)
	{
		b_fullstop(wache1);
		AI_StopProcessInfos(wache1);
		b_intruderalert(wache1,other);
		b_setattackreason(wache1,AIV_AR_INTRUDER);
		Npc_SetTarget(wache1,hero);
		AI_StartState(wache1,zs_attack,1,"");
		b_fullstop(wache2);
		AI_StopProcessInfos(wache2);
		b_intruderalert(wache2,other);
		b_setattackreason(wache2,AIV_AR_INTRUDER);
		Npc_SetTarget(wache2,hero);
		AI_StartState(wache2,zs_attack,1,"");
	};
};

func void on_nc_mageramp_trigger()
{
	var C_NPC wache;
	printdebugnpc(PD_TA_CHECK,"ON_NC_MAGERAMP_TRIGGER");
	wache = Hlp_GetNpc(sld_702_soeldner);
	wache.aivar[AIV_TRIGGER3] = 1;
	wache = Hlp_GetNpc(sld_731_soeldner);
	wache.aivar[AIV_TRIGGER3] = 1;
};

func void on_nc_mages_trigger()
{
	var C_NPC wache1;
	var C_NPC wache2;
	wache1 = Hlp_GetNpc(sld_723_soeldner);
	wache2 = Hlp_GetNpc(sld_732_soeldner);
	if(wache1.aivar[AIV_PASSGATE] != TRUE)
	{
		b_fullstop(wache1);
		AI_StopProcessInfos(wache1);
		b_intruderalert(wache1,other);
		b_setattackreason(wache1,AIV_AR_INTRUDER);
		Npc_SetTarget(wache1,hero);
		AI_StartState(wache1,zs_attack,1,"");
		b_fullstop(wache2);
		AI_StopProcessInfos(wache2);
		b_intruderalert(wache2,other);
		b_setattackreason(wache2,AIV_AR_INTRUDER);
		Npc_SetTarget(wache2,hero);
		AI_StartState(wache2,zs_attack,1,"");
	};
};

func void on_nc_bar_trigger()
{
	var C_NPC wache1;
	var C_NPC wache2;
	wache1 = Hlp_GetNpc(org_875_tuersteher);
	wache2 = Hlp_GetNpc(org_876_tuersteher);
	if(wache2.aivar[AIV_PASSGATE] != TRUE)
	{
		b_fullstop(wache1);
		AI_StopProcessInfos(wache1);
		b_intruderalert(wache1,other);
		b_setattackreason(wache1,AIV_AR_INTRUDER);
		Npc_SetTarget(wache1,hero);
		AI_StartState(wache1,zs_attack,1,"");
		b_fullstop(wache2);
		AI_StopProcessInfos(wache2);
		b_intruderalert(wache2,other);
		b_setattackreason(wache2,AIV_AR_INTRUDER);
		Npc_SetTarget(wache2,hero);
		AI_StartState(wache2,zs_attack,1,"");
	};
};

func void on_nc_magecave_trigger()
{
	var C_NPC wache;
	printdebugnpc(PD_TA_CHECK,"ON_NC_MAGECAVE_TRIGGER");
	wache = Hlp_GetNpc(sld_725_soeldner);
	wache.aivar[AIV_TRIGGER3] = 1;
	wache = Hlp_GetNpc(sld_726_soeldner);
	wache.aivar[AIV_TRIGGER3] = 1;
};

func void on_nc_gate_trigger()
{
	printdebugnpc(PD_TA_CHECK,"ON_NC_GATE_TRIGGER");
};

