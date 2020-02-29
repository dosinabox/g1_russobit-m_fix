
instance ORKPARCHMENTONE(C_ITEM)
{
	name = "������� ������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	value = 3;
	visual = "ItWr_Scroll_02.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	text[0] = "�������, �� ������� ������ ��������.";
	text[1] = "�������� ����� ������ ����� ������";
	text[2] = "�� ����, ���������� �� ������ ������.";
	text[3] = "";
};

instance ORKPARCHMENTTWO(C_ITEM)
{
	name = "������� ������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	value = 3;
	visual = "ItWr_Scroll_02.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	text[0] = "�������, � ����� ������";
	text[1] = "�������� ������� ��������.";
	text[2] = "��� �������� ����� ������";
	text[3] = "�� ����, ���������� �� ������ ������.";
};

instance ITKE_PSI_KALOM_01(C_ITEM)
{
	name = "����";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = "���� �� �����������";
	text[0] = "��������� ������ � ������������ �����������";
	text[1] = "��������� ������.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWRFOCIMAP(C_ITEM)
{
	name = "����� ��������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 15;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = usefocimap;
	description = name;
	text[0] = "������� ����������� ��������";
	text[1] = "�����, � ������� ��������� ���� ��������,";
	text[2] = "������� �������������� ��� ��������";
	text[3] = "����������� �������. ����� ����� ������,";
	text[4] = "�, ��������, ������ ������� ���������";
	text[5] = "� ������ ������.";
};


func void usefocimap()
{
	var int ndocid;
	ndocid = Doc_CreateMap();
	Doc_SetLevel(ndocid,"WORLD.ZEN");
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Map_World_Foki.tga",1);
	Doc_Show(ndocid);
};


instance ITWR_TROLL_01(C_ITEM)
{
	name = "�������� ��������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = usetroll;
	description = name;
	text[1] = "������ ������� ��������. ������ �� ���";
	text[2] = "���� ���������.";
	text[3] = "�������, �� �������� ��� ���������";
	text[4] = "�� �������.";
};


func void usetroll()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_PrintLine(ndocid,0,"���� 169.");
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"������� � ���� ����� ��� ���������. � ��� ����, ���� ������� ���. � ���������� ���, ����� ����� ������. ��� ����� �� ��������� ���� ����� ������ ������, � ������ ����������� �� ����, ��� �� �����.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"�� ������ � ���� ���� ��������� ������. � ������� ��� � ������ �������� �� ��������. 50 ������� �����, �������, ������� ����, �� �� ���� �����.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"������� � ���� ������.");
	Doc_Show(ndocid);
};


instance FOCUS_2(C_ITEM)
{
	name = "������ �� ������ ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	hp = 1;
	hp_max = 1;
	weight = 1;
	value = 1;
	visual = "ItMi_Focus_01.3ds";
	material = MAT_STONE;
	description = name;
	text[1] = "���� �� ���� ��������, ������� ��������������";
	text[2] = "��� �������� ����������� �������.";
};

instance ITKE_BERG_01(C_ITEM)
{
	name = "���� �� �������";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "������ ����";
	text[1] = "�� �������";
	text[2] = "� ������ �����.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_URKUNDE_01(C_ITEM)
{
	name = "���������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 15;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = useurkunde;
	description = "���������";
	text[0] = "�������� ����� ���������";
	text[1] = "����� ������� � ����� ������";
	text[2] = "�� ���� � ����������� �����.";
	text[5] = "����                400 ������ �������";
};


func void useurkunde()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_PrintLine(ndocid,0,"���������");
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"�, �������, ����, �������� ������ �� ��������� ���� � ������� �� ��������, ������� ��������� � ������ ��������... �������... ��� �... ��������� ������� ���������... � ���� ������ ��� ���� � ������ ������ (� ���������� ��� ��������� � ����� ������������ �� ���� ����� �������) ��������� �� 400 ������ �������.");
	Doc_Show(ndocid);
};


instance FAKESCROLL(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	value = 0;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance FOCUS_3(C_ITEM)
{
	name = "������ �� ������� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	hp = 1;
	hp_max = 1;
	weight = 1;
	value = 1;
	visual = "ItMi_Focus_01.3ds";
	material = MAT_STONE;
	description = name;
	text[1] = "���� �� ���� ��������, ������� ��������������";
	text[2] = "��� �������� ����������� �������.";
};

instance ITKE_FOCUS4(C_ITEM)
{
	name = "����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 3;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[1] = "��� ���� ��";
	text[2] = "������ � ����������� ���������.";
};

instance FOCUS_4(C_ITEM)
{
	name = "������ �� ������������ ���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	hp = 1;
	hp_max = 1;
	weight = 1;
	value = 1;
	visual = "ItMi_Focus_01.3ds";
	material = MAT_STONE;
	description = name;
	text[1] = "���� �� ���� ��������, ������� ��������������";
	text[2] = "��� �������� ����������� �������.";
};

instance ITMI_ORCTALISMAN(C_ITEM)
{
	name = "�������� �����";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_Amulet_UluMulu_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_orctalisman;
	on_unequip = unequip_orctalisman;
	description = name;
	text[2] = NAME_PROT_FIRE;
	count[2] = 20;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_orctalisman()
{
	self.protection[PROT_FIRE] += 20;
};

func void unequip_orctalisman()
{
	self.protection[PROT_FIRE] -= 20;
};


instance ITKE_FOCUS5(C_ITEM)
{
	name = "����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 3;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[1] = "��� ���� �� ������";
	text[2] = "������ ��������� ������.";
};

instance FOCUS_5(C_ITEM)
{
	name = "������ �� ��������� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	hp = 1;
	hp_max = 1;
	weight = 1;
	value = 1;
	visual = "ItMi_Focus_01.3ds";
	material = MAT_STONE;
	description = name;
	text[1] = "���� �� ���� ��������, ������� ��������������";
	text[2] = "��� �������� ����������� �������.";
};

