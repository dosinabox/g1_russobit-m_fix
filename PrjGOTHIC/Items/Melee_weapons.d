
const int VALUE_1H_SWORD_01 = 100;

instance ITMW_1H_CLUB_01(C_ITEM)
{
	name = "Дубина";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = 2;
	damagetotal = 5;
	damagetype = DAM_BLUNT;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Club_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_POKER_01(C_ITEM)
{
	name = "Скребок";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 3;
	damagetotal = 6;
	damagetype = DAM_BLUNT;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Poker_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SICKLE_01(C_ITEM)
{
	name = "Серп";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = 4;
	damagetotal = 7;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Sickle_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMWPICKAXE(C_ITEM)
{
	name = "Кирка";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	value = 4;
	damagetotal = 7;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_2H_Pickaxe_01.3DS";
	material = MAT_WOOD;
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SLEDGEHAMMER_01(C_ITEM)
{
	name = "Молот";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = 5;
	damagetotal = 10;
	damagetype = DAM_BLUNT;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Sledgehammer_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_MACE_LIGHT_01(C_ITEM)
{
	name = "Дубина";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = 5;
	damagetotal = 8;
	damagetype = DAM_BLUNT;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Mace_Light_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_HATCHET_01(C_ITEM)
{
	name = "Топор";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = 6;
	damagetotal = 9;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Hatchet_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SWORD_OLD_01(C_ITEM)
{
	name = "Ржавый меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 10;
	damagetotal = 10;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Sword_Old_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_NAILMACE_01(C_ITEM)
{
	name = "Булава с гвоздями";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = 13;
	damagetotal = 11;
	damagetype = DAM_BLUNT;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Nailmace_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SWORD_SHORT_01(C_ITEM)
{
	name = "Короткий меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 44;
	damagetotal = 12;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 6;
	visual = "ItMw_1H_Sword_Short_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SWORD_SHORT_02(C_ITEM)
{
	name = "Защитник крестьянина";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 64;
	damagetotal = 14;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 7;
	visual = "ItMw_1H_Sword_Short_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SWORD_SHORT_03(C_ITEM)
{
	name = "Укус шныга";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 88;
	damagetotal = 16;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 8;
	visual = "ItMw_1H_Sword_Short_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SWORD_SHORT_04(C_ITEM)
{
	name = "Шип ранений";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 120;
	damagetotal = 18;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 9;
	visual = "ItMw_1H_Sword_Short_04.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SWORD_SHORT_05(C_ITEM)
{
	name = "Смирение рудокопа";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 160;
	damagetotal = 20;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	visual = "ItMw_1H_Sword_Short_05.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_AXE_OLD_01(C_ITEM)
{
	name = "Старый топор";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = 19;
	damagetotal = 13;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 7;
	visual = "ItMw_1H_Axe_Old_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SCYTHE_01(C_ITEM)
{
	name = "Косарь";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = 25;
	damagetotal = 15;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 8;
	visual = "ItMw_1H_Scythe_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_STAFF_01(C_ITEM)
{
	name = "Боевой посох";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 62;
	damagetotal = 17;
	damagetype = DAM_BLUNT;
	range = 160;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 9;
	visual = "ItMw_2H_Staff_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_STAFF_02(C_ITEM)
{
	name = "Хороший посох";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 72;
	damagetotal = 19;
	damagetype = DAM_EDGE;
	range = 160;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
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

instance ITMW_2H_STAFF_03(C_ITEM)
{
	name = "Посох жреца";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 90;
	damagetotal = 21;
	damagetype = DAM_BLUNT;
	range = 160;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
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

instance ITMW_1H_LIGHTGUARDSSWORD_03(C_ITEM)
{
	name = "Легкий меч стражника";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 75;
	damagetotal = 22;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	visual = "ItMw_1H_Sword_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_MACE_01(C_ITEM)
{
	name = "Тяжелая булава";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = 55;
	damagetotal = 23;
	damagetype = DAM_BLUNT;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
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

instance ITMW_1H_MACE_02(C_ITEM)
{
	name = "Булава с шипами";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = 65;
	damagetotal = 25;
	damagetype = DAM_BLUNT;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 11;
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

instance ITMW_1H_MACE_03(C_ITEM)
{
	name = "Жало шершня";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = 75;
	damagetotal = 26;
	damagetype = DAM_BLUNT;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 11;
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

instance ITMW_1H_MACE_04(C_ITEM)
{
	name = "Стальной язык";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = 85;
	damagetotal = 29;
	damagetype = DAM_BLUNT;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 11;
	visual = "ItMw_1H_Mace_04.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SWORD_01(C_ITEM)
{
	name = "Незаточенный меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_1H_SWORD_01;
	damagetotal = 20;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	visual = "ItMw_1H_Sword_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SWORD_02(C_ITEM)
{
	name = "Хороший меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 97;
	damagetotal = 30;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 12;
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

instance ITMW_1H_SWORD_03(C_ITEM)
{
	name = "Меч стражника";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 104;
	damagetotal = 32;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 12;
	visual = "ItMw_1H_Sword_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SWORD_04(C_ITEM)
{
	name = "Боевой меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 111;
	damagetotal = 33;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 13;
	visual = "ItMw_1H_Sword_04.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SWORD_05(C_ITEM)
{
	name = "Военный меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 472;
	damagetotal = 34;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 14;
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

instance ITMW_1H_MACE_WAR_01(C_ITEM)
{
	name = "Моргенштерн";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = 125;
	damagetotal = 35;
	damagetype = DAM_BLUNT;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 14;
	visual = "ItMw_1H_Mace_War_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_MACE_WAR_02(C_ITEM)
{
	name = "Стальное жало";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = 132;
	damagetotal = 36;
	damagetype = DAM_BLUNT;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 15;
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

instance ITMW_1H_MACE_WAR_03(C_ITEM)
{
	name = "Камнелом";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = 139;
	damagetotal = 37;
	damagetype = DAM_BLUNT;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 26;
	visual = "ItMw_1H_Mace_War_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_MACE_WAR_04(C_ITEM)
{
	name = "Пронзающий сердца";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = 600;
	damagetotal = 39;
	damagetype = DAM_BLUNT;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 17;
	visual = "ItMw_1H_Mace_War_04.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SWORD_LONG_01(C_ITEM)
{
	name = "Длинный меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 640;
	damagetotal = 40;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 17;
	visual = "ItMw_1H_Sword_Long_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SWORD_LONG_02(C_ITEM)
{
	name = "Сеющий страх";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 680;
	damagetotal = 42;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 18;
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

instance ITMW_1H_SWORD_LONG_03(C_ITEM)
{
	name = "Сеющий ненависть";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 800;
	damagetotal = 44;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 18;
	visual = "ItMw_1H_Sword_Long_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SWORD_LONG_04(C_ITEM)
{
	name = "Победоносный";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 860;
	damagetotal = 46;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	visual = "ItMw_1H_Sword_Long_04.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SWORD_LONG_05(C_ITEM)
{
	name = "Несущий смерть";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 920;
	damagetotal = 48;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 21;
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

instance ITMW_1H_WARHAMMER_01(C_ITEM)
{
	name = "Молот орков";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = 1000;
	damagetotal = 50;
	damagetype = DAM_BLUNT;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 22;
	visual = "ItMw_1H_Warhammer_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_WARHAMMER_02(C_ITEM)
{
	name = "Военный молот";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = 1040;
	damagetotal = 51;
	damagetype = DAM_BLUNT;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 23;
	visual = "ItMw_1H_Warhammer_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_WARHAMMER_03(C_ITEM)
{
	name = "Молот богов";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = 1080;
	damagetotal = 52;
	damagetype = DAM_BLUNT;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 23;
	visual = "ItMw_1H_Warhammer_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_AXE_01(C_ITEM)
{
	name = "Топор";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = 320;
	damagetotal = 29;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 12;
	visual = "ItMw_1H_Axe_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_AXE_02(C_ITEM)
{
	name = "Череполом";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = 1020;
	damagetotal = 53;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 24;
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

instance ITMW_1H_AXE_03(C_ITEM)
{
	name = "Беспощадный";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = 1160;
	damagetotal = 54;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
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

instance ITMW_1H_SWORD_BROAD_01(C_ITEM)
{
	name = "Широкий меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 1240;
	damagetotal = 55;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 26;
	visual = "ItMw_1H_Sword_Broad_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SWORD_BROAD_02(C_ITEM)
{
	name = "Смертельный приговор";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 1300;
	damagetotal = 57;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 27;
	visual = "ItMw_1H_Sword_Broad_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SWORD_BROAD_03(C_ITEM)
{
	name = "Шепот смерти";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 1360;
	damagetotal = 58;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 28;
	visual = "ItMw_1H_Sword_Broad_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SWORD_BROAD_04(C_ITEM)
{
	name = "Кулак бойца";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 1400;
	damagetotal = 59;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 29;
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

instance ITMW_2H_SWORD_OLD_01(C_ITEM)
{
	name = "Ржавый двуручный меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 1480;
	damagetotal = 61;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_Sword_Old_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SWORD_BASTARD_01(C_ITEM)
{
	name = "Ржавый меч-бастард";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 200;
	damagetotal = 45;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 31;
	visual = "ItMw_1H_Sword_Bastard_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SWORD_BASTARD_02(C_ITEM)
{
	name = "Убийца";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 1660;
	damagetotal = 64;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 32;
	visual = "ItMw_1H_Sword_Bastard_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SWORD_BASTARD_03(C_ITEM)
{
	name = "Исполнитель";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 1720;
	damagetotal = 65;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 33;
	visual = "ItMw_1H_Sword_Bastard_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SWORD_BASTARD_04(C_ITEM)
{
	name = "Удар ярости";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 1760;
	damagetotal = 66;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 35;
	visual = "ItMw_1H_Sword_Bastard_04.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_AXE_OLD_01(C_ITEM)
{
	name = "Старый боевой топор";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 1800;
	damagetotal = 67;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 36;
	visual = "ItMw_2H_Axe_Old_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_AXE_OLD_02(C_ITEM)
{
	name = "Кровопийца";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 1840;
	damagetotal = 68;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 38;
	visual = "ItMw_2H_Axe_Old_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_AXE_OLD_03(C_ITEM)
{
	name = "Старый судейский топор";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 1880;
	damagetotal = 69;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_2H_Axe_Old_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_SWORD_LIGHT_01(C_ITEM)
{
	name = "Легкий двуручный меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 1900;
	damagetotal = 70;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 42;
	visual = "ItMw_2H_Sword_Light_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_SWORD_LIGHT_02(C_ITEM)
{
	name = "Хранитель";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 1950;
	damagetotal = 71;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 44;
	visual = "ItMw_2H_Sword_Light_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_SWORD_LIGHT_03(C_ITEM)
{
	name = "Солдатский клинок";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 2000;
	damagetotal = 73;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 46;
	visual = "ItMw_2H_Sword_Light_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_SWORD_LIGHT_04(C_ITEM)
{
	name = "Королевский клинок";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 2200;
	damagetotal = 74;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 48;
	visual = "ItMw_2H_Sword_Light_04.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_SWORD_LIGHT_05(C_ITEM)
{
	name = "Клинок демонов";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 2320;
	damagetotal = 76;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	visual = "ItMw_2H_Sword_Light_05.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_AXE_LIGHT_01(C_ITEM)
{
	name = "Легкий боевой топор";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 2400;
	damagetotal = 77;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 52;
	visual = "ItMw_2H_Axe_light_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_AXE_LIGHT_02(C_ITEM)
{
	name = "Удар грома";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 2440;
	damagetotal = 79;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 54;
	visual = "ItMw_2H_Axe_light_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_AXE_LIGHT_03(C_ITEM)
{
	name = "Час расплаты";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 2520;
	damagetotal = 80;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 56;
	visual = "ItMw_2H_Axe_light_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_SWORD_01(C_ITEM)
{
	name = "Двуручный меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 2600;
	damagetotal = 81;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 58;
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

instance ITMW_2H_SWORD_02(C_ITEM)
{
	name = "Отвага героя";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 2760;
	damagetotal = 83;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 60;
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

instance ITMW_2H_SWORD_03(C_ITEM)
{
	name = "Кровавая атака";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 2840;
	damagetotal = 85;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 62;
	visual = "ItMw_2H_Sword_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_SWORD_HEAVY_01(C_ITEM)
{
	name = "Тяжелый двуручный меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 2920;
	damagetotal = 86;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 64;
	visual = "ItMw_2H_Sword_Heavy_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_SWORD_HEAVY_02(C_ITEM)
{
	name = "Стальная ярость";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 3040;
	damagetotal = 88;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 66;
	visual = "ItMw_2H_Sword_Heavy_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_SWORD_HEAVY_03(C_ITEM)
{
	name = "Молниеносный";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 3260;
	damagetotal = 90;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 68;
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

instance ITMW_2H_SWORD_HEAVY_04(C_ITEM)
{
	name = "Месть тролля";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 3440;
	damagetotal = 92;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	visual = "ItMw_2H_Sword_Heavy_04.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_AXE_HEAVY_01(C_ITEM)
{
	name = "Боевой топор";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 3660;
	damagetotal = 94;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 72;
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

instance ITMW_2H_AXE_HEAVY_02(C_ITEM)
{
	name = "Клич воина";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 3860;
	damagetotal = 96;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 74;
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

instance ITMW_2H_AXE_HEAVY_03(C_ITEM)
{
	name = "Кулак варвара";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 4060;
	damagetotal = 98;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 76;
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

instance ITMW_2H_AXE_HEAVY_04(C_ITEM)
{
	name = "Кулак тролля";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 4360;
	damagetotal = 100;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 78;
	visual = "ItMw_2H_Axe_Heavy_04.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW2HORCSWORD01(C_ITEM)
{
	name = "Круш Варрок";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_WOOD;
	value = 30;
	damagetotal = 45;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
	visual = "ItMw_2H_OrcSword_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW2HORCAXE01(C_ITEM)
{
	name = "Круш Пах";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 35;
	damagetotal = 50;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_OrcAxe_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW2HORCAXE02(C_ITEM)
{
	name = "Круш УрРок";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 38;
	damagetotal = 55;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 35;
	visual = "ItMw_2H_OrcAxe_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW2HORCAXE03(C_ITEM)
{
	name = "Круш Агаш";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 40;
	damagetotal = 60;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_2H_OrcAxe_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW2HORCAXE04(C_ITEM)
{
	name = "Круш БрокДар";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 43;
	damagetotal = 65;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 45;
	visual = "ItMw_2H_OrcAxe_04.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW2HORCMACE01(C_ITEM)
{
	name = "Круш Каррок";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 50;
	damagetotal = 75;
	damagetype = DAM_BLUNT;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	visual = "ItMw_2H_OrcMace_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRWORCSTAFF(C_ITEM)
{
	name = "Грахтнакк";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 0;
	damagetotal = 0;
	damagetype = DAM_BLUNT;
	visual = "ItRw_2H_Orcstaff_01.3DS";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRWUDORCSTAFF(C_ITEM)
{
	name = "ШаБаНакк";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 0;
	damagetotal = 0;
	damagetype = DAM_BLUNT;
	visual = "ItRw_2H_Orcstaff_01.3DS";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

