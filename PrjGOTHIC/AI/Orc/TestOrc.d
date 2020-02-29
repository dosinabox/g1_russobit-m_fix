
prototype ORC_TESTTYPE(C_NPC)
{
	name[0] = "Orc Prototype";
	guild = GIL_NONE;
	level = 1;
	attribute[ATR_STRENGTH] = 8;
	attribute[ATR_DEXTERITY] = 8;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	attribute[ATR_HITPOINTS_MAX] = 90;
	attribute[ATR_HITPOINTS] = 90;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 2000;
};

instance ORC01(ORC_TESTTYPE)
{
	name[0] = "Orc_01";
	guild = GIL_ORCWARRIOR;
	npctype = NPCTYPE_MAIN;
	level = 10;
	voice = 6;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 99;
	attribute[ATR_HITPOINTS] = 99;
	Mdl_SetVisual(self,"orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"Orc_Head",DEFAULT,DEFAULT,-1);
	b_scale(self);
	CreateInvItem(self,itmw2horcaxe04);
	EquipItem(self,itmw2horcaxe04);
	fight_tactic = FAI_ORC;
	daily_routine = rtn_orc01;
};

instance ORC02(ORC_TESTTYPE)
{
	name[0] = "Orc_02";
	guild = GIL_ORCWARRIOR;
	level = 10;
	voice = 6;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 99;
	attribute[ATR_HITPOINTS] = 99;
	Mdl_SetVisual(self,"orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"Orc_Head",DEFAULT,DEFAULT,-1);
	b_scale(self);
	CreateInvItem(self,itmw2horcaxe04);
	EquipItem(self,itmw2horcaxe04);
	fight_tactic = FAI_ORC;
	daily_routine = rtn_orc02;
};

instance ORC03(ORC_TESTTYPE)
{
	name[0] = "Orc_03";
	guild = GIL_ORCWARRIOR;
	level = 10;
	voice = 6;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 99;
	attribute[ATR_HITPOINTS] = 99;
	Mdl_SetVisual(self,"orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"Orc_Head",DEFAULT,DEFAULT,-1);
	b_scale(self);
	CreateInvItem(self,itmw2horcaxe04);
	EquipItem(self,itmw2horcaxe04);
	fight_tactic = FAI_ORC;
	daily_routine = rtn_orc03;
};

instance ORC04(ORC_TESTTYPE)
{
	name[0] = "Orc_04";
	guild = GIL_ORCWARRIOR;
	level = 10;
	voice = 6;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 99;
	attribute[ATR_HITPOINTS] = 99;
	Mdl_SetVisual(self,"orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"Orc_Head",DEFAULT,DEFAULT,-1);
	b_scale(self);
	CreateInvItem(self,itmw2horcaxe04);
	EquipItem(self,itmw2horcaxe04);
	fight_tactic = FAI_ORC;
	daily_routine = rtn_orc04;
};

instance ORC05(ORC_TESTTYPE)
{
	name[0] = "Orc_05";
	guild = GIL_ORCWARRIOR;
	level = 10;
	voice = 6;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 99;
	attribute[ATR_HITPOINTS] = 99;
	Mdl_SetVisual(self,"orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"Orc_Head",DEFAULT,DEFAULT,-1);
	b_scale(self);
	CreateInvItem(self,itmw2horcaxe04);
	EquipItem(self,itmw2horcaxe04);
	fight_tactic = FAI_ORC;
	daily_routine = rtn_orc05;
};

instance ORC06(ORC_TESTTYPE)
{
	name[0] = "Orc_06";
	guild = GIL_ORCWARRIOR;
	level = 10;
	voice = 6;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 99;
	attribute[ATR_HITPOINTS] = 99;
	Mdl_SetVisual(self,"orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"Orc_Head",DEFAULT,DEFAULT,-1);
	b_scale(self);
	CreateInvItem(self,itmw2horcaxe04);
	EquipItem(self,itmw2horcaxe04);
	fight_tactic = FAI_ORC;
	daily_routine = rtn_orc06;
};

instance ORC07(ORC_TESTTYPE)
{
	name[0] = "Orc_07";
	guild = GIL_ORCWARRIOR;
	level = 10;
	voice = 6;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 99;
	attribute[ATR_HITPOINTS] = 99;
	Mdl_SetVisual(self,"orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"Orc_Head",DEFAULT,DEFAULT,-1);
	b_scale(self);
	CreateInvItem(self,itmw2horcaxe04);
	EquipItem(self,itmw2horcaxe04);
	fight_tactic = FAI_ORC;
	daily_routine = rtn_orc07;
};

instance ORC08(ORC_TESTTYPE)
{
	name[0] = "Orc_08";
	guild = GIL_ORCWARRIOR;
	level = 10;
	voice = 6;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 99;
	attribute[ATR_HITPOINTS] = 99;
	Mdl_SetVisual(self,"orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"Orc_Head",DEFAULT,DEFAULT,-1);
	b_scale(self);
	CreateInvItem(self,itmw2horcaxe04);
	EquipItem(self,itmw2horcaxe04);
	fight_tactic = FAI_ORC;
	daily_routine = rtn_orc08;
};

instance ORC09(ORC_TESTTYPE)
{
	name[0] = "Orc_09";
	guild = GIL_ORCWARRIOR;
	npctype = NPCTYPE_GUARD;
	level = 10;
	voice = 6;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 99;
	attribute[ATR_HITPOINTS] = 99;
	Mdl_SetVisual(self,"orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"Orc_Head",DEFAULT,DEFAULT,-1);
	b_scale(self);
	CreateInvItem(self,itmw2horcaxe04);
	EquipItem(self,itmw2horcaxe04);
	fight_tactic = FAI_ORC;
	daily_routine = rtn_orc09;
};

instance ORC10(ORC_TESTTYPE)
{
	name[0] = "Orc_10";
	guild = GIL_ORCWARRIOR;
	npctype = NPCTYPE_GUARD;
	level = 10;
	voice = 6;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 99;
	attribute[ATR_HITPOINTS] = 99;
	Mdl_SetVisual(self,"orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"Orc_Head",DEFAULT,DEFAULT,-1);
	b_scale(self);
	CreateInvItem(self,itmw2horcaxe04);
	EquipItem(self,itmw2horcaxe04);
	fight_tactic = FAI_ORC;
	daily_routine = rtn_orc10;
};

instance ORC11(ORC_TESTTYPE)
{
	name[0] = "Orc_11";
	guild = GIL_ORCWARRIOR;
	npctype = NPCTYPE_GUARD;
	level = 10;
	voice = 6;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 99;
	attribute[ATR_HITPOINTS] = 99;
	Mdl_SetVisual(self,"orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"Orc_Head",DEFAULT,DEFAULT,-1);
	b_scale(self);
	CreateInvItem(self,itmw2horcaxe04);
	EquipItem(self,itmw2horcaxe04);
	CreateInvItem(self,itmialarmhorn);
	fight_tactic = FAI_ORC;
	daily_routine = rtn_orc11;
};

instance ORC12(ORC_TESTTYPE)
{
	name[0] = "Orc_12";
	guild = GIL_ORCWARRIOR;
	npctype = NPCTYPE_GUARD;
	level = 10;
	voice = 6;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 99;
	attribute[ATR_MANA] = 99;
	attribute[ATR_HITPOINTS_MAX] = 99;
	attribute[ATR_HITPOINTS] = 99;
	Mdl_SetVisual(self,"orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"Orc_Head",DEFAULT,DEFAULT,-1);
	b_scale(self);
	CreateInvItem(self,itmw2horcaxe04);
	EquipItem(self,itmw2horcaxe04);
	CreateInvItem(self,itarrunelight);
	CreateInvItem(self,itarruneheal);
	CreateInvItem(self,itarrunechainlightning);
	CreateInvItem(self,itarruneicewave);
	CreateInvItem(self,itarrunethunderball);
	fight_tactic = FAI_ORC;
	start_aistate = zs_orc_guard;
};


func void rtn_orc01()
{
	ta_orc_eatanddrink(23,0,12,0,"OW_ORC_PATH_04");
	ta_orc_eatanddrink(12,0,23,0,"OW_ORC_PATH_04");
};

func void rtn_orc02()
{
	ta_orc_sitonfloor(23,0,12,0,"OW_ORC_HUT_02");
	ta_orc_sitonfloor(12,0,23,0,"OW_ORC_HUT_02");
};

func void rtn_orc03()
{
	ta_orc_sitonfloor(23,0,12,0,"OW_ORC_HUT_01");
	ta_orc_sitonfloor(12,0,23,0,"OW_ORC_HUT_01");
};

func void rtn_orc04()
{
	ta_orc_eat(23,0,12,0,"OW_ORC_PLACE_01");
	ta_orc_eat(12,0,23,0,"OW_ORC_PLACE_01");
};

func void rtn_orc05()
{
	ta_orc_drinkalcohol(23,0,12,0,"OW_ORC_PLACE_01");
	ta_orc_drinkalcohol(12,0,23,0,"OW_ORC_PLACE_01");
};

func void rtn_orc06()
{
	ta_orc_walkaround(23,0,12,0,"OW_ORC_PATH_03");
	ta_orc_walkaround(12,0,23,0,"OW_ORC_PATH_03");
};

func void rtn_orc07()
{
	ta_orc_speech(23,0,12,0,"ORC_PLACE_02");
	ta_orc_speech(12,0,23,0,"ORC_PLACE_02");
};

func void rtn_orc08()
{
	ta_orc_eatanddrink(23,0,12,0,"OW_ORC_PLACE_01");
	ta_orc_eatanddrink(12,0,23,0,"OW_ORC_PLACE_01");
};

func void rtn_orc09()
{
	ta_orc_guardsleepy(23,0,12,0,"ORC_GUARD_SLEEP");
	ta_orc_guardsleepy(12,0,23,0,"ORC_GUARD_SLEEP");
};

func void rtn_orc10()
{
	ta_orc_guardsleepy(23,0,12,0,"ORC_GUARD_SLEEP");
	ta_orc_guardsleepy(12,0,23,0,"ORC_GUARD_SLEEP");
};

func void rtn_orc11()
{
	ta_orc_guard(23,0,12,0,"OW_ORC_BRIDGE_GUARD");
	ta_orc_guard(12,0,23,0,"OW_ORC_BRIDGE_GUARD");
};

func void rtn_orc12()
{
	ta_orc_guard(23,0,12,0,"ORC_BRIDGE_02");
	ta_orc_guard(12,0,23,0,"ORC_BRIDGE_02");
};

func void startup_world_orcs()
{
	b_initorcattitudes(3);
	Wld_InsertNpc(orc11,"OW_ORC_BRIDGE_GUARD");
	Wld_InsertNpc(orc12,"ORC_BRIDGE_02");
};

