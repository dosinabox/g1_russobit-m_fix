
func void b_insertinextremo()
{
	Wld_InsertNpc(inextremo_drpymonte,"OCR_IE_PYMONTE");
	Wld_InsertNpc(inextremo_theflail,"OCR_IE_FLAIL");
	Wld_InsertNpc(inextremo_thomastheforger,"OCR_IE_THOMAS");
	Wld_InsertNpc(inextremo_unicorn,"OCR_IE_UNICORN");
	Wld_InsertNpc(inextremo_yellowpfeiffer,"OCR_IE_PFEIFFER");
	Wld_InsertNpc(inextremo_lutter,"OCR_IE_LUTTER");
	Wld_InsertNpc(inextremo_flex,"OCR_IE_FLEX");
	Wld_InsertNpc(ie_397_announcer,"OCR_AUDIENCE_02");
	Wld_InsertNpc(charlotte,"OCR_AUDIENCE_03");
	Wld_InsertNpc(iefan1,"OCR_CROWD_01");
	Wld_InsertNpc(iefan2,"OCR_CROWD_02");
	Wld_InsertNpc(iefan3,"OCR_CROWD_03");
	Wld_InsertNpc(iefan4,"OCR_CROWD_04");
};

func void b_killinextremo()
{
	b_exchangeroutine(inextremo_drpymonte,"off");
	b_exchangeroutine(inextremo_theflail,"off");
	b_exchangeroutine(inextremo_thomastheforger,"off");
	b_exchangeroutine(inextremo_unicorn,"off");
	b_exchangeroutine(inextremo_yellowpfeiffer,"off");
	b_exchangeroutine(inextremo_lutter,"off");
	b_exchangeroutine(inextremo_flex,"off");
	b_exchangeroutine(ie_397_announcer,"off");
	b_exchangeroutine(charlotte,"off");
	b_exchangeroutine(iefan1,"off");
	b_exchangeroutine(iefan2,"off");
	b_exchangeroutine(iefan3,"off");
	b_exchangeroutine(iefan4,"off");
	//b_exchangeroutine(vlk_580_grim,"start");
};

func void b_inextremostartmusic()
{
	Wld_SendTrigger("INEXTREMO_IE");
	Wld_SendTrigger("INEXTREMO_MUSIK");
	INEXTREMOPLAYING = TRUE;
};

func void b_inextremostopmusic()
{
	Wld_SendUntrigger("INEXTREMO_MUSIK");
	Wld_SendUntrigger("INEXTREMO_IE");
	INEXTREMOPLAYING = FALSE;
};

