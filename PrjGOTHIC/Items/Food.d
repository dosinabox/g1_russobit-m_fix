
const int VALUE_BUGMEAT = 2;
const int HP_BUGMEAT = 4;
const int VALUE_APFEL = 4;
const int HP_APFEL = 8;
const int VALUE_WEINTRAUBEN = 6;
const int HP_WEINTRAUBEN = 8;
const int VALUE_WASSER = 3;
const int HP_WASSER = 5;
const int VALUE_BIER = 10;
const int HP_BIER = 3;
const int VALUE_WEIN = 13;
const int HP_WEIN = 5;
const int VALUE_REISSCHNAPS = 15;
const int HP_REISSCHNAPS = 7;
const int VALUE_REIS = 5;
const int HP_REIS = 10;
const int VALUE_WURZELSUPPE = 3;
const int HP_WURZELSUPPE = 7;
const int VALUE_RAGOUT = 4;
const int HP_RAGOUT = 9;
const int VALUE_CRAWLERSUPPE = 10;
const int HP_CRAWLERSUPPE = 15;
const int VALUE_FLEISCHROH = 5;
const int HP_FLEISCHROH = 7;
const int VALUE_BROT = 8;
const int HP_BROT = 12;
const int VALUE_K�SE = 10;
const int HP_K�SE = 15;
const int VALUE_FLEISCH = 8;
const int HP_FLEISCH = 18;
const int VALUE_SCHINKEN = 12;
const int HP_SCHINKEN = 18;
const int VALUE_WALDBEEREN = 5;
const int HP_WALDBEEREN = 10;
const int VALUE_FLAMMENDORN = 6;
const int HP_FLAMMENDORN = 12;
const int VALUE_SERAPHIS = 7;
const int HP_SERAPHIS = 5;
const int VALUE_VELAYIS = 8;
const int HP_VELAYIS = 16;
const int VALUE_BERGMOOS = 50;
const int HP_BERGMOOS = 18;
const int VALUE_GRABMOOS = 70;
const int HP_GRABMOOS = 20;
const int VALUE_NACHTSCHATTEN = 11;
const int HP_NACHTSCHATTEN = 22;
const int VALUE_MONDSCHATTEN = 12;
const int HP_MONDSCHATTEN = 24;
const int VALUE_ORKBLATT = 13;
const int HP_ORKBLATT = 26;
const int VALUE_EICHENBLATT = 14;
const int HP_EICHENBLATT = 28;
const int VALUE_H�LLENPILZ = 3;
const int HP_H�LLENPILZ = 6;
const int VALUE_SKLAVENBROT = 9;
const int HP_SKLAVENBROT = 15;
const int VALUE_HEILKR�UTER1 = 14;
const int HP_HEILKR�UTER1 = 30;
const int VALUE_HEILKR�UTER2 = 19;
const int HP_HEILKR�UTER2 = 39;
const int VALUE_HEILKR�UTER3 = 24;
const int HP_HEILKR�UTER3 = 49;
const int VALUE_TROLLKIRSCHE = 15;
const int HP_TROLLKIRSCHE = -20;
const int VALUE_BLUTBUCHE = 3;
const int MANA_BLUTBUCHE = 5;
const int VALUE_TURMEICHE = 8;
const int MANA_TURMEICHE = 10;
const int VALUE_RABENKRAUT = 12;
const int MANA_RABENKRAUT = 15;
const int VALUE_DUNKELKRAUT = 17;
const int MANA_DUNKELKRAUT = 20;
const int VALUE_STEIMWURZEL = 20;
const int MANA_STEINWURZEL = 25;
const int VALUE_DRACHENWURZEL = 23;
const int MANA_DRACHENWURZEL = 30;

instance ITAT_MEATBUG_01(C_ITEM)
{
	name = "���� ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_BUGMEAT;
	visual = "ItAt_Meatbug_01.3DS";
	material = MAT_LEATHER;
	scemename = "FOOD";
	on_state[0] = usebugmeat;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_BUGMEAT;
	text[5] = NAME_VALUE;
	count[5] = VALUE_BUGMEAT;
};


func void usebugmeat()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_BUGMEAT);
};


instance ITFOAPPLE(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_APFEL;
	visual = "ItFo_Apple_01.3ds";
	material = MAT_LEATHER;
	scemename = "FOOD";
	on_state[0] = useapple;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_APFEL;
	text[5] = NAME_VALUE;
	count[5] = VALUE_APFEL;
};


func void useapple()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_APFEL);
};


instance ITFO_WINEBERRYS_01(C_ITEM)
{
	name = "����������� ������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_WEINTRAUBEN;
	visual = "ItFo_wineberrys_01.3ds";
	on_state[0] = usewineberrys;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_WEINTRAUBEN;
	text[5] = NAME_VALUE;
	count[5] = VALUE_WEINTRAUBEN;
};


func void usewineberrys()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_WEINTRAUBEN);
};


instance ITFOLOAF(C_ITEM)
{
	name = "����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_BROT;
	visual = "ItFo_Loaf_01.3ds";
	scemename = "FOODHUGE";
	on_state[0] = useloaf;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_BROT;
	text[5] = NAME_VALUE;
	count[5] = VALUE_BROT;
};


func void useloaf()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_BROT);
};


instance ITFOMUTTON(C_ITEM)
{
	name = "������� ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_FLEISCH;
	visual = "ItFo_CookedMutton_01.3ds";
	scemename = "MEAT";
	on_state[0] = usemutton;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_FLEISCH;
	text[5] = NAME_VALUE;
	count[5] = VALUE_FLEISCH;
};


func void usemutton()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_FLEISCH);
};


instance ITFOMUTTONRAW(C_ITEM)
{
	name = "����� ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_FLEISCHROH;
	visual = "ItFo_RawMutton_01.3ds";
	scemename = "MEAT";
	on_state[0] = usemuttonraw;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_FLEISCHROH;
	text[5] = NAME_VALUE;
	count[5] = VALUE_FLEISCHROH;
};


func void usemuttonraw()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_FLEISCHROH);
};


instance ITFO_MUTTON_01(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_SCHINKEN;
	visual = "ItFo_mutton_01.3ds";
	scemename = "FOODHUGE";
	on_state[0] = usemutton1;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_SCHINKEN;
	text[5] = NAME_VALUE;
	count[5] = VALUE_SCHINKEN;
};


func void usemutton1()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_SCHINKEN);
};


instance ITFOCHEESE(C_ITEM)
{
	name = "���";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_K�SE;
	visual = "ItFo_Cheese_01.3ds";
	scemename = "FOODHUGE";
	on_state[0] = usecheese;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_K�SE;
	text[5] = NAME_VALUE;
	count[5] = VALUE_K�SE;
};


func void usecheese()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_K�SE);
};


instance ITFORICE(C_ITEM)
{
	name = "���";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_REIS;
	visual = "ItFo_Rice_01.3ds";
	scemename = "RICE";
	on_state[0] = userice;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_REIS;
	text[5] = NAME_VALUE;
	count[5] = VALUE_REIS;
};


func void userice()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_REIS);
};


instance ITFOSOUP(C_ITEM)
{
	name = "��� �� ��������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_WURZELSUPPE;
	visual = "ItFo_Soup_01.3ds";
	scemename = "RICE";
	on_state[0] = usesoup;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_WURZELSUPPE;
	text[5] = NAME_VALUE;
	count[5] = VALUE_WURZELSUPPE;
};


func void usesoup()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_WURZELSUPPE);
};


instance ITFOMEATBUGRAGOUT(C_ITEM)
{
	name = "���� �� �����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_RAGOUT;
	visual = "ItFo_Meatbugragout_01.3ds";
	material = MAT_LEATHER;
	scemename = "RICE";
	on_state[0] = usemeatbugragout;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_RAGOUT;
	text[5] = NAME_VALUE;
	count[5] = VALUE_RAGOUT;
};


func void usemeatbugragout()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_RAGOUT);
};


instance ITFOCRAWLERSOUP(C_ITEM)
{
	name = "��� � ����� ��������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_CRAWLERSUPPE;
	visual = "ItFo_Crawlersoup_01.3ds";
	material = MAT_LEATHER;
	on_state[0] = usecrawlersoup;
	scemename = "RICE";
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_CRAWLERSUPPE;
	text[5] = NAME_VALUE;
	count[5] = VALUE_CRAWLERSUPPE;
};


func void usecrawlersoup()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_CRAWLERSUPPE);
};


instance ITFO_POTION_WATER_01(C_ITEM)
{
	name = "����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_WASSER;
	visual = "ItFo_Potion_Water_01.3ds";
	material = MAT_GLAS;
	on_state[0] = usewaterpotion;
	scemename = "POTION";
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_WASSER;
	text[5] = NAME_VALUE;
	count[5] = VALUE_WASSER;
};


func void usewaterpotion()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_WASSER);
};


instance ITFOBEER(C_ITEM)
{
	name = "����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_BIER;
	visual = "ItFo_Beer_01.3ds";
	material = MAT_GLAS;
	on_state[0] = usebooze;
	scemename = "POTION";
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_REISSCHNAPS;
	text[5] = NAME_VALUE;
	count[5] = VALUE_BIER;
};


instance ITFOWINE(C_ITEM)
{
	name = "����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_WEIN;
	visual = "ItFo_Wine_01.3ds";
	material = MAT_LEATHER;
	on_state[0] = usebooze;
	scemename = "POTION";
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_REISSCHNAPS;
	text[5] = NAME_VALUE;
	count[5] = VALUE_WEIN;
};

instance ITFOBOOZE(C_ITEM)
{
	name = "������� �����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_REISSCHNAPS;
	visual = "ItFo_Booze_01.3ds";
	material = MAT_GLAS;
	on_state[0] = usebooze;
	scemename = "POTION";
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_REISSCHNAPS;
	text[5] = NAME_VALUE;
	count[5] = VALUE_REISSCHNAPS;
};


func void usebooze()
{
	if(Npc_IsPlayer(self) && (hero.attribute[ATR_HITPOINTS] == hero.attribute[ATR_HITPOINTS_MAX]))
	{
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_DRUNKEN.MDS",50000);
	};
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_REISSCHNAPS);
};


instance ITFO_PLANTS_BERRYS_01(C_ITEM)
{
	name = "������ �����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_WALDBEEREN;
	visual = "ItFo_Plants_Berrys_01.3ds";
	material = MAT_WOOD;
	on_state[0] = useberrys;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_WALDBEEREN;
	text[5] = NAME_VALUE;
	count[5] = VALUE_WALDBEEREN;
};


func void useberrys()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_WALDBEEREN);
	printdebugnpc(PD_ITEM_MOBSI,"� �� �����.");
};


instance ITFO_PLANTS_FLAMEBERRY_01(C_ITEM)
{
	name = "�������� �����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_FLAMMENDORN;
	visual = "ItFo_Plants_Flameberry_01.3ds";
	material = MAT_WOOD;
	on_state[0] = useflame;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_FLAMMENDORN;
	text[5] = NAME_VALUE;
	count[5] = VALUE_FLAMMENDORN;
};


func void useflame()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_FLAMMENDORN);
	printdebugnpc(PD_ITEM_MOBSI,"� �� �������� �����.");
};


instance ITFO_PLANTS_SERAPHIS_01(C_ITEM)
{
	name = "�������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_SERAPHIS;
	visual = "ItFo_Plants_Seraphis_01.3ds";
	material = MAT_WOOD;
	on_state[0] = useseraphis;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_SERAPHIS;
	text[5] = NAME_VALUE;
	count[5] = VALUE_SERAPHIS;
};


func void useseraphis()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_SERAPHIS);
	printdebugnpc(PD_ITEM_MOBSI,"� �� �������.");
};


instance ITFO_PLANTS_VELAYIS_01(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_VELAYIS;
	visual = "ItFo_Plants_Flameberry_02.3ds";
	material = MAT_WOOD;
	on_state[0] = usevelayis;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_VELAYIS;
	text[5] = NAME_VALUE;
	count[5] = VALUE_VELAYIS;
};


func void usevelayis()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_VELAYIS);
	printdebugnpc(PD_ITEM_MOBSI,"� �� ������.");
};


instance ITFO_PLANTS_MOUNTAINMOOS_01(C_ITEM)
{
	name = "������ ���";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_BERGMOOS;
	visual = "ItFo_Plants_mountainmoos_01.3ds";
	material = MAT_WOOD;
	on_state[0] = usemoos;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_BERGMOOS;
	text[5] = NAME_VALUE;
	count[5] = VALUE_BERGMOOS;
};


func void usemoos()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_BERGMOOS);
	printdebugnpc(PD_ITEM_MOBSI,"� �� ���.");
};


instance ITFO_PLANTS_MOUNTAINMOOS_02(C_ITEM)
{
	name = "��������� ���";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_GRABMOOS;
	visual = "ItFo_Plants_mountainmoos_02.3ds";
	material = MAT_WOOD;
	on_state[0] = usemoos2;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_GRABMOOS;
	text[5] = NAME_VALUE;
	count[5] = VALUE_GRABMOOS;
};


func void usemoos2()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_GRABMOOS);
	printdebugnpc(PD_ITEM_MOBSI,"� �� ��������� ���.");
};


instance ITFO_PLANTS_NIGHTSHADOW_01(C_ITEM)
{
	name = "������ ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_NACHTSCHATTEN;
	visual = "ItFo_Plants_Nightshadow_01.3ds";
	material = MAT_WOOD;
	on_state[0] = usenight;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_NACHTSCHATTEN;
	text[5] = NAME_VALUE;
	count[5] = VALUE_NACHTSCHATTEN;
};


func void usenight()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_NACHTSCHATTEN);
	printdebugnpc(PD_ITEM_MOBSI,"� �� ������ ����.");
};


instance ITFO_PLANTS_NIGHTSHADOW_02(C_ITEM)
{
	name = "������ ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MONDSCHATTEN;
	visual = "ItFo_Plants_Moonshadow.3ds";
	material = MAT_WOOD;
	on_state[0] = usemoon;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_MANA;
	count[1] = HP_MONDSCHATTEN;
	text[5] = NAME_VALUE;
	count[5] = VALUE_MONDSCHATTEN;
};


func void usemoon()
{
	Npc_ChangeAttribute(self,ATR_MANA,HP_MONDSCHATTEN);
	printdebugnpc(PD_ITEM_MOBSI,"� �� ������ ����.");
};


instance ITFO_PLANTS_ORCHERB_01(C_ITEM)
{
	name = "������ ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_ORKBLATT;
	visual = "ItFo_Plants_OrcHerb_01.3ds";
	material = MAT_WOOD;
	on_state[0] = useorc;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_ORKBLATT;
	text[5] = NAME_VALUE;
	count[5] = VALUE_ORKBLATT;
};


func void useorc()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_ORKBLATT);
	printdebugnpc(PD_ITEM_MOBSI,"� �� ������ ����.");
};


instance ITFO_PLANTS_ORCHERB_02(C_ITEM)
{
	name = "������� ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_EICHENBLATT;
	visual = "ItFo_Plants_OakHerb.3ds";
	material = MAT_WOOD;
	on_state[0] = useorc2;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_EICHENBLATT;
	text[5] = NAME_VALUE;
	count[5] = VALUE_EICHENBLATT;
};


func void useorc2()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_EICHENBLATT);
	printdebugnpc(PD_ITEM_MOBSI,"� �� ������� ����.");
};


instance ITFO_PLANTS_MUSHROOM_01(C_ITEM)
{
	name = "������ ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_H�LLENPILZ;
	visual = "ItFo_Plants_mushroom_01.3ds";
	material = MAT_WOOD;
	on_state[0] = usemush;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_H�LLENPILZ;
	text[5] = NAME_VALUE;
	count[5] = VALUE_H�LLENPILZ;
};


func void usemush()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_H�LLENPILZ);
	printdebugnpc(PD_ITEM_MOBSI,"� �� ������ ����.");
};


instance ITFO_PLANTS_MUSHROOM_02(C_ITEM)
{
	name = "������� ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_SKLAVENBROT;
	visual = "ItFo_Plants_mushroom_02.3ds";
	material = MAT_WOOD;
	on_state[0] = usemush2;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_SKLAVENBROT;
	text[5] = NAME_VALUE;
	count[5] = VALUE_SKLAVENBROT;
};


func void usemush2()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_SKLAVENBROT);
	printdebugnpc(PD_ITEM_MOBSI,"� �� ������� ����.");
};


instance ITFO_PLANTS_HERB_01(C_ITEM)
{
	name = "�������� �����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_HEILKR�UTER1;
	visual = "ItFo_Plants_Herb_01.3ds";
	material = MAT_WOOD;
	on_state[0] = useplants1;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_HEILKR�UTER1;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HEILKR�UTER1;
};


func void useplants1()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_HEILKR�UTER1);
	printdebugnpc(PD_ITEM_MOBSI,"� �� �������� �����.");
};


instance ITFO_PLANTS_HERB_02(C_ITEM)
{
	name = "�������� ��������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_HEILKR�UTER2;
	visual = "ItFo_Plants_Herb_02.3ds";
	material = MAT_WOOD;
	on_state[0] = useplants2;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_HEILKR�UTER2;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HEILKR�UTER2;
};


func void useplants2()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_HEILKR�UTER2);
	printdebugnpc(PD_ITEM_MOBSI,"� �� �������� �����.");
};


instance ITFO_PLANTS_HERB_03(C_ITEM)
{
	name = "�������� ������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_HEILKR�UTER3;
	visual = "ItFo_Plants_Herb_03.3ds";
	material = MAT_WOOD;
	on_state[0] = useplants3;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_HEILKR�UTER3;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HEILKR�UTER3;
};


func void useplants3()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_HEILKR�UTER3);
	printdebugnpc(PD_ITEM_MOBSI,"� �� �������� �����.");
};


instance ITFO_PLANTS_BLOODWOOD_01(C_ITEM)
{
	name = "������ ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_BLUTBUCHE;
	visual = "ItFo_Plants_Bloodwood_01.3ds";
	material = MAT_WOOD;
	on_state[0] = useblood;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_MANA;
	count[1] = MANA_BLUTBUCHE;
	text[5] = NAME_VALUE;
	count[5] = VALUE_BLUTBUCHE;
};


func void useblood()
{
	Npc_ChangeAttribute(self,ATR_MANA,MANA_BLUTBUCHE);
	printdebugnpc(PD_ITEM_MOBSI,"� �� ������ ����.");
};


instance ITFO_PLANTS_TOWERWOOD_01(C_ITEM)
{
	name = "���� ������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItFo_Plants_Honey_01.3ds";
	material = MAT_WOOD;
	on_state[0] = usehoneycomb;
	scemename = "FOODHUGE";
	description = name;
	text[1] = "������ ���������� ���������������.";
	text[2] = "�������� ������� ���!";
	text[5] = NAME_VALUE;
	count[5] = 100;
};


func void usehoneycomb()
{
	if(HONEYCOMB == 0)
	{
		HONEYCOMB = 1;
		PrintScreen("������� ���: 1/5",-1,40,"FONT_OLD_20_WHITE.TGA",5);
		Log_CreateTopic("���� �������",LOG_NOTE);
		b_logentry("���� �������","� ����� ���� ������ � ����� ����������� �� ���� �� ���. �������� ������!");
		b_givexp(100);
	}
	else if(HONEYCOMB == 1)
	{
		HONEYCOMB = 2;
		PrintScreen("������� ���: 2/5",-1,40,"FONT_OLD_20_WHITE.TGA",5);
		b_logentry("���� �������","������ ������ ��������� ��� �������!");
		b_givexp(100);
	}
	else if(HONEYCOMB == 2)
	{
		HONEYCOMB = 3;
		PrintScreen("������� ���: 3/5",-1,40,"FONT_OLD_20_WHITE.TGA",5);
		b_logentry("���� �������","���� ������ ����. ����, ��� �� ��� ������ �����.");
		b_givexp(100);
	}
	else if(HONEYCOMB == 3)
	{
		HONEYCOMB = 4;
		PrintScreen("������� ���: 4/5",-1,40,"FONT_OLD_20_WHITE.TGA",5);
		b_logentry("���� �������","��������� �������. �����, ������ ���������� ������� � ������� ���� ����?");
		b_givexp(100);
	}
	else if(HONEYCOMB == 4)
	{
		HONEYCOMB = 5;
		PrintScreen("������� ���: 5/5",-1,40,"FONT_OLD_20_WHITE.TGA",5);
		PrintScreen("+10 ����� ��������",-1,47,"FONT_OLD_20_WHITE.TGA",5);
		hero.lp = hero.lp + 10;
		Snd_Play("BLO_WARN_A1");
		b_logentry("���� �������","�����, ���� ��� ����� ����������. � � ������ �������� ���� �������!");
	}
	else if(HONEYCOMB == 5)
	{
		b_givexp(100);
	};
};


instance ITFO_PLANTS_RAVENHERB_01(C_ITEM)
{
	name = "������� �����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_RABENKRAUT;
	visual = "ItFo_Plants_RavenHerb_01.3ds";
	material = MAT_WOOD;
	on_state[0] = useraven;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_MANA;
	count[1] = MANA_RABENKRAUT;
	text[5] = NAME_VALUE;
	count[5] = VALUE_RABENKRAUT;
};


func void useraven()
{
	Npc_ChangeAttribute(self,ATR_MANA,MANA_RABENKRAUT);
	printdebugnpc(PD_ITEM_MOBSI,"� �� ������� �����.");
};


instance ITFO_PLANTS_RAVENHERB_02(C_ITEM)
{
	name = "������ ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_DUNKELKRAUT;
	visual = "ItFo_Plants_DarkHerb.3ds";
	material = MAT_WOOD;
	on_state[0] = useraven2;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_MANA;
	count[1] = MANA_DUNKELKRAUT;
	text[5] = NAME_VALUE;
	count[5] = VALUE_DUNKELKRAUT;
};


func void useraven2()
{
	Npc_ChangeAttribute(self,ATR_MANA,MANA_DUNKELKRAUT);
	printdebugnpc(PD_ITEM_MOBSI,"� �� ������ ����.");
};


instance ITFO_PLANTS_STONEROOT_01(C_ITEM)
{
	name = "�������� ������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_STEIMWURZEL;
	visual = "ItFo_Plants_Stoneroot_01.3ds";
	material = MAT_WOOD;
	on_state[0] = useroot;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_MANA;
	count[1] = MANA_STEINWURZEL;
	text[5] = NAME_VALUE;
	count[5] = VALUE_STEIMWURZEL;
};


func void useroot()
{
	Npc_ChangeAttribute(self,ATR_MANA,MANA_STEINWURZEL);
	printdebugnpc(PD_ITEM_MOBSI,"� �� �������� ������.");
};


instance ITFO_PLANTS_STONEROOT_02(C_ITEM)
{
	name = "�������� ������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_DRACHENWURZEL;
	visual = "ItFo_Plants_Dragonroot.3ds";
	material = MAT_WOOD;
	on_state[0] = useroot2;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_MANA;
	count[1] = MANA_DRACHENWURZEL;
	text[5] = NAME_VALUE;
	count[5] = VALUE_DRACHENWURZEL;
};


func void useroot2()
{
	Npc_ChangeAttribute(self,ATR_MANA,MANA_DRACHENWURZEL);
	printdebugnpc(PD_ITEM_MOBSI,"� �� �������� ������.");
};


instance ITFO_PLANTS_TROLLBERRYS_01(C_ITEM)
{
	name = "����� �������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_TROLLKIRSCHE;
	visual = "ItFo_Plants_Trollberrys_01.3ds";
	material = MAT_WOOD;
	on_state[0] = usetrollberrys;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_TROLLKIRSCHE;
	text[5] = NAME_VALUE;
	count[5] = VALUE_TROLLKIRSCHE;
};


func void usetrollberrys()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_TROLLKIRSCHE);
	printdebugnpc(PD_ITEM_MOBSI,"� �� ����� �������.");
};

instance ITFO_PLANTS_DEADLEAF(C_ITEM)
{
	name = "������� ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItFo_Plants_Deadleaf.3ds";
	material = MAT_WOOD;
	on_state[0] = usedeadleaf;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_MANA;
	count[1] = 35;
	text[5] = NAME_VALUE;
	count[5] = 50;
};


func void usedeadleaf()
{
	Npc_ChangeAttribute(self,ATR_MANA,35);
};

