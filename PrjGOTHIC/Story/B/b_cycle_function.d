
func void b_cycle_function()
{
	var C_NPC kirgo;
	var C_NPC kharim;
	var C_NPC gorhanis;
	kirgo = Hlp_GetNpc(grd_251_kirgo);
	kharim = Hlp_GetNpc(sld_729_kharim);
	gorhanis = Hlp_GetNpc(tpl_1422_gorhanis);
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
	if(RUSSOBITMFIXV11 == FALSE && Npc_KnowsInfo(hero,info_diego_gamestart)) 
	{
		PrintScreen("Загруженное сохранение не поддерживается!",-1,43,"font_old_10_white.tga",2);
		PrintScreen("Пожалуйста, начните новую игру.",-1,40,"font_old_10_white.tga",2);
	};
	Wld_SendTrigger("CYCLE_TRIGGER");
};

