
const int VALUE_Z�HNE = 10;
const int VALUE_KRALLEN = 8;
const int VALUE_WOLFSFELL = 10;
const int VALUE_ORKHUNDFELL = 20;
const int VALUE_PANZERPLATTE = 20;
const int VALUE_CRAWLERZANGEN = 10;
const int VALUE_SHADOWBEASTFELL = 400;
const int VALUE_LURKERKLAUE = 10;
const int VALUE_LURKERHAUT = 20;
const int VALUE_SUMPFHAIHAUT = 200;
const int VALUE_TROLLFELL = 300;
const int VALUE_FL�GEL = 8;
const int VALUE_STACHEL = 10;
const int VALUE_FEUERZUNGE = 100;
const int VALUE_SUMPFHAIZ�HNE = 100;
const int VALUE_SHADOWBEASTHORN = 100;
const int VALUE_TROLLHAUER = 100;
const int VALUE_STEINHERZ = 300;
const int VALUE_FEUERHERZ = 300;
const int VALUE_EISHERZ = 300;
const int VALUE_EISTUECK = 100;

instance ITAT_TEETH_01(C_ITEM)
{
	name = "�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_Z�HNE;
	visual = "ItAt_Teeth_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_Z�HNE;
};

instance ITAT_WOLF_01(C_ITEM)
{
	name = "����� �����";
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
	name = "����� ������� ������";
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
	name = "���� �������� �������";
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
	name = "�����";
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
	name = "��������� �������� �������-�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_PANZERPLATTE;
	visual = "ItAt_Crawler_02.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_PANZERPLATTE;
};

instance ITAT_CRAWLER_01(C_ITEM)
{
	name = "������� �������";
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
	name = "����� ���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SHADOWBEASTFELL;
	visual = "ItAt_Shadowbeast_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_SHADOWBEASTFELL;
};

instance ITAT_SHADOW_02(C_ITEM)
{
	name = "��� ���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SHADOWBEASTHORN;
	visual = "ItAt_Shadowbeast_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_SHADOWBEASTHORN;
};

instance ITAT_LURKER_01(C_ITEM)
{
	name = "������ �����";
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
	name = "����� �����";
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
	name = "���� ������";
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
	name = "����� ������";
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
	name = "����� ����������";
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
	name = "���� ����������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SUMPFHAIZ�HNE;
	visual = "ItAt_Swampshark_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_SUMPFHAIZ�HNE;
};

instance ITAT_BLOODFLY_01(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_FL�GEL;
	visual = "ItAt_Bloodfly_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_FL�GEL;
};

instance ITAT_BLOODFLY_02(C_ITEM)
{
	name = "���� ������";
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
	name = "������ ��������� ������";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	spell = SPL_WINDFIST;
	value = VALUE_STEINHERZ;
	visual = "ItAt_StoneGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "��� ������ ������ �� ����";
	text[1] = "������� ��������� ������.";
	text[2] = "��� �������� ����� ����������� ����������";
	text[3] = "�� ������� ����������.";
	text[5] = NAME_VALUE;
	count[5] = VALUE_STEINHERZ;
};

instance ITAT_FIREGOLEM_01(C_ITEM)
{
	name = "������ ��������� ������";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	spell = SPL_FIREBALL;
	value = VALUE_FEUERHERZ;
	visual = "ItAt_FireGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "��� ������ ������ �� ����";
	text[1] = "������� ��������� ������.";
	text[2] = "��� �������� ����� �������";
	text[3] = "���������� ������.";
	text[5] = NAME_VALUE;
	count[5] = VALUE_FEUERHERZ;
};

instance ITAT_ICEGOLEM_01(C_ITEM)
{
	name = "������ �������� ������";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	spell = SPL_ICECUBE;
	value = VALUE_EISHERZ;
	visual = "ItAt_IceGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "��� ������ ������ �� ����";
	text[1] = "������� �������� ������.";
	text[2] = "��� �������� ����� ����������";
	text[3] = "���������� � ������� �����.";
	text[5] = NAME_VALUE;
	count[5] = VALUE_EISHERZ;
};

instance ITAT_ICEGOLEM_02(C_ITEM)
{
	name = "������� �������� ������";
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	spell = SPL_THUNDERBOLT;
	value = VALUE_EISTUECK;
	visual = "ItAt_IceGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "��� ������� �� ����";
	text[1] = "������� �������� ������.";
	text[5] = NAME_VALUE;
	count[5] = VALUE_EISTUECK;
};

