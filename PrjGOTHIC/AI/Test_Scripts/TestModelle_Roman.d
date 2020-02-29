
instance ITWRLEVELMAP(C_ITEM)
{
	name = "Map of Test Level";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 15;
	visual = "ItWrMap.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = uselevelmap;
};


func void uselevelmap()
{
	var int ndocid;
	ndocid = Doc_CreateMap();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Map_X.TGA",1);
	Doc_SetFont(ndocid,-1,"FONT_OLD_20_WHITE.TGA");
	Doc_SetMargins(ndocid,-1,10,10,10,10,1);
	Doc_PrintLine(ndocid,-1,"Level Map");
	Doc_Show(ndocid);
};


instance ITWRBOOKOFTALES(C_ITEM)
{
	name = "Book of Tales";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 15;
	visual = "ItWrMap.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = usebookoftales;
};


func void usebookoftales()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"BOOK_LEFT.TGA",0);
	Doc_SetPage(ndocid,1,"BOOK_RIGHT.TGA",0);
	Doc_SetFont(ndocid,-1,"FONT_OLD_10_WHITE.TGA");
	Doc_SetMargins(ndocid,-1,10,10,10,10,1);
	Doc_PrintLine(ndocid,-1,"HEADER");
	Doc_PrintLine(ndocid,-1,"");
	Doc_PrintLines(ndocid,0,"One line on the left");
	Doc_PrintLines(ndocid,1,"One line on the right");
	Doc_Show(ndocid);
};


instance ITMW1HSWORDBURNING(C_ITEM)
{
	name = "Легендарный короткий меч прижигания";
	visual = "ItMw1hSword01.3DS";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	damagetype = DAM_EDGE | DAM_FIRE | DAM_MAGIC;
	damagetotal = 191;
	value = 20000;
	damage[DAM_INDEX_EDGE] = 1;
	damage[DAM_INDEX_FIRE] = 120;
	damage[DAM_INDEX_MAGIC] = 70;
	description = "Легендарный короткий меч прижигания";
	text[1] = "Это отличный меч, убивающий всех,";
	text[2] = "кто пытается убить тебя.";
	text[5] = "Урон";
	count[5] = damagetotal;
};

instance ITMW2HSWORDBURNING(C_ITEM)
{
	name = "Легендарный тяжелый меч прижигания";
	visual = "ItMw2hSword01.3DS";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	damagetype = DAM_FIRE;
	damagetotal = 250;
	value = 30000;
	description = "Легендарный тяжелый меч прижигания";
	text[1] = "Ничто не может устоять перед";
	text[2] = "его огненным прикосновением.";
	text[3] = "Этот меч считался давно утерянным.";
	text[5] = "Урон";
	count[5] = damagetotal;
};

instance ITRWWARBOWBURNING(C_ITEM)
{
	name = "Легендарный лук прижигания";
	visual = "ItRw_Bow_War_01.mms";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	damagetype = DAM_FIRE | DAM_POINT | DAM_FLY;
	munition = itamarrow;
	damagetotal = 200;
	value = 30000;
	damage[DAM_INDEX_POINT] = 75;
	damage[DAM_INDEX_FIRE] = 75;
	damage[DAM_INDEX_FLY] = 50;
	description = "Легендарный лук прижигания";
	text[1] = "Лук, сделанный в давние времена,";
	text[2] = "является самым лучшим оружием,";
	text[3] = "которое когда-либо появлялось в мире.";
	text[5] = "Урон";
	count[5] = damagetotal;
};

instance ITARROBEMITHRIL(C_ITEM)
{
	name = "Легендарный доспех из мифрила";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	value = 1098;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 20;
	wear = WEAR_TORSO;
	ownerguild = GIL_NONE;
	disguiseguild = GIL_NONE;
	visual = "dmbm.3ds";
	visual_change = "Hum_DMBM_ARMOR.asc";
	visual_skin = 0;
	material = MAT_METAL;
};

instance PC_ROMAN(NPC_DEFAULT)
{
	name[0] = "Роман Ромулан";
	id = 9995;
	guild = GIL_NONE;
	voice = 11;
	attribute[ATR_HITPOINTS_MAX] = 50;
	attribute[ATR_MANA_MAX] = 50;
	attribute[ATR_HITPOINTS] = 25;
	attribute[ATR_MANA] = 50;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 50;
	level = 50;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"HUM_BODY_NAKED0",0,0,"Hum_Head_Fighter",1,2,itarrobemithril);
	EquipItem(self,itrwwarbowburning);
	EquipItem(self,itmw1hswordburning);
	EquipItem(self,itmw2hswordburning);
	CreateInvItem(self,itwrlevelmap);
};

instance ALLROUND_TESTMODELL(NPC_DEFAULT)
{
	name[0] = "Странник";
	id = 9999;
	guild = GIL_NONE;
	voice = 11;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_MANA_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA] = 250;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 250;
	level = 250;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"HUM_BODY_NAKED0",0,0,"Hum_Head_Fighter",1,2,grd_armor_h);
	Npc_SetTalentSkill(self,NPC_TALENT_ACROBAT,3);
	Npc_SetTalentValue(self,NPC_TALENT_ACROBAT,100);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,3);
	Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,0);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKPOCKET,3);
	Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,0);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,3);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,3);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,3);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,3);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,3);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,8);
	Npc_SetTalentSkill(self,NPC_TALENT_FIREMASTER,3);
	flags = NPC_FLAG_IMMORTAL;
	fight_tactic = FAI_HUMAN_STRONG;
	CreateInvItem(self,itarrobemithril);
	EquipItem(self,itmw_2h_sword_heavy_01);
	CreateInvItems(self,itamarrow,50);
	CreateInvItem(self,itarrunelight);
	CreateInvItem(self,itarrunefirebolt);
	CreateInvItem(self,itarrunefireball);
	CreateInvItem(self,itarrunefirestorm);
	CreateInvItem(self,itarrunefirerain);
	CreateInvItem(self,itarruneteleport1);
	CreateInvItem(self,itarruneteleport2);
	CreateInvItem(self,itarruneteleport3);
	CreateInvItem(self,itarruneteleport5);
	CreateInvItem(self,itarruneheal);
	CreateInvItem(self,itarrunechainlightning);
	CreateInvItem(self,itarrunethunderbolt);
	CreateInvItem(self,itarrunethunderball);
	CreateInvItem(self,itarruneicecube);
	CreateInvItem(self,itarruneicewave);
	CreateInvItem(self,itarrunedestroyundead);
	CreateInvItem(self,itarrunewindfist);
	CreateInvItem(self,itarrunestormfist);
	CreateInvItem(self,itarrunetelekinesis);
	CreateInvItem(self,itarrunecharm);
	CreateInvItem(self,itarrunesleep);
	CreateInvItem(self,itarrunepyrokinesis);
	CreateInvItem(self,itarrunecontrol);
	CreateInvItem(self,itarrunearmyofdarkness);
	CreateInvItem(self,itarscrolllight);
	CreateInvItem(self,itarscrollfirebolt);
	CreateInvItem(self,itarscrollfireball);
	CreateInvItem(self,itarscrollfirestorm);
	CreateInvItem(self,itarscrollfirerain);
	CreateInvItem(self,itarscrollteleport1);
	CreateInvItem(self,itarscrollteleport2);
	CreateInvItem(self,itarscrollteleport3);
	CreateInvItem(self,itarscrollteleport4);
	CreateInvItem(self,itarscrollteleport5);
	CreateInvItem(self,itarscrollheal);
	CreateInvItem(self,itarscrolltrfbloodfly);
	CreateInvItem(self,itarscrolltrfcrawler);
	CreateInvItem(self,itarscrolltrflurker);
	CreateInvItem(self,itarscrolltrfmeatbug);
	CreateInvItem(self,itarscrolltrfmolerat);
	CreateInvItem(self,itarscrolltrforcdog);
	CreateInvItem(self,itarscrolltrfscavenger);
	CreateInvItem(self,itarscrolltrfshadowbeast);
	CreateInvItem(self,itarscrolltrfsnapper);
	CreateInvItem(self,itarscrolltrfwaran);
	CreateInvItem(self,itarscrolltrfwolf);
	CreateInvItem(self,itarscrollchainlightning);
	CreateInvItem(self,itarscrollthunderbolt);
	CreateInvItem(self,itarscrollthunderball);
	CreateInvItem(self,itarscrollicecube);
	CreateInvItem(self,itarscrollicewave);
	CreateInvItem(self,itarscrollsummondemon);
	CreateInvItem(self,itarscrollsummonskeletons);
	CreateInvItem(self,itarscrollsummongolem);
	CreateInvItem(self,itarscrollarmyofdarkness);
	CreateInvItem(self,itarscrolldestroyundead);
	CreateInvItem(self,itarscrollwindfist);
	CreateInvItem(self,itarscrollstormfist);
	CreateInvItem(self,itarscrolltelekinesis);
	CreateInvItem(self,itarscrollcharm);
	CreateInvItem(self,itarscrollsleep);
	CreateInvItem(self,itarscrollpyrokinesis);
	CreateInvItem(self,itarscrollcontrol);
	CreateInvItem(self,itarscrollfear);
	CreateInvItem(self,itarscrollberzerk);
	CreateInvItem(self,itarscrollshrink);
	CreateInvItems(self,itfoapple,10);
	CreateInvItems(self,itfocheese,10);
	CreateInvItems(self,itfoloaf,10);
	CreateInvItems(self,itfobeer,10);
	CreateInvItems(self,itfowine,10);
	CreateInvItem(self,itwrlevelmap);
	CreateInvItem(self,itwrbookoftales);
	npc_setpermattitude(self,ATT_HOSTILE);
	Npc_SetAttitude(self,ATT_HOSTILE);
	start_aistate = zs_testempty;
};


func void zs_testempty()
{
	Npc_PercEnable(self,PERC_ASSESSTALK,zs_testfinishmove);
	PrintScreen("Looking at player ...",-1,50,"FONT_OLD_20_WHITE.TGA",2);
	AI_LookAtNpc(self,hero);
};

func void zs_testempty_loop()
{
};

func void zs_testempty_end()
{
};

func void zs_testsmoke()
{
	b_choosejoint(self);
	AI_UseMob(self,"SMOKE",1);
};

func int zs_testsmoke_loop()
{
	AI_Wait(self,1);
	return 1;
};

func void zs_testsmoke_end()
{
	AI_UseMob(self,"SMOKE",-1);
	AI_UseItemToState(self,itmijoint_1,-1);
};


var int m_nguild;

func void zs_testguild()
{
	if(M_NGUILD == 0)
	{
		M_NGUILD = GIL_NONE;
	}
	else if(M_NGUILD == GIL_NONE)
	{
		M_NGUILD = GIL_GRD;
	}
	else if(M_NGUILD == GIL_GRD)
	{
		M_NGUILD = GIL_VLK;
	}
	else if(M_NGUILD == GIL_VLK)
	{
		M_NGUILD = GIL_NONE;
	};
	Npc_SetTrueGuild(hero,M_NGUILD);
};

func int zs_testguild_loop()
{
	return 1;
};

func void zs_testguild_end()
{
};

func void zs_testinfos()
{
	AI_ProcessInfos(self);
};

func int zs_testinfos_loop()
{
	return 1;
};

func void zs_testinfos_end()
{
};


var int g_nmana;

func void zs_testspell()
{
	PrintScreen("Increasing Mana ...",-1,50,"FONT_OLD_20_WHITE.TGA",3);
	G_NMANA = G_NMANA + 1;
	if(G_NMANA > 50)
	{
		G_NMANA = 25;
	};
	if(G_NMANA < 25)
	{
		G_NMANA = 25;
	};
	if(Npc_HasSpell(self,G_NSPELL))
	{
		PrintScreen("Readying spell ...",-1,40,"FONT_OLD_20_WHITE.TGA",3);
		AI_ReadySpell(self,SPL_FIREBALL,G_NMANA);
	};
};

func int zs_testspell_loop()
{
	return 1;
};

func void zs_testspell_end()
{
};


var int g_nspell;

func void zs_testmagic()
{
	PrintScreen("Unreadying spell ...",-1,30,"FONT_OLD_20_WHITE.TGA",3);
	AI_UnreadySpell(self);
	if(Npc_HasSpell(self,G_NSPELL))
	{
		PrintScreen("Readying spell ...",-1,40,"FONT_OLD_20_WHITE.TGA",3);
		AI_ReadySpell(self,G_NSPELL,50);
	}
	else
	{
		PrintScreen("Spell unavailable ...",-1,60,"FONT_OLD_20_WHITE.TGA",3);
	};
	G_NSPELL = G_NSPELL + 1;
	if(G_NSPELL > SPL_DESTROYUNDEAD)
	{
		G_NSPELL = SPL_LIGHT;
	};
};

func int zs_testmagic_loop()
{
	return 1;
};

func void zs_testmagic_end()
{
};

func void zs_testpatrol()
{
	Npc_PercEnable(self,PERC_MOVEMOB,zs_testmovemob);
	AI_GotoWP(self,"WP_OUT");
	AI_AlignToFP(self);
};

func void zs_testpatrol_loop()
{
};

func void zs_testpatrol_end()
{
};

func void zs_testmovemob()
{
	PrintScreen("Stopping ...",-1,30,"FONT_OLD_20_WHITE.TGA",3);
	Npc_ClearAIQueue(self);
	AI_Standup(self);
};

func void zs_testmovemob_loop()
{
	if(!Npc_IsWayBlocked(self))
	{
		PrintScreen("Way is free now ...",-1,40,"FONT_OLD_20_WHITE.TGA",3);
		AI_StartState(self,zs_testpatrol,0," ");
	};
};

func void zs_testmovemob_end()
{
};

func void zs_testdraw()
{
	PrintScreen("Arming ranged weapon ...",-1,50,"FONT_OLD_20_WHITE.TGA",2);
	AI_Standup(self);
	AI_EquipBestRangedWeapon(self);
	AI_ReadyRangedWeapon(self);
	PrintScreen("Aiming at player ...",-1,60,"FONT_OLD_20_WHITE.TGA",2);
	AI_AimAt(self,hero);
	PrintScreen("Next time I will shoot ...",-1,70,"FONT_OLD_20_WHITE.TGA",2);
	Npc_PercEnable(self,PERC_ASSESSTALK,zs_testshoot);
};

func void zs_testdraw_loop()
{
};

func void zs_testdraw_end()
{
};

func void zs_testshoot()
{
	PrintScreen("Shooting at player ...",-1,50,"FONT_OLD_20_WHITE.TGA",2);
	AI_ShootAt(self,hero);
	PrintScreen("Standing up ...",-1,60,"FONT_OLD_20_WHITE.TGA",2);
	AI_Standup(self);
	PrintScreen("Removing weapon ...",-1,70,"FONT_OLD_20_WHITE.TGA",2);
	AI_RemoveWeapon(self);
	AI_StartState(self,zs_testempty,0," ");
};

func int zs_testshoot_loop()
{
	return 1;
};

func void zs_testshoot_end()
{
};

func void zs_testfinishmove()
{
	PrintScreen("Arming weapon ...",-1,20,"FONT_OLD_20_WHITE.TGA",2);
	AI_Standup(self);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,hero);
};

func void zs_testfinishmove_loop()
{
	PrintScreen("Attacking hero ...",-1,25,"FONT_OLD_20_WHITE.TGA",2);
	AI_Attack(self);
	if(Npc_IsInState(hero,zs_unconscious))
	{
		PrintScreen("Finishing hero ...",-1,30,"FONT_OLD_20_WHITE.TGA",2);
		AI_FinishingMove(self,hero);
		AI_Standup(self);
		AI_RemoveWeapon(self);
		Npc_SetAttitude(self,ATT_NEUTRAL);
		AI_StartState(self,zs_testempty,0," ");
	};
};

func void zs_testfinishmove_end()
{
};

func void dailyroute_test_empty()
{
};


instance MISSION_TEST_EMPTY(C_MISSION)
{
	name = "Mission_Test_Empty";
	description = "Mission_Test_Empty";
	important = 1;
	offerconditions = mis_con_off_te;
	successconditions = mis_con_suc_te;
	failureconditions = mis_con_fai_te;
	obsoleteconditions = mis_con_obs_te;
	offer = mis_off_te;
	success = mis_suc_te;
	failure = mis_fai_te;
	obsolete = mis_obs_te;
	running = mis_run_te;
};


func int mis_con_off_te()
{
	return 1;
};

func int mis_con_suc_te()
{
	return 1;
};

func int mis_con_fai_te()
{
	return 0;
};

func int mis_con_obs_te()
{
	return 0;
};

func void mis_off_te()
{
	AI_AskText(self,NOFUNC,NOFUNC,"Да.","Нет.");
};

func void mis_suc_te()
{
	Print("Empty Mission succeeded");
};

func void mis_fai_te()
{
	Print("Empty Mission failed");
};

func void mis_obs_te()
{
	Print("Empty Mission became obsolete");
};

func void mis_run_te()
{
	Print("Empty Mission is running");
};


instance MISSION_TEST_DEFAULT(C_MISSION)
{
	name = "Mission_Test_Default";
	description = "Mission_Test_Default";
	important = 1;
	offerconditions = mis_con_off_td;
	successconditions = mis_con_suc_td;
	failureconditions = mis_con_fai_td;
	obsoleteconditions = mis_con_obs_td;
	offer = mis_off_td;
	success = mis_suc_td;
	failure = mis_fai_td;
	obsolete = mis_obs_td;
	running = mis_run_td;
};


func int mis_con_off_td()
{
	return 1;
};

func int mis_con_suc_td()
{
	return 1;
};

func int mis_con_fai_td()
{
	return 0;
};

func int mis_con_obs_td()
{
	return 0;
};

func void mis_off_td()
{
	AI_AskText(self,NOFUNC,NOFUNC,"Да.","Нет.");
};

func void mis_suc_td()
{
	Print("Default Mission succeeded");
};

func void mis_fai_td()
{
	Print("Default Mission failed");
};

func void mis_obs_td()
{
	Print("Default Mission became obsolete");
};

func void mis_run_td()
{
	Print("Default Mission is running");
};


instance TRADE_TEST(C_ITEMREACT)
{
	npc = allround_testmodell;
	trade_item = itfoapple;
	trade_amount = 10;
	requested_item = itfobeer;
	requested_amount = 2;
	reaction = trade_test_check;
};


func int trade_test_check()
{
	var string strtradeamount;
	var string strtradeitem;
	var string strrequestedamount;
	var string strrequesteditem;
	strtradeamount = "Количество товара:";
	strtradeamount = ConcatStrings(strtradeamount,IntToString(trade_test.trade_amount));
	strtradeitem = "Вид товара:";
	strtradeitem = ConcatStrings(strtradeitem,IntToString(trade_test.trade_item));
	strrequestedamount = "Необходимое количество:";
	strrequestedamount = ConcatStrings(strrequestedamount,IntToString(trade_test.requested_amount));
	strrequesteditem = "Необходимый товар:";
	strrequesteditem = ConcatStrings(strrequesteditem,IntToString(trade_test.requested_item));
	PrintScreen(strtradeamount,10,20,"FONT_OLD_20_WHITE.TGA",3);
	PrintScreen(strtradeitem,10,30,"FONT_OLD_20_WHITE.TGA",3);
	PrintScreen(strrequestedamount,10,40,"FONT_OLD_20_WHITE.TGA",3);
	PrintScreen(strrequesteditem,10,50,"FONT_OLD_20_WHITE.TGA",3);
	if(trade_test.requested_amount == 2)
	{
		return 1;
	};
	return 0;
};


instance INFO_TEST_TRADE(C_INFO)
{
	npc = allround_testmodell;
	nr = 666;
	condition = info_test_trade_success;
	information = info_test_trade_procedure;
	important = 0;
	description = "Allrounder's Trade";
	trade = 1;
};


func int info_test_trade_success()
{
	return 1;
};

func void info_test_trade_procedure()
{
	PrintScreen("Info_Test_Trade_Procedure()",-1,50,"FONT_OLD_20_WHITE.TGA",10);
};


instance INFO_TEST_TRADE_PERMANENT(C_INFO)
{
	npc = allround_testmodell;
	nr = 666;
	condition = info_test_trade_permanent_success;
	information = info_test_trade_permanent_procedure;
	important = 0;
	description = "Allrounder's Permanent Trade";
	permanent = 1;
	trade = 1;
};


func int info_test_trade_permanent_success()
{
	return 1;
};

func void info_test_trade_permanent_procedure()
{
	PrintScreen("Info_Test_Trade_Permanent_Procedure()",-1,50,"FONT_OLD_20_WHITE.TGA",10);
};


instance INFO_TEST_PERMANENT(C_INFO)
{
	npc = allround_testmodell;
	nr = 666;
	condition = info_test_permanent_success;
	information = info_test_permanent_procedure;
	important = 0;
	permanent = 1;
	description = "Allrounder's Permanent Info";
};


func int info_test_permanent_success()
{
	return 1;
};

func void info_test_permanent_procedure()
{
	PrintScreen("Info_Test_Permanent_Procedure()",-1,50,"FONT_OLD_20_WHITE.TGA",10);
};


instance INFO_TEST_IMPORTANT(C_INFO)
{
	npc = allround_testmodell;
	nr = 666;
	condition = info_test_important_success;
	information = info_test_important_procedure;
	important = 1;
	permanent = 0;
	description = "Allrounder's Important Info";
};


func int info_test_important_success()
{
	return 1;
};

func void info_test_important_procedure()
{
	PrintScreen("Info_Test_Important_Procedure()",-1,50,"FONT_OLD_20_WHITE.TGA",10);
};


instance INFO_TEST_IMPORTANT_PERMANENT(C_INFO)
{
	npc = allround_testmodell;
	nr = 666;
	condition = info_test_important_permanent_success;
	information = info_test_important_permanent_procedure;
	important = 1;
	permanent = 1;
	description = "Allrounder's Important Permanent Info";
};


func int info_test_important_permanent_success()
{
	return 1;
};

func void info_test_important_permanent_procedure()
{
	PrintScreen("Info_Test_Important_Permanent_Procedure()",-1,50,"FONT_OLD_20_WHITE.TGA",10);
};


instance INFO_TEST_NORMAL(C_INFO)
{
	npc = allround_testmodell;
	nr = 666;
	condition = info_test_success_normal;
	information = info_test_procedure_normal;
	important = 0;
	description = "Allrounder's Normal Info";
};


func int info_test_success_normal()
{
	return 1;
};

func void info_test_procedure_normal()
{
	PrintScreen("Info_Test_Procedure_Normal()",-1,50,"FONT_OLD_20_WHITE.TGA",10);
};


instance INFO_TEST_CHOICE(C_INFO)
{
	npc = allround_testmodell;
	nr = 666;
	condition = info_test_success_choice;
	information = info_test_procedure_choice;
	important = 0;
	permanent = 0;
	description = "Allrounder's Choice Info";
};


func int info_test_success_choice()
{
	return 1;
};

func void info_test_procedure_choice()
{
	PrintScreen("Info_Test_Procedure_Choice()",-1,50,"FONT_OLD_20_WHITE.TGA",10);
	Info_ClearChoices(info_test_choice);
	Info_AddChoice(info_test_choice,"Да.",info_test_procedure_choice_yes);
	Info_AddChoice(info_test_choice,"Нет.",info_test_procedure_choice_no);
	Info_AddChoice(info_test_choice,"Не знаю.",info_test_procedure_choice_unsure);
	Info_AddChoice(info_test_choice,"Выйти.",info_test_procedure_choice_exit);
};

func void info_test_procedure_choice_yes()
{
	Info_ClearChoices(info_test_choice);
};

func void info_test_procedure_choice_no()
{
	Info_ClearChoices(info_test_choice);
};

func void info_test_procedure_choice_unsure()
{
	Info_ClearChoices(info_test_choice);
	Info_AddChoice(info_test_choice,"Да.",info_test_procedure_choice_yes);
	Info_AddChoice(info_test_choice,"Нет.",info_test_procedure_choice_no);
	Info_AddChoice(info_test_choice,"Выйти.",info_test_procedure_choice_exit);
};

func void info_test_procedure_choice_exit()
{
	Info_ClearChoices(info_test_choice);
};


instance INFO_TEST_PERMANENT_CHOICE(C_INFO)
{
	npc = allround_testmodell;
	nr = 666;
	condition = info_test_success_permanent_choice;
	information = info_test_procedure_permanent_choice;
	important = 0;
	permanent = 1;
	description = "Allrounder's Permanent Choice Info";
};


func int info_test_success_permanent_choice()
{
	return 1;
};

func void info_test_procedure_permanent_choice()
{
	PrintScreen("Info_Test_Procedure_Permanent_Choice()",-1,50,"FONT_OLD_20_WHITE.TGA",10);
	Info_ClearChoices(info_test_permanent_choice);
	Info_AddChoice(info_test_permanent_choice,"Ладно.",info_test_procedure_permanent_choice_yes);
	Info_AddChoice(info_test_permanent_choice,"А не пошел бы ты...",info_test_procedure_permanent_choice_no);
	Info_AddChoice(info_test_permanent_choice,"Хм...",info_test_procedure_permanent_choice_unsure);
	Info_AddChoice(info_test_permanent_choice,"(уйти)",info_test_procedure_permanent_choice_exit);
};

func void info_test_procedure_permanent_choice_yes()
{
	Info_ClearChoices(info_test_permanent_choice);
};

func void info_test_procedure_permanent_choice_no()
{
	Info_ClearChoices(info_test_permanent_choice);
};

func void info_test_procedure_permanent_choice_unsure()
{
};

func void info_test_procedure_permanent_choice_exit()
{
	Info_ClearChoices(info_test_permanent_choice);
	AI_StopProcessInfos(self);
};


instance INFO_TEST_PERMANENT_IMPORTANT_CHOICE(C_INFO)
{
	npc = allround_testmodell;
	nr = 666;
	condition = info_test_success_permanent_important_choice;
	information = info_test_procedure_permanent_important_choice;
	important = 1;
	permanent = 1;
	description = "Allrounder's Permanent Important Choice Info";
};


func int info_test_success_permanent_important_choice()
{
	return 1;
};

func void info_test_procedure_permanent_important_choice()
{
	PrintScreen("Info_Test_Procedure_Permanent_Important_Choice()",-1,50,"FONT_OLD_20_WHITE.TGA",10);
	Info_ClearChoices(info_test_permanent_important_choice);
	Info_AddChoice(info_test_permanent_important_choice,"Да.",info_test_procedure_permanent_important_choice_yes);
	Info_AddChoice(info_test_permanent_important_choice,"Нет.",info_test_procedure_permanent_important_choice_no);
	Info_AddChoice(info_test_permanent_important_choice,"Не знаю.",info_test_procedure_permanent_important_choice_unsure);
	Info_AddChoice(info_test_permanent_important_choice,"Пока.",info_test_procedure_permanent_important_choice_exit);
};

func void info_test_procedure_permanent_important_choice_yes()
{
	Info_ClearChoices(info_test_permanent_important_choice);
};

func void info_test_procedure_permanent_important_choice_no()
{
	Info_ClearChoices(info_test_permanent_important_choice);
};

func void info_test_procedure_permanent_important_choice_unsure()
{
};

func void info_test_procedure_permanent_important_choice_exit()
{
	Info_ClearChoices(info_test_permanent_important_choice);
	AI_StopProcessInfos(self);
};

