
const int VALUE_ZеHNE = 10;
const int VALUE_KRALLEN = 15;
const int VALUE_WOLFSFELL = 10;
const int VALUE_ORKHUNDFELL = 15;
const int VALUE_PANZERPLATTE = 50;
const int VALUE_CRAWLERZANGEN = 10;
const int VALUE_SHADOWBEASTFELL = 100;
const int VALUE_LURKERKLAUE = 15;
const int VALUE_LURKERHAUT = 25;
const int VALUE_SUMPFHAIHAUT = 200;
const int VALUE_TROLLFELL = 300;
const int VALUE_FLьGEL = 8;
const int VALUE_STACHEL = 25;
const int VALUE_FEUERZUNGE = 500;
const int VALUE_SUMPFHAIZеHNE = 500;
const int VALUE_SHADOWBEASTHORN = 500;
const int VALUE_TROLLHAUER = 500;
const int VALUE_STEINHERZ = 1000;
const int VALUE_FEUERHERZ = 1000;
const int VALUE_EISHERZ = 1000;
const int VALUE_EISTUECK = 100;

instance ITAT_TEETH_01(C_ITEM)
{
	name = "Клыки";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_ZеHNE;
	visual = "ItAt_Teeth_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_ZеHNE;
};

instance ITAT_WOLF_01(C_ITEM)
{
	name = "Шкура волка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_WOLFSFELL;
	visual = "ItAt_Wolf_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_WOLFSFELL;
};

instance ITAT_WOLF_02(C_ITEM)
{
	name = "Шкура орочьей собаки";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_ORKHUNDFELL;
	visual = "ItAt_Wolf_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_ORKHUNDFELL;
};

instance ITAT_WARAN_01(C_ITEM)
{
	name = "Язык огненной ящерицы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_FEUERZUNGE;
	visual = "ItAt_Waran_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_FEUERZUNGE;
};

instance ITAT_CLAWS_01(C_ITEM)
{
	name = "Когти";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_KRALLEN;
	visual = "ItAt_Claws_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_KRALLEN;
};

instance ITAT_CRAWLER_02(C_ITEM)
{
	name = "Панцирная пластина";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_PANZERPLATTE;
	visual = "ItAt_Crawler_02.3DS";
	material = MAT_WOOD;
	description = "Панцирная пластина ползуна-воина";
	text[5] = NAME_VALUE;
	count[5] = VALUE_PANZERPLATTE;
};

instance ITAT_CRAWLER_01(C_ITEM)
{
	name = "Челюсти ползуна";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_CRAWLERZANGEN;
	visual = "ItAt_Crawler_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_CRAWLERZANGEN;
};

instance ITAT_SHADOW_01(C_ITEM)
{
	name = "Шкура";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SHADOWBEASTFELL;
	visual = "ItAt_Shadowbeast_01.3DS";
	material = MAT_LEATHER;
	description = "Шкура мракориса";
	text[5] = NAME_VALUE;
	count[5] = VALUE_SHADOWBEASTFELL;
};

instance ITAT_SHADOW_02(C_ITEM)
{
	name = "Рог";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SHADOWBEASTHORN;
	visual = "ItAt_Shadowbeast_02.3DS";
	material = MAT_LEATHER;
	description = "Рог мракориса";
	text[5] = NAME_VALUE;
	count[5] = VALUE_SHADOWBEASTHORN;
};

instance ITAT_LURKER_01(C_ITEM)
{
	name = "Коготь шныга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_LURKERKLAUE;
	visual = "ItAt_Lurker_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_LURKERKLAUE;
};

instance ITAT_LURKER_02(C_ITEM)
{
	name = "Шкура шныга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_LURKERHAUT;
	visual = "ItAt_Lurker_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_LURKERHAUT;
};

instance ITAT_TROLL_02(C_ITEM)
{
	name = "Клык тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_TROLLHAUER;
	visual = "ItAt_Troll_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_TROLLHAUER;
};

instance ITAT_TROLL_01(C_ITEM)
{
	name = "Шкура тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_TROLLFELL;
	visual = "ItAt_Troll_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_TROLLFELL;
};

instance ITAT_SWAMPSHARK_01(C_ITEM)
{
	name = "Шкура болотожора";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SUMPFHAIHAUT;
	visual = "ItAt_Swampshark_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_SUMPFHAIHAUT;
};

instance ITAT_SWAMPSHARK_02(C_ITEM)
{
	name = "Клыки болотожора";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SUMPFHAIZеHNE;
	visual = "ItAt_Swampshark_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_SUMPFHAIZеHNE;
};

instance ITAT_BLOODFLY_01(C_ITEM)
{
	name = "Крылья";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_FLьGEL;
	visual = "ItAt_Bloodfly_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_FLьGEL;
};

instance ITAT_BLOODFLY_02(C_ITEM)
{
	name = "Жало шершня";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_STACHEL;
	visual = "ItAt_Bloodfly_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_STACHEL;
};

instance ITAT_STONEGOLEM_01(C_ITEM)
{
	name = "Сердце каменного голема";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	spell = SPL_WINDFIST;
	value = VALUE_STEINHERZ;
	visual = "ItAt_StoneGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "Это сердце добыто из тела";
	text[1] = "убитого каменного голема.";
	text[2] = "Оно обладает силой отбрасывать противника";
	text[3] = "на большое расстояние.";
	text[5] = NAME_VALUE;
	count[5] = VALUE_STEINHERZ;
};

instance ITAT_FIREGOLEM_01(C_ITEM)
{
	name = "Сердце огненного голема";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	spell = SPL_FIREBALL;
	value = VALUE_FEUERHERZ;
	visual = "ItAt_FireGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "Это сердце добыто из тела";
	text[1] = "убитого огненного голема.";
	text[2] = "Оно обладает силой сжигать";
	text[3] = "противника заживо.";
	text[5] = NAME_VALUE;
	count[5] = VALUE_FEUERHERZ;
};

instance ITAT_ICEGOLEM_01(C_ITEM)
{
	name = "Сердце ледяного голема";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	spell = SPL_ICECUBE;
	value = VALUE_EISHERZ;
	visual = "ItAt_IceGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "Это сердце добыто из тела";
	text[1] = "убитого ледяного голема.";
	text[2] = "Оно обладает силой превращать";
	text[3] = "противника в ледяную глыбу.";
	text[5] = NAME_VALUE;
	count[5] = VALUE_EISHERZ;
};

instance ITAT_ICEGOLEM_02(C_ITEM)
{
	name = "Осколок ледяного голема";
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	spell = SPL_THUNDERBOLT;
	value = VALUE_EISTUECK;
	visual = "ItAt_IceGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "Это осколок от тела";
	text[1] = "убитого ледяного голема.";
	text[5] = NAME_VALUE;
	count[5] = VALUE_EISTUECK;
};

