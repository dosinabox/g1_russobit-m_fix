
prototype NPC_TESTDEFAULT(C_NPC)
{
	name[0] = "Прототип";
	guild = GIL_NONE;
	level = 1;
	attribute[ATR_STRENGTH] = 5;
	attribute[ATR_DEXTERITY] = 5;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	attribute[ATR_HITPOINTS_MAX] = 5;
	attribute[ATR_HITPOINTS] = 5;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 4000;
};

instance ATESTMODELL(NPC_TESTDEFAULT)
{
	name[0] = "ATestmodell";
	guild = GIL_BAU;
	level = 10;
	voice = 11;
	id = 3001;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 18;
	attribute[ATR_HITPOINTS] = 18;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald",DEFAULT,DEFAULT,-1);
	Npc_SetAttitude(self,ATT_HOSTILE);
	fight_tactic = FAI_HUMAN_COWARD;
	start_aistate = zs_firespit;
};


func void rtn_start_3001()
{
};


instance BTESTMODELL(NPC_TESTDEFAULT)
{
	name[0] = "BTestmodell";
	guild = GIL_EBR;
	level = 20;
	voice = 11;
	id = 3002;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 30;
	attribute[ATR_HITPOINTS] = 30;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald",DEFAULT,DEFAULT,ebr_armor_h);
	daily_routine = rtn_start_3002;
	fight_tactic = FAI_HUMAN_COWARD;
};


func void rtn_start_3002()
{
};


instance CTESTMODELL(NPC_TESTDEFAULT)
{
	name[0] = "CTestmodell";
	guild = GIL_EBR;
	level = 6;
	voice = 11;
	id = 3003;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 30;
	attribute[ATR_HITPOINTS] = 30;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald",DEFAULT,DEFAULT,ebr_armor_h);
	daily_routine = rtn_start_3003;
	fight_tactic = FAI_HUMAN_COWARD;
};


func void rtn_start_3003()
{
};


instance DTESTMODELL(NPC_TESTDEFAULT)
{
	name[0] = "DTestmodell";
	slot = "Гуру";
	guild = GIL_GUR;
	level = 6;
	voice = 11;
	id = 3004;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 0;
	attribute[ATR_MANA_MAX] = 10;
	attribute[ATR_MANA] = 10;
	attribute[ATR_HITPOINTS_MAX] = 30;
	attribute[ATR_HITPOINTS] = 30;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald",DEFAULT,DEFAULT,gur_armor_h);
	daily_routine = rtn_start_3004;
	fight_tactic = FAI_HUMAN_COWARD;
};


func void rtn_start_3004()
{
	ta_smoke(0,0,1,0,"WP_CAVE_12");
	ta_pickore(1,0,2,0,"WP_ORE");
	ta_sitaround(2,0,3,0,"WP_CHAIR");
	ta_cookforme(3,0,4,0,"WP_PAN");
	ta_ebr_hangaround(4,0,5,0,"WP_THRONE");
	ta_cook(5,0,6,0,"WP_CAULDRON");
	ta_herbalchemy(6,0,7,0,"WP_HERB");
	ta_smith_sharp(7,0,8,0,"WP_BSSHARP");
	ta_sleep(8,0,9,0,"WP_BEDLOW");
	ta_smith_fire(9,0,10,0,"WP_BSFIRE");
	ta_smith_anvil(10,0,11,0,"WP_BSANVIL");
	ta_smith_cool(11,0,12,0,"WP_BSCOOL");
	ta_roastscavenger(12,0,13,0,"WP_CHICKEN");
	ta_readbook(13,0,14,0,"WP_BOOK");
	ta_sleep(14,0,15,0,"WP_BED");
	ta_potionalchemy(15,0,16,0,"WP_LAB");
	ta_pray(16,0,17,0,"WP_IDOL");
	ta_herbalchemy(17,0,18,0,"WP_HERB");
	ta_repairhut(18,0,19,0,"WP_REPAIR");
	ta_standaround(19,0,0,0,"WP_BSANVIL");
};


instance FTESTMODELL(NPC_TESTDEFAULT)
{
	name[0] = "FTestmodell";
	slot = "Стражник";
	guild = GIL_GRD;
	level = 5;
	voice = 11;
	id = 3006;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 0;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 15;
	attribute[ATR_HITPOINTS] = 15;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald",DEFAULT,DEFAULT,grd_armor_m);
	daily_routine = rtn_start_3006;
	fight_tactic = 1;
};


func void rtn_start_3006()
{
	ta_guard(0,0,23,59,"WP_STEALWITNESS_2");
};


instance GTESTMODELL(NPC_TESTDEFAULT)
{
	name[0] = "GTestmodell";
	guild = GIL_KDF;
	level = 6;
	voice = 11;
	id = 3007;
	attribute[ATR_STRENGTH] = 7;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 15;
	attribute[ATR_MANA] = 15;
	attribute[ATR_HITPOINTS_MAX] = 20;
	attribute[ATR_HITPOINTS] = 20;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald",DEFAULT,DEFAULT,kdf_armor_l);
	daily_routine = rtn_start_3007;
	fight_tactic = 1;
};


func void rtn_start_3007()
{
	ta_sitaround(0,0,23,59,"WP_STEALWITNESS_1");
};


instance HTESTMODELL(NPC_TESTDEFAULT)
{
	name[0] = "HTestmodell";
	guild = GIL_KDF;
	level = 6;
	voice = 11;
	id = 3008;
	attribute[ATR_STRENGTH] = 5;
	attribute[ATR_DEXTERITY] = 6;
	attribute[ATR_MANA_MAX] = 15;
	attribute[ATR_MANA] = 15;
	attribute[ATR_HITPOINTS_MAX] = 20;
	attribute[ATR_HITPOINTS] = 20;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald",DEFAULT,DEFAULT,kdf_armor_l);
	daily_routine = rtn_start_3008;
	fight_tactic = 1;
};


func void rtn_start_3008()
{
	ta_sitaround(0,0,23,59,"WP_STEAL_1");
};


instance ITESTMODELL(NPC_TESTDEFAULT)
{
	name[0] = "ITestmodell";
	guild = GIL_EBR;
	level = 3;
	voice = 11;
	id = 3009;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 7;
	attribute[ATR_DEXTERITY] = 11;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 13;
	attribute[ATR_HITPOINTS] = 13;
	Mdl_SetVisual(self,"BABE.MDS");
	Mdl_SetVisualBody(self,"Bab_body_Naked0",DEFAULT,DEFAULT,"Bab_Head_Hair1",DEFAULT,DEFAULT,-1);
	daily_routine = rtn_start_3009;
};


func void rtn_start_3009()
{
	ta_sleep(23,0,4,0,"WP_CHAIRSNBEDS");
	ta_sitaround(4,0,6,0,"WP_REPAIR");
	ta_standaround(6,0,8,0,"WP_IDOL");
	ta_washself(8,0,9,0,"WP_REPAIR");
	ta_babe_sweep(9,0,20,0,"WP_LAB");
	ta_sitaround(20,0,23,0,"WP_IDOL");
};


instance JTESTMODELL(NPC_TESTDEFAULT)
{
	name[0] = "JTestmodell";
	guild = GIL_EBR;
	level = 2;
	voice = 11;
	id = 3010;
	attribute[ATR_STRENGTH] = 6;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	Mdl_SetVisual(self,"Babe.MDS");
	Mdl_SetVisualBody(self,"Bab_body_Naked0",DEFAULT,DEFAULT,"Bab_Head_Hair2",DEFAULT,DEFAULT,-1);
	daily_routine = rtn_start_3010;
};


func void rtn_start_3010()
{
	ta_babe_sweep(0,0,23,59,"WP_HALLYWAY_2");
};


instance SLD1_TESTMODELL(NPC_TESTDEFAULT)
{
	name[0] = "SLD1_Testmodell";
	guild = GIL_VLK;
	level = 4;
	voice = 4;
	id = 1707;
	attribute[ATR_STRENGTH] = 9;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_HITPOINTS_MAX] = 18;
	attribute[ATR_HITPOINTS] = 18;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",51,DEFAULT,vlk_armor_l);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	Wld_AssignRoomToNpc("T2",self);
	Wld_AssignRoomToGuild("T4",GIL_SLD);
	start_aistate = zs_testhangaround;
};


func void rtn_start_sld1_testmodell()
{
	ta_testhangaround(0,0,13,0,"x");
	ta_testhangaround(13,0,0,0,"x");
};


instance SLD2_TESTMODELL(NPC_TESTDEFAULT)
{
	name[0] = "SLD2_Testmodell";
	guild = GIL_SLD;
	level = 3;
	voice = 4;
	id = 2707;
	attribute[ATR_STRENGTH] = 9;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_HITPOINTS_MAX] = 18;
	attribute[ATR_HITPOINTS] = 18;
	attribute[ATR_MANA_MAX] = 10;
	attribute[ATR_MANA] = 10;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",51,DEFAULT,sld_armor_h);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	npc_setpermattitude(self,ATT_FRIENDLY);
	start_aistate = zs_testhangaround;
};


func void rtn_start_sld2_testmodell()
{
	ta_testhangaround(0,0,13,0,"X");
	ta_testhangaround(13,0,0,0,"X");
};


instance SLD3_TESTMODELL(NPC_TESTDEFAULT)
{
	name[0] = "SLD3_Testmodell";
	guild = GIL_SLD;
	level = 3;
	voice = 4;
	id = 3707;
	attribute[ATR_STRENGTH] = 9;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_HITPOINTS_MAX] = 18;
	attribute[ATR_HITPOINTS] = 10;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",51,DEFAULT,sld_armor_h);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = rtn_start_sld3_testmodell;
};


func void rtn_start_sld3_testmodell()
{
	ta_testhangaround(0,0,13,0,"X");
	ta_testhangaround(13,0,0,0,"X");
};


instance GRD1_TESTMODELL(NPC_TESTDEFAULT)
{
	name[0] = "GRD1_Testmodell";
	guild = GIL_GRD;
	level = 3;
	voice = 11;
	id = 1221;
	attribute[ATR_STRENGTH] = 9;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 18;
	attribute[ATR_HITPOINTS] = 18;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"HumanS_Relaxed.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Fighter",1,2,grd_armor_l);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetAttitude(self,ATT_FRIENDLY);
	daily_routine = rtn_start_grd1_testmodell;
};

instance TESTINFO_001_07_700(C_INFO)
{
	npc = grd1_testmodell;
	nr = 1;
	condition = testinfo_001_07_700_condition;
	information = testinfo_001_07_700_info;
	important = 0;
};


func int testinfo_001_07_700_condition()
{
	return 1;
};

func void testinfo_001_07_700_info()
{
	AI_Output(self,other,"Global_001_07_00");	//Эй, новичок!
	AI_Output(self,other,"Global_001_07_01");	//Ну, если ты еще не понял...
	AI_Output(self,other,"Global_001_07_02");	//Здесь, в колонии, есть три больших лагеря.
	AI_Output(self,other,"Global_001_07_03");	//Старый лагерь, Новый лагерь и Лагерь сектантов.
	AI_Output(self,other,"Global_001_07_05");	//Если не хочешь прислуживать Баронам в Старом лагере, приходи к нам.
};

func void rtn_start_grd1_testmodell()
{
	ta_testhangaround(0,0,13,0,"X");
	ta_testhangaround(13,0,0,0,"X");
};


instance GRD1_TESTMODELL_TRADE_01(C_ITEMREACT)
{
	npc = grd1_testmodell;
	trade_item = itforice;
	trade_amount = 1;
	requested_item = itmihammer;
	requested_amount = 1;
	reaction = grd1_testmodell_trade_01_func;
};


func int grd1_testmodell_trade_01_func()
{
	if(grd1_testmodell_trade_01.requested_amount == 1)
	{
		Print("Обмен удался.");
		return 1;
	};
	return 0;
};


instance GRD1_TESTMODELL_TRADE_01_INFO_01(C_INFO)
{
	npc = grd1_testmodell;
	nr = 1;
	condition = grd1_testmodell_trade_01_info_01_condition;
	information = grd1_testmodell_trade_01_info_01_info;
	important = 1;
};


func int grd1_testmodell_trade_01_info_01_condition()
{
	return 1;
};

func void grd1_testmodell_trade_01_info_01_info()
{
	b_say(self,other,"BAU_900_Ricelord01_Trade_01_Info_01_Satz_01");
	Print("Gardisten Info");
	b_say(self,other,"BAU_900_Ricelord01_Trade_01_Info_01_Satz_02");
	b_say(self,other,"BAU_900_Ricelord01_Trade_01_Info_01_Satz_03");
};


instance GRD2_TESTMODELL(NPC_TESTDEFAULT)
{
	name[0] = "GRD2_Testmodell";
	guild = GIL_VLK;
	level = 3;
	voice = 11;
	id = 2221;
	attribute[ATR_STRENGTH] = 9;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 18;
	attribute[ATR_HITPOINTS] = 18;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"HumanS_Relaxed.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Fighter",1,2,vlk_armor_l);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetAttitude(self,ATT_ANGRY);
	daily_routine = rtn_start_grd2_testmodell;
};


func void rtn_start_grd2_testmodell()
{
	ta_testhangaround(0,0,13,0,"X");
	ta_testhangaround(13,0,0,0,"X");
};


instance GRD3_TESTMODELL(NPC_TESTDEFAULT)
{
	name[0] = "GRD3_Testmodell";
	guild = GIL_EBR;
	level = 3;
	voice = 11;
	id = 3221;
	attribute[ATR_STRENGTH] = 9;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 18;
	attribute[ATR_HITPOINTS] = 18;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"HumanS_Relaxed.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Fighter",1,2,ebr_armor_h);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	daily_routine = rtn_start_grd3_testmodell;
};


func void rtn_start_grd3_testmodell()
{
	ta_testhangaround(0,0,13,0,"X");
	ta_testhangaround(13,0,0,0,"X");
};

