
instance PC_HERO(NPC_DEFAULT)
{
	name[0] = "Я";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 0;
	voice = 15;
	id = 0;
	exp = 0;
	exp_next = 500;
	lp = 0;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 5;
	attribute[ATR_MANA] = 5;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
	CreateInvItem(self,itwr_fire_letter_01);
};

instance PC_HERO_L2(NPC_DEFAULT)
{
	name[0] = "Я";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 2;
	voice = 15;
	id = 0;
	exp = 1500;
	exp_next = 3000;
	lp = 0;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 5;
	attribute[ATR_MANA] = 5;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,vlk_armor_l);
	EquipItem(self,herosword20);
	CreateInvItems(self,itamarrow,50);
	EquipItem(self,herosword13);
	EquipItem(self,herobow13);
};

instance PC_HERO_L5(NPC_DEFAULT)
{
	name[0] = "Я";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 5;
	voice = 15;
	id = 0;
	exp = 7500;
	exp_next = 10500;
	lp = 0;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 5;
	attribute[ATR_MANA] = 5;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
	EquipItem(self,herosword25);
	EquipItem(self,herobow13);
	CreateInvItems(self,itamarrow,50);
};

instance PC_HERO_L7(NPC_DEFAULT)
{
	name[0] = "Я";
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORG;
	level = 7;
	voice = 15;
	id = 0;
	exp = 14000;
	exp_next = 18000;
	lp = 0;
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 20;
	attribute[ATR_MANA] = 20;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,org_armor_h);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,1);
	Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_sword_05);
	EquipItem(self,itrw_bow_small_04);
	CreateInvItems(self,itamarrow,100);
	CreateInvItems(self,itminugget,50);
	CreateInvItem(self,itwrworldmap);
	CreateInvItems(self,itkelockpick,30);
	CreateInvItems(self,itlstorch,20);
	CreateInvItems(self,itfo_potion_health_03,20);
	CreateInvItems(self,itfo_potion_mana_03,20);
};

instance PC_HERO_L11(NPC_DEFAULT)
{
	name[0] = "Я";
	npctype = NPCTYPE_MAIN;
	guild = GIL_SLD;
	level = 11;
	voice = 15;
	id = 0;
	exp = 33000;
	exp_next = 39000;
	lp = 0;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 45;
	attribute[ATR_MANA_MAX] = 50;
	attribute[ATR_MANA] = 50;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,sld_armor_h);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,1);
	Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	EquipItem(self,itmw_1h_sword_long_05);
	EquipItem(self,itrw_bow_long_02);
	CreateInvItems(self,itamarrow,100);
	CreateInvItems(self,itminugget,400);
	CreateInvItems(self,itkelockpick,30);
	CreateInvItems(self,itlstorch,20);
};

instance PC_HERO_L13(NPC_DEFAULT)
{
	name[0] = "Я";
	npctype = NPCTYPE_MAIN;
	guild = GIL_SLD;
	level = 13;
	voice = 15;
	id = 0;
	exp = 45500;
	exp_next = 52500;
	lp = 0;
	attribute[ATR_STRENGTH] = 65;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 50;
	attribute[ATR_MANA] = 50;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,sld_armor_h);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKPOCKET,1);
	Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,1);
	Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	EquipItem(self,itmw_1h_sword_broad_01);
	EquipItem(self,itrw_bow_long_04);
	CreateInvItems(self,itamarrow,100);
	CreateInvItems(self,itminugget,400);
	CreateInvItems(self,itkelockpick,50);
	CreateInvItems(self,itlstorch,20);
};

instance HEROSWORD13(C_ITEM)
{
	name = "Изношенный меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 27;
	damage[DAM_INDEX_BARRIER] = 13;
	damagetype = DAM_EDGE;
	range = 100;
	visual = "ItMw1hSwordold01.3DS";
};

instance HEROSWORD20(C_ITEM)
{
	name = "Меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 31;
	damage[DAM_INDEX_BARRIER] = 20;
	damagetype = DAM_EDGE;
	range = 100;
	visual = "ItMw1hSword01.3DS";
};

instance HEROSWORD25(C_ITEM)
{
	name = "Меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 31;
	damage[DAM_INDEX_BARRIER] = 25;
	damagetype = DAM_EDGE;
	range = 100;
	visual = "ItMw1hSword01.3DS";
};

instance HEROBOW13(C_ITEM)
{
	name = "Длинный лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 35;
	damage[DAM_INDEX_BARRIER] = 13;
	damagetype = DAM_POINT;
	munition = itamarrow;
	visual = "ItRwLongbow.mms";
};

instance XP_MAP(C_ITEM)
{
	name = "Карта опыта";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 1000;
	visual = "ItWr_Map_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	text[1] = "Бонус к руде:";
	count[1] = 1000;
	text[2] = "Бонус к очкам обучения:";
	count[2] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = use_xp_map;
};

func void use_xp_map()
{
	CreateInvItems(self,itminugget,1000);
	hero.lp = hero.lp + 10;
	PrintScreen("+1000 кусков руды, +10 очков обучения",-1,-1,"font_old_20_white.tga",3);
};

instance D36TESTBOOK(C_ITEM)
{
	name = "Книга тестов";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 36;
	visual = "ITWR_BOOK_ALCHEMY.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	text[0] = "Gothic Russobit-M Fix";
	text[1] = ConcatStrings(IntToString(FIX_VERSION_START)," версия от 19/02/2021");
	text[2] = ConcatStrings(IntToString(FIX_VERSION_SAVE)," версия в сохранении");
	on_state[0] = use_d36testbook;
};

func void use_d36testbook()
{
	//PrintScreen("тестим...",-1,30,"font_old_20_white.tga",4);
};

instance ALCHEMYKIT(C_ITEM)
{
	name = "Набор юного алхимика";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 36;
	visual = "ITWR_BOOK_ALCHEMY.3ds";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	on_state[0] = use_alchemykit;
};

func void use_alchemykit()
{
	hero.lp = hero.lp + 10;
	CreateInvItem(self,alchemybook);
	CreateInvItem(self,alchemy_hp1);
	CreateInvItem(self,alchemy_hp2);
	CreateInvItem(self,alchemy_hp3);
	CreateInvItem(self,alchemy_hpmax);
	CreateInvItem(self,alchemy_mp1);
	CreateInvItem(self,alchemy_mp2);
	CreateInvItem(self,alchemy_mp3);
	CreateInvItem(self,alchemy_mpmax);
	CreateInvItem(self,alchemy_dex);
	CreateInvItem(self,alchemy_str);
	CreateInvItem(self,alchemy_egg);
	CreateInvItem(self,alchemy_fortuno);
	CreateInvItem(self,alchemy_master);
	CreateInvItem(self,alchemy_joint2);
	CreateInvItem(self,alchemy_joint3);
	CreateInvItem(self,kalomsrecipe);
	CreateInvItems(self,itmiflask,20);
	CreateInvItems(self,itfo_plants_berrys_01,5);
	CreateInvItems(self,itfo_plants_nightshadow_01,5);
	CreateInvItems(self,itfo_plants_herb_01,5);
	CreateInvItems(self,itfo_plants_herb_02,5);
	CreateInvItems(self,itfo_plants_herb_03,5);
	CreateInvItems(self,itfo_plants_seraphis_01,5);
	CreateInvItems(self,itfo_plants_ravenherb_01,5);
	CreateInvItems(self,itfo_plants_stoneroot_01,5);
	CreateInvItems(self,itfo_plants_mountainmoos_01,5);
	CreateInvItems(self,itfo_plants_mushroom_01,5);
	CreateInvItems(self,itfo_plants_nightshadow_02,5);
	CreateInvItems(self,itfo_plants_orcherb_02,5);
	CreateInvItems(self,itfo_plants_mountainmoos_02,5);
	CreateInvItems(self,itfo_plants_trollberrys_01,5);
	CreateInvItems(self,itfo_plants_ravenherb_02,5);
	CreateInvItems(self,itfo_plants_stoneroot_02,5);
	CreateInvItems(self,itfo_plants_flameberry_01,5);
	CreateInvItems(self,itat_crawlerqueen,9);
	CreateInvItems(self,itmi_plants_swampherb_01,18);
	CreateInvItems(self,itmi_alchemy_alcohol_01,5);
	CreateInvItems(self,itfo_plants_bloodwood_01,5);
	CreateInvItems(self,itfo_plants_deadleaf,5);
};

instance FIX(C_ITEM)
{
	name = "Лекарство от бага";
	mainflag = ITEM_KAT_POTIONS;
	flags = 0;
	value = 36;
	visual = "ItMiFlask.3ds";
	material = MAT_GLAS;
	scemename = "POTIONFAST";
	on_state[0] = use_fix;
};

func void use_fix()
{
	Npc_SetTalentSkill(hero,NPC_TALENT_REGENERATE,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_FIREMASTER,0);
};

