
instance SH(NPC_DEFAULT)
{
	name[0] = "Помощник по сюжету";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 10;
	voice = 15;
	id = 0;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Bald",9,0,law_armor);
	start_aistate = zs_sh_hangaround;
};


func void zs_sh_hangaround()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_SH_Hangaround");
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
};

func void zs_sh_hangaround_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_SH_Hangaround_Loop");
};

func void zs_sh_hangaround_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_SH_Hangaround_End");
};


instance STORYHELPER_EXIT(C_INFO)
{
	npc = sh;
	nr = 999;
	condition = storyhelper_exit_condition;
	information = storyhelper_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int storyhelper_exit_condition()
{
	return 1;
};

func void storyhelper_exit_info()
{
	AI_StopProcessInfos(self);
};


instance STORYHELPER_INFO2(C_INFO)
{
	npc = sh;
	condition = storyhelper_info2_condition;
	information = storyhelper_info2_info;
	important = 0;
	permanent = 1;
	description = "Глава 2";
};


func int storyhelper_info2_condition()
{
	return TRUE;
};

func void storyhelper_info2_info()
{
	Info_ClearChoices(storyhelper_info2);
	Info_AddChoice(storyhelper_info2,DIALOG_BACK,storyhelper_back2);
	Info_AddChoice(storyhelper_info2,"II: Подготовка к вызову",storyhelper_prepareritual);
	Info_AddChoice(storyhelper_info2,"II: Альманах",storyhelper_corkalom_bringbook_running);
	Info_AddChoice(storyhelper_info2,"II: Яйца ползунов",storyhelper_corkalom_bringmcqballs_running);
	Info_AddChoice(storyhelper_info2,"II: Юнитор для Кор Галома",storyhelper_yberion_bringfocus_success);
	Info_AddChoice(storyhelper_info2,"II: Начало главы",storyhelper_chapter2start);
};

func void storyhelper_chapter2start()
{
	b_kapitelwechsel(2);
	Info_ClearChoices(storyhelper_info2);
	AI_StopProcessInfos(self);
};

func void storyhelper_yberion_bringfocus_success()
{
	b_kapitelwechsel(2);
	CreateInvItem(hero,focus_1);
	YBERION_BRINGFOCUS = LOG_SUCCESS;
	Info_ClearChoices(storyhelper_info2);
	AI_StopProcessInfos(self);
};

func void storyhelper_corkalom_bringmcqballs_running()
{
	b_kapitelwechsel(2);
	YBERION_BRINGFOCUS = LOG_SUCCESS;
	gur_1201_corkalom_weg_accept();
	CORKALOM_BRINGMCQBALLS = LOG_RUNNING;
	Info_ClearChoices(storyhelper_info2);
	AI_StopProcessInfos(self);
};

func void storyhelper_corkalom_bringbook_running()
{
	b_kapitelwechsel(2);
	YBERION_BRINGFOCUS = LOG_SUCCESS;
	CORKALOM_BRINGMCQBALLS = LOG_SUCCESS;
	CORKALOM_BRINGBOOK = LOG_RUNNING;
	Info_ClearChoices(storyhelper_info2);
	AI_StopProcessInfos(self);
};

func void storyhelper_prepareritual()
{
	b_kapitelwechsel(2);
	YBERION_BRINGFOCUS = LOG_SUCCESS;
	CORKALOM_BRINGMCQBALLS = LOG_SUCCESS;
	CORKALOM_BRINGBOOK = LOG_SUCCESS;
	b_story_prepareritual();
	Info_ClearChoices(storyhelper_info2);
	AI_StopProcessInfos(self);
};

func void storyhelper_back2()
{
	Info_ClearChoices(storyhelper_info2);
};


instance STORYHELPER_INFO3(C_INFO)
{
	npc = sh;
	condition = storyhelper_info3_condition;
	information = storyhelper_info3_info;
	important = 0;
	permanent = 1;
	description = "Глава 3";
};


func int storyhelper_info3_condition()
{
	return TRUE;
};

func void storyhelper_info3_info()
{
	Info_ClearChoices(storyhelper_info3);
	Info_AddChoice(storyhelper_info3,DIALOG_BACK,storyhelper_back3);
	Info_AddChoice(storyhelper_info3,"III: Сатурас - принести 4 юнитора",storyhelper_saturasbringfoci_running);
	Info_AddChoice(storyhelper_info3,"III: Кор Ангар - сходить в Новый лагерь",storyhelper_corangar_sendtonc);
	Info_AddChoice(storyhelper_info3,"III: Идол Люкор - побежден",storyhelper_baallukor_defeat);
	Info_AddChoice(storyhelper_info3,"III: Поход на кладбище орков",storyhelper_orcgraveyard);
};

func void storyhelper_orcgraveyard()
{
	b_kapitelwechsel(2);
	b_story_prepareritual();
	b_kapitelwechsel(3);
	b_story_gotoorcgraveyard();
	Info_ClearChoices(storyhelper_info3);
	AI_StopProcessInfos(self);
};

func void storyhelper_baallukor_defeat()
{
	b_kapitelwechsel(2);
	b_story_prepareritual();
	b_kapitelwechsel(3);
	b_story_gotoorcgraveyard();
	BAALLUKOR_BRINGPARCHMENT = 4;
	Info_ClearChoices(storyhelper_info3);
	AI_StopProcessInfos(self);
};

func void storyhelper_corangar_sendtonc()
{
	b_kapitelwechsel(2);
	b_story_prepareritual();
	b_kapitelwechsel(3);
	b_story_gotoorcgraveyard();
	b_story_backfromorcgraveyard();
	CreateInvItem(hero,focus_1);
	CreateInvItem(hero,itwrfokusbuch);
	b_story_senttonc();
	Info_ClearChoices(storyhelper_info3);
	AI_StopProcessInfos(self);
};

func void storyhelper_saturasbringfoci_running()
{
	b_kapitelwechsel(2);
	b_story_prepareritual();
	b_kapitelwechsel(3);
	b_story_gotoorcgraveyard();
	b_story_backfromorcgraveyard();
	b_story_senttonc();
	b_story_bringfoci();
	Info_ClearChoices(storyhelper_info3);
	AI_StopProcessInfos(self);
};

func void storyhelper_back3()
{
	Info_ClearChoices(storyhelper_info3);
};


instance STORYHELPER_INFO4(C_INFO)
{
	npc = sh;
	condition = storyhelper_info4_condition;
	information = storyhelper_info4_info;
	important = 0;
	permanent = 1;
	description = "Глава 4";
};


func int storyhelper_info4_condition()
{
	return TRUE;
};

func void storyhelper_info4_info()
{
	Info_ClearChoices(storyhelper_info4);
	Info_AddChoice(storyhelper_info4,DIALOG_BACK,storyhelper_back4);
	Info_AddChoice(storyhelper_info4,"IV: Поиск частей Улу-Мулу",storyhelper_searchforulumulu);
	Info_AddChoice(storyhelper_info4,"IV: Подготовка к нападению на Свободную шахту",storyhelper_attackfreemine);
	Info_AddChoice(storyhelper_info4,"IV: Ксардас - найти орка-шамана",storyhelper_xardasfindorcshaman);
	Info_AddChoice(storyhelper_info4,"IV: Ксардас - первая встреча",storyhelper_xardasintro);
	Info_AddChoice(storyhelper_info4,"IV: Сатурас - найти Ксардаса",storyhelper_saturasfindxardas);
	Info_AddChoice(storyhelper_info4,"IV: Диего - нападение на Свободную шахту",storyhelper_freemineambush);
	Info_AddChoice(storyhelper_info4,"IV: Сатурас - помощь магов Огня",storyhelper_saturasbringfoci_success);
};

func void storyhelper_saturasbringfoci_success()
{
	b_kapitelwechsel(2);
	b_story_prepareritual();
	b_kapitelwechsel(3);
	b_story_gotoorcgraveyard();
	b_story_backfromorcgraveyard();
	b_story_senttonc();
	b_story_bringfoci();
	b_story_broughtfoci();
	b_kapitelwechsel(4);
	Info_ClearChoices(storyhelper_info4);
	AI_StopProcessInfos(self);
};

func void storyhelper_freemineambush()
{
	b_kapitelwechsel(2);
	b_story_prepareritual();
	b_kapitelwechsel(3);
	b_story_gotoorcgraveyard();
	b_story_backfromorcgraveyard();
	b_story_senttonc();
	b_story_bringfoci();
	b_story_broughtfoci();
	b_kapitelwechsel(4);
	b_story_fmtaken();
	Info_ClearChoices(storyhelper_info4);
	AI_StopProcessInfos(self);
};

func void storyhelper_saturasfindxardas()
{
	b_kapitelwechsel(2);
	b_story_prepareritual();
	b_kapitelwechsel(3);
	b_story_gotoorcgraveyard();
	b_story_backfromorcgraveyard();
	b_story_senttonc();
	b_story_bringfoci();
	b_story_broughtfoci();
	b_kapitelwechsel(4);
	b_story_fmtaken();
	b_story_cordspost();
	b_story_findxardas();
	Info_ClearChoices(storyhelper_info4);
	AI_StopProcessInfos(self);
};

func void storyhelper_xardasintro()
{
	b_kapitelwechsel(2);
	b_story_prepareritual();
	b_kapitelwechsel(3);
	b_story_gotoorcgraveyard();
	b_story_backfromorcgraveyard();
	b_story_senttonc();
	b_story_bringfoci();
	b_story_broughtfoci();
	b_kapitelwechsel(4);
	b_story_fmtaken();
	b_story_cordspost();
	b_story_findxardas();
	b_story_accesstoxardas();
	Info_ClearChoices(storyhelper_info4);
	AI_StopProcessInfos(self);
};

func void storyhelper_xardasfindorcshaman()
{
	b_kapitelwechsel(2);
	b_story_prepareritual();
	b_kapitelwechsel(3);
	b_story_gotoorcgraveyard();
	b_story_backfromorcgraveyard();
	b_story_senttonc();
	b_story_bringfoci();
	b_story_broughtfoci();
	b_kapitelwechsel(4);
	b_story_fmtaken();
	b_story_cordspost();
	b_story_findxardas();
	b_story_accesstoxardas();
	b_story_findorcshaman();
	Info_ClearChoices(storyhelper_info4);
	AI_StopProcessInfos(self);
};

func void storyhelper_attackfreemine()
{
	b_kapitelwechsel(2);
	b_story_prepareritual();
	b_kapitelwechsel(3);
	b_story_gotoorcgraveyard();
	b_story_backfromorcgraveyard();
	b_story_senttonc();
	b_story_bringfoci();
	b_story_broughtfoci();
	b_kapitelwechsel(4);
	b_story_fmtaken();
	b_story_cordspost();
	b_story_findxardas();
	b_story_accesstoxardas();
	b_story_findorcshaman();
	b_story_foundurshak();
	b_story_friendofurshak();
	b_story_returnedfromurshak();
	Info_ClearChoices(storyhelper_info4);
	AI_StopProcessInfos(self);
};

func void storyhelper_searchforulumulu()
{
	b_kapitelwechsel(2);
	b_story_prepareritual();
	b_kapitelwechsel(3);
	b_story_gotoorcgraveyard();
	b_story_backfromorcgraveyard();
	b_story_senttonc();
	b_story_bringfoci();
	b_story_broughtfoci();
	b_kapitelwechsel(4);
	b_story_fmtaken();
	b_story_cordspost();
	b_story_findxardas();
	b_story_accesstoxardas();
	b_story_findorcshaman();
	b_story_foundurshak();
	b_story_friendofurshak();
	b_story_returnedfromurshak();
	b_story_cancelfindxardas();
	b_story_gornjoins();
	KNOWS_GETMCPLATES = TRUE;
	b_story_jackalfight();
	b_story_foundorcslave();
	b_story_curedorc();
	b_story_leftfm();
	Info_ClearChoices(storyhelper_info4);
	AI_StopProcessInfos(self);
};

func void storyhelper_back4()
{
	Info_ClearChoices(storyhelper_info4);
};


instance STORYHELPER_INFO5(C_INFO)
{
	npc = sh;
	condition = storyhelper_info5_condition;
	information = storyhelper_info5_info;
	important = 0;
	permanent = 1;
	description = "Глава 5";
};


func int storyhelper_info5_condition()
{
	return TRUE;
};

func void storyhelper_info5_info()
{
	Info_ClearChoices(storyhelper_info5);
	Info_AddChoice(storyhelper_info5,DIALOG_BACK,storyhelper_back5);
	//Info_AddChoice(storyhelper_info5,"V: УРИЗЕЛЬ заряжен",storyhelper_urizielloaded);
	Info_AddChoice(storyhelper_info5,"V: Подготовка к зарядке УРИЗЕЛЯ",storyhelper_loaduriziel);
	Info_AddChoice(storyhelper_info5,"V: Исследование затонувшей башни",storyhelper_exploresunkentower);
	Info_AddChoice(storyhelper_info5,"V: Нахождение УРИЗЕЛЯ",storyhelper_founduriziel);
	Info_AddChoice(storyhelper_info5,"V: Подготовка к походу в город орков",storyhelper_readyfororccity);
};

func void storyhelper_readyfororccity()
{
	b_kapitelwechsel(2);
	b_story_prepareritual();
	b_kapitelwechsel(3);
	b_story_gotoorcgraveyard();
	b_story_backfromorcgraveyard();
	b_story_senttonc();
	b_story_bringfoci();
	b_story_broughtfoci();
	b_kapitelwechsel(4);
	b_story_fmtaken();
	b_story_cordspost();
	b_story_findxardas();
	b_story_accesstoxardas();
	b_story_findorcshaman();
	b_story_foundurshak();
	b_story_friendofurshak();
	b_story_returnedfromurshak();
	b_story_cancelfindxardas();
	b_story_gornjoins();
	KNOWS_GETMCPLATES = TRUE;
	b_story_jackalfight();
	b_story_foundorcslave();
	b_story_curedorc();
	b_story_leftfm();
	b_story_gotulumulu();
	b_kapitelwechsel(5);
	CreateInvItem(hero,crw_armor_h);
	Info_ClearChoices(storyhelper_info5);
	AI_StopProcessInfos(self);
};

func void storyhelper_founduriziel()
{
	b_kapitelwechsel(2);
	b_story_prepareritual();
	b_kapitelwechsel(3);
	b_story_gotoorcgraveyard();
	b_story_backfromorcgraveyard();
	b_story_senttonc();
	b_story_bringfoci();
	b_story_broughtfoci();
	b_kapitelwechsel(4);
	b_story_fmtaken();
	b_story_cordspost();
	b_story_findxardas();
	b_story_accesstoxardas();
	b_story_findorcshaman();
	b_story_foundurshak();
	b_story_friendofurshak();
	b_story_returnedfromurshak();
	b_story_cancelfindxardas();
	b_story_gornjoins();
	KNOWS_GETMCPLATES = TRUE;
	b_story_jackalfight();
	b_story_foundorcslave();
	b_story_curedorc();
	b_story_leftfm();
	b_story_gotulumulu();
	b_kapitelwechsel(5);
	CreateInvItem(hero,crw_armor_h);
	ENTEREDTEMPLE = TRUE;
	b_story_founduriziel();
	b_story_encounteredhighpriest();
	b_story_showedurizieltoxardas();
	Info_ClearChoices(storyhelper_info5);
	AI_StopProcessInfos(self);
};

func void storyhelper_exploresunkentower()
{
	b_kapitelwechsel(2);
	b_story_prepareritual();
	b_kapitelwechsel(3);
	b_story_gotoorcgraveyard();
	b_story_backfromorcgraveyard();
	b_story_senttonc();
	b_story_bringfoci();
	b_story_broughtfoci();
	b_kapitelwechsel(4);
	b_story_fmtaken();
	b_story_cordspost();
	b_story_findxardas();
	b_story_accesstoxardas();
	b_story_findorcshaman();
	b_story_foundurshak();
	b_story_friendofurshak();
	b_story_returnedfromurshak();
	b_story_cancelfindxardas();
	b_story_gornjoins();
	KNOWS_GETMCPLATES = TRUE;
	b_story_jackalfight();
	b_story_foundorcslave();
	b_story_curedorc();
	b_story_leftfm();
	b_story_gotulumulu();
	b_kapitelwechsel(5);
	CreateInvItem(hero,crw_armor_h);
	ENTEREDTEMPLE = TRUE;
	b_story_founduriziel();
	b_story_encounteredhighpriest();
	b_story_showedurizieltoxardas();
	b_story_exploresunkentower();
	Info_ClearChoices(storyhelper_info5);
	AI_StopProcessInfos(self);
};

func void storyhelper_loaduriziel()
{
	b_kapitelwechsel(2);
	b_story_prepareritual();
	b_kapitelwechsel(3);
	b_story_gotoorcgraveyard();
	b_story_backfromorcgraveyard();
	b_story_senttonc();
	b_story_bringfoci();
	b_story_broughtfoci();
	b_kapitelwechsel(4);
	b_story_fmtaken();
	b_story_cordspost();
	b_story_findxardas();
	b_story_accesstoxardas();
	b_story_findorcshaman();
	b_story_foundurshak();
	b_story_friendofurshak();
	b_story_returnedfromurshak();
	b_story_cancelfindxardas();
	b_story_gornjoins();
	KNOWS_GETMCPLATES = TRUE;
	b_story_jackalfight();
	b_story_foundorcslave();
	b_story_curedorc();
	b_story_leftfm();
	b_story_gotulumulu();
	b_kapitelwechsel(5);
	CreateInvItem(hero,crw_armor_h);
	ENTEREDTEMPLE = TRUE;
	b_story_founduriziel();
	b_story_encounteredhighpriest();
	b_story_showedurizieltoxardas();
	b_story_exploresunkentower();
	CreateInvItem(hero,ore_armor_m);
	CreateInvItem(hero,itarrune_1_3_teleport1);
	b_story_loadsword();
	Info_ClearChoices(storyhelper_info5);
	AI_StopProcessInfos(self);
};

func void storyhelper_urizielloaded()
{
	b_kapitelwechsel(2);
	b_story_prepareritual();
	b_kapitelwechsel(3);
	b_story_gotoorcgraveyard();
	b_story_backfromorcgraveyard();
	b_story_senttonc();
	b_story_bringfoci();
	b_story_broughtfoci();
	b_kapitelwechsel(4);
	b_story_fmtaken();
	b_story_cordspost();
	b_story_findxardas();
	b_story_accesstoxardas();
	b_story_findorcshaman();
	b_story_foundurshak();
	b_story_friendofurshak();
	b_story_returnedfromurshak();
	b_story_cancelfindxardas();
	b_story_gornjoins();
	KNOWS_GETMCPLATES = TRUE;
	b_story_jackalfight();
	b_story_foundorcslave();
	b_story_curedorc();
	b_story_gotulumulu();
	b_kapitelwechsel(5);
	CreateInvItem(hero,crw_armor_h);
	ENTEREDTEMPLE = TRUE;
	b_story_founduriziel();
	b_story_encounteredhighpriest();
	b_story_showedurizieltoxardas();
	b_story_exploresunkentower();
	CreateInvItem(hero,ore_armor_m);
	CreateInvItem(hero,itarrune_1_3_teleport1);
	b_story_loadsword();
	b_kapitelwechsel(6);
	b_story_urizielloaded();
	//Info_ClearChoices(storyhelper_info5);
	Info_ClearChoices(storyhelper_info6);
	AI_StopProcessInfos(self);
};

func void storyhelper_back5()
{
	Info_ClearChoices(storyhelper_info5);
};

instance STORYHELPER_INFO6(C_INFO)
{
	npc = sh;
	condition = storyhelper_info6_condition;
	information = storyhelper_info6_info;
	important = 0;
	permanent = 1;
	description = "Глава 6";
};


func int storyhelper_info6_condition()
{
	return TRUE;
};

func void storyhelper_info6_info()
{
	Info_ClearChoices(storyhelper_info6);
	Info_AddChoice(storyhelper_info6,DIALOG_BACK,storyhelper_back6);
	Info_AddChoice(storyhelper_info6,"VI: УРИЗЕЛЬ заряжен",storyhelper_urizielloaded);
};

func void storyhelper_back6()
{
	Info_ClearChoices(storyhelper_info6);
};

