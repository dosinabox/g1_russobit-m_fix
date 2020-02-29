
instance ITWRTEMPLEMAP(C_ITEM)
{
	name = "Карта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 30;
	visual = "ItWrTempleMap.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = usetemplemap;
	description = "Схема храма";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void usetemplemap()
{
	var int ndocid;
	ndocid = Doc_CreateMap();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Map_Temple.tga",1);
	Doc_Show(ndocid);
};


instance ITMIALARMHORN(C_ITEM)
{
	name = "Рог";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 9;
	visual = "ItMi_Alarmhorn_01.3DS";
	material = MAT_WOOD;
	scemename = "HORN";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_STUFF_IDOL_SLEEPER_01(C_ITEM)
{
	name = "Статуэтка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Stuff_Idol_Sleeper_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[0] = "Статуэтка какого-то бесформенного существа";
	text[1] = "в маске с шестью большими шипами.";
};

instance WELTENSPALTER(C_ITEM)
{
	name = "Раскалывающий миры";
	//mainflag = ITEM_KAT_NONE;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damagetotal = 50;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	mag_circle = 7;
	text[0] = "Это меч бессмертного";
	text[1] = "орка-жреца Варраг-Хашора.";
	text[2] = "Меч был испорчен временем";
	text[3] = "и стал непригоден!";
	text[4] = "Быть может, его можно использовать";
	text[5] = "как-то иначе.";
};

instance LICHTBRINGER(C_ITEM)
{
	name = "Несущий свет";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damagetotal = 50;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	mag_circle = 7;
	text[0] = "Это меч бессмертного";
	text[1] = "орка-жреца Варраг-Казорга.";
	text[2] = "Меч был испорчен временем";
	text[3] = "и стал непригоден!";
	text[4] = "Быть может, его можно использовать";
	text[5] = "как-то иначе.";
};

instance ZEITENKLINGE(C_ITEM)
{
	name = "Клинок времен";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damagetotal = 50;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	mag_circle = 7;
	text[0] = "Это меч бессмертного";
	text[1] = "орка-жреца Варраг-Унхилькта.";
	text[2] = "Меч был испорчен временем";
	text[3] = "и стал непригоден!";
	text[4] = "Быть может, его можно использовать";
	text[5] = "как-то иначе.";
};

instance DAEMONENSTREICH(C_ITEM)
{
	name = "Удар демона";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damagetotal = 50;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	mag_circle = 7;
	text[0] = "Это меч бессмертного";
	text[1] = "орка-жреца Варраг-Руушка.";
	text[2] = "Меч был испорчен временем";
	text[3] = "и стал непригоден!";
	text[4] = "Быть может, его можно использовать";
	text[5] = "как-то иначе.";
};

instance BANNKLINGE(C_ITEM)
{
	name = "Клинок проклятий";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damagetotal = 50;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	mag_circle = 7;
	text[0] = "Это меч бессмертного";
	text[1] = "орка-жреца Граш-Варраг-Арушата.";
	text[2] = "Меч был испорчен временем";
	text[3] = "и стал непригоден!";
	text[4] = "Быть может, его можно использовать";
	text[5] = "как-то иначе.";
};

instance MYTHRILKLINGE(C_ITEM)
{
	name = "Необычный меч";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damagetotal = 10;
	damagetype = DAM_EDGE;
	range = 160;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_Sword_Sleeper_01.3DS";
	description = name;
	text[0] = "Очень красивый меч.";
	text[1] = "На клинке выгравированы древние руны.";
	text[2] = "Может быть, Ксардас сможет их прочитать!";
	text[3] = "Лучше я сначала узнаю, что это за оружие,";
	text[4] = "а пока буду носить его с собой.";
};

instance MYTHRILKLINGE01(C_ITEM)
{
	name = "УРИЗЕЛЬ";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10000;
	damagetotal = 90;
	damagetype = DAM_EDGE;
	range = 180;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_Sword_Sleeper_01.3DS";
	description = name;
	text[0] = "Этот древний меч называется УРИЗЕЛЬ.";
	text[1] = "Раньше он обладал огромной силой,";
	text[2] = "но она была утеряна.";
	text[3] = NAME_DAMAGE;
	count[3] = damagetotal;
	text[4] = NAME_STR_NEEDED;
	count[4] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance MYTHRILKLINGE02(C_ITEM)
{
	name = "УРИЗЕЛЬ";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10000;
	damagetype = DAM_FIRE | DAM_MAGIC;
	damage[DAM_INDEX_FIRE] = 30;
	damage[DAM_INDEX_MAGIC] = 120;
	range = 180;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_Sword_Sleeper_02.3DS";
	description = name;
	text[0] = "Это меч УРИЗЕЛЬ, заряженный";
	text[1] = "энергией магической руды.";
	text[2] = NAME_DAM_MAGIC;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = NAME_DAM_FIRE;
	count[3] = damage[DAM_INDEX_FIRE];
	text[4] = NAME_STR_NEEDED;
	count[4] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance MYTHRILKLINGE03(C_ITEM)
{
	name = "УРИЗЕЛЬ";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 8000;
	damagetotal = 90;
	damagetype = DAM_EDGE;
	range = 180;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_Sword_Sleeper_01.3DS";
	description = name;
	text[0] = "Магический драгоценный камень был";
	text[1] = "изъят. Меч все еще очень хорош,";
	text[2] = "но теперь не обладает магической силой.";
	text[3] = NAME_DAMAGE;
	count[3] = damagetotal;
	text[4] = NAME_STR_NEEDED;
	count[4] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance DEMOURIZEL(C_ITEM)
{
	name = "УРИЗЕЛЬ";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 1;
	damagetotal = 115;
	damagetype = DAM_EDGE;
	range = 0;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 1;
	visual = "ItMw_2H_Sword_Sleeper_01.3DS";
	description = name;
};

instance SCROLL4MILTEN(C_ITEM)
{
	name = "Перенос энергии";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 15;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Заклинание переноса энергии на меч.";
	text[1] = "Я не могу его использовать.";
};

instance ITKE_SUNKENTOWER(C_ITEM)
{
	name = "Ключ Ксардаса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Открывает сундуки";
	text[1] = "в затонувшей башне.";
};

instance DUNGEONKEY(C_ITEM)
{
	name = "Ключ от подземелья";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Открывает тюремные камеры";
	text[1] = "в Старом лагере.";
};

instance ITARRUNE_6_6_URIZIELRUNE(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10000;
	visual = "ItAr_Rune_14.3ds";
	material = MAT_STONE;
	spell = SPL_MASSDEATH;
	mag_circle = 6;
	description = "Волна смерти УРИЗЕЛЯ";
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_MASSDEATH;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_MASSDEATH;
	text[3] = "Эта магическая руна содержит";
	text[4] = "древнюю силу меча УРИЗЕЛЬ.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

