
instance ITWR_BOOK_CIRCLE_01(C_ITEM)
{
	name = "����� �������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 50;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "1-� ���� �����";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = useitwr_book_circle_01;
};


func void useitwr_book_circle_01()
{
	var int ndocid;
	var string text;
	var string text_1;
	var string text_2;
	text = ConcatStrings(NAME_MANAKOSTEN,IntToString(SPL_SENDCAST_LIGHT));
	text_1 = ConcatStrings(NAME_MANAKOSTEN,IntToString(SPL_SENDCAST_THUNDERBOLT));
	text_2 = ConcatStrings(NAME_MANAKOSTEN,IntToString(SPL_SENDCAST_FIREBOLT));
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"1-� ���� �����");
	Doc_PrintLine(ndocid,0,"---------------");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"����� ���� �������� �������� ����������� ������������ ��� ����� � ������������ ���, ��� �������� ��� �������, ����������� ��������� ����. ����� ����� ����� �� ���� �������� ������ �������� � ������������� ���� ���������� ������������ ����. �������� ������ ������ �����, ��� ����� ������ ������������ ����������.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"����");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"������ ��� ������ �����. ��� ������� ���� ���������� ���.");
	Doc_PrintLine(ndocid,1,text);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"������� ������");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"������� ���������� �������.");
	Doc_PrintLine(ndocid,1,text_1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"�������� ������");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"������� ����������� ����.");
	Doc_PrintLine(ndocid,1,text_2);
	Doc_Show(ndocid);
};


instance ITWR_BOOK_CIRCLE_02(C_ITEM)
{
	name = "2-� ���� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "2-� ���� �����";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = useitwr_book_circle_02;
};


func void useitwr_book_circle_02()
{
	var int ndocid;
	var string text_1;
	text_1 = ConcatStrings(NAME_MANAKOSTEN,IntToString(SPL_HEALING_HP_PER_MP));
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"2-� ���� �����");
	Doc_PrintLine(ndocid,0,"---------------");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"��� ���������� ������������ ���������� ������� ����� ����, ��� �� ����������. ������ �������� �������� �����.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"������ ���������� ���������� �������� � ���� ����� �������, ������� ���������� ���������� �����.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"���������");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"������ ������, ��� ���� �� ����������, ��� ��� ������� �� ���� �������. � �� �����, ��� �� ����� ����������� �������, � ���� ����� ����������� �������� ���� ����.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"��� ���������� ����������� ����, ���������� ����.");
	Doc_PrintLine(ndocid,1,"��������. ����������");
	Doc_PrintLine(ndocid,1,text_1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_Show(ndocid);
};


instance ITWR_BOOK_CIRCLE_03(C_ITEM)
{
	name = "3-� ���� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 150;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "3-� ���� �����";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = useitwr_book_circle_03;
};


func void useitwr_book_circle_03()
{
	var int ndocid;
	var string text;
	var string text_1;
	var string text_2;
	text = ConcatStrings(NAME_MANAKOSTEN,IntToString(SPL_SENDCAST_FIREBALL));
	text_1 = ConcatStrings(NAME_MANAKOSTEN,IntToString(SPL_SENDCAST_ICECUBE));
	text_2 = ConcatStrings(NAME_MANAKOSTEN,IntToString(SPL_SENDCAST_THUNDERBALL));
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"3-� ���� �����");
	Doc_PrintLine(ndocid,0,"---------------");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"��������� ���������� ���������� ������������ ���������� ���������� ����. ��� ���������� ��������� ������������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"������ ���������� ����������� �� ��� ���, ���� ��� ����� ����������� �� ��� ���� ���������� �������. ��� ���������� �������������� ������������.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"�������� ���");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"������ ��� ������ ����� ����. �������� ���, ��������� ���� ������.");
	Doc_PrintLine(ndocid,1,"�������� ����������");
	Doc_PrintLine(ndocid,1,text);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"������� �����");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"������ ������������ � ������� �����. ��� ���������� ����� ����.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,text_1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"������� ������");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"���, ��������� �� ���������� �������.");
	Doc_PrintLine(ndocid,1,text_2);
	Doc_Show(ndocid);
};


instance ITWR_BOOK_CIRCLE_04(C_ITEM)
{
	name = "4-� ���� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 200;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "4-� ���� �����";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = useitwr_book_circle_04;
};


func void useitwr_book_circle_04()
{
	var int ndocid;
	var string text;
	var string text_1;
	var string text_2;
	text = ConcatStrings(NAME_MANAKOSTEN,IntToString(SPL_SENDCAST_FIRESTORM));
	text_1 = ConcatStrings(NAME_MANAKOSTEN,IntToString(SPL_ZAPPED_DAMAGE_PER_SEC));
	text_2 = ConcatStrings(NAME_MANAKOSTEN,IntToString(SPL_SENDCAST_DESTROYUNDEAD));
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"4-� ���� �����");
	Doc_PrintLine(ndocid,0,"---------------");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"�����");
	Doc_PrintLine(ndocid,0,"������������");
	Doc_PrintLine(ndocid,0,"---------------");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"������� �����������: �������� �� ��, ��� ���������� ��������� � ����, ��� ����� ���� ��������� ������, ��� �������� ���������� �����. ��� ���� ������� ���������� ����� �������������. ��� ���� �� ���������� �����������.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"�������� �����");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"��� ���������� ��������� ��� �������� ��� �� ������ ����������, � ����� ����������� �� ������, ������� ����� ����.");
	Doc_PrintLine(ndocid,1,"�������� ����������");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,text);
	Doc_PrintLine(ndocid,1,"������");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"���������� ��������� �� ������ ������. ��� ���� ������ ��������������, ���� ������� ��������� ��� ������������.");
	Doc_PrintLine(ndocid,1,text_1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"����������� ������");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"��� ���������� ���������� ��������, ����������� �����.");
	Doc_PrintLine(ndocid,1,text_2);
	Doc_Show(ndocid);
};


instance ITWR_BOOK_CIRCLE_05(C_ITEM)
{
	name = "5-� ���� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 250;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "5-� ���� �����";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = useitwr_book_circle_05;
};


func void useitwr_book_circle_05()
{
	var int ndocid;
	var string text_1;
	var string text_2;
	text_1 = ConcatStrings(NAME_MANAKOSTEN,IntToString(SPL_SENDCAST_FIRERAIN));
	text_2 = ConcatStrings(NAME_MANAKOSTEN,IntToString(SPL_SENDCAST_ICEWAVE));
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"5-� ���� �����");
	Doc_PrintLine(ndocid,0,"---------------");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"�������� �����");
	Doc_PrintLine(ndocid,0,"---------------");
	Doc_PrintLines(ndocid,0,"���� ������������� ���� �������� ����� ����� ��������, ����������� � ���� ������ ����.");
	Doc_PrintLine(ndocid,0,text_1);
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"������� �����");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"����� ����������� ���� ��������� ���� ����������� � ������������ �� �� �������� �����. ������ ��������� �����������, �� ��� ���� ���������� ������ ���� ��������� ����.");
	Doc_PrintLines(ndocid,1,"���������� ����� ����.");
	Doc_PrintLine(ndocid,1,text_2);
	Doc_Show(ndocid);
};


instance ITWR_BOOK_CIRCLE_06(C_ITEM)
{
	name = "6-� ���� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 300;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "6-� ���� �����";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = useitwr_book_circle_06;
};


func void useitwr_book_circle_06()
{
	var int ndocid;
	var string text;
	text = ConcatStrings(NAME_MANAKOSTEN,IntToString(SPL_SENDCAST_BREATHOFDEATH));
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"6-� ���� �����");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"������� ������");
	Doc_PrintLine(ndocid,0,"---------------");
	Doc_PrintLines(ndocid,0,"������� �������. ������ ����������� ����� �����, ��������� ��������� ����� ������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,text);
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"����� ������");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"�������� �������� � ����, ���������� ������� �������.");
	Doc_PrintLines(ndocid,1,"����������� ������ ���� � ���, ��� ��� �������� ���� �������.");
	Doc_PrintLine(ndocid,1,"");
	Doc_Show(ndocid);
};


instance GOETTERGABE(C_ITEM)
{
	name = "��� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "��� �����";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usegoettergabe;
};


func void usegoettergabe()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_PrintLine(ndocid,0,"�����");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0," ");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"��� �����");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"� ������� �������� ���� �������� ������� ����� � ������������� �����. �� ����� ������� ���������� ��� ��� �������? ��� ����� ����������� �����? ��� ����� �������������� ���� �� ���, ��� ��� ��������. ���� � �� �� ���� ������������, ����� ����� ��� ��������, ������� ��� ����������.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"�� ��� ������ ��� ����? ��� �������� ��, ��������� � � �� �� ����� ���������� ����� �����������? ����� ���� ��, ��� ��� ����. ����� ������ � �������������� ������� �����. ���� ����� ������ ������ ���������, � ���� ��� �������� ����������� �� ������������ � �������� ����� ��������� ��.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"������ ��� �����");
	Doc_Show(ndocid);
};


instance GEHEIMNISSE_DER_ZAUBEREI(C_ITEM)
{
	name = "����� ����������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "����� ����������";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usegeheimnisse_der_zauberei;
};


func void usegeheimnisse_der_zauberei()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"����� ����������");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"��� ��� �������� ���������� ���������� ����, � �� �� �����������. �� �������� ������������ ������ �� ��� ���������� ������� � ��������� �� ����� ����. �����, ����������� � ������� ��������� �����, ������ ����� �������� ���� ���, ����� �������� �����.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"���� ��� ���� �������� �������� ���������� ������, �����������, ��������� � ������� � ��� ������������ ���. � ������ ��������� ������������ ���� ������� ��������� ���� ��� �� ������ ���� � ���� ����, ������ � ���� �������� ����. �� �������� ���� �� �����������.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"������ ��� �����");
	Doc_Show(ndocid);
};


instance MACHTVOLLE_KUNST(C_ITEM)
{
	name = "�������������� ���������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "�������������� ���������";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usemachtvolle_kunst;
};


func void usemachtvolle_kunst()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"�������������� ���������");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"���� ��� ����������� � ��������� �����.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"� �������� ���������� ���� ����� ������������� ����������� ���� �������� �������. ������� ��� ����� � ���� ��� ������ ������. � ��� ����� � ��� ����� ����������, ����� ��� ����� ���������. �� ����� ���� ������ ����������� � ������������ � ����������� ����.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"�� ������ � ������, ���������� ������� � ������ ����. � ��� ���������� ���������� �� ����� � ������ �� ������� ��������. ���������� ������������ ���� - ��������� ���� ������� ����, ��� ��� ���� �������� ������ � ������ ����� ����� ������ ���, ������� �����-���� �������� ��������.");
	Doc_Show(ndocid);
};


instance ELEMENTARE_ARCANEI(C_ITEM)
{
	name = "���������� ������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "���������� ������";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = useelementare_arcanei;
};


func void useelementare_arcanei()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"���������� ������");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"������������� ����� � ������������ � ������� ���������������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"������ ���� ������������ ����� � �� ����� � ���� ���� ���� �����. ��� ����� �������, ��� ����� �������� ���������� ��������� ����. ��� ����� �������������� �� ������ ��������, ������� �� �������.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"���������� �������� � ����� ���� ������� � ����� ������ ��� �����, �� � ������� ����� ���������� ����������� ����� �����. ����������� ���� ��������� �� ������ ���� ������������� ���� �������� ��������������� ����, ��� ���������� ���� �������� � ����� ������ � ������ ��������, ������� ������ ����� ������������ � �������.");
	Doc_Show(ndocid);
};


instance WAHRE_MACHT(C_ITEM)
{
	name = "�������� ����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "�������� ����";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usewahre_macht;
};


func void usewahre_macht()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"�������� ����");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"������ ���� ������������");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"������ ���� �������� ���� �� �������� ��������. ������� ������������ ������ �� ������������ ����, �� �������� ���������, ��� �������� �� ��������� ������� � ������ ���� ��������.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"���� ��� ���� ������� ������, �� ������� � ���� ���������� ����� �� ������� ������ �������������, �� ����������� ��� �������� ���� ��������. �� ����� ���������� ������� ������� � ������������, ���� ����� ����� ������������� � ���� - ������ �� ������ ������ � ���� �� ����.");
	Doc_Show(ndocid);
};


instance DAS_MAGISCHE_ERZ(C_ITEM)
{
	name = "���������� ����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "���������� ����";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usedas_magische_erz;
};


func void usedas_magische_erz()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"���������� ����");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"������ ���� ��� �����, ��� ��������, ����� ����� � ������ ��������. ��� ����� ������ ���� � ����. ��� �������� ���������� �������, �������� ��������������� ���������� � � �� �� ����� ����� � ���������. �� ���� ����, ���������� � ������ �������� ���� ��������, ������ ������ ������, � ������� �� ��������� �� ���� ������, ���������� �� ������� �����.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"��� ������ ���� ��� �������, ������� ���� �� ������� ����� ���. ������ � ����� ������� ������ ������ ������ �� ������ ����� ��������, � �� ���� ������� ��� �������� ����� ������. �� ���������� ���� ����� ����� ������. ����� ����� ��� ������ �� �� ������. �������, ����� ���� ���� �� ������ �������� ����� �����.");
	Doc_Show(ndocid);
};


instance SCHLACHT_UM_VARANT1(C_ITEM)
{
	name = "����� ��� �������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "����� ��� �������";
	text[0] = "��� 1";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = useschlacht_um_varant1;
};


func void useschlacht_um_varant1()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Red_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Red_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"... �� ������ ����� ����� ������� ������. �� ������ ���� ������ � ��� ���� �������� �� ����������� ����� ����� ��������� �����. �� ����� �� ������� ����� � ������, � ���� ��� ������ � ��������� ������������ � �������. �� �������� ����� ������ ������, � �������� �������. �� ����, ��� ��� ������ � ���� ����� ����� ��������� ��������� ������ � ������� ���, ����� ���� ������� � ������� �� ������...");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"... ������������ � ������� ��� �������������� ����. ��� ���������� ����� ���� �������� ������������, ����� ������ ��������� �� �����...");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"...������ ��� ����, ��� ����� �������, ��� ������� ������ � ���� ���. �� ����� �� ����� ���� ����������� �� ������� ����� ��������� ������ � �������� ���������� ����, ��� ������� � �����. ������ �� ����� ��������������� �������� � ���������� ��������� ������� ���������� �������� ������ ������...");
	Doc_Show(ndocid);
};


instance SCHLACHT_UM_VARANT2(C_ITEM)
{
	name = "����� ��� �������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "����� ��� �������";
	text[0] = "��� 2";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = useschlacht_um_varant2;
};


func void useschlacht_um_varant2()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Red_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Red_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"����� ����� ��� ��������. ������, ����������� ����������, ��� ��������� ����������. ������ ����� ����� �� ���������� �� ����� �������, � �������� ����� ��������� ����� ������������ � ����������� �������. � ������������� ����������� �������� ��� ������, �������� ��������� ������, ����� ��������� ������������ �������. �� ������ ��������� ��������� ��������.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"�� ������ ��� ������ ������ � ������. ��������� ������� ���������� � �����������. ��, ���� �� ������ ��������� �������, ������ ��� � �������. ������� ������� ������� �� ����� ��������� �� ������������ ���������. ��� ������ ���� �������� ��������� �������� ��, ������� �������� �� ������ � ������� �� ������ �� ������. ��������� ������� ��������� �� ������� �� ����� ������. �� ��� ��������.");
	Doc_Show(ndocid);
};


instance MYRTANAS_LYRIK(C_ITEM)
{
	name = "������ �������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ �������";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usemyrtanas_lyrik;
};


func void usemyrtanas_lyrik()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Red_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Red_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"    �����");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                  ��������");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"������� ���, �� ������ ���������");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"��-�������� ������ ����� ����������.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"� ������ � ����� �������� �����,");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"� ������� ����� ������ ������.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"� �������� ���, ������� ����, ����");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"��������� ���������� ������ ������,");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"����������� �� ��� ������ �����,");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"��� ������� �� ������ ������� �����.");
	Doc_PrintLines(ndocid,1,"");
	Doc_Show(ndocid);
};


instance LEHREN_DER_GOETTER1(C_ITEM)
{
	name = "������ ����� - ��� 1";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ �����";
	text[0] = "��� 1";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = uselehren_der_goetter1;
};


func void uselehren_der_goetter1()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Red_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Red_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"������ ����� �����, ��� �� �� �� ����, ����� ����� ���� ��������. ������ ������ �����, ��� �� �� �� ����, ����� ������ ���������. ������ ������, ��� ��� ���� �������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"����� ������: �� ���������� � ������ ������, ���� ���� �� ������ ������ �� ������, ��� ������ �������������� ������ � ��������. � ���������� ������, ���� � �����. ���� ������ ������, ������ ���� ������ ����. �������� ��� ��������� �� ���� ���������.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"����� �������: ������� � ����, ��� ���� ������ ��� ����, ����� ������� �������. ����� � ��� ������, ����� �������� �� ������, ��� ������ ������� ��������. ������� � �������� ��������� �� ���� ���������.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"����� �������: ���, ��� ��������� ������ ������� �������������� � ���� �����, ����� ������� ����. ��� ���� ������� ����, ��������� � ������, � ��� ������� ��������� � ������� �����.");
	Doc_Show(ndocid);
};


instance LEHREN_DER_GOETTER2(C_ITEM)
{
	name = "������ ����� - ��� 2";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ �����";
	text[0] = "��� 2";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = uselehren_der_goetter2;
};


func void uselehren_der_goetter2()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Red_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Red_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"�� ���� �� ���, �� ����, � ����� ����� �� ���������� ����� ���. �� ��� ���� ������ �����, � ��� ���� ������� ���. ����� ������� ���� �����. �� ����� ����� �� ����� ���� � ����� ������, � ����� �� ������ ������. �� ��� ���� ��� ��� ��� ������� �����. ����� ����� ������� ����� ���� � ������ �������. ������ ������ ���� ����. � ����� � ��� ������ ����. ����� ������� �� ���� ������ ����� � ������ �������. ������ ������� ����� ��������� �������, ������, ���������������� � ��������. � ��� ����� ������� ������ ����������.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"� �� ����� �������� ����� ��� ��������������� ������� � ����� �� ��� �����. ������ �� ����������� �� �����, ��� ��� �� �������� ������ ��� ����� ������������ � �������� �����, ����� ��������� ��� �����. � ����� �� �������� ���� ��������, ����� �� ���������� ������ ��� ������. �� ������� ���� ����� �� ��������� �� ������ �����. ������ ����������� ������ �������, � �� ���� ���������� �� �������� � ��� ������: '��� �� ����������� ���, ��� ����� �� ����� ��� ��� ������� �� ����'. � �� ������ ������ � ���� � ����� �� �����.");
	Doc_Show(ndocid);
};


instance LEHREN_DER_GOETTER3(C_ITEM)
{
	name = "������ ����� - ��� 3";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ �����";
	text[0] = "��� 3";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = uselehren_der_goetter3;
};


func void uselehren_der_goetter3()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Red_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Red_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"����� ��� ����� ����������� ������� ��� � ������������� � ���. ��������� �� ��� �� ������� ����������� ������� ������� ������. �� ������ �� ������. � �� ������� ���� ����� �������� ��� �� ������ �������, � ���������� ��� ������� ���� ����� �� ����������. ��� ���� �������� ������ � ������������ ����� ���������. �� ��� ��� ���� ����� ����� �����, � �� ��� ���� �� �� �����. � ����� ���� �� ���� ���, ��� ��� ���������. �� ��������, ��� ��� ���������� �� ���������� ���, ������� ������ ���� ��������� �����.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"���� ����� ������� � �������, � �������� �������. �� ���� ������ �� ��� ���� ���������� ������������� ����� �������. � ����� ��� �������� � �������, � �� �������� �� ������ � ����� ������������. ������ ������ ���������, � �������� ������������ �����. ������������ � ���������� ����� ����� �� ����� ��� �����. ��� ����������� �����. ���, ��� ���������� �� ��������, ������� ������ ����, � ���������� ������ ���������� ������ ����.");
	Doc_Show(ndocid);
};


instance JAGD_UND_BEUTE(C_ITEM)
{
	name = "��������� ������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "��������� ������";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usejagd_und_beute;
};


func void usejagd_und_beute()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"��� ����� �������� ������ �����, � ��� ������ ���������� �������, ����� ������� ����� ��������� �����. ������� ����� ������ �� ������ �����. ������ ����� ������� � ����� ������� ����� ������ ���������� � �����. �� ��� ��� �� ������� � ���, ��� ��� ����� ���������. ���������� ��������� ������, ������� ������������ ������, ��� ������� ��������� � �������! ����� ������� ����������� � ��������������.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"��������� ����� � ����� �������� �� ������ ������ ������� ��������, �� � ����� ������� �������� �����. �� ������ ���� ������� �������� �� ���������� ������ ���������, �, ��������, ��� �� ��������� � � �������. ����� �������������� ���������� ��� ����� � �����? ������ ���������� ��� �������������� � �������� �������� �� ���� ���������� ����������� ���������.");
	Doc_Show(ndocid);
};


instance KAMPFKUNST(C_ITEM)
{
	name = "��������� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "��������� �����";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usekampfkunst;
};


func void usekampfkunst()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"� ������� ���� ����������� ��� ������ ������� ������� �������� ��������� �����.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"������ � ������������ ���� ������ ������� ������ ��������, ��������� ���������������� � �������, � ����� ������������. ��� ������ ���� ������ �������������� ���� �������� � ���������� ��������� ����, ����� ��������� ������� �������� ���� �����������.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"�������� ������ � �������� ���� �������� ������ ��������.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"��� ���������� ����� �������� ������� �� ��� ����������� ���������. ��������� ��������, � ��� ���������, �� ������ ���� ���������� ����������: �������� ���������� ���� � ���������������� �������� ����.");
	Doc_Show(ndocid);
};


instance DIE_GRUFT(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "��������� �����";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ASTRONOMIE(C_ITEM)
{
	name = "����������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "����������";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = useastronomie;
};


func void useastronomie()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"� ������ ��������� ������� � ��� ������ ��������: �����, ����, ����� � ������, ������� ������ � � �� ������ - ����������� ���� �������. �������� ����� �������� ����� ���.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"� ����������� �������� ������� �������� ����� ���������. ��� ���� ��������� ��� � ������ ������, ������������ �����, ��� ���������� ���� �������� ������� �� ������� ��������. � ��� �������� ������� ������ ����.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"����� ��������� ������, ��� �����, �� ������� ��� ��������� ������ ������ �� ��������� � ��������, �� ������ ���������, �� ���� �� ����� ������� �����, ��� ��� ��� �������� ��� ��, ��� � ������ �������.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"��� ����������� ��������� ������� ���� ������������ ���� ����, ����� ����� ��������� ��������� ���.");
	Doc_Show(ndocid);
};


instance REZEPTUREN(C_ITEM)
{
	name = "������� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������� �����";
	text[0] = "��� 1";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = userezepturen;
};


func void userezepturen()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"������� ����������:");
	Doc_PrintLine(ndocid,0,"----------------");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"������� � ��� ����� ������ �����. ��� �������� ������� �� ����. ���� ��� �������� � �����, ������� �������� ������ ������ ����, ��� ������ ��� ��������. �� ���������� ���������! ������ � �������� �������� ���� �� �����.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"�����, ��������� � ������������� ���� ����� ������, � �������� ������� ��������, ��������� �������� ����. ������ � �������� ��������������. ��� ���� ������, ��� ��� ��������, ��� ���� �������� - ��� ������.");
	Doc_Show(ndocid);
};


instance REZEPTUREN2(C_ITEM)
{
	name = "������� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������� �����";
	text[0] = "��� 2";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = userezepturen2;
};


func void userezepturen2()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"���� ��������");
	Doc_PrintLine(ndocid,0,"--------------------");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"������ � ����� �������� ������ ������ ��������, ������ �� ������������ ����� ����. ������� ��� ���� �� ������������, ���� ��� ������� - ��� ����� ���������. �������� ����� ����: ��� ������ ������ ���������� �����������. ��� ������������� ���� ����������� ����� ��������������� ������ ������ - ������.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"��� ������, ��� ������� ���������� ��������� ���������� ���� � ����, � ���� ��������. ��� ������������ ����� ��� � ������� ��� ���. � ��������� �� ���� ������� ������� ����� �������� � �������, � ��� ����� � �������� ������.");
	Doc_Show(ndocid);
};


instance TAGEBUCHOT(C_ITEM)
{
	name = "�������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "�������";
	text[0] = "������ ����������� �����.";
	text[1] = "� ��� �� ������� �������.";
	on_state[0] = usetagebuchot;
};


func void usetagebuchot()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"���� 23.");
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLines(ndocid,0,"� ������� ���� �������.");
	Doc_PrintLines(ndocid,0,"�����, ������ ��� �������� ��� ���, � ��� ��� ��� ��� ��������� ���� � ��������� ��������.");
	Doc_PrintLines(ndocid,0,"������ ����� �������, � ��� ����� �� ����� ������. ��� �������� ����, ��� ����� ����� � ������!");
	Doc_PrintLines(ndocid,0,"� ����� ������, �� ���� �� ����������!");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"���� 28.");
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLines(ndocid,0,"�� ������ ���������� ������ ������ ������ ����.");
	Doc_PrintLines(ndocid,0,"�� ��� �������� �������� ������, �� � �� ��� ��� �� ����, ����� ��� ��� �����.");
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"���� 67.");
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLines(ndocid,1,"���-�� ��������� ���, ��� � ���� �����-������� ������ ��� ������, �� ��� �� ��� ����� �����?");
	Doc_PrintLines(ndocid,1,"��� � ����� ���, �������� ��� ������ ������. ��� �� ��� �������� ��������� �� ���� ���� �����.");
	Doc_PrintLine(ndocid,1,"");
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"���� 78.");
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLines(ndocid,1,"��� ����� � ����� �� ��� � �������� ����� �����. �� ��� �������� ���� �� �������.");
	Doc_PrintLines(ndocid,1,"� ����� ������. ���� ������� ����� �������� �����. ����� ����, �� ����-������ ����������.");
	Doc_Show(ndocid);
};


instance ITWR_BLOODFLY_01(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 150;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = useitwr_bloodfly_01;
};


func void useitwr_bloodfly_01()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"������");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"� �������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"�� ���, ��� ����� ��������� �����, � ������ �����, ������� �������� ������, ������������ ������� ������ ����. ��� ������� ���� ������ ���� � �������� �� �����.");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"������ ���� �� ���� ������ �������� ������, �� � �������� �������� ��� ������ ����������. ����� ������� �������� ������, ����� ����� �������� ��� �� ���������� ������, � ��������� ������. ��������� ��� ����� ����� ����, ��� ������ �����.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_Show(ndocid);
	if(KNOWS_GETBFSTING == FALSE)
	{
		KNOWS_GETBFSTING = TRUE;
		Log_CreateTopic(GE_ANIMALTROPHIES,LOG_NOTE);
		b_logentry(GE_ANIMALTROPHIES,"����� ������ ���� ������");
		PrintScreen("�����: ������ ����",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

