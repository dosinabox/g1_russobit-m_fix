
instance ITWR_BOOK_CIRCLE_01(C_ITEM)
{
	name = "������ ���� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 50;
	visual = "ItWr_Book_Magic.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ ���� �����";
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
	Doc_PrintLine(ndocid,0,"������ ���� �����");
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
	if(MANABOOK1 == FALSE)
	{
		b_raiseattribute(ATR_MANA_MAX,1);
		Npc_ChangeAttribute(self,ATR_MANA,1);
		MANABOOK1 = TRUE;
	};
};


instance ITWR_BOOK_CIRCLE_02(C_ITEM)
{
	name = "������ ���� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_Magic.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ ���� �����";
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
	Doc_PrintLine(ndocid,0,"������ ���� �����");
	Doc_PrintLine(ndocid,0,"---------------");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"��� ���������� ������������ ���������� ������� ����� ����, ��� �� ����������. ������ �������� �������� �����.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"������ ���������� ���������� �������� � ���� ����� �������, ������� ���������� ���������� �����.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"���������");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"������ ������, ��� ���� �� ����������, ��� ��� ������� �� ���� �������. � �� �����, ��� �� ����� ����������� �������, � ���� ����� ����������� �������� ���� ����.");
	Doc_PrintLines(ndocid,1,"��� ���������� ����������� ����, ���������� ����.");
	Doc_PrintLine(ndocid,1,NAME_SPELL_INVEST);
	Doc_PrintLine(ndocid,1,text_1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_Show(ndocid);
	if(MANABOOK2 == FALSE)
	{
		b_raiseattribute(ATR_MANA_MAX,1);
		Npc_ChangeAttribute(self,ATR_MANA,1);
		MANABOOK2 = TRUE;
	};
};


instance ITWR_BOOK_CIRCLE_03(C_ITEM)
{
	name = "������ ���� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 150;
	visual = "ItWr_Book_Magic.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ ���� �����";
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
	Doc_PrintLine(ndocid,0,"������ ���� �����");
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
	Doc_PrintLine(ndocid,1,NAME_SPELL_LOAD);
	Doc_PrintLine(ndocid,1,text);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"������� �����");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"������ ������������ � ������� �����. ��� ���������� ����� ����.");
	Doc_PrintLine(ndocid,1,text_1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"������� ������");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"���, ��������� �� ���������� �������.");
	Doc_PrintLine(ndocid,1,text_2);
	Doc_Show(ndocid);
	if(MANABOOK3 == FALSE)
	{
		b_raiseattribute(ATR_MANA_MAX,1);
		Npc_ChangeAttribute(self,ATR_MANA,1);
		MANABOOK3 = TRUE;
	};
};


instance ITWR_BOOK_CIRCLE_04(C_ITEM)
{
	name = "��������� ���� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 200;
	visual = "ItWr_Book_Magic.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "��������� ���� �����";
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
	Doc_PrintLine(ndocid,0,"��������� ���� �����");
	Doc_PrintLine(ndocid,0,"---------------");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"����� ������������");
	Doc_PrintLine(ndocid,0,"---------------");
	Doc_PrintLines(ndocid,0,"������� �����������: �������� �� ��, ��� ���������� ��������� � ����, ��� ����� ���� ��������� ������, ��� �������� ���������� �����. ��� ���� ������� ���������� ����� �������������. ��� ���� �� ���������� �����������.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"�������� �����");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"��� ���������� ��������� ��� �������� ��� �� ������ ����������, � ����� ����������� �� ������, ������� ����� ����.");
	Doc_PrintLine(ndocid,1,NAME_SPELL_LOAD);
	Doc_PrintLine(ndocid,1,text);
	Doc_PrintLine(ndocid,1,"");
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
	if(MANABOOK4 == FALSE)
	{
		b_raiseattribute(ATR_MANA_MAX,1);
		Npc_ChangeAttribute(self,ATR_MANA,1);
		MANABOOK4 = TRUE;
	};
};


instance ITWR_BOOK_CIRCLE_05(C_ITEM)
{
	name = "����� ���� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 250;
	visual = "ItWr_Book_Magic.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "����� ���� �����";
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
	Doc_PrintLine(ndocid,0,"����� ���� �����");
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
	if(MANABOOK5 == FALSE)
	{
		b_raiseattribute(ATR_MANA_MAX,1);
		Npc_ChangeAttribute(self,ATR_MANA,1);
		MANABOOK5 = TRUE;
	};
};


instance ITWR_BOOK_CIRCLE_06(C_ITEM)
{
	name = "������ ���� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 300;
	visual = "ItWr_Book_Magic2.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ ���� �����";
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
	Doc_PrintLine(ndocid,0,"������ ���� �����");
	Doc_PrintLine(ndocid,0,"---------------");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"������� ������");
	Doc_PrintLine(ndocid,0,"---------------");
	Doc_PrintLines(ndocid,0,"������� �������. ������ ����������� ����� �����, ��������� ��������� ����� ������.");
	Doc_PrintLine(ndocid,0,text);
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"����� ������");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"�������� �������� � ����, ���������� ������� �������.");
	Doc_PrintLines(ndocid,1,"����������� ������ ���� � ���, ��� ��� �������� ���� �������.");
	Doc_PrintLine(ndocid,1,"");
	Doc_Show(ndocid);
	if(MANABOOK6 == FALSE)
	{
		b_raiseattribute(ATR_MANA_MAX,1);
		Npc_ChangeAttribute(self,ATR_MANA,1);
		MANABOOK6 = TRUE;
	};
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
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"�����");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
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
	Doc_PrintLines(ndocid,0,"�������������� ���������");
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
	visual = "ItWr_Book_02_04.3ds";
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
	visual = "ItWr_Book_02_01.3ds";
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
	visual = "ItWr_Book_02_01.3ds";
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
	description = "������";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usegruft;
};

func void usegruft()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Gruft_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Gruft_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_Show(ndocid);
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
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLines(ndocid,0,"�� ���, ��� ����� ��������� �����, � ������ �����, ������� �������� ������, ������������ ������� ������ ����. ��� ������� ���� ������ ���� � �������� �� �����.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"���� ������� � ������ ������ ��������� ��������� � ����� �������������� ��� ������������� ���������� �����. ��������� ���������� ��� ������ �� ������ � ������ �����������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"������ ���� �� ���� ������ �������� ������, �� � �������� �������� ��� ������ ����������. ����� ������� �������� ������, ����� ����� �������� ��� �� ���������� ������, � ��������� ������. ��������� ��� ����� ����� ����, ��� ������ �����.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_Show(ndocid);
	if(HONEYCOMB < 5 && HONEYCOMBBOOK == 0)
	{
		Log_CreateTopic("���� �������",LOG_NOTE);
		b_logentry("���� �������","�� ����� ��� ������� � ����� ��� ���������� �������� �� ���. �������� ����� �������, ������� �����.");
		HONEYCOMBBOOK = 1;
	};
	if(KNOWS_GETBFSTING == FALSE)
	{
		b_learn_trophies_sting();
	};
};

instance BALORONOTE(C_ITEM)
{
	name = "������ ������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "ITAR_SCROLL_01_EG.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ ������";
	on_state[0] = usebaloronote;
};


func void usebaloronote()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"  - 5 �����");
	Doc_PrintLine(ndocid,0,"  - 2 ������� ������");
	Doc_PrintLine(ndocid,0,"  - 5 ������� ����");
	Doc_PrintLine(ndocid,0,"  - 3 ������� �����");
	Doc_PrintLine(ndocid,0,"  - 2 ����� ����");
	Doc_PrintLine(ndocid,0,"  - 2 ������ ���������");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
	if(SLD_753_BALORO_SC_BESORGT_DEN_KRAM == LOG_RUNNING)
	{
		b_logentry(BALOROS_WAFFE,"������ �� ������� ��������� �� ��������� �����. ������ � �� �����, ����� ������ �� ������ ���.");
		Log_SetTopicStatus(BALOROS_WAFFE,LOG_FAILED);
		SLD_753_BALORO_SC_BESORGT_DEN_KRAM = LOG_FAILED;
	};
};

instance QUENTINNOTE(C_ITEM)
{
	name = "�������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "ITAR_SCROLL_01_EG.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������� ��������";
	on_state[0] = usequentinnote;
};


func void usequentinnote()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLines(ndocid,0,"�����, ������� ������� ����� ������ ������. ���� ������� ���� - ������ ��������, ������� ����� ������ ��������� ���������� �� ������ ���������. ��������� �������� �� ���� ���������� ����, ��� ������������� - �����������! ��� ���������� �������� ������ ����� � ����� �������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"  - �������");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
	if(QUENTIN_GANG_QUEST_STARTED != LOG_RUNNING && QUENTIN_GANG_QUEST_STARTED != LOG_SUCCESS && QUENTIN_GANG_QUEST_STARTED != LOG_FAILED && !Npc_IsDead(org_858_quentin))
	{
		QUENTIN_GANG_QUEST_STARTED = LOG_RUNNING;
		Log_CreateTopic(QUENTIN_GANG,LOG_MISSION);
		Log_SetTopicStatus(QUENTIN_GANG,LOG_RUNNING);
		b_logentry(QUENTIN_GANG,"������, ��� ���������� ����� ������ ������ - �� ��, �� ���� ���� ������. �� ����� ���� ��� �� ���� �����, � �������� �� ������ ��������... ��� ������� �������� �� ������� � ���������, ��� ��������� ��� �����.");
	};
};

instance CALASHNOTE(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	description = "������ ��� ������";
	text[1] = "����� ��� �� ������.";
	on_state[0] = usecalashnote;
};


func void usecalashnote()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLines(ndocid,0,"�����! ����� ����� ����� ������, ������� ����� ��� ������ � �����. ��������� ��� ��� ������� � ������ ��� ����, ����� �������� �� ��� ��������!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"  - �������");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
	CreateInvItem(hero,calashnote2);
	if(Npc_KnowsInfo(hero,info_calash_dia1))
	{
		b_logentry(QUENTIN_GANG,"������ �������, ������ ����� �������� ����� ������. ������� ������� ���� � � ������ �������� ������ ���������� ������ ����! � ��������!");
	}
	else
	{
		b_logentry(QUENTIN_GANG,"������� ������� ����! ���� �� � ����� � ������ ���������, �� ��� �� ��������� �� ��� ����������. � ��������!");
	};
};

instance CALASHNOTE2(C_ITEM)
{
	name = "�������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "ITAR_SCROLL_01_EG.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ ��� ������";
	on_state[0] = usecalashnote2;
};


func void usecalashnote2()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLines(ndocid,0,"�����! ����� ����� ����� ������, ������� ����� ��� ������ � �����. ��������� ��� ��� ������� � ������ ��� ����, ����� �������� �� ��� ��������!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"  - �������");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};

instance ALCH200(C_ITEM)
{
	name = "������ �������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 200;
	visual = "ITWR_BOOK_ALCHEMY.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ �������";
	text[1] = "��������� ������� ��������� ������������.";
	text[2] = "(��������� 10 ����� ��������)";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usealchemybook;
};

instance ALCHEMYBOOK(C_ITEM)
{
	name = "������ �������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 600;
	visual = "ITWR_BOOK_ALCHEMY.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ �������";
	text[1] = "��������� ������� ��������� ������������.";
	text[2] = "(��������� 10 ����� ��������)";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usealchemybook;
};

func void usealchemybook()
{
	if(hero.lp < 10 && ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("������������ ����� ��������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else if(hero.lp >= 10 || ALCHEMYACTIVE == TRUE)
	{
		var int ndocid;
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Alchemy_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Alchemy_R.tga",0);
		Doc_SetFont(ndocid,-1,"font_15_book.tga");
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"������ �������");
		Doc_SetFont(ndocid,-1,"font_10_book.TGA");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"������ ������� � ���������� �������� �����. ������� ������ ����� ��� ����� ��������� �����, ����� �������� ��� ���������� � ���������� ��� �� ���������. ���� ���������� ������ ������� � �������, ����� �������� �������� � ���������� ���������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"��� �������� ������� ������� ��������� ������ ������� �� ������: ��� ����� �������� �������� ������� ������������ ������ ������������ �������. ����������� ����������� ���������");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLines(ndocid,1,"������� ��� ������� ������ ��������, ���������� ��� ��������� ���������� �� �����������!");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"��� ������� ����� ���������� ������ ��������, ������� ����� ����� � ��������� ���� ��� ����. � ��� ����� � �������������� �������� ��� ������� ��������� �����������: ��� ��� ���� ���. ������� ������ �������� �������� ��������� � ����� ��������� �������� � ������� ������ ��������.");
		Doc_Show(ndocid);
		if(ALCHEMYACTIVE == FALSE)
		{
			Log_CreateTopic("�������",LOG_NOTE);
			b_logentry("�������","� ����� ����� � �������� � ������� ����������� ��� ������������� �����. ������ ����� ������ �������.");
			PrintScreen("������ ����� �������!",-1,11,"FONT_OLD_20_WHITE.TGA",4);
			hero.lp = hero.lp - 10;
			ALCHEMYACTIVE = TRUE;
			Npc_SetTalentSkill(hero,NPC_TALENT_REGENERATE,1);
			if(Npc_HasItems(kdf_405_torrez,alchemybook))
			{
				Npc_RemoveInvItem(kdf_405_torrez,alchemybook);
			};
			if(Npc_HasItems(kdw_604_cronos,alchemybook))
			{
				Npc_RemoveInvItem(kdw_604_cronos,alchemybook);
			};
			if(Npc_HasItems(nov_1357_fortuno,alchemybook))
			{
				Npc_RemoveInvItem(nov_1357_fortuno,alchemybook);
			};
			if(Npc_HasItems(stt_329_dexter,alchemybook))
			{
				Npc_RemoveInvItem(stt_329_dexter,alchemybook);
			};
			if(Npc_HasItems(kdw_605_riordian,alchemybook))
			{
				Npc_RemoveInvItem(kdw_605_riordian,alchemybook);
			};
		};
	};
};

instance ALCHEMY_HP1(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "HP1RECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ �������� ���������";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_ESSENZ;
	on_state[0] = usehp1recipe;
};

func void usehp1recipe()
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
		Doc_SetPage(ndocid,0,"letters.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"�������� ����� - ����� ������� �������� ��������, ������� ����� ����� ��� ������. �� ������ ��� ������� ������, ����� �������� �����-���� ��������� ��������, �� ��� ����� ������ ����� ���� �� ��������� �������. ���� ������ �������� �����, �� �� ���������� ������ ����� ������� �������� ���������.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(HP1RECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("�������","������ ������ �������� ��������� (��������� ���� +50). ���������: �������� ����� (1).");
			HP1RECIPE = TRUE;
		};
	};
};

instance ALCHEMY_HP2(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "HP2RECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ ��������� ���������";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_EXTRAKT;
	on_state[0] = usehp2recipe;
};

func void usehp2recipe()
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
		Doc_SetPage(ndocid,0,"letters.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"�������� �������� ������ ��������� �� ����� ��� ������� ����� ��� � ������� ����� � ����� ��������. �� ��������� ������� ����� �������� �������� ���������: ��� ����� ��������� �� ���.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(HP2RECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("�������","������ ������ ��������� ��������� (��������� ���� +70). ���������: �������� �������� (1).");
			HP2RECIPE = TRUE;
		};
	};
};

instance ALCHEMY_HP3(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "HP3RECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ ����� ���������";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_ELIXIER;
	on_state[0] = usehp3recipe;
};

func void usehp3recipe()
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
		Doc_SetPage(ndocid,0,"letters.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"������ �������� ������ ��������� �������� �� �����, ����� ����� ��� ����� ��������� �������� � ����������� ����� ��������� - ����� ����������� �������� ������ ��������� ��� ��� ������. ��������� ������ ������ � ���������� �������� � ������� � �������� �� ��������� ������.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(HP3RECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("�������","������ ������ ����� ��������� (��������� ���� +100). ���������: �������� ������ (1).");
			HP3RECIPE = TRUE;
		};
	};
};

instance ALCHEMY_MP1(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "MP1RECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ �������� ���������� �������";
	text[1] = NAME_BONUS_MANA;
	count[1] = MANA_ESSENZ;
	on_state[0] = usemp1recipe;
};

func void usemp1recipe()
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
		Doc_SetPage(ndocid,0,"letters.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"������ �� ��� �����, ��� ������� �������� ����������� ����������. ��� �� ���� �� ����� �� ������� ��� ���������� ����, �� ��� ������� ��������� �� ���� ����� �������� �������� ���������� �������: �������� ����� �� �������, ���������� � ������ � ��������.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(MP1RECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("�������","������ ������ �������� ���������� ������� (���������� ���� +30). ���������: ������� (1).");
			MP1RECIPE = TRUE;
		};
	};
};

instance ALCHEMY_MP2(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "MP2RECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ ��������� ���������� �������";
	text[1] = NAME_BONUS_MANA;
	count[1] = MANA_EXTRAKT;
	on_state[0] = usemp2recipe;
};

func void usemp2recipe()
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
		Doc_SetPage(ndocid,0,"letters.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"������ ������� ����� ������ � ������ ������: � �������, � ���� ����. ������� ����� ����� �������� � �������� �������, ������ � �������: ��� ����� �������� �������� ���������� �������.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(MP2RECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("�������","������ ������ ��������� ���������� ������� (���������� ���� +50). ���������: ������� ����� (1).");
			MP2RECIPE = TRUE;
		};
	};
};

instance ALCHEMY_MP3(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "MP3RECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ ����� ���������� �������";
	text[1] = NAME_BONUS_MANA;
	count[1] = MANA_ELIXIER;
	on_state[0] = usemp3recipe;
};

func void usemp3recipe()
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
		Doc_SetPage(ndocid,0,"letters.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"����� �� ����� ������� ���������� �������� ��������� �������� ������. ������ �� ����� ������ ������ ����� ����� ��������, ������� ������� �����, ������� � �������� ������� ����������� ����� �������������� ���������� �������. ��������� ���������� �������� �������� �������, ��� � ������������� ������������ ����� ������� � ������. �� ����� ����, ��� ������ ��������� ������ ������.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(MP3RECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("�������","������ ������ ����� ���������� ������� (���������� ���� +70). ���������: �������� ������ (1).");
			MP3RECIPE = TRUE;
		};
	};
};

instance ALCHEMY_MPMAX(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "MPMAXRECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ �������� ���� ����";
	text[1] = NAME_BONUS_MANAMAX;
	count[1] = MANAMAX_ESSENZ;
	on_state[0] = usempmaxrecipe;
};

func void usempmaxrecipe()
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
		Doc_SetPage(ndocid,0,"letters.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"������ ����� ����� ������� ������������ ����� � ������������� �� ��� ����������� ������������. ����� ����������� ���, ����� ��� �����������: ������ ��� � ������ ����. ������������ �������� ���������� � ������ ���� � ������������ ����� ���� ����� � ������ �����. ����� �� ���������, ��������� ����� �������� �������� ������ ���� ����� ����� ��������� ����������.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(MPMAXRECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("�������","������ ������ �������� ���� ���� (������������ ���������� ���� +5). ���������: ������ ��� (1) � ������ ���� (1).");
			MPMAXRECIPE = TRUE;
		};
	};
};

instance ALCHEMY_HPMAX(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "HPMAXRECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ �������� �����";
	text[1] = NAME_BONUS_HPMAX;
	count[1] = HPMAX_ESSENZ;
	on_state[0] = usehpmaxrecipe;
};

func void usehpmaxrecipe()
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
		Doc_SetPage(ndocid,0,"letters.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"��� ��������, ����������� ��������� ����, ����� ������� ������� ����. ����� ����������� �������� ��������������� ������, ������������ ������ ���. ������ ����������� ���������� ��� ����������� � ����� � ����� � ������������ ����� ��������. �� ���������� ��������� � ������� �� ���������� ����: ����� ��� ��������������� � ������� ����� ������ ���� � ������.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(HPMAXRECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("�������","������ ������ �������� ����� (������������ ��������� ���� +5). ���������: ������ ��� (1) � ������� ���� (1).");
			HPMAXRECIPE = TRUE;
		};
	};
};

instance ALCHEMY_DEX(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "DEXRECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ �������� ��������";
	text[1] = NAME_BONUS_DEX;
	count[1] = DEX_ESSENZ;
	on_state[0] = usedexrecipe;
};

func void usedexrecipe()
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
		Doc_SetPage(ndocid,0,"letters.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"��� �������� �������� ���������� ���������� ��������� ���. ����� ���������� ���� ������ ����� ������� � ���� ����� ������ ����. ����� ���������� ���� ������������, ���������� ����� ���������� ���������� ������� ����� � ����� ������. ������ � ����� ��������� ����� �������������� �������� �������� ����� �������. ������ ��������� � �� ������������ �� � ����!");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(DEXRECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			if(DIFF_HARD == TRUE)
			{
				b_logentry("�������","������ ������ �������� �������� (�������� +1). ���������: ��������� ��� (1), ����� ������� (1) � ������ ���� (1).");
			}
			else
			{
				b_logentry("�������","������ ������ �������� �������� (�������� +3). ���������: ��������� ��� (1), ����� ������� (1) � ������ ���� (1).");
			};
			DEXRECIPE = TRUE;
		};
	};
};

instance ALCHEMY_STR(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "STRRECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ �������� ����";
	text[1] = NAME_BONUS_STR;
	count[1] = STR_ESSENZ;
	on_state[0] = usestrrecipe;
};

func void usestrrecipe()
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
		Doc_SetPage(ndocid,0,"letters.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"��� � ��� ������ ����� � �������������� ���������, ����� ����������� ���������� ��������� ���. � ���� ����������� ����� �������� ������ � ���� �������� �����. ���������� ����� �������, ���� �� ���������� ���������� ������ ����. ��� ��������, ��� �������� ������ ��������� ����� ���� ���� � �����.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(STRRECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			if(DIFF_HARD == TRUE)
			{
				b_logentry("�������","������ ������ �������� ���� (���� +1). ���������: ��������� ��� (1), �������� ������ (1) � �������� ����� (1).");
			}
			else
			{
				b_logentry("�������","������ ������ �������� ���� (���� +3). ���������: ��������� ��� (1), �������� ������ (1) � �������� ����� (1).");
			};
			STRRECIPE = TRUE;
		};
	};
};

instance ALCHEMY_EGG(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "EGGRECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ ����� �� ��� �������� ��������";
	text[1] = NAME_BONUS_MANAMAX;
	count[1] = MANAMAX_ELIXIEREGG;
	on_state[0] = useeggrecipe;
};

func void useeggrecipe()
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
		Doc_SetPage(ndocid,0,"letters.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"���������! ���� ��������� ������ ������! ������ ����� �� �������� ������� �����, ���������� ������ ��� ������� �������, �� �������� �� �������� �������� ����������� ������� ������... � ��� �������� ��� ���� �������, ��� ������ ��������� �� ���. �� ������, ��� ����� ������� �������� ��� ����� ����� ����������� � ����� ��������, � ��� �� ������ ���� ��� ����� ���������. ����������� � ����������� ����� � ����� ������ � ������� ��� ������� ���, ������� ������� �����. ");
		Doc_PrintLines(ndocid,0,"�� ���� ��������, ��� ������ ����� ����� ��� ���� � ����� �������� ���������: �������� ������, ����������� ������� �������, ������ � ������ ������������ � ����������, � ����� �������. ����� ����������� �������� �������� � ����� ��������� �������� ����������� ������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"�� �������� � ����� ������!");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"- �����");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(EGGRECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("�������","������ ������ ����� �� ��� �������� �������� (������������ ���������� ���� +10). ���������: ���� �������� (3) � �������� (6).");
			EGGRECIPE = TRUE;
		};
	};
};

instance ALCHEMY_FORTUNO(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "YBRECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ ��������� ����� �������";
	text[1] = NAME_BONUS_MANAMAX;
	count[1] = 10;
	text[2] = NAME_BONUS_HPMAX;
	count[2] = 10;
	on_state[0] = usefortunorecipe;
};

func void usefortunorecipe()
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
		Doc_PrintLines(ndocid,0,"������ �� ������� ����� ���, ������� ����� � ����. ����� ������� ��� � ��������� � ������� � ������ ��������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"������ ����� � ���������� �� ������� ������, � ������� ������� ���������� � ������������ ������ ����.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"- �������");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(FORTUNORECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("�������","������ ������ ��������� ����� ������� (������������ ���������� � ��������� ���� +10). ���������: ������� ���� (1), ������ ����� (1) � ������ ���� (1).");
			FORTUNORECIPE = TRUE;
		};
	};
};

instance ALCHEMY_MASTER(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1200;
	visual = "MASTERRECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ ����� ����";
	text[1] = NAME_BONUS_DEX;
	count[1] = 4;
	text[2] = NAME_BONUS_STR;
	count[2] = 4;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usemasterrecipe;
};

func void usemasterrecipe()
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
		Doc_PrintLines(ndocid,0,"������ �� �������� ���� � �������� ����� ������� ���������, ������ �� � ����� ������. �������������� ���������� ������� �� ������� �������� ����, � �������� �������� ��������� ��������� ����������. �������, ����� ������ �� �������� ��� ����� ������� ����� ��-�� �� ������������.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(MASTERRECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("�������","������ ������ ����� ���� (�������� � ���� +4). ���������: �������� �������� (1) � �������� ���� (1).");
			MASTERRECIPE = TRUE;
		};
	};
};
	
////////////������� ���������/////////////////////

instance ALCHEMY_HP1_PRICED(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "HP1RECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ �������� ���������";
	text[1] = NAME_BONUS_HP;
	count[1] = 50;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usehp1recipe_priced;
};

instance ALCHEMY_HP2_PRICED(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 200;
	visual = "HP2RECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ ��������� ���������";
	text[1] = NAME_BONUS_HP;
	count[1] = 70;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usehp2recipe_priced;
};

instance ALCHEMY_HP3_PRICED(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 300;
	visual = "HP3RECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ ����� ���������";
	text[1] = NAME_BONUS_HP;
	count[1] = 100;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usehp3recipe_priced;
};

instance ALCHEMY_MP1_PRICED(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "MP1RECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ �������� ���������� �������";
	text[1] = NAME_BONUS_MANA;
	count[1] = 30;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usemp1recipe_priced;
};

instance ALCHEMY_MP2_PRICED(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 200;
	visual = "MP2RECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ ��������� ���������� �������";
	text[1] = NAME_BONUS_MANA;
	count[1] = 50;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usemp2recipe_priced;
};

instance ALCHEMY_MP3_PRICED(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 300;
	visual = "MP3RECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ ����� ���������� �������";
	text[1] = NAME_BONUS_MANA;
	count[1] = 70;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usemp3recipe_priced;
};

instance ALCHEMY_MPMAX_PRICED(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 600;
	visual = "MPMAXRECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ �������� ���� ����";
	text[1] = NAME_BONUS_MANAMAX;
	count[1] = 5;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usempmaxrecipe_priced;
};

instance ALCHEMY_JOINT2(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 40;
	visual = "JOINTRECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ '��������� �������'";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usejoint2recipe;
};

instance ALCHEMY_JOINT3(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 80;
	visual = "JOINTRECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "������ '���� �����'";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usejoint3recipe;
};

//////////////////////////////////////////

func void usehp1recipe_priced()
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
		Doc_PrintLines(ndocid,0,"������� �� '������� ����� ����, ����� � ��������' ������, 562 �.");
		Doc_PrintLines(ndocid,0,"-------------------");
		Doc_PrintLines(ndocid,0,"...����������� ������ �������� �����. �� �� �������� ������� ������������� ����������� ��������. ���������, ��� ������, ������ � ����� �������� ������� ������, ���� �� �������� �� ������.");
		Doc_PrintLines(ndocid,0," ");
		Doc_PrintLines(ndocid,0,"...���������� ������� ��� ���� �������. � ������� ������� � ������ ���������� ������ �� ��������� ������������ ������������ ������. ���������� ������ � ����������� ������, �������� ������� ���� � �������� �� ������� �� �������. ��������� ������������ �������� � ������ ������� ����������� ������ � ������� ������. ��������� ����� � ��������� ���� � ������. ������������ �������, ���� ���������� �� ������� ���������� ����������� ����. �������� ��������� ������ � ������������.");
		Doc_PrintLines(ndocid,0," ");
		Doc_PrintLines(ndocid,0,"����������. ���������� ����� ���������� ��� ����, ����� ��������� ���������� ����� ������� ��������. ����� ������� ������������ ������ � ���������� �������� �������� �������� ����� � ������.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(HP1RECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("�������","������ ������ �������� ��������� (��������� ���� +50). ���������: �������� ����� (1).");
			HP1RECIPE = TRUE;
		};
	};
};

func void usehp2recipe_priced()
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
		Doc_PrintLines(ndocid,0,"������� �� '������� ����� ����, ����� � ��������' ������, 562 �.");
		Doc_PrintLines(ndocid,0,"-------------------");
		Doc_PrintLines(ndocid,0,"...����������� ��� ���������� �������� ��������. ���������, ����� ���������� ������������ �������� ���������, ��� ����� �������� �� ��������� ������� ����.");
		Doc_PrintLines(ndocid,0," ");
		Doc_PrintLines(ndocid,0,"...������������ ����� �������� �������� � ����� � ������� ���������, ������� ���� �� �������� � ���������� �������. ����� ��������� �� �������, � �������� ����� �������� �������� � ������� � ������� ���� ���, ����� �� ��� �� �������. ����������� �� ����� ��������� ���� �� ��� ���, ���� �� ���������� ���� � �����. � ����������� ������ ��������� ������� � ���� ��� ������ ������ ����...");
		Doc_PrintLines(ndocid,0," ");
		Doc_PrintLines(ndocid,0,"����������. ���������� �� ��������� ���������� ������� � ���������� ����. ���������� ����� ������� ���� ������ ������������ � ���� � �������� �������� ����������� ��������������.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(HP2RECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("�������","������ ������ ��������� ��������� (��������� ���� +70). ���������: �������� �������� (1).");
			HP2RECIPE = TRUE;
		};
	};
};

func void usehp3recipe_priced()
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
		Doc_PrintLines(ndocid,0,"������� �� '������� ����� ����, ����� � ��������' ������, 562 �.");
		Doc_PrintLines(ndocid,0,"-------------------");
		Doc_PrintLines(ndocid,0,"...��������� �������� ������ �������� ������. �������, ��� ��� ������ ������ ����� ����������� � ���� �� ��������� �����������. ��� ������� ��� �������� �� ������������.");
		Doc_PrintLines(ndocid,0," ");
		Doc_PrintLines(ndocid,0,"�������� �������� �� ������� � �������� ��� ������� �������. ���������� � ������ �� ��������� ��������� ����� ����������� �������� � ��������� � �������. ��� �������� � �������������� ������� ����� � ������� ��������� ������� ���� �������� �� �������� � �������� �� �������, � ����� ��������� ���� ���������� ������ � ����������� ���������� �������, ����� �������� ������ ���� ��������������� ������� � ����� � ����� ���������. ���������� �������� ��������� ����� � ��������� ��� � ����...");
		Doc_PrintLines(ndocid,0," ");
		Doc_PrintLines(ndocid,0,"����������. ��������, ������ ����� ��������, ���� ������������ ������ �������� ������� �� ������� � ���������� ������ ��������.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(HP3RECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("�������","������ ������ ����� ��������� (��������� ���� +100). ���������: �������� ������ (1).");
			HP3RECIPE = TRUE;
		};
	};
};

func void usemp1recipe_priced()
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
		Doc_PrintLines(ndocid,0,"������� �� '������� ����� ����, ����� � ��������' ������, 562 �.");
		Doc_PrintLines(ndocid,0,"-------------------");
		Doc_PrintLines(ndocid,0,"...������ ����� ������������ � ������� �������. ��� ����������� ������ ����� ����� ��������...");
		Doc_PrintLines(ndocid,0," ");
		Doc_PrintLines(ndocid,0,"�������� ��� ����������� ������ ���������� ������� � ����� ������� �� �����. ��������� ����� �� �������, �������� ����� �� ������� � ������� �����. �� ��������� ���������� �����. ���������� �������� ������ ������������ � ������ ����. ������� ����� � ����, ��� ������ ������������ ����������� ������. ����� ������ ������ � ����� ���� ��������� ��� � ������� ��� ��������.");
		Doc_PrintLines(ndocid,0," ");
		Doc_PrintLines(ndocid,0,"����������. ��������� ��������� ������� �������� � �����. ������ ���� ���������� ����� �������� � ��������� ������ ����� � ��������, ������ �������� �� ���� ������ ����� ���� ������������ ��� ������������� �������� �������.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(MP1RECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("�������","������ ������ �������� ���������� ������� (���������� ���� +30). ���������: ������� (1).");
			MP1RECIPE = TRUE;
		};
	};
};

func void usemp2recipe_priced()
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
		Doc_PrintLines(ndocid,0,"������� �� '������� ����� ����, ����� � ��������' ������, 562 �.");
		Doc_PrintLines(ndocid,0,"-------------------");
		Doc_PrintLines(ndocid,0,"...������ �� ���� �������� ��������, ��� ��� ���������� ���� ����� ������������ � ������� �����...");
		Doc_PrintLines(ndocid,0," ");
		Doc_PrintLines(ndocid,0,"��������� ���������� ������� ������ �������� �����, �������� � ��� ������� ������ � ������� � �������� ����. ��������� ������ �������� �� �������� �������� ��������� � ������ � ��������� � ������ � �����. ��������� ����� ����� �� �����, ���������� ������� � ��������� �� �������. ��������� ����� �������� ��������� � ������� � ������� ����. �� ���� ����������� ����, � ��� ������ ������ ���������������� ��������� ����� ��������... � ���������� �������� �������� ������� ���������� ���� � ��������� �����������.");
		Doc_PrintLines(ndocid,0," ");
		Doc_PrintLines(ndocid,0,"����������. ����������� � ����� ������������ ������� ����� �������� � ������������� ��������, � ��������� ��������� �������.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(MP2RECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("�������","������ ������ ��������� ���������� ������� (���������� ���� +50). ���������: ������� ����� (1).");
			MP2RECIPE = TRUE;
		};
	};
};

func void usemp3recipe_priced()
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
		Doc_PrintLines(ndocid,0,"������� �� '������� ����� ����, ����� � ��������' ������, 562 �.");
		Doc_PrintLines(ndocid,0,"-------------------");
		Doc_PrintLines(ndocid,0,"...��� �������� �������� ����� ���������� ������� �������� � �������� ������. ��� ������������� ����������� ����� ������� � ���� ��������� �������� ��������.");
		Doc_PrintLines(ndocid,0," ");
		Doc_PrintLines(ndocid,0,"��������� ������� � �������� ��� � ���������� ������ ����� �������, ����� �������� ����������� � �������. ������� �������� ����� � ��������� ����������� ������ � ��������� �����������. ������� ����� � �������� �������� �� �������. ������� ����� ��� �������� � �������� ������� ��� ����������� � ��� ������ ��� �����������. ���������� ����� ������� ���������� � ������� ���������� ����.");
		Doc_PrintLines(ndocid,0," ");
		Doc_PrintLines(ndocid,0,"����������. ������������ �������� ����� ��������� ����� ����� �������� � ������ ��������.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(MP3RECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("�������","������ ������ ����� ���������� ������� (���������� ���� +70). ���������: �������� ������ (1).");
			MP3RECIPE = TRUE;
		};
	};
};

func void usempmaxrecipe_priced()
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
		Doc_PrintLines(ndocid,0,"������� �� '������� ����� ����, ����� � ��������' ������, 562 �.");
		Doc_PrintLines(ndocid,0,"-------------------");
		Doc_PrintLines(ndocid,0,"...� ������ ���������� ����� ��� �������� ���������� ������������ ����� ���� ������������ ���������� ������� ��� � ������ ����.");
		Doc_PrintLines(ndocid,0," ");
		Doc_PrintLines(ndocid,0,"...��� ������� ��������� ����������� ���� � ��������� � �������. ��� �������� ������ ����� �������� ������ ������ ���� ������� ��������� ����� �������. ����������� ��� � ����� ��� �����������. ����� ��� ������� ����������, � ����� ������� � ����� ����. ���� �������� ����, ����� �������� ������� ������ ���� ������� � �������� �� � �����. ������� ����� � ���������� ���������� ���... � ���������� �������� �������� ������ ���������� ����...");
		Doc_PrintLines(ndocid,0," ");
		Doc_PrintLines(ndocid,0,"����������. ������ ��� ���������, ��� �� ����������� ������, � �� ������� �� ����, ���. ������������ ���������� ����� �������� � ������������� ��������, ������� ����� ����������� �� ������� ���� ��������������.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(MPMAXRECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("�������","������ ������ �������� ���� ���� (������������ ���������� ���� +5). ���������: ������ ��� (1) � ������ ���� (1).");
			MPMAXRECIPE = TRUE;
		};
	};
};

func void usejoint2recipe()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters2.TGA",0);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLines(ndocid,0,"��� ������� ����! ��� ������������� ����� ������� ������ �����: �� ��� � ������ ��������� ����������� � ����� �� ������ ���������� � ������������. ���������� ���������� ������������ �� ������.");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"     - �������");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
	JOINT2RECIPE = TRUE;
};

func void usejoint3recipe()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters2.TGA",0);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLines(ndocid,0,"������ ����. ��� ������������� ����� ������� ������ ������� �����. �� ����� �������� � ������� � ������� � ������������ ����������.");
	Doc_PrintLines(ndocid,0,"����� � ������ �� ���� �������� ��������, �� ����� ������ ����� ������ ������� �� ����.");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"     - �������");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
	JOINT3RECIPE = TRUE;
};

