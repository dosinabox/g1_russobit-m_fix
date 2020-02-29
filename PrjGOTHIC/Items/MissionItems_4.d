
instance ITWR_GOLEMBOOK1(C_ITEM)
{
	name = "Арканум Голум - Том I";
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
	Doc_PrintLine(ndocid,0,"АРКАНУМ ГОЛУМ - Том I");
	Doc_PrintLine(ndocid,0,"=====================");
	Doc_PrintLines(ndocid,0,"(Магия големов)");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Только тот, кому хотя бы однажды удалось встретиться с этим созданием, сможет понять, с каким интересом встречает это магическое существо любознательного путешественника.");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"Каменный голем");
	Doc_PrintLine(ndocid,1,"------------");
	Doc_PrintLines(ndocid,1,"Эти каменные великаны почти неуязвимы в бою. Мечи, топоры, стрелы не причиняют им никакого ущерба.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Единственный достоверный рассказ о победе над каменным големом был записан одним солдатом. Его удалось победить боевым молотом.");
	Doc_Show(ndocid);
};


instance ITWR_GOLEMBOOK2(C_ITEM)
{
	name = "Арканум Голум - Том II";
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
	Doc_PrintLine(ndocid,0,"АРКАНУМ ГОЛУМ - Том II");
	Doc_PrintLine(ndocid,0,"======================");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Ледяной голем");
	Doc_PrintLine(ndocid,0,"---------");
	Doc_PrintLines(ndocid,0,"Ледяные големы подобны каменным. Они полностью состоят изо льда. Все знакомое нам оружие просто соскальзывает по его телу, не причиняя никакого вреда.");
	Doc_PrintLines(ndocid,0,"Искателям приключений следует знать, что дыхание этого голема очень опасно. Если подойти к нему слишком близко, он может превратить вас в ледяную колонну.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLines(ndocid,1,"Один из магов огня рассказывал о встрече с ледяным големом. Кажется, ему было легко справиться с этим чудовищем.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Огненный голем");
	Doc_PrintLine(ndocid,1,"------------");
	Doc_PrintLines(ndocid,1,"Как говорят, эти огненные создания могут одним своим прикосновением превратить свою жертву в пылающий факел.");
	Doc_PrintLines(ndocid,1,"Год назад группа охотников столкнулась с одним из этих чудовищ. Исход битвы неизвестен, но некоторые утверждают, что молнии и лед смогли усмирить адское создание.");
	Doc_Show(ndocid);
};


instance ITWRWORLDMAP_ORC(C_ITEM)
{
	name = "Карта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWrWorldMap_Orc.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = useworldmap_orc;
	description = "Карта колонии (дополненная)";
	text[0] = "Орк-шаман Ур-Шак дорисовал на этой";
	text[1] = "карте земли орков!";
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
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = "Ключ от Свободной шахты";
};

instance ORCMEDICINE(C_ITEM)
{
	name = "Зелье орка";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ITFO_POTION_STRENGTH_01.3DS";
	material = MAT_GLAS;
	on_state[0] = useorcmedicine;
	scemename = "POTION";
	description = name;
	text[1] = "Действие: неизвестно";
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
	name = "Улу-Мулу";
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
	text[0] = "Великий знак силы и достоинства.";
	text[1] = "Его хозяин может не бояться орков!";
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

