
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
	count[4] = VALUE_JOINT3 * 10;
};


func void usespecialjoint()
{
	AI_StartState(self,zs_magicsleep,1,"");
};


instance ITAT_DAMLURKER_01(C_ITEM)
{
	name = "����� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_LURKERKLAUE;
	visual = "ItAt_Lurker_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_VALUE;
	count[4] = VALUE_LURKERKLAUE * 2;
};

instance ITWROMMAP(C_ITEM)
{
	name = "�����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 30;
	visual = "ItWr_Map_01.3DS";
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
	visual = "ItMi_Amulet_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = "������ ���������� ����� ����";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance CRONOS_BRIEF(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
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
	Doc_SetPage(ndocid,0,"letters.TGA",0);
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
	text[1] = "�� �������� ������� ������� ������ ��� '���'";
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
	name = "�������� ����� ��� ��������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItFo_Potion_Health_01.3ds";
	material = MAT_GLAS;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance THELIST(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItWr_Scroll_01.3ds";
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
	visual = "ItWr_Scroll_01.3ds";
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
	flags = ITEM_RING || ITEM_MISSION;
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
	flags = ITEM_MULTI || ITEM_MISSION;
	value = 100;
	visual = "ItFo_Potion_Health_01.3ds";
	material = MAT_GLAS;
	on_state[0] = useheiltrank;
	scemename = "POTION";
	description = "����� �������� �������";
	text[2] = NAME_BONUS_HP;
	count[2] = 30;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useheiltrank()
{
	printdebugnpc(PD_ITEM_MOBSI,"UseHealthPotion");
	Npc_ChangeAttribute(self,ATR_HITPOINTS,30);
	printdebugnpc(PD_ITEM_MOBSI,"� ����� �������� �����.");
};


instance SPECIALWATER(C_ITEM)
{
	name = "��������� ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItFoFlaskHealth.3ds";
	material = MAT_GLAS;
	scemename = "POTION";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance KALOMSRECIPE(C_ITEM)
{
	name = "������ ������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	text[0] = "������ ��������� �����";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = use_kalomsrecipe;
};


func void use_kalomsrecipe()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"������ �� �����");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"����� �� ��� ��� ��. ������ ��� ���� ����. ����� ��� ������.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"������ �����, ��� ����� ��������� ��������.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"- �����");
	Doc_Show(ndocid);
};


instance ITWRWORLDMAP(C_ITEM)
{
	name = "����� �������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = useworldmap;
	description = name;
	text[0] = "� ���������, ����� �� ������� �������";
	text[1] = "�� ���-������.";
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
	visual = "ItWr_Map_01.3DS";
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
	visual = "ItWr_Map_01.3DS";
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
	visual = "ItWr_Map_01.3DS";
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
	visual = "ItWr_Scroll_01.3DS";
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
	description = "������ ����� ����";
	text[1] = "�� ���������!";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void usefireletter()
{
	var int ndocid;
	CreateInvItem(hero,itwr_fire_letter_02);
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"�������������� ������");
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
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usefireletter2;
	scemename = "MAP";
	description = "������ ����� ����";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void usefireletter2()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"�������������� ������ �������");
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
	text[0] = "��� ���� �� ������� ������� ������.";
	text[1] = "�� ��������� ������ �������� � ����� �������.";
	text[5] = NAME_VALUE;
	count[5] = value;
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

instance ITKE_OB_SMITH_01(C_ITEM)
{
	name = "�������� ����";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "�� ��������� ����� � �������.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_STORAGE_01(C_ITEM)
{
	name = "����";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "��������� ������� �����";
	text[1] = "� �������� ����� �������.";
	text[5] = NAME_VALUE;
	count[5] = value;
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
	visual = "ItFo_Beer_01.3ds";
	material = MAT_GLAS;
	on_state[0] = usestarkbeer;
	scemename = "POTION";
	description = name;
	text[0] = NAME_BONUS_HP;
	count[0] = 6;
	text[3] = "";
	text[4] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void usestarkbeer()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,6);
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
	visual = "ItWr_Book_02_03.3ds";
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
	Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
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
	Doc_PrintLines(ndocid,1,"������ �������������� ���� ������� ����, ������ ��� ������ ���-�� �����.");
	Doc_Show(ndocid);
	if(RIDDLE1 == FALSE)
	{
		Log_CreateTopic(THERIDDLE_LOG,LOG_MISSION);
		Log_SetTopicStatus(THERIDDLE_LOG,LOG_RUNNING);
		b_logentry(THERIDDLE_LOG,"� ���� � �������-���� � �������� ����� ���� ����� �������� �����. '��������'! ��� �������� ���������� ����. � ��� ��������, ��� ������������ ����� ������ ���� ���: ...������ �������������� ���� ������� ����, ������ ��� ������ ���-�� �����... ��... � ��� ������ �� �������, ��, ����� ����, ����� ���-������ ����������.");
		Wld_InsertItem(theriddle2,"CASTLE_TOWER_TOP");
		RIDDLE1 = TRUE;
	};
};


instance THERIDDLE2(C_ITEM)
{
	name = "������ �����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_02_03.3ds";
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
	Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
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
		Wld_InsertItem(theriddle3,"FP_SLEEP_OW_BLOODFLY_01_02");
		RIDDLE2 = TRUE;
	};
};


instance THERIDDLE3(C_ITEM)
{
	name = "������ �����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_02_03.3ds";
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
	Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
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
		Wld_InsertItem(theriddle4,"FP_SLEEP_OW_LURKER_NC_LAKE_02");
		RIDDLE3 = TRUE;
	};
};


instance THERIDDLE4(C_ITEM)
{
	name = "������ �����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_02_03.3ds";
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
	Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
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
		Wld_InsertItem(theriddle5,"LOCATION_25_01");
		RIDDLE4 = TRUE;
	};
};


instance THERIDDLE5(C_ITEM)
{
	name = "������ �����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_02_03.3ds";
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
	Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
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
		RIDDLE5 = TRUE;
	};
};


instance THERIDDLE6(C_ITEM)
{
	name = "������ �����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_02_03.3ds";
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
	Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"��������");
	Doc_PrintLine(ndocid,0,"-----------");
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
		b_logentry(THERIDDLE_LOG,"������������ ����� �����. ��� ����� �����-�� ������. ��� ��������� ��� � ����� ������������ ���. ����� �� ������� �� �������� �� � ��� ������� ������ �����. �� �� �������� �� ���� ���� �����, ��� ������ ������ � ���.");
		Log_SetTopicStatus(THERIDDLE_LOG,LOG_SUCCESS);
		Snd_Play("FoundRiddler");
		Wld_InsertNpc(skeletonmage,"OW_FOGDUNGEON_36_MOVEMENT");
		Wld_InsertNpc(skeleton,"OW_FOGDUNGEON_36_MOVEMENT");
		Wld_InsertNpc(skeletonwarrior,"OW_FOGDUNGEON_36_MOVEMENT");
		Wld_InsertNpc(skeleton,"OW_FOGDUNGEON_36_MOVEMENT2");
		Wld_InsertNpc(skeletonscout,"OW_FOGDUNGEON_36_MOVEMENT2");
		Wld_InsertNpc(skeletonwarrior,"OW_FOGDUNGEON_37");
		Wld_InsertNpc(skeletonmage,"OW_FOGDUNGEON_37");
		RIDDLE6 = TRUE;
	};
};

