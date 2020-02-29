
instance THORUS_SCHWERT(C_ITEM)
{
	name = "Меч Торуса";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 500;
	damagetotal = 90;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 75;
	owner = grd_200_thorus;
	visual = "ItMw_2H_Sword_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance INNOS_ZORN(C_ITEM)
{
	name = "Гнев Инноса";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 570;
	damagetotal = 110;
	damagetype = DAM_EDGE;
	range = 160;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	owner = ebr_100_gomez;
	visual = "ItMw_2H_Sword_Heavy_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance SCARS_SCHWERT(C_ITEM)
{
	name = "Меч Шрама";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 460;
	damagetotal = 85;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	owner = ebr_101_scar;
	visual = "ItMw_1H_Sword_Bastard_04.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
	count[5] = value;
};

instance ARTOS_SCHWERT(C_ITEM)
{
	name = "Меч Арто";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 360;
	damagetotal = 65;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	owner = ebr_102_arto;
	visual = "ItMw_1H_Sword_Long_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance RABENRECHT(C_ITEM)
{
	name = "Мудрость ворона";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 400;
	damagetotal = 70;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 55;
	owner = ebr_105_raven;
	visual = "ItMw_1H_Sword_Broad_04.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance PRANKENHIEB(C_ITEM)
{
	name = "Коготь глорха";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 300;
	damagetotal = 55;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	owner = ebr_106_bartholo;
	visual = "ItMw_1H_Sword_Long_05.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance DIEGOS_BOGEN(C_ITEM)
{
	name = "Лук Диего";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 390;
	damagetotal = 70;
	damagetype = DAM_POINT;
	munition = itamarrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 45;
	owner = pc_thief;
	visual = "ItRwLongbow.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance WHISTLERS_SCHWERT(C_ITEM)
{
	name = "Меч Уистлера";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 110;
	damagetotal = 20;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 15;
	visual = "ItMw_1H_Sword_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance STAB_DES_LICHTS(C_ITEM)
{
	name = "Посох света";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 350;
	damagetotal = 65;
	damagetype = DAM_BLUNT;
	range = 160;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 45;
	owner = gur_1200_yberion;
	visual = "ItMw_2H_Staff_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance KALOMS_SCHWERT(C_ITEM)
{
	name = "Меч Галома";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 400;
	damagetotal = 70;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 55;
	owner = gur_1201_corkalom;
	visual = "ItMw_1H_Sword_05.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance STREITSCHLICHTER(C_ITEM)
{
	name = "Судья Лестера";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = 340;
	damagetotal = 60;
	damagetype = DAM_BLUNT;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	owner = pc_psionic;
	visual = "ItMw_1H_Mace_War_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ROTER_WIND(C_ITEM)
{
	name = "Красный ветер";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 570;
	damagetotal = 105;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	owner = gur_1202_corangar;
	visual = "ItMw_2H_Sword_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance NAMIBS_KEULE(C_ITEM)
{
	name = "Дубина Намиба";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = 300;
	damagetotal = 55;
	damagetype = DAM_BLUNT;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	owner = gur_1204_baalnamib;
	visual = "ItMw_1H_Mace_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ORUNS_KEULE(C_ITEM)
{
	name = "Дубина Орана";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = 330;
	damagetotal = 60;
	damagetype = DAM_BLUNT;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	owner = gur_1209_baalorun;
	visual = "ItMw_1H_Mace_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance FORTUNOS_KEULE(C_ITEM)
{
	name = "Дубина Фортун";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = 110;
	damagetotal = 20;
	damagetype = DAM_BLUNT;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 15;
	owner = nov_1357_fortuno;
	visual = "ItMw_1H_Mace_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance LEES_AXT(C_ITEM)
{
	name = "Топор Ли";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = 560;
	damagetotal = 105;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 95;
	owner = sld_700_lee;
	visual = "ItMw_2H_Axe_Heavy_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ORIKS_AXT(C_ITEM)
{
	name = "Топор Орикса";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = 540;
	damagetotal = 95;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	owner = sld_701_orik;
	visual = "ItMw_2H_Axe_Heavy_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance TORLOFS_AXT(C_ITEM)
{
	name = "Топор Торлофа";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = 550;
	damagetotal = 99;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 85;
	owner = sld_737_torlof;
	visual = "ItMw_2H_Axe_Heavy_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance CORDS_SPALTER(C_ITEM)
{
	name = "Раскольник Корда";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = 310;
	damagetotal = 60;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	owner = sld_709_cord;
	visual = "ItMw_1H_Axe_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance GORNS_RACHE(C_ITEM)
{
	name = "Месть Горна";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = 560;
	damagetotal = 100;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	owner = pc_fighter;
	visual = "ItMw_2H_Axe_Heavy_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance LARES_AXT(C_ITEM)
{
	name = "Топор Ларса";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = 340;
	damagetotal = 65;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 45;
	owner = org_801_lares;
	visual = "ItMw_1H_Axe_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance WOLFS_BOGEN(C_ITEM)
{
	name = "Лук Волка";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 200;
	damagetotal = 35;
	damagetype = DAM_POINT;
	munition = itamarrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 35;
	owner = org_855_wolf;
	visual = "ItRwLongbow.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance SILAS_AXT(C_ITEM)
{
	name = "Топор Силаса";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = 290;
	damagetotal = 55;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	owner = org_841_silas;
	visual = "ItMw_1H_Axe_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance HEERSCHERSTAB(C_ITEM)
{
	name = "Посох Мастера";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 150;
	damagetotal = 26;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	owner = bau_900_ricelord;
	visual = "ItMw_2H_Staff_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

