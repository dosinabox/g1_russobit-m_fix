
instance MORDRAGSRING(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 250;
	visual = "ItMi_Ring_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_mordragsring;
	on_unequip = unequip_mordragsring;
	description = "������ ��������";
	text[2] = NAME_BONUS_DEX;
	count[2] = 5;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_mordragsring()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,5);
};

func void unequip_mordragsring()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-5);
};


instance SPECIALJOINT(C_ITEM)
{
	name = "���������� ��� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_JOINT3 * 10;
	visual = "ItMi_Joint_01.3ds";
	material = MAT_WOOD;
	scemename = "JOINT";
	on_state[0] = usespecialjoint;
	text[0] = "���� �������� ���������";
	text[1] = "������� �������, ��� ������� '��� �����'.";
	text[3] = "�� ����������� ��� ���� ����� �����!";
	text[5] = NAME_VALUE;
	count[5] = VALUE_JOINT3 * 10;
};


func void usespecialjoint()
{
	AI_StartState(self,zs_magicsleep,1,"");
};


instance ITAT_DAMLURKER_01(C_ITEM)
{
	name = "����� ����� � �������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_LURKERKLAUE;
	visual = "ItAt_Lurker_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_LURKERKLAUE;
};

instance ITWROMMAP(C_ITEM)
{
	name = "�����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWrOMMap.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = useommap;
	description = "����� ������ � ������ �����";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useommap()
{
	var int ndocid;
	ndocid = Doc_CreateMap();
	Doc_SetLevel(ndocid,"WORLD.ZEN");
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Map_OldMine.tga",1);
	Doc_Show(ndocid);
};


instance ALTESSCHWERTVM(C_ITEM)
{
	name = "������ ���";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 12;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	damagetotal = 12;
	damagetype = DAM_EDGE;
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

instance ALTESSCHWERT(C_ITEM)
{
	name = "������ ���";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 12;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	damagetotal = 12;
	damagetype = DAM_EDGE;
	visual = "ItMw_1H_Sword_Old_01.3DS";
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance JACKALSSWORD(C_ITEM)
{
	name = "��� ������";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	owner = grd_201_jackal;
	value = 27;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	damagetotal = 3;
	damagetype = DAM_EDGE;
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

instance KDW_AMULETT(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 100;
	visual = "ItMi_Amulet_Foki_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_kdw_amulett;
	on_unequip = unequip_kdw_amulett;
	description = "������ ���������� ����� ����";
	text[2] = NAME_BONUS_MANAMAX;
	count[2] = 5;
	text[5] = NAME_VALUE;
	count[5] = value;
};

func void equip_kdw_amulett()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 5;
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 5;
};

func void unequip_kdw_amulett()
{
	if(self.attribute[ATR_MANA] >= 5)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 5;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 5;
};


instance CRONOS_BRIEF(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usecronosbrief;
	scemename = "MAP";
	description = "������ ������� � ����� ����";
};


func void usecronosbrief()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters2.TGA",0);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"������� ������ ��������,");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLines(ndocid,0,"�������, ��������� ������ ����� ����� ����, ������ ��� �� �������� ��� � ���������. � �������� �������, ��� �� ���������� ���� ���������� ���������� ����������� ������������ ����� ������� ������� � ������ ������� � ���������� ������. ��� ��� �� ���������� � ��������� ����, �� ����� ���������� ������������ ����� ������ ������, �������� � ����� ���������. ������� ��� ��� � ��� ��� ����� �����, ���� ������ ������ �� ����� �������������� ������������� ������ �����.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"��� ������ ������� ������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"������, ��������� ����.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance NEKS_AMULETT(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 50;
	visual = "ItMi_Amulet_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_schutzamulett_nek;
	on_unequip = unequip_schutzamulett_nek;
	description = "������ ������� ���������";
	text[1] = "�� �������� ������� ������ ��� '���'";
	text[2] = NAME_PROT_EDGE;
	count[2] = 5;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_schutzamulett_nek()
{
	self.protection[PROT_EDGE] += 5;
	self.protection[PROT_BLUNT] += 5;
};

func void unequip_schutzamulett_nek()
{
	self.protection[PROT_EDGE] -= 5;
	self.protection[PROT_BLUNT] -= 5;
};


instance RECRUITJOINT(C_ITEM)
{
	name = "�������� ��� ���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	hp = 10;
	hp_max = 10;
	weight = 1;
	value = 1;
	visual = "ItMiJoint.3ds";
	material = MAT_WOOD;
	scemename = "JOINT";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance HEALTHWATER(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1500;
	visual = "ItFo_Potion_Yberion.3ds";
	material = MAT_GLAS;
	on_state[0] = usehealthwater;
	scemename = "POTIONFAST";
	description = "�������� ����� �������";
	text[1] = NAME_BONUS_MANAMAX;
	count[1] = 10;
	text[2] = NAME_BONUS_HPMAX;
	count[2] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

func void usehealthwater()
{
	Npc_ChangeAttribute(self,ATR_MANA_MAX,10);
	Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,10);
	Npc_ChangeAttribute(self,ATR_MANA,10);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,10);
	PrintScreen("����. ���� � ��������� ���� +10",-1,-1,"FONT_OLD_20_WHITE.TGA",_TIME_MESSAGE_RAISEATTRIBUTE);
};

instance THELIST(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ITAR_SCROLL_01_EG.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = usethelist;
	description = name;
	text[0] = "��, ����� ������ �����, ����� � ���� ������";
	text[1] = "��� ����������� ��� ������ ���������.";
};


func void usethelist()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"������");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"20 ������� ����� - �� ��������������!");
	Doc_PrintLine(ndocid,0,"25-30 �����");
	Doc_PrintLine(ndocid,0,"10 ������ ����");
	Doc_PrintLine(ndocid,0,"1 ������");
	Doc_PrintLine(ndocid,0,"1 �����");
	Doc_PrintLine(ndocid,0,"5 ����� + 3 �������");
	Doc_PrintLines(ndocid,0,"� ����� ��������� - ��� �� ������ ���� �� ���� �����!");
	Doc_PrintLine(ndocid,0,"���� ������ ���� ��������� �����������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"��");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance THELISTNC(C_ITEM)
{
	name = "������ (�����������)";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ITAR_SCROLL_01_EG.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = usethelistnc;
	description = name;
	text[0] = "��, ����� ������ �����, ����� � ���� ������";
	text[1] = "��� ����������� ��� ������ ���������.";
	text[2] = "(���� ������� � ���� ��� ��������� �������.";
	text[3] = "�������� �������� ��������!)";
};


func void usethelistnc()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"������");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"20 ������� ����� - �� ��������������!");
	Doc_PrintLine(ndocid,0,"25-30 �����");
	Doc_PrintLine(ndocid,0,"10 ������ ����");
	Doc_PrintLine(ndocid,0,"1 ������");
	Doc_PrintLine(ndocid,0,"1 �����");
	Doc_PrintLine(ndocid,0,"5 ����� + 3 �������");
	Doc_PrintLines(ndocid,0,"� ����� ��������� - ��� �� ������ ���� �� ���� �����!");
	Doc_PrintLine(ndocid,0,"���� ������ ���� ��������� �����������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"��");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"��, ���� ���-��� ���...");
	Doc_PrintLine(ndocid,0,"30 ������� ����");
	Doc_PrintLine(ndocid,0,"5 ������� ����");
	Doc_PrintLine(ndocid,0,"25 ������� ��������");
	Doc_PrintLine(ndocid,0,"��������� �����");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance LARES_RING(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 50;
	visual = "ItMi_Ring_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_lares_ring;
	on_unequip = unequip_lares_ring;
	description = "������ �����";
	text[2] = NAME_BONUS_STR;
	count[2] = 3;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_lares_ring()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,3);
};

func void unequip_lares_ring()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-3);
};


instance HEILTRANK(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 15;
	visual = "ItFo_Potion_Health_04.3ds";
	material = MAT_GLAS;
	on_state[0] = useheiltrank;
	scemename = "POTIONFAST";
	description = "����� �������� �������";
	text[1] = NAME_BONUS_HP;
	count[1] = 30;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useheiltrank()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,30);
};


instance SPECIALWATER(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItFo_Potion_Yberion.3ds";
	material = MAT_GLAS;
	description = "������ ����� �������";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance KALOMSRECIPE(C_ITEM)
{
	name = "������ ������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 60;
	visual = "HP0RECIPE.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ ������";
	//text[0] = "������ ��������� �����";
	text[1] = NAME_BONUS_HP;
	count[1] = 30;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = use_kalomsrecipe;
};


func void use_kalomsrecipe_old()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters2.TGA",0);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_PrintLine(ndocid,0,"������ �� �����");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"����� �� ��� ��� ��. ������ ��� ���� ����. ����� ��� ������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLines(ndocid,0,"������ �����, ��� ����� ��������� ��������.");
	Doc_PrintLine(ndocid,0,"- �����");
	Doc_Show(ndocid);
};

func void use_kalomsrecipe()
{
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("���������� �������� ������ �������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		var int ndocid;
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"letters2.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"����� �������� ������� ������ ���� �����, ��� ������� �������� ������. ������ ����� �������� �� ������, ���������� � �������� � ������ ����. �������� �� �����. ��� ����� �� ������� ������� �������� ��������� �����, �� ������ � ������������� � �������� ��� ������������ ������: ������� �� ����������� ������������ ��� ������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"- �����");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(HP0RECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("�������","������ ������ ����� �������� ������� (��������� ���� +30). ���������: ������ ���� (1).");
			HP0RECIPE = TRUE;
		};
	};
};


instance ITWRWORLDMAP(C_ITEM)
{
	name = "�����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 50;
	visual = "ItWrWorldMap.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = useworldmap;
	description = "����� �������";
	text[0] = "� ���������, ����� �� �������";
	text[1] = "������� �� ���-������.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useworldmap()
{
	var int ndocid;
	ndocid = Doc_CreateMap();
	Doc_SetLevel(ndocid,"WORLD.ZEN");
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Map_World.tga",1);
	Doc_Show(ndocid);
};


instance ITWROCMAP(C_ITEM)
{
	name = "�����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 40;
	visual = "ItWrOCMap.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = useocmap;
	description = "����� ������� ������";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useocmap()
{
	var int ndocid;
	ndocid = Doc_CreateMap();
	//Doc_SetLevel(ndocid,"WORLD.ZEN");
	//Doc_MapCoordinates("WORLD.ZEN", -11975, -9675, 0, 0, 11775, 7875, 687, 511);
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Map_OldCamp.tga",1);
	Doc_Show(ndocid);
};


instance ITWRNCMAP(C_ITEM)
{
	name = "�����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 40;
	visual = "ItWrNCMap.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = usencmap;
	description = "����� ������ ������";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void usencmap()
{
	var int ndocid;
	ndocid = Doc_CreateMap();
	//Doc_SetLevel(ndocid,"WORLD.ZEN");
	//Doc_MapCoordinates("WORLD.ZEN", -64875, -1775, 0, 0, -41125, 15775, 687, 511);
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Map_NewCamp.tga",1);
	Doc_Show(ndocid);
};


instance ITWRPSIMAP(C_ITEM)
{
	name = "�����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 40;
	visual = "ItWrPsiMap.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = usepsimap;
	description = "����� ��������� ������";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void usepsimap()
{
	var int ndocid;
	ndocid = Doc_CreateMap();
	//Doc_SetLevel(ndocid,"WORLD.ZEN");
	//Doc_MapCoordinates("WORLD.ZEN", 33750, -21500, 0, 0, 67050, 2600, 687, 511);
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Map_PSICamp.tga",1);
	Doc_Show(ndocid);
};


instance ITWRPINUP(C_ITEM)
{
	name = "��������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 60;
	visual = "ItWrPinup.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = usepinup;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void usepinup()
{
	var int ndocid;
	ndocid = Doc_CreateMap();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Map_PinUp.tga",1);
	Doc_Show(ndocid);
};


instance ITWRDIEVERURTEILTEN(C_ITEM)
{
	name = "�������������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWrBook.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_FIRE_LETTER_01(C_ITEM)
{
	name = "������������ ������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usefireletter;
	scemename = "MAPSEALED";
	description = "������������ ������ ����� ����";
	text[1] = "�� ���������!";
};


func void usefireletter()
{
	var int ndocid;
	CreateInvItem(hero,itwr_fire_letter_02);
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters_fire.TGA",0);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"�������������� ������ �������,");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLines(ndocid,0,"���� ���������� ������ ������� ������������ ����� �����. �� �������������� � � ���� �������� �������� ��� � ����� �������. �������� ������������ ����� ������� ���������. ��� �������� ����� �������� � �������, �������� ������ ����������� � ����� �����. ��� ���������� ��������� � ��������� ������ �� ����� �����, ����� �� ��������, ����� ��� �������� �� ����� � ������ �������� ��� ��������. ����� ��� ������ ��������, �� ������� ������������������ � ���, ��� �� ������ �������� ����� ������� ���� ����, ������ �� ������. ���� ������ �������� ��� �������� �������������. �� ����������� �������� ��� ���, ��� ������ ������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"�� ������� ��� �����!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITWR_FIRE_LETTER_02(C_ITEM)
{
	name = "�������� ������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWrScroll.3DS";
	material = MAT_LEATHER;
	on_state[0] = usefireletter2;
	scemename = "MAP";
	description = "������ ����� ����";
};


func void usefireletter2()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters_fire.TGA",0);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"�������������� ������ �������,");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLines(ndocid,0,"���� ���������� ������ ������� ������������ ����� �����. �� �������������� � � ���� �������� �������� ��� � ����� �������. �������� ������������ ����� ������� ���������. ��� �������� ����� �������� � �������, �������� ������ ����������� � ����� �����. ��� ���������� ��������� � ��������� ������ �� ����� �����, ����� �� ��������, ����� ��� �������� �� ����� � ������ �������� ��� ��������. ����� ��� ������ ��������, �� ������� ������������������ � ���, ��� �� ������ �������� ����� ������� ���� ����, ������ �� ������. ���� ������ �������� ��� �������� �������������. �� ����������� �������� ��� ���, ��� ������ ������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"�� ������� ��� �����!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITKE_GOMEZ_01(C_ITEM)
{
	name = "���� ������";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "��������� ������ ������.";
};

instance ITKEY_RB_01(C_ITEM)
{
	name = "���� �����";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "��������� ������ �����.";
};

instance ITKEY_OB_SMITH_01(C_ITEM)
{
	name = "�������� ����";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "��������� ����� ������ � �������.";
};

instance ITKE_STORAGE_01(C_ITEM)
{
	name = "���� �� ������";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "��������� ����� ������";
	text[1] = "� �������� ����� �������.";
};

instance ITKE_OM_01(C_ITEM)
{
	name = "���� �� �������";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "����� �������";
	text[1] = "������� �������� ��� ������";
	text[2] = "������ �����";
};

instance ITKE_OM_02(C_ITEM)
{
	name = "���� �� �������";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "��������� ������ ������";
	text[1] = "� ������ �����.";
};

instance ITKE_OM_03(C_ITEM)
{
	name = "���� �� �������";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "��������� �������";
	text[1] = "�� ������ � ������ �����.";
};

instance ITKE_OM_04(C_ITEM)
{
	name = "���� �� �������";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "����� ��������";
	text[1] = "������ �������� ������";
};

instance ITFO_OM_BEER_01(C_ITEM)
{
	name = "������� ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = 30;
	visual = "ItFo_Beer_02.3ds";
	material = MAT_GLAS;
	on_state[0] = usestarkbeer;
	scemename = "POTION";
	description = name;
	text[1] = NAME_BONUS_HPMAX;
	count[1] = 1;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void usestarkbeer()
{
	b_raiseattribute(ATR_HITPOINTS_MAX,1);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,1);
	if(Npc_IsPlayer(self))
	{
		if(STARKBEER == 0)
		{
			STARKBEER = 1;
		}
		else if(STARKBEER == 1)
		{
			STARKBEER = 2;
		}
		else if(STARKBEER == 2)
		{
			STARKBEER = 3;
		}
		else if(STARKBEER == 3)
		{
			STARKBEER = 4;
		}
		else if(STARKBEER == 4)
		{
			STARKBEER = 5;
			Mdl_ApplyOverlayMdsTimed(self,"HUMANS_DRUNKEN.MDS",60000);
		};
	};
};


var int riddle1;
var int riddle2;
var int riddle3;
var int riddle4;
var int riddle5;
var int riddle6;

instance THERIDDLE1(C_ITEM)
{
	name = "������ �����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ITWR_BOOK_RIDDLE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "��������";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usetheriddle1;
};


func void usetheriddle1()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Riddle_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Riddle_R.tga",0);
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"��������");
	Doc_PrintLine(ndocid,0,"-----------");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"���, ��� ����� ���������� �� ���� ������ �������� � ��������� ������� ������, ������ ������, ��� ������ �������� ���� ����. ����� ���, �� ����� �������� ��������� ���, ��� ��������� ��� � ���� �����, � �������, ��� �� ����� ������� ������ ���������.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"������ �������������� ���� ������� ���� �������, ������ ��� ������ ���-�� �����.");
	Doc_Show(ndocid);
	if(RIDDLE1 == FALSE)
	{
		Log_CreateTopic(THERIDDLE_LOG,LOG_MISSION);
		Log_SetTopicStatus(THERIDDLE_LOG,LOG_RUNNING);
		b_logentry(THERIDDLE_LOG,"� ���� � �������-���� � �������� ����� ���� ����� �������� �����. '��������'! ��� �������� ���������� ����. � ��� ��������, ��� ������������ ����� ������ ���� ���: ...������ �������������� ���� ������� ���� �������, ������ ��� ������ ���-�� �����... ��... � ��� ������ �� �������, ��, ����� ����, ����� ���-������ ����������.");
		//Wld_InsertItem(theriddle2,"FP_RIDD_2");
		Snd_Play("AMBIENTTONE_03_DARK");
		RIDDLE1 = TRUE;
		RIDDLE1INSERT = TRUE;
	};
};


instance THERIDDLE2(C_ITEM)
{
	name = "������ �����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ITWR_BOOK_RIDDLE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "�������� 2";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usetheriddle2;
};


func void usetheriddle2()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Riddle_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Riddle_R.tga",0);
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"��������");
	Doc_PrintLine(ndocid,0,"-----------");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"� ���������� ������� �������� ��������� ����������� ������ ���� �������. �� ���� � ���� � ����� ��� ������ ���, �� � ����� ���� �� ����. ��� �������� ���� �� ������� ����.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"��� ���� ���������, ����� ������ ������, ���� ���������� ������ �������.");
	Doc_Show(ndocid);
	if(RIDDLE2 == FALSE)
	{
		b_givexp(300);
		b_logentry(THERIDDLE_LOG,"� ����� ������ �����, �� ������� ����� ����� '��������'. ��� ��������� �� ����� ����������... ��� ���� ���������, ����� ������ ������, ���� ���������� ������ �������...");
		Snd_Play("FoundRiddlersBook");
		//Wld_InsertItem(theriddle3,"FP_SLEEP_OW_BLOODFLY_01_02");
		RIDDLE2 = TRUE;
		RIDDLE2INSERT = TRUE;
	};
};


instance THERIDDLE3(C_ITEM)
{
	name = "������ �����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ITWR_BOOK_RIDDLE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "�������� 3";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usetheriddle3;
};


func void usetheriddle3()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Riddle_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Riddle_R.tga",0);
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"��������");
	Doc_PrintLine(ndocid,0,"-----------");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"�, ���� ������� ������. �������� ��, ����� ����� �������, ��� �, �����������, ������� ��� ����. ��� ����� ����� �������� ���, ������� �������� ����� ��������.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"����� ����� ��������� ����� ����� � �� ������ ������ ����.");
	Doc_Show(ndocid);
	if(RIDDLE3 == FALSE)
	{
		b_givexp(500);
		b_logentry(THERIDDLE_LOG,"� ����� ������ �����. �������, � ������� ��������, ��� ����� ������� �� �����... ����� ����� ��������� ����� ����� � �� ������ ������ ����...");
		Snd_Play("FoundRiddlersBook");
		//Wld_InsertItem(theriddle4,"FP_SLEEP_OW_LURKER_NC_LAKE_02");
		RIDDLE3 = TRUE;
		RIDDLE3INSERT = TRUE;
	};
};


instance THERIDDLE4(C_ITEM)
{
	name = "������ �����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ITWR_BOOK_RIDDLE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "�������� 4";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usetheriddle4;
};


func void usetheriddle4()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Riddle_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Riddle_R.tga",0);
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"��������");
	Doc_PrintLine(ndocid,0,"-----------");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"� ���� �� ���� ��������� �����-������ ������ �������� ��������. ������ ��� ������� � ������ ����. ������ ����� ��� ������ ������� ����������, � ����� ����� � ��� ������.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"������ ���� ���, ��� ��� �����-�� �� �����.");
	Doc_Show(ndocid);
	if(RIDDLE4 == FALSE)
	{
		b_givexp(700);
		b_logentry(THERIDDLE_LOG,"����� ���������. � ����� ������ � �������� ���� ������� �������� ��� ������... ������ ���� ���, ��� ��� �����-�� �� �����...");
		Snd_Play("FoundRiddlersBook");
		//Wld_InsertItem(theriddle5,"FP_RIDD_4");
		RIDDLE4 = TRUE;
		RIDDLE4INSERT = TRUE;
	};
};


instance THERIDDLE5(C_ITEM)
{
	name = "������ �����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ITWR_BOOK_RIDDLE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "�������� 5";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usetheriddle5;
};


func void usetheriddle5()
{
	var int ndocid;
	var C_NPC riddler;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Riddle_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Riddle_R.tga",0);
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"��������");
	Doc_PrintLine(ndocid,0,"-----------");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"�� � �� ���� �������� �� ���� ���� ����. � ������ ���� ��������� ����, �������� �� ���, � ���������, ������� ������ ����. �������, ��� �������� �� ��������� �������...");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"�� ������� ���� ���, ��� ��� ��������.");
	Doc_Show(ndocid);
	if(RIDDLE5 == FALSE)
	{
		b_givexp(850);
		b_logentry(THERIDDLE_LOG,"�������, ��� ��������� �����. ���������, � ��� ��� ��������� �����������... �� ������� ���� ���, ��� ��� ��������.");
		Snd_Play("FoundRiddlersBook");
		Wld_InsertNpc(bau_940_riddler,"");
		riddler = Hlp_GetNpc(bau_940_riddler);
		Npc_ChangeAttribute(riddler,ATR_HITPOINTS,-riddler.attribute[ATR_HITPOINTS_MAX]);
		//RIDDLE5 = TRUE;
		//RIDDLE5INSERT = TRUE;
	};
};


instance THERIDDLE6(C_ITEM)
{
	name = "������ �����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ITWR_BOOK_RIDDLE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "�������� 6";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usetheriddle6;
};


func void usetheriddle6()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Riddle_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Riddle_R_Blood.tga",0);
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_Show(ndocid);
	if(RIDDLE6 == FALSE)
	{
		b_givexp(1000);
		b_logentry(THERIDDLE_LOG,"������������ ����� �����. ��� ����� �����-�� ������. ���-�� ��������� ��� � ����� ������������ ���. ����� �� ������� �� �������� �� � ��� ������� ������ �����. �� �� �������� �� ���� ���� �����, ��� ������ ������ � ���.");
		Log_SetTopicStatus(THERIDDLE_LOG,LOG_SUCCESS);
		Snd_Play("FoundRiddler");
		Wld_InsertNpc(skeletonmage,"OW_FOGDUNGEON_36_MOVEMENT");
		Wld_InsertNpc(skeletonmage,"OW_FOGDUNGEON_37");
		Wld_InsertNpc(skeleton,"OW_FOGDUNGEON_36_MOVEMENT");
		Wld_InsertNpc(skeleton,"OW_FOGDUNGEON_36_MOVEMENT2");
		Wld_InsertNpc(skeletonscout,"OW_FOGDUNGEON_36_MOVEMENT2");
		if(Npc_GetDistToWP(hero,"OW_FOGDUNGEON_36_MOVEMENT2") < 8000)
		{
			Wld_SpawnNpcRange(hero,skeletonwarrior,2,30);
		};
		RIDDLE6 = TRUE;
	};
};

