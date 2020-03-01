
func void b_cycle_function()
{
	var C_NPC kirgo;
	var C_NPC kharim;
	var C_NPC gorhanis;
	//var C_NPC riddler;
	kirgo = Hlp_GetNpc(grd_251_kirgo);
	kharim = Hlp_GetNpc(sld_729_kharim);
	gorhanis = Hlp_GetNpc(tpl_1422_gorhanis);
	//riddler = Hlp_GetNpc(bau_940_riddler);
	if(KAPITEL < 4)
	{
		if(Wld_IsTime(20,18,20,18))
		{
			kharim.attribute[ATR_HITPOINTS] = 172;
			kharim.attribute[ATR_HITPOINTS_MAX] = 172;
		};
		if(Wld_IsTime(21,38,21,38))
		{
			kirgo.attribute[ATR_HITPOINTS] = 160;
			kirgo.attribute[ATR_HITPOINTS_MAX] = 160;
		};
		if(Wld_IsTime(22,58,22,58))
		{
			kharim.attribute[ATR_HITPOINTS] = 172;
			kharim.attribute[ATR_HITPOINTS_MAX] = 172;
			gorhanis.attribute[ATR_HITPOINTS] = 280;
			gorhanis.attribute[ATR_HITPOINTS_MAX] = 280;
		};
	};
	if(RUSSOBITMFIXV13 == FALSE && Npc_KnowsInfo(hero,info_diego_gamestart)) 
	{
		PrintScreen("Загруженное сохранение не поддерживается!",50,43,"font_old_10_white.tga",2);
		PrintScreen("Пожалуйста, начните новую игру.",50,40,"font_old_10_white.tga",2);
	};
	if(RIDDLE1INSERT == TRUE)
	{
		Wld_InsertItem(theriddle2,"FP_RIDD_2");
		RIDDLE1INSERT = FALSE;
	};
	if(RIDDLE2INSERT == TRUE)
	{
		Wld_InsertItem(theriddle3,"FP_SLEEP_OW_BLOODFLY_01_02");
		RIDDLE2INSERT = FALSE;
	};
	if(RIDDLE3INSERT == TRUE)
	{
		Wld_InsertItem(theriddle4,"FP_SLEEP_OW_LURKER_NC_LAKE_02");
		RIDDLE3INSERT = FALSE;
	};
	if(RIDDLE4INSERT == TRUE)
	{
		Wld_InsertItem(theriddle5,"FP_RIDD_4");
		RIDDLE4INSERT = FALSE;
	};
	//if(RIDDLE5INSERT == TRUE)
	//{
		//Wld_InsertNpc(riddler,"OW_FOGDUNGEON_36_MOVEMENT");
		//Npc_ChangeAttribute(riddler,ATR_HITPOINTS,-riddler.attribute[ATR_HITPOINTS_MAX]);
		//RIDDLE5INSERT = FALSE;
	//};
	Wld_SendTrigger("CYCLE_TRIGGER");
};

