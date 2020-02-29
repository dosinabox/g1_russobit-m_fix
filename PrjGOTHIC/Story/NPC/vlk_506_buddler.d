
instance VLK_506_BUDDLER(NPC_DEFAULT)
{
	name[0] = "Грант";
	npctype = NPCTYPE_MAIN;
	guild = GIL_VLK;
	level = 2;
	voice = 19;
	id = 506;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Pony",69,1,vlk_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nailmace_01);
	CreateInvItem(self,itmwpickaxe);
	CreateInvItem(self,itfoloaf);
	CreateInvItem(self,itfobeer);
	daily_routine = rtn_start_506;
};


func void rtn_start_506()
{
	ta_sleep(23,0,6,30,"OCR_HUT_15");
	ta_standaround(6,30,11,0,"OCR_OUTSIDE_HUT_15");
	ta_repairhut(11,0,17,0,"OCR_HUT_15");
	ta_sitcampfire(17,0,23,0,"OCR_OUTSIDE_HUT_15");
};

func void rtn_letterwait_506()
{
	ta_stay(23,0,6,30,"OCR_NORTHGATE_RAMP_ATOP");
	ta_stay(6,30,23,0,"OCR_NORTHGATE_RAMP_ATOP");
};

func void rtn_guide_506()
{
	ta_guidepc(23,0,6,30,"OC_ROUND_27");
	ta_guidepc(6,30,23,0,"OC_ROUND_27");
};

instance INFO_VLK506_EXIT(C_INFO)
{
	npc = vlk_506_buddler;
	nr = 999;
	condition = info_raeubers_exit_condition;
	information = info_raeubers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

instance DIA_VLK506_HI(C_INFO)
{
	npc = vlk_506_buddler;
	nr = 1;
	condition = dia_vlk506_hi_condition;
	information = dia_vlk506_hi_info;
	permanent = 0;
	important = 1;
};


func int dia_vlk506_hi_condition()
{
	if((LETTER_TOLD > 1) && (KAPITEL < 4) && (!Npc_KnowsInfo(hero,dia_vlk505_hi)))
	{
		return 1;
	};
};

func void dia_vlk506_hi_info()
{
	AI_Output(self,other,"DIA_LetterFight_01");	//Иди сюда! Быстрее!
	AI_Output(hero,self,"Info_Grd_212_FirstWarn_Info_15_02");	//В чем дело?
	if(SLY_LOSTNEK == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_LetterFight_02");	//Это Нек, они нашли его! Идем за мной, я покажу!
	}
	else if(DEXTER_GETKALOMSRECIPE == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_LetterFight_03");	//Я слышал, что ты ищешь рецепт для Декстера. Я могу помочь тебе, идем за мной!
	}
	else
	{
		AI_Output(self,other,"DIA_LetterFight_04");	//Мне нужна твоя помощь! Иди за мной, пожалуйста!
	};
	Npc_ExchangeRoutine(vlk_505_buddler,"start");
	Info_ClearChoices(dia_vlk506_hi);
	Info_AddChoice(dia_vlk506_hi,"Ладно. Пойдем.",dia_vlk506_hi_yes);
	Info_AddChoice(dia_vlk506_hi,"Мне это не нужно!",dia_vlk506_hi_no);
};

func void dia_vlk506_hi_yes()
{
	AI_Output(other,self,"DIA_Dusty_LetsGo_15_03");	//Ладно. Пойдем.
	Npc_ExchangeRoutine(self,"guide");
	AI_StopProcessInfos(self);
};

func void dia_vlk506_hi_no()
{
	AI_Output(other,self,"DIA_SLD_753_Baloro_Exit_Info_15_01");	//Мне это не нужно!
	AI_Output(self,other,"DIA_LetterFight_05");	//Так, ладно... Здесь слухи расходятся быстро: я знаю, что у тебя есть письмо для магов! Отдай его мне!
	self.guild = GIL_NONE;
	Npc_SetTrueGuild(self,GIL_NONE);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
	Npc_ExchangeRoutine(self,"start");
};

instance DIA_VLK506_HI2(C_INFO)
{
	npc = vlk_506_buddler;
	nr = 1;
	condition = dia_vlk506_hi2_condition;
	information = dia_vlk506_hi2_info;
	permanent = 0;
	important = 1;
};


func int dia_vlk506_hi2_condition()
{
	if((LETTER_TOLD > 1) && (KAPITEL < 4) && (Npc_GetDistToWP(self,"OC_ROUND_27") < 300) && (!Npc_KnowsInfo(hero,dia_vlk505_hi)))
	{
		return 1;
	};
};

func void dia_vlk506_hi2_info()
{
	AI_Output(self,other,"DIA_LetterFight_05");	//Так, ладно... Здесь слухи расходятся быстро: я знаю, что у тебя есть письмо для магов! Отдай его мне!
	self.guild = GIL_NONE;
	Npc_SetTrueGuild(self,GIL_NONE);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
	Npc_ExchangeRoutine(self,"start");
};

instance VLK506_GETLOST(C_INFO)
{
	npc = vlk_506_buddler;
	nr = 1;
	condition = vlk506_getlost_condition;
	information = vlk506_getlost_info;
	permanent = 1;
	important = 1;
};

func int vlk506_getlost_condition()
{
	if((self.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (LETTER_TOLD > 1) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void vlk506_getlost_info()
{
	AI_Output(self,other,"SVM_19_GetOutOfHere");	//Проваливай!
	AI_StopProcessInfos(self);
};

