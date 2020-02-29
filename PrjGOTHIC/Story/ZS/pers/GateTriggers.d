
func int on_occ_gate_trigger()
{
	var C_NPC wache;
	printdebugnpc(PD_TA_CHECK,"On_OCC_GATE_Trigger");
	wache = Hlp_GetNpc(grd_213_torwache);
	wache.aivar[AIV_TRIGGER3] = 1;
	wache = Hlp_GetNpc(grd_212_torwache);
	wache.aivar[AIV_TRIGGER3] = 1;
};

func int on_ocr_northgate_trigger()
{
	var C_NPC wache;
	printdebugnpc(PD_TA_CHECK,"On_OCR_NORTHGATE_Trigger");
	wache = Hlp_GetNpc(grd_216_torwache);
	wache.aivar[AIV_TRIGGER3] = 1;
	wache = Hlp_GetNpc(grd_217_torwache);
	wache.aivar[AIV_TRIGGER3] = 1;
};

func int on_ocr_maingate_trigger()
{
	var C_NPC wache;
	printdebugnpc(PD_TA_CHECK,"On_OCR_MAINGATE_Trigger");
	wache = Hlp_GetNpc(grd_215_torwache);
	wache.aivar[AIV_TRIGGER3] = 1;
	wache = Hlp_GetNpc(grd_214_torwache);
	wache.aivar[AIV_TRIGGER3] = 1;
};

func int on_occ_baronsdoor_trigger()
{
	var C_NPC wache;
	printdebugnpc(PD_TA_CHECK,"On_OCC_BARONSDOOR_Trigger");
	wache = Hlp_GetNpc(grd_218_gardist);
	wache.aivar[AIV_TRIGGER3] = 1;
	wache = Hlp_GetNpc(grd_245_gardist);
	wache.aivar[AIV_TRIGGER3] = 1;
};

func int on_psi_labdoor_trigger()
{
	var C_NPC wache;
	printdebugnpc(PD_TA_CHECK,"ON_PSI_LABDOOR_TRIGGER");
	wache = Hlp_GetNpc(tpl_1406_templer);
	wache.aivar[AIV_TRIGGER3] = 1;
};

func int on_psi_temple_gate_trigger()
{
	var C_NPC wache;
	printdebugnpc(PD_TA_CHECK,"ON_PSI_TEMPLE_GATE_TRIGGER");
	wache = Hlp_GetNpc(tpl_1413_templer);
	wache.aivar[AIV_TRIGGER3] = 1;
	wache = Hlp_GetNpc(tpl_1430_templer);
	wache.aivar[AIV_TRIGGER3] = 1;
	wache = Hlp_GetNpc(tpl_1431_templer);
	wache.aivar[AIV_TRIGGER3] = 1;
	wache = Hlp_GetNpc(tpl_1432_templer);
	wache.aivar[AIV_TRIGGER3] = 1;
};

func int on_nc_mageramp_trigger()
{
	var C_NPC wache;
	printdebugnpc(PD_TA_CHECK,"ON_NC_MAGERAMP_TRIGGER");
	wache = Hlp_GetNpc(sld_702_soeldner);
	wache.aivar[AIV_TRIGGER3] = 1;
	wache = Hlp_GetNpc(sld_731_soeldner);
	wache.aivar[AIV_TRIGGER3] = 1;
};

func int on_nc_magecave_trigger()
{
	var C_NPC wache;
	printdebugnpc(PD_TA_CHECK,"ON_NC_MAGECAVE_TRIGGER");
	wache = Hlp_GetNpc(sld_725_soeldner);
	wache.aivar[AIV_TRIGGER3] = 1;
	wache = Hlp_GetNpc(sld_726_soeldner);
	wache.aivar[AIV_TRIGGER3] = 1;
};

func int on_nc_gate_trigger()
{
	printdebugnpc(PD_TA_CHECK,"ON_NC_GATE_TRIGGER");
};

