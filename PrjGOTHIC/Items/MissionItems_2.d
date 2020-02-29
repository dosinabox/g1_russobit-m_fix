
instance ITWRFOCUSMAPPSI(C_ITEM)
{
	name = "�����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 15;
	visual = "ItWrFocusMapPsi.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = usefocusmappsi;
	description = "����� ��������";
	text[1] = "�� ���� ����� �������� ������";
	text[2] = "� �������, ������� ����� ��������";
	text[3] = "��� ������ �������.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void usefocusmappsi()
{
	var int ndocid;
	ndocid = Doc_CreateMap();
	Doc_SetLevel(ndocid,"WORLD.ZEN");
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Map_World_FocusPSI.tga",1);
	Doc_Show(ndocid);
};


instance FOCUS_1(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	hp = 1;
	hp_max = 1;
	weight = 1;
	value = 1;
	visual = "ItMi_Focus_01.3ds";
	material = MAT_STONE;
	description = "������ �� �����";
	text[1] = "���� �� ���� ��������, ������� ��������������";
	text[2] = "��� �������� ����������� �������.";
};

instance ITMI_STUFF_GEARWHEEL_01(C_ITEM)
{
	name = "����������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Stuff_Gearwheel_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "��� ���������� � ������ ������,";
	text[1] = "� ����� �� ��������� ������";
	text[2] = "������ �����.";
};

instance ITAT_CRAWLERQUEEN(C_ITEM)
{
	name = "���� �������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 100;
	visual = "ItAt_Crawlerqueen.3ds";
	material = MAT_LEATHER;
	description = name;
	text[0] = "��� ���� ��������";
	text[1] = "�������� ��������.";
	text[2] = "��� �������� ��������,";
	text[3] = "������� ������� ������� ����� ��������.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWRFOKUSBUCH(C_ITEM)
{
	name = "��������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_Almanac.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = useitwrfokusbuch;
	description = name;
	text[0] = "��� ������� ��������� ����� ��������";
	text[1] = "��������� ����������, ������� ��������";
	text[2] = "��� ������������� ��������.";
};


func void useitwrfokusbuch()
{
	var int ndocid;
	if((WISSEN_ALMANACH == FALSE) && Npc_IsPlayer(self))
	{
		b_givexp(50);
		WISSEN_ALMANACH = TRUE;
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"����� 23");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"����������� ����");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"��������� �������� ���������� �������, ������� �������� �����, ������������� �� ����� ������ ����������. ����� �� ��� ����������� ���������� ��� �� ���� ���, ������ ����.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"��� ������ ������ ������� �������, �� ������ ������.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"����� ����, ������� �������� ���������� ������� �������, ����� ��������� ����� ���, ������� ������� ���������� ������. �� ����� ������ �������� ���� �������� ����� ��������. ��� ������� �����, ��� �������� ���� ������.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"�� �������� ������ ������ ������ ������ ���������. ��� ������ ������ ����������� ���� �����.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"� ������ �������� ���� ������, ����� ������� ����� ������� ����.");
	Doc_Show(ndocid);
};

