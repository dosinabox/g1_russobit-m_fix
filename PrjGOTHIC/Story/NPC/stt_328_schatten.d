
instance STT_328_SCHATTEN(NPC_DEFAULT)
{
	name[0] = "Сэм";
	npctype = NPCTYPE_MAIN;
	guild = GIL_STT;
	level = 5;
	voice = 19;
	id = 328;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Bald",7,2,stt_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_sword_short_02);
	EquipItem(self,itrw_bow_small_01);
	CreateInvItems(self,itamarrow,20);
	daily_routine = rtn_start_328;
};


func void rtn_start_328()
{
	ta_sleep(23,55,7,0,"OCR_HUT_22");
	ta_sitaround(7,0,11,0,"OCR_OUTSIDE_ARENA_HANGAROUND");
	ta_roastscavenger(11,0,13,0,"OCR_OUTSIDE_ARENA_01");
	ta_standaround(13,0,15,30,"OCR_ARENA_01");
	ta_boss(15,30,23,55,"OCR_ARENA_01");
};

func void rtn_noarena_328()
{
	ta_sleep(23,5,7,0,"OCR_HUT_22");
	ta_sitaround(7,0,11,0,"OCR_OUTSIDE_ARENA_HANGAROUND");
	ta_roastscavenger(11,0,17,30,"OCR_OUTSIDE_ARENA_01");
	ta_sitaround(17,30,23,5,"OCR_OUTSIDE_ARENA_HANGAROUND");
};

func void info_sam_back()
{
	AI_Output(other,self,"GRD_219_Stone_BETTERARMOR_Info_BACK_15_01");	//Я передумал.
	Info_ClearChoices(dia_scatty_wannabet);
};

instance DIA_SCATTY_WANNABET(C_INFO)
{
	npc = stt_328_schatten;
	nr = 1;
	condition = dia_scatty_wannabet_condition;
	information = dia_scatty_wannabet_info;
	permanent = 1;
	description = "Я хочу сделать ставку.";
};


func int dia_scatty_wannabet_condition()
{
	if(KAPITEL < 4 && ARENA_BET_KIRGO == FALSE && ARENA_BET_KHARIM == FALSE && ARENA_BET_GORHANIS == FALSE && !Npc_IsDead(tpl_1422_gorhanis) && !Npc_IsDead(grd_251_kirgo) && !Npc_IsDead(sld_729_kharim))
	{
		return 1;
	};
};

func void dia_scatty_wannabet_info()
{
	AI_Output(other,self,"DIA_Scatty_WannaBet_15_00");	//Я хочу сделать ставку.
	if(ARENA_BET_DAY == Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Sam_15");	//Приходи завтра вечером.
		AI_StopProcessInfos(self);
	}
	else if(Wld_IsTime(19,10,22,52))
	{
		Info_ClearChoices(dia_scatty_wannabet);
		Info_AddChoice(dia_scatty_wannabet,DIALOG_BACK,info_sam_back);
		if(Wld_IsTime(19,10,20,13))
		{
			AI_Output(self,other,"DIA_Sam_11");	//Но не более одной ставки за вечер.
			Info_AddChoice(dia_scatty_wannabet,"Кирго (ставка: 50, выигрыш: 100).",dia_scatty_arenabet_kirgo);
			Info_AddChoice(dia_scatty_wannabet,"Карим (ставка: 30, выигрыш: 30).",dia_scatty_arenabet_kharim);
		}
		else if(Wld_IsTime(20,20,21,35))
		{
			AI_Output(self,other,"DIA_Sam_11");	//Но не более одной ставки за вечер.
			Info_AddChoice(dia_scatty_wannabet,"Кирго (ставка: 50, выигрыш: 100).",dia_scatty_arenabet_kirgo);
			Info_AddChoice(dia_scatty_wannabet,"Гор Ханис (ставка: 15, выигрыш: 10).",dia_scatty_arenabet_gorhanis);
		}
		else if(Wld_IsTime(21,40,22,52))
		{
			AI_Output(self,other,"DIA_Sam_11");	//Но не более одной ставки за вечер.
			Info_AddChoice(dia_scatty_wannabet,"Карим (ставка: 30, выигрыш: 30).",dia_scatty_arenabet_kharim);
			Info_AddChoice(dia_scatty_wannabet,"Гор Ханис (ставка: 15, выигрыш: 10).",dia_scatty_arenabet_gorhanis);
		}
		else
		{
			AI_Output(self,other,"DIA_Sam_05");	//Приходи вечером, когда все соберутся.
		};
	}
	else if(Wld_IsTime(22,52,23,59))
	{
		AI_Output(self,other,"DIA_Sam_06");	//Сегодняшний бой уже закончился. Приходи завтра вечером.
	}
	else
	{
		AI_Output(self,other,"DIA_Sam_05");	//Приходи вечером, когда все соберутся.
	};
};

func void dia_scatty_arenabet_kirgo()
{
	AI_Output(other,self,"Info_Grd_237_FirstWarn_15_06");	//Ладно, вот тебе руда!
	if(Npc_HasItems(other,itminugget) >= 50)
	{
		b_giveinvitems(other,self,itminugget,50);
		AI_Output(self,other,"DIA_Sam_10");	//Так, а теперь посмотрим, кто кого!
		AI_TurnToNPC(self,grd_251_kirgo);
		b_clearimmortal(grd_251_kirgo);
		b_clearimmortal(sld_729_kharim);
		b_clearimmortal(tpl_1422_gorhanis);
		var C_NPC kirgo;
		var C_NPC kharim;
		var C_NPC gorhanis;
		kirgo = Hlp_GetNpc(grd_251_kirgo);
		kharim = Hlp_GetNpc(sld_729_kharim);
		gorhanis = Hlp_GetNpc(tpl_1422_gorhanis);
		kirgo.attribute[ATR_HITPOINTS] = 1800;
		kirgo.attribute[ATR_HITPOINTS_MAX] = 1800;
		kharim.attribute[ATR_HITPOINTS] = 1500;
		kharim.attribute[ATR_HITPOINTS_MAX] = 1500;
		gorhanis.attribute[ATR_HITPOINTS] = 1100;
		gorhanis.attribute[ATR_HITPOINTS_MAX] = 1100;
		ARENA_BET_DAY = Wld_GetDay();
		ARENA_BET_KIRGO = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Sam_09");	//У тебя же нет столько!
	};
	Info_ClearChoices(dia_scatty_wannabet);
};

func void dia_scatty_arenabet_kharim()
{
	AI_Output(other,self,"VLK_585_Aleph_SCHUPPEN_30_15_01");	//Предлагаю 30 кусков.
	if(Npc_HasItems(other,itminugget) >= 30)
	{
		b_giveinvitems(other,self,itminugget,30);
		AI_Output(self,other,"DIA_Sam_10");	//Так, а теперь посмотрим, кто кого!
		AI_TurnToNPC(self,sld_729_kharim);
		b_clearimmortal(grd_251_kirgo);
		b_clearimmortal(sld_729_kharim);
		b_clearimmortal(tpl_1422_gorhanis);
		var C_NPC kirgo;
		var C_NPC kharim;
		var C_NPC gorhanis;
		kirgo = Hlp_GetNpc(grd_251_kirgo);
		kharim = Hlp_GetNpc(sld_729_kharim);
		gorhanis = Hlp_GetNpc(tpl_1422_gorhanis);
		kirgo.attribute[ATR_HITPOINTS] = 1800;
		kirgo.attribute[ATR_HITPOINTS_MAX] = 1800;
		kharim.attribute[ATR_HITPOINTS] = 1500;
		kharim.attribute[ATR_HITPOINTS_MAX] = 1500;
		gorhanis.attribute[ATR_HITPOINTS] = 1100;
		gorhanis.attribute[ATR_HITPOINTS_MAX] = 1100;
		ARENA_BET_DAY = Wld_GetDay();
		ARENA_BET_KHARIM = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Sam_09");	//У тебя же нет столько!
	};
	Info_ClearChoices(dia_scatty_wannabet);
};

func void dia_scatty_arenabet_gorhanis()
{
	AI_Output(other,self,"Info_Grd_237_FirstWarn_15_06");	//Ладно, вот тебе руда!
	if(Npc_HasItems(other,itminugget) >= 15)
	{
		b_giveinvitems(other,self,itminugget,15);
		AI_Output(self,other,"DIA_Sam_10");	//Так, а теперь посмотрим, кто кого!
		AI_TurnToNPC(self,tpl_1422_gorhanis);
		b_clearimmortal(grd_251_kirgo);
		b_clearimmortal(sld_729_kharim);
		b_clearimmortal(tpl_1422_gorhanis);
		var C_NPC kirgo;
		var C_NPC kharim;
		var C_NPC gorhanis;
		kirgo = Hlp_GetNpc(grd_251_kirgo);
		kharim = Hlp_GetNpc(sld_729_kharim);
		gorhanis = Hlp_GetNpc(tpl_1422_gorhanis);
		kirgo.attribute[ATR_HITPOINTS] = 1800;
		kirgo.attribute[ATR_HITPOINTS_MAX] = 1800;
		kharim.attribute[ATR_HITPOINTS] = 1500;
		kharim.attribute[ATR_HITPOINTS_MAX] = 1500;
		gorhanis.attribute[ATR_HITPOINTS] = 1100;
		gorhanis.attribute[ATR_HITPOINTS_MAX] = 1100;
		ARENA_BET_DAY = Wld_GetDay();
		ARENA_BET_GORHANIS = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Sam_09");	//У тебя же нет столько!
	};
	Info_ClearChoices(dia_scatty_wannabet);
};

instance DIA_SCATTY_BETRESULT(C_INFO)
{
	npc = stt_328_schatten;
	nr = 1;
	condition = dia_scatty_betresult_condition;
	information = dia_scatty_betresult_info;
	permanent = 1;
	important = 1;
};


func int dia_scatty_betresult_condition()
{
	if(KAPITEL < 4 && (ARENA_BET_KIRGO_WON == TRUE || ARENA_BET_KHARIM_WON == TRUE || ARENA_BET_GORHANIS_WON == TRUE) && !Npc_IsDead(tpl_1422_gorhanis) && !Npc_IsDead(grd_251_kirgo) && !Npc_IsDead(sld_729_kharim))
	{
		return 1;
	};
};

func void dia_scatty_betresult_info()
{
	if(ARENA_BET_KIRGO == TRUE)
	{
		if(ARENA_BET_KIRGO_WON == TRUE)
		{
			b_giveinvitems(self,other,itminugget,150);
			AI_Output(self,other,"DIA_Sam_08");	//Хороший бой. Поздравляю, держи свой выигрыш.
		}
		else
		{
			AI_Output(self,other,"DIA_Sam_07");	//Эх, не повезло! Ничего, попробуешь завтра...
		};
	};
	if(ARENA_BET_KHARIM == TRUE)
	{
		if(ARENA_BET_KHARIM_WON == TRUE)
		{
			b_giveinvitems(self,other,itminugget,60);
			AI_Output(self,other,"DIA_Sam_08");	//Хороший бой. Поздравляю, держи свой выигрыш.
		}
		else
		{
			AI_Output(self,other,"DIA_Sam_07");	//Эх, не повезло! Ничего, попробуешь завтра...
		};
	};
	if(ARENA_BET_GORHANIS == TRUE)
	{
		if(ARENA_BET_GORHANIS_WON == TRUE)
		{
			b_giveinvitems(self,other,itminugget,25);
			AI_Output(self,other,"DIA_Sam_08");	//Хороший бой. Поздравляю, держи свой выигрыш.
		}
		else
		{
			AI_Output(self,other,"DIA_Sam_07");	//Эх, не повезло! Ничего, попробуешь завтра...
		};
	};
	ARENA_BET_KIRGO = FALSE;
	ARENA_BET_KHARIM = FALSE;
	ARENA_BET_GORHANIS = FALSE;
	ARENA_BET_KIRGO_WON = FALSE;
	ARENA_BET_KHARIM_WON = FALSE;
	ARENA_BET_GORHANIS_WON = FALSE;
	var C_NPC kirgo;
	var C_NPC kharim;
	var C_NPC gorhanis;
	kirgo = Hlp_GetNpc(grd_251_kirgo);
	kharim = Hlp_GetNpc(sld_729_kharim);
	gorhanis = Hlp_GetNpc(tpl_1422_gorhanis);
	b_exchangeroutine(kirgo,"START");
	b_exchangeroutine(kharim,"START");
	b_exchangeroutine(gorhanis,"START");
	kirgo.attribute[ATR_HITPOINTS] = 1800;
	kirgo.attribute[ATR_HITPOINTS_MAX] = 1800;
	kirgo.flags = NPC_FLAG_IMMORTAL;
	kharim.attribute[ATR_HITPOINTS] = 1500;
	kharim.attribute[ATR_HITPOINTS_MAX] = 1500;
	kharim.flags = NPC_FLAG_IMMORTAL;
	gorhanis.attribute[ATR_HITPOINTS] = 1100;
	gorhanis.attribute[ATR_HITPOINTS_MAX] = 1100;
	gorhanis.flags = NPC_FLAG_IMMORTAL;
	if(!Npc_HasItems(kirgo,itmw_kirgo) && !Npc_HasItems(kirgo,itmw_1h_sword_01))
	{
		CreateInvItem(kirgo,itmw_1h_sword_01);
		AI_EquipBestMeleeWeapon(kirgo);
	};
	if(!Npc_HasItems(kharim,itmw_kharim) && !Npc_HasItems(kharim,itmw_1h_sword_01))
	{
		CreateInvItem(kharim,itmw_1h_sword_01);
		AI_EquipBestMeleeWeapon(kharim);
	};
	if(!Npc_HasItems(gorhanis,itmw_gorhanis) && !Npc_HasItems(gorhanis,itmw_1h_sword_01))
	{
		CreateInvItem(gorhanis,itmw_1h_sword_01);
		AI_EquipBestMeleeWeapon(gorhanis);
	};
	AI_StopProcessInfos(self);
};

instance DIA_SAM_HI(C_INFO)
{
	npc = stt_328_schatten;
	nr = 1;
	condition = dia_sam_hi_condition;
	information = dia_sam_hi_info;
	permanent = 0;
	important = 1;
};

func int dia_sam_hi_condition()
{
	if(KAPITEL < 4 && !Npc_IsDead(tpl_1422_gorhanis) && !Npc_IsDead(grd_251_kirgo) && !Npc_IsDead(sld_729_kharim))
	{
		return 1;
	};
};

func void dia_sam_hi_info()
{
	if(Npc_KnowsInfo(hero,info_kirgo_inarena) || Npc_KnowsInfo(hero,info_kharim_inarena) || Npc_KnowsInfo(hero,info_gorhanis_inarena))
	{
		AI_Output(self,other,"DIA_Sam_02");	//Привет! Видел тебя в бою - неплохие движения!
	}
	else
	{
		AI_Output(self,other,"DIA_Sam_01");	//Погоди! Я тебя здесь раньше не видел.
	};
	AI_Output(self,other,"DIA_Sam_03");	//Меня зовут Сэм. Я организую ставки.
	AI_Output(self,other,"DIA_Sam_04");	//Каждый вечер на арене устраиваются бои, а рудокопы и Призраки ставят руду на любимых бойцов. Хочешь поучаствовать?
	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_05");	//А что для этого нужно сделать?
	AI_Output(self,other,"DIA_Sam_12");	//Приходи вечером, когда все соберутся. Дождешься выхода своего бойца и обратишься ко мне.
	AI_Output(self,other,"DIA_Sam_13");	//Я возьму твою руду и выплачу выигрыш, если твой боец останется стоять на ногах, хехе.
	AI_Output(self,other,"DIA_Sam_14");	//Но не более одной ставки за вечер! А то были тут у нас случаи...
	ARENA_BET_DAY = Wld_GetDay() - 1;
};

instance INFO_SAM_EXIT(C_INFO)
{
	npc = stt_328_schatten;
	nr = 999;
	condition = info_raeubers_exit_condition;
	information = info_raeubers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

