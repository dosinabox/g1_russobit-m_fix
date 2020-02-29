
instance ORKPARCHMENTONE(C_ITEM)
{
	name = "Обрывок свитка";
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
	text[0] = "Кажется, не хватает нижней половины.";
	text[1] = "Письмена этого свитка очень похожи";
	text[2] = "на руны, написанные на стенах пещеры.";
	text[3] = "";
};

instance ORKPARCHMENTTWO(C_ITEM)
{
	name = "Обрывок свитка";
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
	text[0] = "Кажется, у этого свитка";
	text[1] = "оторвана верхняя половина.";
	text[2] = "Его письмена очень похожи";
	text[3] = "на руны, написанные на стенах пещеры.";
};

instance ITKE_PSI_KALOM_01(C_ITEM)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = "Ключ из лаборатории";
	text[0] = "Открывает сундук в алхимической лаборатории";
	text[1] = "Болотного лагеря.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWRFOCIMAP(C_ITEM)
{
	name = "Карта Сатураса";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 15;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = usefocimap;
	description = name;
	text[0] = "Вершины пентаграммы отмечают";
	text[1] = "места, в которых находятся пять юниторов,";
	text[2] = "которые использовались при создании";
	text[3] = "магического Барьера. Карта очень старая,";
	text[4] = "и, возможно, сейчас юниторы находятся";
	text[5] = "в других местах.";
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
	name = "Страница дневника";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = usetroll;
	description = name;
	text[1] = "Сильно помятая страница. Записи на ней";
	text[2] = "едва различимы.";
	text[3] = "Кажется, ее владелец был охотником";
	text[4] = "на троллей.";
};


func void usetroll()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_PrintLine(ndocid,0,"День 169.");
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Сегодня у меня точно все получится. Я это знаю, боги помогут мне. Я испробовал все, чтобы убить тролля. Его шкуру не пробивает даже самый острый клинок, а стрелы отскакивают от него, как от камня.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Но теперь у меня есть волшебный свиток. Я выменял его у одного торговца из Хориниса. 50 золотых монет, конечно, высокая цена, но он того стоил.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Сегодня я убью тролля.");
	Doc_Show(ndocid);
};


instance FOCUS_2(C_ITEM)
{
	name = "Юнитор из ущелья тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	hp = 1;
	hp_max = 1;
	weight = 1;
	value = 1;
	visual = "ItMi_Focus_01.3ds";
	material = MAT_STONE;
	description = name;
	text[1] = "Один из пяти юниторов, которые использовались";
	text[2] = "для создания магического Барьера.";
};

instance ITKE_BERG_01(C_ITEM)
{
	name = "Ключ от сундука";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Ржавый ключ";
	text[1] = "от сундука";
	text[2] = "в горном форте.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_URKUNDE_01(C_ITEM)
{
	name = "Завещание";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 15;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = useurkunde;
	description = "Завещание";
	text[0] = "Владелец этого документа";
	text[1] = "может заявить о своих правах";
	text[2] = "на форт и прилегающие земли.";
	text[5] = "Цена                400 фунтов золотом";
};


func void useurkunde()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_PrintLine(ndocid,0,"Завещание");
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Я, Бергмар, граф, владелец земель до западного леса и наделов до Тимориса, которые находятся в землях Хориниса... завещаю... что я... владельцу данного документа... и дому Инноса мой феод с горным фортом (с положенной мне десятиной и всеми находящимися на этой земле шахтами) купленным за 400 фунтов золотом.");
	Doc_Show(ndocid);
};


instance FAKESCROLL(C_ITEM)
{
	name = "Письмо";
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
	name = "Юнитор из горного форта";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	hp = 1;
	hp_max = 1;
	weight = 1;
	value = 1;
	visual = "ItMi_Focus_01.3ds";
	material = MAT_STONE;
	description = name;
	text[1] = "Один из пяти юниторов, которые использовались";
	text[2] = "для создания магического Барьера.";
};

instance ITKE_FOCUS4(C_ITEM)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 3;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[1] = "Это ключ из";
	text[2] = "пещеры в разрушенном монастыре.";
};

instance FOCUS_4(C_ITEM)
{
	name = "Юнитор из разрушенного монастыря";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	hp = 1;
	hp_max = 1;
	weight = 1;
	value = 1;
	visual = "ItMi_Focus_01.3ds";
	material = MAT_STONE;
	description = name;
	text[1] = "Один из пяти юниторов, которые использовались";
	text[2] = "для создания магического Барьера.";
};

instance ITMI_ORCTALISMAN(C_ITEM)
{
	name = "Талисман орков";
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
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 3;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[1] = "Это ключ из склепа";
	text[2] = "внутри каменного кольца.";
};

instance FOCUS_5(C_ITEM)
{
	name = "Юнитор из каменного кольца";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	hp = 1;
	hp_max = 1;
	weight = 1;
	value = 1;
	visual = "ItMi_Focus_01.3ds";
	material = MAT_STONE;
	description = name;
	text[1] = "Один из пяти юниторов, которые использовались";
	text[2] = "для создания магического Барьера.";
};

