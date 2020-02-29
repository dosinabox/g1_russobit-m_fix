
instance ITWR_GOLEMBOOK1(C_ITEM)
{
	name = "������� ����� - ��� I";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = usegolembook1;
};


func void usegolembook1()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"������� ����� - ��� I");
	Doc_PrintLine(ndocid,0,"=====================");
	Doc_PrintLines(ndocid,0,"(����� �������)");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"������ ���, ���� ���� �� ������� ������� ����������� � ���� ���������, ������ ������, � ����� ��������� ��������� ��� ���������� �������� ��������������� ���������������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"�������� �����");
	Doc_PrintLine(ndocid,1,"------------");
	Doc_PrintLines(ndocid,1,"��� �������� �������� ����� ��������� � ���. ����, ������, ������ �� ��������� �� �������� ������.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"������������ ����������� ������� � ������ ��� �������� ������� ��� ������� ����� ��������. ��� ������� �������� ������ �������.");
	Doc_Show(ndocid);
};


instance ITWR_GOLEMBOOK2(C_ITEM)
{
	name = "������� ����� - ��� II";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = usegolembook2;
};


func void usegolembook2()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"������� ����� - ��� II");
	Doc_PrintLine(ndocid,0,"======================");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"������� �����");
	Doc_PrintLine(ndocid,0,"---------");
	Doc_PrintLines(ndocid,0,"������� ������ ������� ��������. ��� ��������� ������� ��� ����. ��� �������� ��� ������ ������ ������������� �� ��� ����, �� �������� �������� �����.");
	Doc_PrintLines(ndocid,0,"��������� ����������� ������� �����, ��� ������� ����� ������ ����� ������. ���� ������� � ���� ������� ������, �� ����� ���������� ��� � ������� �������.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLines(ndocid,1,"���� �� ����� ���� ����������� � ������� � ������� �������. �������, ��� ���� ����� ���������� � ���� ���������.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"�������� �����");
	Doc_PrintLine(ndocid,1,"------------");
	Doc_PrintLines(ndocid,1,"��� �������, ��� �������� �������� ����� ����� ����� �������������� ���������� ���� ������ � �������� �����.");
	Doc_PrintLines(ndocid,1,"��� ����� ������ ��������� ����������� � ����� �� ���� �������. ����� ����� ����������, �� ��������� ����������, ��� ������ � ��� ������ �������� ������ ��������.");
	Doc_Show(ndocid);
};


instance ITWRWORLDMAP_ORC(C_ITEM)
{
	name = "�����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWrWorldMap_Orc.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = useworldmap_orc;
	description = "����� ������� (�����������)";
	text[0] = "���-����� ��-��� ��������� �� ����";
	text[1] = "����� ����� �����!";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useworldmap_orc()
{
	var int ndocid;
	ndocid = Doc_CreateMap();
	Doc_SetLevel(ndocid,"WORLD.ZEN");
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Map_World_Orc.tga",1);
	Doc_Show(ndocid);
};


instance ITKE_FREEMINE(C_ITEM)
{
	name = "����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = "���� �� ��������� �����";
};

instance ORCMEDICINE(C_ITEM)
{
	name = "����� ����";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ITFO_POTION_STRENGTH_01.3DS";
	material = MAT_GLAS;
	on_state[0] = useorcmedicine;
	scemename = "POTION";
	description = name;
	text[1] = "��������: ����������";
};


func void useorcmedicine()
{
	if(c_npcisorc(self))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	}
	else
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
	};
};


instance ULUMULU(C_ITEM)
{
	name = "���-����";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	value = 1000;
	damagetotal = 35;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_Amulet_Ulumulu_02.3ds";
	visual_skin = 0;
	material = MAT_WOOD;
	description = name;
	text[0] = "������� ���� ���� � �����������.";
	text[1] = "��� ������ ����� �� ������� �����!";
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

