
instance ITARRUNELIGHT(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 300;
	visual = "ItAr_Rune_42.3ds";
	material = MAT_STONE;
	spell = SPL_LIGHT;
	mag_circle = 1;
	description = "����";
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_LIGHT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLLIGHT(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 5;
	visual = "ItAr_Scroll_32_EG.3DS";
	material = MAT_STONE;
	spell = SPL_LIGHT;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_LIGHT;
	description = "����";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_LIGHT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARRUNEFIREBOLT(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 300;
	visual = "ItAr_Rune_23.3ds";
	material = MAT_STONE;
	spell = SPL_FIREBOLT;
	mag_circle = 1;
	description = "�������� ������";
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_FIREBOLT;
	text[2] = NAME_DAM_FIRE;
	count[2] = SPL_DAMAGE_FIREBOLT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLFIREBOLT(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 30;
	visual = "ItAr_Scroll_35.3DS";
	material = MAT_STONE;
	spell = SPL_FIREBOLT;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_FIREBOLT;
	description = "�������� ������";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_FIREBOLT;
	text[2] = NAME_DAM_FIRE;
	count[2] = SPL_DAMAGE_FIREBOLT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARRUNEFIREBALL(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 700;
	visual = "ItAr_Rune_26.3ds";
	material = MAT_STONE;
	spell = SPL_FIREBALL;
	mag_circle = 3;
	description = "�������� ���";
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTENMAX;
	count[1] = SPL_SENDCAST_FIREBALL;
	text[2] = "�������� ���� (�� ��. ���. ����):";
	count[2] = SPL_DAMAGE_FIREBALL;
	text[4] = NAME_SPELL_LOAD;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLFIREBALL(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 70;
	visual = "ItAr_Scroll_27.3DS";
	material = MAT_STONE;
	spell = SPL_FIREBALL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_FIREBALL;
	description = "�������� ���";
	text[1] = NAME_MANAKOSTENMAX;
	count[1] = SPL_SENDCAST_FIREBALL;
	text[2] = "�������� ���� (�� ��. ���. ����):";
	count[2] = SPL_DAMAGE_FIREBALL;
	text[4] = NAME_SPELL_LOAD;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARRUNEFIRESTORM(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 1100;
	visual = "ItAr_Rune_24.3ds";
	material = MAT_STONE;
	spell = SPL_FIRESTORM;
	mag_circle = 4;
	description = "�������� �����";
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTENMAX;
	count[1] = SPL_SENDCAST_FIRESTORM;
	text[2] = "�������� ���� (�� ��. ���. ����):";
	count[2] = SPL_DAMAGE_FIRESTORM;
	text[4] = NAME_SPELL_LOAD;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLFIRESTORM(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 110;
	visual = "ItAr_Scroll_36.3DS";
	material = MAT_STONE;
	spell = SPL_FIRESTORM;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_FIRESTORM;
	description = "�������� �����";
	text[1] = NAME_MANAKOSTENMAX;
	count[1] = SPL_SENDCAST_FIRESTORM;
	text[2] = "�������� ���� (�� ��. ���. ����):";
	count[2] = SPL_DAMAGE_FIRESTORM;
	text[4] = NAME_SPELL_LOAD;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARRUNEFIRERAIN(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 1300;
	visual = "ItAr_Rune_25.3ds";
	material = MAT_STONE;
	spell = SPL_FIRERAIN;
	mag_circle = 5;
	description = "�������� �����";
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_FIRERAIN;
	text[2] = NAME_DAM_FIRE;
	count[2] = SPL_DAMAGE_FIRERAIN;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLFIRERAIN(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 130;
	visual = "ItAr_Scroll_28.3DS";
	material = MAT_STONE;
	spell = SPL_FIRERAIN;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_FIRERAIN;
	description = "�������� �����";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_FIRERAIN;
	text[2] = NAME_DAM_FIRE;
	count[2] = SPL_DAMAGE_FIRERAIN;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARRUNETELEPORT1(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	visual = "ItAr_Rune_38.3ds";
	material = MAT_STONE;
	spell = SPL_TELEPORT1;
	description = "������������ � ����� ����";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ITARSCROLLTELEPORT1(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	visual = "ItAr_Scroll_38.3DS";
	material = MAT_STONE;
	spell = SPL_TELEPORT1;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TELEPORT;
	description = "������������ � ����� ����";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ITARRUNETELEPORT2(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	visual = "ItAr_Rune_40.3ds";
	material = MAT_STONE;
	spell = SPL_TELEPORT2;
	description = "������������ � ����� ����";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ITARSCROLLTELEPORT2(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	visual = "ItAr_Scroll_40.3DS";
	material = MAT_STONE;
	spell = SPL_TELEPORT2;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TELEPORT;
	description = "������������ � ����� ����";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ITARRUNETELEPORT3(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	visual = "ItAr_Rune_41.3ds";
	material = MAT_STONE;
	spell = SPL_TELEPORT3;
	description = "������������ � ����������";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ITARSCROLLTELEPORT3(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	visual = "ItAr_Scroll_39.3DS";
	material = MAT_STONE;
	spell = SPL_TELEPORT3;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TELEPORT;
	description = "������������ � ����������";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ITARSCROLLTELEPORT4(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	visual = "ItAr_Scroll_43_EG.3DS";
	material = MAT_STONE;
	spell = SPL_TELEPORT4;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TELEPORT;
	description = "������ ����������";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ITARRUNETELEPORT5(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	visual = "ItAr_Rune_39.3ds";
	material = MAT_STONE;
	spell = SPL_TELEPORT5;
	description = "������������ � �������� ������";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ITARSCROLLTELEPORT5(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	visual = "ItAr_Scroll_37.3DS";
	material = MAT_STONE;
	spell = SPL_TELEPORT5;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TELEPORT;
	description = "������������ � �������� ������";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ITARRUNEHEAL(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 500;
	visual = "ItAr_Rune_27.3ds";
	material = MAT_STONE;
	spell = SPL_HEAL;
	mag_circle = 2;
	description = "�������";
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = "������� �� ����:";
	count[1] = SPL_HEALING_HP_PER_MP;
	text[4] = NAME_SPELL_INVEST;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLHEAL(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItAr_Scroll_33_EG.3DS";
	material = MAT_STONE;
	spell = SPL_HEAL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_HEALING_HP_PER_MP;
	description = "�������";
	text[1] = "������� �� ����:";
	count[1] = SPL_HEALING_HP_PER_MP;
	text[2] = NAME_MANA_NEEDED;
	count[2] = SPL_HEALING_HP_PER_MP;
	text[4] = NAME_SPELL_INVEST;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLTRFBLOODFLY(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 300;
	visual = "ITAR_SCROLL_02_EG.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_BLOODFLY;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_BLOODFLY;
	description = "����������� � ������";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_TRF_BLOODFLY;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLTRFCRAWLER(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 300;
	visual = "ItAr_Scroll_04.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_CRAWLER;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_CRAWLER;
	description = "����������� � �������";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_TRF_CRAWLER;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLTRFLURKER(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 300;
	visual = "ItAr_Scroll_02.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_LURKER;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_LURKER;
	description = "����������� � �����";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_TRF_LURKER;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLTRFMEATBUG(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 300;
	visual = "ItAr_Scroll_03.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_MEATBUG;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_MEATBUG;
	description = "����������� � ������� ����";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_TRF_MEATBUG;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLTRFMOLERAT(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 300;
	visual = "ItAr_Scroll_05.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_MOLERAT;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_MOLERAT;
	description = "����������� � ����������";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_TRF_MOLERAT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLTRFORCDOG(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 300;
	visual = "ItAr_Scroll_11.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_ORCDOG;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_ORCDOG;
	description = "����������� � ������ ������";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_TRF_ORCDOG;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLTRFSCAVENGER(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 300;
	visual = "ItAr_Scroll_07.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_SCAVENGER;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_SCAVENGER;
	description = "����������� � ����������";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_TRF_SCAVENGER;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLTRFSHADOWBEAST(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 300;
	visual = "ItAr_Scroll_06.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_SHADOWBEAST;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_SHADOWBEAST;
	description = "����������� � ���������";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_TRF_SHADOWBEAST;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLTRFSNAPPER(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 300;
	visual = "ItAr_Scroll_30_EG.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_SNAPPER;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_SNAPPER;
	description = "����������� � ������";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_TRF_SNAPPER;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLTRFWARAN(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 300;
	visual = "ItAr_Scroll_10.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_WARAN;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_WARAN;
	description = "����������� � �������";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_TRF_WARAN;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLTRFWOLF(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 300;
	visual = "ItAr_Scroll_09.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_WOLF;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_WOLF;
	description = "����������� � �����";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_TRF_WOLF;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARRUNECHAINLIGHTNING(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 700;
	visual = "ItAr_Rune_19.3ds";
	material = MAT_STONE;
	spell = SPL_CHAINLIGHTNING;
	mag_circle = 4;
	description = "������";
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_DAMAGEPERSEC;
	count[1] = SPL_ZAPPED_DAMAGE_PER_SEC;
	text[4] = NAME_SPELL_INVEST;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLCHAINLIGHTNING(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 70;
	visual = "ItAr_Scroll_31.3DS";
	material = MAT_STONE;
	spell = SPL_CHAINLIGHTNING;
	description = "������";
	text[1] = NAME_DAMAGEPERSEC;
	count[1] = SPL_ZAPPED_DAMAGE_PER_SEC;
	text[4] = NAME_SPELL_INVEST;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARRUNETHUNDERBOLT(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 500;
	visual = "ItAr_Rune_18.3ds";
	material = MAT_STONE;
	spell = SPL_THUNDERBOLT;
	mag_circle = 1;
	description = "������� ������";
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_THUNDERBOLT;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_THUNDERBOLT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLTHUNDERBOLT(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItAr_Scroll_20.3DS";
	material = MAT_STONE;
	spell = SPL_THUNDERBOLT;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_THUNDERBOLT;
	description = "������� ������";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_THUNDERBOLT;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_THUNDERBOLT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARRUNETHUNDERBALL(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 900;
	visual = "ItAr_Rune_20.3ds";
	material = MAT_STONE;
	spell = SPL_THUNDERBALL;
	mag_circle = 3;
	description = "������� ������";
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTENMAX;
	count[1] = SPL_SENDCAST_THUNDERBALL;
	text[2] = "���������� ���� (�� ��. ���. ����):";
	count[2] = SPL_DAMAGE_THUNDERBALL;
	text[4] = NAME_SPELL_LOAD;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLTHUNDERBALL(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 90;
	visual = "ItAr_Scroll_01.3DS";
	material = MAT_STONE;
	spell = SPL_THUNDERBALL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_THUNDERBALL;
	description = "������� ������";
	text[1] = NAME_MANAKOSTENMAX;
	count[1] = SPL_SENDCAST_THUNDERBALL;
	text[2] = "���������� ���� (�� ��. ���. ����):";
	count[2] = SPL_DAMAGE_THUNDERBALL;
	text[4] = NAME_SPELL_LOAD;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARRUNEICECUBE(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 700;
	visual = "ItAr_Rune_21.3ds";
	material = MAT_STONE;
	spell = SPL_ICECUBE;
	mag_circle = 3;
	description = "������� �����";
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_ICECUBE;
	text[2] = "����:";
	count[2] = SPL_FREEZE_DAMAGE;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLICECUBE(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 70;
	visual = "ItAr_Scroll_25.3DS";
	material = MAT_STONE;
	spell = SPL_ICECUBE;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_ICECUBE;
	description = "������� �����";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_ICECUBE;
	text[2] = "����:";
	count[2] = SPL_FREEZE_DAMAGE;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARRUNEICEWAVE(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 1100;
	visual = "ItAr_Rune_22.3ds";
	material = MAT_STONE;
	spell = SPL_ICEWAVE;
	mag_circle = 5;
	description = "������� �����";
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_ICEWAVE;
	text[2] = "����:";
	count[2] = SPL_FREEZE_DAMAGE;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLICEWAVE(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 110;
	visual = "ItAr_Scroll_30.3DS";
	material = MAT_STONE;
	spell = SPL_ICEWAVE;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_ICEWAVE;
	description = "������� �����";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_ICEWAVE;
	text[2] = "����:";
	count[2] = SPL_FREEZE_DAMAGE;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLSUMMONDEMON(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 550;
	visual = "ItAr_Scroll_18.3DS";
	material = MAT_STONE;
	spell = SPL_SUMMONDEMON;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_SUMMONDEMON;
	description = "������ ������";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_SUMMONDEMON;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLSUMMONSKELETONS(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 350;
	visual = "ItAr_Scroll_23.3DS";
	material = MAT_STONE;
	spell = SPL_SUMMONSKELETON;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_SUMMONSKELETON;
	description = "������ ��������";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_SUMMONSKELETON;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLSUMMONGOLEM(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 450;
	visual = "ITAR_SCROLL_23_EG.3DS";
	material = MAT_STONE;
	spell = SPL_SUMMONGOLEM;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_SUMMONGOLEM;
	description = "������ ������";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_SUMMONGOLEM;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLARMYOFDARKNESS(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 666;
	visual = "ItAr_Scroll_13_EG.3DS";
	material = MAT_STONE;
	spell = SPL_ARMYOFDARKNESS;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_ARMYOFDARKNESS;
	description = "����� ����";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_ARMYOFDARKNESS;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARRUNEARMYOFDARKNESS(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 6660;
	visual = "ItAr_Rune_13.3ds";
	material = MAT_STONE;
	spell = SPL_ARMYOFDARKNESS;
	mag_circle = 6;
	description = "����� ����";
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_ARMYOFDARKNESS;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARRUNEDESTROYUNDEAD(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 1100;
	visual = "ItAr_Rune_15.3ds";
	material = MAT_STONE;
	spell = SPL_DESTROYUNDEAD;
	mag_circle = 4;
	description = "����������� ������";
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_DESTROYUNDEAD;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_DESTROYUNDEAD;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLDESTROYUNDEAD(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 110;
	visual = "ItAr_Scroll_15_EG.3DS";
	material = MAT_STONE;
	spell = SPL_DESTROYUNDEAD;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_DESTROYUNDEAD;
	description = "����������� ������";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_DESTROYUNDEAD;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_DESTROYUNDEAD;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARRUNEWINDFIST(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 500;
	visual = "ItAr_Rune_06.3ds";
	material = MAT_STONE;
	spell = SPL_WINDFIST;
	mag_circle = 2;
	description = "����� �����";
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTENMAX;
	count[1] = SPL_SENDCAST_WINDFIST;
	text[2] = "���� �� ������� (�� ��. ���. ����):";
	count[2] = SPL_DAMAGE_WINDFIST;
	text[4] = NAME_SPELL_LOAD;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLWINDFIST(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItAr_Scroll_12.3DS";
	material = MAT_STONE;
	spell = SPL_WINDFIST;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_WINDFIST;
	description = "����� �����";
	text[1] = NAME_MANAKOSTENMAX;
	count[1] = SPL_SENDCAST_WINDFIST;
	text[2] = "���� �� ������� (�� ��. ���. ����):";
	count[2] = SPL_DAMAGE_WINDFIST;
	text[4] = NAME_SPELL_LOAD;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARRUNESTORMFIST(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 900;
	visual = "ItAr_Rune_07.3ds";
	material = MAT_STONE;
	spell = SPL_STORMFIST;
	mag_circle = 4;
	description = "�����";
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTENMAX;
	count[1] = SPL_SENDCAST_STORMFIST;
	text[2] = "���� �� ������� (�� ��. ���. ����):";
	count[2] = SPL_DAMAGE_STORMFIST;
	text[4] = NAME_SPELL_LOAD;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLSTORMFIST(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 90;
	visual = "ItAr_Scroll_17.3DS";
	material = MAT_STONE;
	spell = SPL_STORMFIST;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_STORMFIST;
	description = "�����";
	text[1] = NAME_MANAKOSTENMAX;
	count[1] = SPL_SENDCAST_STORMFIST;
	text[2] = "���� �� ������� (�� ��. ���. ����):";
	count[2] = SPL_DAMAGE_STORMFIST;
	text[4] = NAME_SPELL_LOAD;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARRUNETELEKINESIS(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 700;
	visual = "ItAr_Rune_05.3ds";
	material = MAT_STONE;
	spell = SPL_TELEKINESIS;
	mag_circle = 3;
	description = "���������";
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAPERSEC;
	count[1] = 1;
	text[4] = NAME_SPELL_INVEST;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLTELEKINESIS(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 70;
	visual = "ItAr_Scroll_13.3DS";
	material = MAT_STONE;
	spell = SPL_TELEKINESIS;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 10;
	description = "���������";
	text[1] = NAME_MANAPERSEC;
	count[1] = 1;
	text[2] = NAME_MANA_NEEDED;
	count[2] = cond_value[2];
	text[4] = NAME_SPELL_INVEST;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARRUNECHARM(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 700;
	visual = "ItAr_Rune_10.3ds";
	material = MAT_STONE;
	spell = SPL_CHARM;
	mag_circle = 3;
	description = "����";
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_CHARM;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLCHARM(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 70;
	visual = "ItAr_Scroll_10_EG.3DS";
	material = MAT_STONE;
	spell = SPL_CHARM;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_CHARM;
	description = "����";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_CHARM;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARRUNESLEEP(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 500;
	visual = "ItAr_Rune_09.3ds";
	material = MAT_STONE;
	spell = SPL_SLEEP;
	mag_circle = 2;
	description = "���";
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_SLEEP;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLSLEEP(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItAr_Scroll_09_EG.3DS";
	material = MAT_STONE;
	spell = SPL_SLEEP;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_SLEEP;
	description = "���";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_SLEEP;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARRUNEPYROKINESIS(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 700;
	visual = "ItAr_Rune_04.3ds";
	material = MAT_STONE;
	spell = SPL_PYROKINESIS;
	mag_circle = 3;
	description = "���������";
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_DAMAGEPERSEC;
	count[1] = SPL_PYRO_DAMAGE_PER_SEC;
	text[4] = NAME_SPELL_INVEST;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLPYROKINESIS(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 70;
	visual = "ItAr_Scroll_29_EG.3DS";
	material = MAT_STONE;
	spell = SPL_PYROKINESIS;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 10;
	description = "���������";
	text[1] = NAME_DAMAGEPERSEC;
	count[1] = SPL_PYRO_DAMAGE_PER_SEC;
	text[4] = NAME_SPELL_INVEST;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARRUNECONTROL(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 900;
	visual = "ItAr_Rune_02.3ds";
	material = MAT_STONE;
	spell = SPL_CONTROL;
	mag_circle = 4;
	description = "��������";
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLCONTROL(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 90;
	visual = "ItAr_Scroll_08.3DS";
	material = MAT_STONE;
	spell = SPL_CONTROL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 30;
	description = "��������";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLFEAR(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 250;
	visual = "ItAr_Scroll_11_EG.3DS";
	material = MAT_STONE;
	spell = SPL_FEAR;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_FEAR;
	description = "�����";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_FEAR;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLBERZERK(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 200;
	visual = "ItAr_Scroll_22.3DS";
	material = MAT_STONE;
	spell = SPL_BERZERK;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_BERZERK;
	description = "����";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_BERZERK;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARRUNEBREATHOFDEATH(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 1500;
	visual = "ItAr_Rune_12.3ds";
	material = MAT_STONE;
	spell = SPL_BREATHOFDEATH;
	mag_circle = 6;
	description = "������� ������";
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_BREATHOFDEATH;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_BREATHOFDEATH;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITARSCROLLSHRINK(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 1000;
	visual = "ItAr_Scroll_15.3DS";
	material = MAT_STONE;
	spell = SPL_SHRINK;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_SHRINK;
	description = "���������� �������";
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_SENDCAST_SHRINK;
	text[5] = NAME_VALUE;
	count[5] = value;
};

