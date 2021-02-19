
instance ITWR_BOOK_CIRCLE_01(C_ITEM)
{
	name = "Первый круг магии";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 50;
	visual = "ItWr_Book_Magic.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Первый круг магии";
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
	Doc_PrintLine(ndocid,0,"Первый круг магии");
	Doc_PrintLine(ndocid,0,"---------------");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Когда боги даровали человеку способность воспринимать мир магии и использовать его, они наделили его знанием, позволяющим создавать руны. Слуги богов взяли на себя почетную миссию создания и использования этих артефактов божественной силы. Постигая знания Кругов магии, они могли читать определенные заклинания.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Свет");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"Первый дар Инноса людям. Маг создает ярко светящийся шар.");
	Doc_PrintLine(ndocid,1,text);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Ледяная стрела");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"Выстрел магической энергии.");
	Doc_PrintLine(ndocid,1,text_1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Огненная стрела");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"Выстрел магического огня.");
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
	name = "Второй круг магии";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_Magic.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Второй круг магии";
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
	Doc_PrintLine(ndocid,0,"Второй круг магии");
	Doc_PrintLine(ndocid,0,"---------------");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Все заклинания высвобождают магическую энергию силой того, кто их использует. Такого человека называют магом.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Каждое применение заклинания отбирает у мага часть энергии, которая называется магической силой.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Исцеление");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"Аданос увидел, что люди не бессмертны, что они умирают по воле Белиара. И он решил, что не будет подчиняться Белиару, а даст людям возможность исцелять свои тела.");
	Doc_PrintLines(ndocid,1,"Это заклинание освобождает силу, исцеляющую мага.");
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
	name = "Третий круг магии";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 150;
	visual = "ItWr_Book_Magic.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Третий круг магии";
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
	Doc_PrintLine(ndocid,0,"Третий круг магии");
	Doc_PrintLine(ndocid,0,"---------------");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Некоторые заклинания используют определенное количество магической силы. Они называются зарядными заклинаниями.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Другие заклинания сохраняются до тех пор, пока маг может расходовать на них свою магическую энергию. Они называются инвестирующими заклинаниями.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Огненный шар");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"Второй дар Инноса детям огня. Огненный шар, сжигающий свою жертву.");
	Doc_PrintLine(ndocid,1,NAME_SPELL_LOAD);
	Doc_PrintLine(ndocid,1,text);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Ледяная глыба");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"Жертва превращается в ледяную глыбу. Это заклинание Круга Воды.");
	Doc_PrintLine(ndocid,1,text_1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Шаровая молния");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"Шар, созданный из магической энергии.");
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
	name = "Четвертый круг магии";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 200;
	visual = "ItWr_Book_Magic.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Четвертый круг магии";
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
	Doc_PrintLine(ndocid,0,"Четвертый круг магии");
	Doc_PrintLine(ndocid,0,"---------------");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Магия телепортации");
	Doc_PrintLine(ndocid,0,"---------------");
	Doc_PrintLines(ndocid,0,"Главная особенность: несмотря на то, что заклинание заключено в руну, оно может быть прочитано каждым, кто обладает магической силой. При этом энергия заклинания сразу освобождается. Для него не существует ограничений.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"Огненный шторм");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"Это заклинание действует как огненный шар на одного противника, а потом переносится на других, стоящих возле него.");
	Doc_PrintLine(ndocid,1,NAME_SPELL_LOAD);
	Doc_PrintLine(ndocid,1,text);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Молния");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"Заклинание действует на многих врагов. Его силу сложно контролировать, магу следует осторожно его использовать.");
	Doc_PrintLine(ndocid,1,text_1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Уничтожение нежити");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"Это заклинание уничтожает существа, порожденные тьмой.");
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
	name = "Пятый круг магии";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 250;
	visual = "ItWr_Book_Magic.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Пятый круг магии";
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
	Doc_PrintLine(ndocid,0,"Пятый круг магии");
	Doc_PrintLine(ndocid,0,"---------------");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Огненный дождь");
	Doc_PrintLine(ndocid,0,"---------------");
	Doc_PrintLines(ndocid,0,"Сила божественного огня поражает любое живое существо, находящееся в поле зрения мага.");
	Doc_PrintLine(ndocid,0,text_1);
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Ледяная волна");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"Волна магического льда накрывает всех противников и замораживает их на короткое время. Жертвы сохраняют подвижность, но при этом постепенно теряют свою жизненную силу.");
	Doc_PrintLines(ndocid,1,"Заклинание Круга Воды.");
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
	name = "Шестой круг магии";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 300;
	visual = "ItWr_Book_Magic2.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Шестой круг магии";
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
	Doc_PrintLine(ndocid,0,"Шестой круг магии");
	Doc_PrintLine(ndocid,0,"---------------");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Дыхание смерти");
	Doc_PrintLine(ndocid,0,"---------------");
	Doc_PrintLines(ndocid,0,"Дыхание Белиара. Облако забирающего жизнь Ничто, способное мгновенно убить жертву.");
	Doc_PrintLine(ndocid,0,text);
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Волна Смерти");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"Немногое известно о руне, содержащей энергию УРИЗЕЛЯ.");
	Doc_PrintLines(ndocid,1,"Сохранилась память лишь о том, что она скрывает силы Белиара.");
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
	name = "Дар богов";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Дар богов";
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
	Doc_PrintLine(ndocid,0,"Магия");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"Дар богов");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"В течение столетий люди пытались постичь смысл и происхождение магии. Но каким образом собирались они это сделать? Как можно исследовать магию? Это самая противоречивая сила из тех, что нам известна. Одна и та же сила используется, чтобы убить или исцелить, создать или уничтожить.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"На что похожа эта сила? Где отыскать ее, невидимую и в то же время обладающую таким могуществом? Магия есть то, что она есть. Самый щедрый и могущественный подарок богов. Сила богов дается только избранным, и лишь они способны становиться ее проводниками и обладают даром управлять ею.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Бартос фон Ларан");
	Doc_Show(ndocid);
};


instance GEHEIMNISSE_DER_ZAUBEREI(C_ITEM)
{
	name = "Тайны колдовства";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Тайны колдовства";
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
	Doc_PrintLine(ndocid,0,"Тайны колдовства");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Сам маг является служителем магической силы, а не ее повелителем. Он обладает способностью влиять на мир магической энергии и проводить ее через себя. Адепт, посвященный в высокое искусство магии, должен уметь укрощать свой дух, чтобы добиться этого.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Сила его духа помогает собирать магические арканы, формировать, связывать и вносить в наш вещественный мир. В момент наивысшей концентрации магу удается перенести свой дух из нашего мира в иные миры, откуда к нему приходит сила. Он является лишь ее проводником.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Бартос фон Ларан");
	Doc_Show(ndocid);
};


instance MACHTVOLLE_KUNST(C_ITEM)
{
	name = "Могущественное искусство";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Могущественное искусство";
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
	Doc_PrintLines(ndocid,0,"Могущественное искусство");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Труд для посвященных в искусство аркан.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"В процессе постижения тайн магии увеличивается способность мага собирать энергию. Сначала она течет к нему как лесной ручеек. В это время о ней нужно заботиться, иначе она может иссякнуть. Но потом этот ручеек наполняется и превращается в полноводную реку.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Он растет и растет, становится сильнее с каждым днем. В его дальнейшем могуществе не будет и намека на прежнюю слабость. Достижение максимальной силы - священный долг каждого мага, ибо она была дарована богами и являет собой самый ценный дар, который когда-либо получали смертные.");
	Doc_Show(ndocid);
};


instance ELEMENTARE_ARCANEI(C_ITEM)
{
	name = "Магические знания";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Магические знания";
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
	Doc_PrintLine(ndocid,0,"Магические знания");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Классификация магии в соответствии с земными представлениями.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Долгие годы исследований магии и ее места в мире дали свои плоды. Уже можно сказать, что магия является абсолютным элементом мира. Она может воздействовать на другие элементы, изменяя их природу.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Соединение элемента и магии дает элемент в самой чистой его форме, но в природе такое соединение встречается очень редко. Способность мага создавать из ничего вещи материального мира является доказательством того, что магическая сила вызывает к жизни чистые и высшие элементы, которые только могут существовать в природе.");
	Doc_Show(ndocid);
};


instance WAHRE_MACHT(C_ITEM)
{
	name = "Истинная сила";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Истинная сила";
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
	Doc_PrintLine(ndocid,0,"Истинная сила");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Святой долг посвященного");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Только одно отличает мага от обычного человека. Обладая возможностью влиять на божественную силу, он является существом, для которого не действуют границы и законы мира смертных.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Если маг смог достичь уровня, на котором у него получилось выйти за границы своего существования, он поднимается над законами мира смертных. Он может пересекать границы времени и пространства, даже конец всему существующему в мире - смерть не сможет встать у него на пути.");
	Doc_Show(ndocid);
};


instance DAS_MAGISCHE_ERZ(C_ITEM)
{
	name = "Магическая руда";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Магическая руда";
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
	Doc_PrintLine(ndocid,0,"Магическая руда");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Лучшую руду для мечей, без сомнения, можно найти в шахтах Хориниса. Это самая чистая руда в мире. Она содержит магическую энергию, обладает непревзойденной прочностью и в то же время легка в обработке. Из этой руды, добываемой в темных глубинах шахт Хориниса, куется лучшее оружие, с которым не сравнится ни один клинок, выкованный из обычной стали.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Нет такого щита или доспеха, который смог бы устоять перед ним. Короли и герои древних времен носили оружие из лучшей стали Хориниса, и во всей Миртане оно ценилось очень высоко. Но магическая руда стоит очень дорого. Очень много сил уходит на ее добычу. Кажется, будто руда сама не желает покидать недра земли.");
	Doc_Show(ndocid);
};


instance SCHLACHT_UM_VARANT1(C_ITEM)
{
	name = "Битва при Варанте";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Битва при Варанте";
	text[0] = "Том 1";
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
	Doc_PrintLines(ndocid,0,"... но король Робар решил напасть первым. Он собрал свои войска и все силы направил на ослабленный левый фланг вражеской армии. Он решил не тратить время и стрелы, и мечи его войска с легкостью расправились с врагами. Он направил своих солдат дальше, к границам Варанта. Он знал, что для победы в этой битве нужно разделить вражеское войско и сделать так, чтобы силы Геллона и Люккора не смогли...");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"... объединились и нанесли ему сокрушительный удар. Ему немедленно нужно было вызывать подкрепление, иначе победа досталась бы врагу...");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"...Геллон был убит, его армия разбита, его солдаты бежали с поля боя. Но Робар не хотел дать побежденным ни единого шанса собраться вместе и приказал уничтожить всех, кто остался в живых. Люккор же решил воспользоваться моментом и предпринял последнюю попытку разгромить уставшее войско Робара...");
	Doc_Show(ndocid);
};


instance SCHLACHT_UM_VARANT2(C_ITEM)
{
	name = "Битва при Варанте";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Битва при Варанте";
	text[0] = "Том 2";
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
	Doc_PrintLines(ndocid,0,"Исход войны был известен. Варант, захваченный иноземцами, был полностью разграблен. Король Робар решил не оставаться на полях Варанта, а приказал своим генералам самим расправиться с оставшимися врагами. В разгромленном государстве остались еще войска, которыми руководил Люккор, самый способный военачальник Варанта. Он провел множество блестящих сражений.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Но теперь его войско попало в засаду. Вражеские солдаты готовились к наступлению. Ли, один из лучших генералов Миртаны, загнал его в ловушку. Тяжелая конница Варанта не могла сражаться на заболоченной местности. Вся долина была окружена солдатами генерала Ли, которые нападали на врагов и убивали их одного за другим. Отчаянные попытки выбраться из ловушки не имели успеха. Он был побежден.");
	Doc_Show(ndocid);
};


instance MYRTANAS_LYRIK(C_ITEM)
{
	name = "Лирика Миртаны";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Лирика Миртаны";
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
	Doc_PrintLine(ndocid,0,"    Песнь");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                  покаяния");
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
	Doc_PrintLines(ndocid,1,"Погибло все, но солнце неустанно");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"По-прежнему вершит годов круговорот.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"И память о былом тревожит разум,");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"О прежней жизни чистой вопиет.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"И братства дух, забытый нами, ждет");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Бесплодно исполнения обетов данных,");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Отвергнутых во имя низких целей,");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Что никогда не ведали законов чести.");
	Doc_PrintLines(ndocid,1,"");
	Doc_Show(ndocid);
};


instance LEHREN_DER_GOETTER1(C_ITEM)
{
	name = "Учение богов - Том 1";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Учение богов";
	text[0] = "Том 1";
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
	Doc_PrintLines(ndocid,0,"Услышь слова богов, ибо на то их воля, чтобы слова были услышаны. Следуй учению богов, ибо на то их воля, чтобы учению следовали. Слушай жрецов, ибо они были избраны.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Слова Инноса: Не сомневайся в словах жрецов, даже если не можешь понять их смысла, это станет свидетельством истины и мудрости. Я восходящее солнце, свет и жизнь. Идти против солнца, значит идти против меня. Делающие так навлекают на себя проклятие.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Слова Аданоса: Работай и живи, ибо день создан для того, чтобы человек работал. Учись и ищи знаний, чтобы передать их другим, ибо такова природа человека. Ленивые и праздные навлекают на себя проклятие.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Слова Белиара: Тот, кто действует против законов справедливости и воли богов, будет наказан мной. Его тело познает боль, страдание и смерть, а дух навечно останется в царстве теней.");
	Doc_Show(ndocid);
};


instance LEHREN_DER_GOETTER2(C_ITEM)
{
	name = "Учение богов - Том 2";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Учение богов";
	text[0] = "Том 2";
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
	Doc_PrintLines(ndocid,0,"Не было ни дня, ни ночи, и ничто живое не обременяло собой мир. Но вот миру явился Иннос, и его свет осветил все. Иннос даровал миру жизнь. Но ничто живое не могло жить в свете Инноса, и тогда он создал солнце. Но его свет был все еще слишком силен. Тогда Иннос отделил часть себя и создал Белиара. Белиар принес миру ночь. И тогда в мир пришли люди. Иннос отделил от себя другую часть и создал Аданоса. Аданос даровал людям множество желаний, знания, любознательность и смелость. И был Иннос доволен своими созданиями.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"И он решил передать людей под покровительство Аданоса и почил от дел своих. Белиар же рассердился на людей, ибо они не захотели видеть его своим покровителем и отдыхали ночью, когда приходило его время. И тогда он сотворил себе человека, чтобы он поклонялся только ему одному. Но человек этот ничем не отличался от других людей. Гневом наполнилось сердце Белиара, и он убил созданного им человека и так сказал: 'Они не поклоняются мне, так пусть же мысли обо мне внушают им ужас'. И он создал смерть и взял у людей их жизни.");
	Doc_Show(ndocid);
};


instance LEHREN_DER_GOETTER3(C_ITEM)
{
	name = "Учение богов - Том 3";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Учение богов";
	text[0] = "Том 3";
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
	Doc_PrintLines(ndocid,0,"Иннос дал людям способность слышать его и разговаривать с ним. Некоторым из них он даровал способность творить великие чудеса. Он назвал ее магией. С ее помощью люди могли изменять мир по своему желанию, и изначально это желание было ничем не ограничено. Так люди получили доступ к божественным силам созидания. Но все они были равны между собой, и им это было не по нраву. И тогда взял он силу тех, кто был недоволен. Те немногие, кто был благодарен за магический дар, ставили Инноса выше остальных богов.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Этих людей уважали и боялись, и называли жрецами. Но даже многие из них были недовольны способностями самых сильных. И тогда они воззвали к Аданосу, и он позволил им забыть о своих способностях. Группа жрецов распалась, и начались бесчисленные войны. Воспоминания о могуществе богов стали не более чем мифом. Так разделились жрецы. Тех, кто последовал за Аданосом, назвали магами Воды, а избранники Инноса назывались магами Огня.");
	Doc_Show(ndocid);
};


instance JAGD_UND_BEUTE(C_ITEM)
{
	name = "Охотничьи трофеи";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Охотничьи трофеи";
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
	Doc_PrintLines(ndocid,0,"Его книги пережили многие эпохи, а его советы используют учителя, чтобы обучать людей искусству охоты. Великие битвы севера не прошли даром. Сейчас любой живущий в лесах человек может хорошо обращаться с луком. Но это еще не говорит о том, что они умеют охотиться. Существует несколько правил, которые предполагают больше, чем простое обращение с оружием! Дикая природа таинственна и непредсказуема.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Искусство охоты с луком является не только частью древней традиции, но и самым быстрым способом охоты. За долгие годы техника стрельбы не претерпела особых изменений, и, возможно, она не изменится и в будущем. Какие обстоятельства определяют ход охоты с луком? Умение распознать эти закономерности и является решающим на пути постижения охотничьего искусства.");
	Doc_Show(ndocid);
};


instance KAMPFKUNST(C_ITEM)
{
	name = "Искусство войны";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Искусство войны";
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
	Doc_PrintLines(ndocid,0,"В течение двух тысячелетий это учение служило основой развития искусства войны.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Вместе с подвижностью тела бойцов обучали быстро нападать, развивали наблюдательность и реакцию, а также самоконтроль. Они должны были хорошо контролировать свои движения и правильное положение тела, чтобы наилучшим образом раскрыть свои возможности.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Основное учение о развитии тела пережило многие столетия.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Его достижения имели огромное влияние на все последующие поколения. Проходили столетия, и мир изменялся, но только одно оставалось неизменным: гармония внутренней силы и целенаправленное движение тела.");
	Doc_Show(ndocid);
};


instance DIE_GRUFT(C_ITEM)
{
	name = "Могила";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Могила";
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
	name = "Астрономия";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Астрономия";
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
	Doc_PrintLines(ndocid,0,"В центре находится Морград и его четыре элемента: Земля, Вода, Огонь и Воздух, обитель смерти и в ее недрах - невыразимая тьма Белиара. Небесная сфера укрывает собой мир.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"В космической иерархии человек занимает место преемника. Его душа связывает его с высшим бытием, божественным духом, его преходящее тело напротив состоит из материи Морграда. В нем отражена картина целого мира.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Время обращения планет, или время, за которое они совершают полный оборот по отношению к Морграду, не всегда постоянно, из чего мы можем сделать вывод, что наш мир движется так же, как и другие планеты.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"При составлении календаря человек стал рассчитывать фазы луны, чтобы точно вычислить солнечный год.");
	Doc_Show(ndocid);
};


instance REZEPTUREN(C_ITEM)
{
	name = "Рецепты зелий";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Рецепты зелий";
	text[0] = "Том 1";
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
	Doc_PrintLines(ndocid,0,"Бальзам провидения:");
	Doc_PrintLine(ndocid,0,"----------------");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Поэтому в его глаза попала желчь. Это вещество горькое на вкус. Если она попадает в глаза, человек начинает видеть горечь мира, так растет его мудрость. Он становится провидцем! Горечь и мудрость зависимы друг от друга.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Слезы, страдания и разочарования тоже несут горечь, а мудрость утешает человека, хранящего душевную боль. Горечь и мудрость противоположны. Где есть горечь, там нет мудрости, где есть мудрость - нет горечи.");
	Doc_Show(ndocid);
};


instance REZEPTUREN2(C_ITEM)
{
	name = "Рецепты зелий";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Рецепты зелий";
	text[0] = "Том 2";
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
	Doc_PrintLines(ndocid,0,"Вино забвения");
	Doc_PrintLine(ndocid,0,"--------------------");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Высоко в горах Архолоса растет лучший виноград, идущий на изготовление этого вина. Довести это вино до совершенства, дать ему созреть - это целое искусство. Основная тайна вина: оно всегда должно оставаться неподвижным. При приготовлении вина виноградные кисти перекладываются особой травой - зиосом.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Они видели, как Магистр превращает чистейшую родниковую воду в вино, и были поражены. Они преклонялись перед ним и хвалили его дар. В наказание за лень Магистр заточил своих учеников в бутылки, а сам исчез в огненном столбе.");
	Doc_Show(ndocid);
};


instance TAGEBUCHOT(C_ITEM)
{
	name = "Дневник";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Дневник";
	text[0] = "Старая потрепанная книга.";
	text[1] = "В ней не хватает страниц.";
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
	Doc_PrintLine(ndocid,0,"День 23.");
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLines(ndocid,0,"Я потерял счет времени.");
	Doc_PrintLines(ndocid,0,"Думаю, прошло уже двадцать три дня, с тех пор как нас захватили орки и заставили работать.");
	Doc_PrintLines(ndocid,0,"Работа очень тяжелая, а эти твари не знают пощады. Кто оказался слаб, уже давно лежит в могиле!");
	Doc_PrintLines(ndocid,0,"Я сбегу отсюда, им меня не остановить!");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"День 28.");
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLines(ndocid,0,"Мы должны продолжить копать пещеру вглубь горы.");
	Doc_PrintLines(ndocid,0,"Мы уже выкопали огромную пещеру, но я до сих пор не знаю, зачем все это нужно.");
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"День 67.");
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLines(ndocid,1,"Кто-то рассказал мне, что у этих орков-шаманов больше нет сердец, но как же они тогда живут?");
	Doc_PrintLines(ndocid,1,"Еще я видел меч, которого так боятся шаманы. Как бы мне хотелось проткнуть их всех этим мечом.");
	Doc_PrintLine(ndocid,1,"");
	Doc_SetFont(ndocid,-1,"font_15_book.tga");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"День 78.");
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_PrintLines(ndocid,1,"Меч лежит в одной из зал в передней части храма. Но его охраняет один из шаманов.");
	Doc_PrintLines(ndocid,1,"Я сбегу отсюда. Этот дневник лучше оставить здесь. Может быть, он кому-нибудь пригодится.");
	Doc_Show(ndocid);
};


instance ITWR_BLOODFLY_01(C_ITEM)
{
	name = "Шершни";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 150;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Шершни";
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
	Doc_PrintLine(ndocid,0,"Шершни");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLines(ndocid,0,"Но там, где земля затоплена водой, а воздух тяжел, обитают огромные шершни, привлекаемые запахом живого тела. Они убивают свою жертву ядом и выпивают ее кровь.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Соты шершней с давних времен считались целебными и часто использовались для приготовления магических зелий. Трудность нахождения сот делает их редким и ценным деликатесом.");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Вынуть жало из тела шершня довольно сложно, но у хорошего охотника это должно получиться. Нужно сделать глубокий надрез, чтобы ножом отделить его от окружающих тканей, и осторожно вынуть. Применять его можно после того, как стечет кровь.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_Show(ndocid);
	if(HONEYCOMB < 5 && HONEYCOMBBOOK == 0)
	{
		Log_CreateTopic("Соты шершней",LOG_NOTE);
		b_logentry("Соты шершней","Из книги про шершней я узнал про магические свойства их сот. Попробую найти столько, сколько смогу.");
		HONEYCOMBBOOK = 1;
	};
	if(KNOWS_GETBFSTING == FALSE)
	{
		b_learn_trophies_sting();
	};
};

instance BALORONOTE(C_ITEM)
{
	name = "Список Балоро";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "ITAR_SCROLL_01_EG.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Список Балоро";
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
	Doc_PrintLine(ndocid,0,"  - 5 яблок");
	Doc_PrintLine(ndocid,0,"  - 2 бутылки шнапса");
	Doc_PrintLine(ndocid,0,"  - 5 бутылок пива");
	Doc_PrintLine(ndocid,0,"  - 3 буханки хлеба");
	Doc_PrintLine(ndocid,0,"  - 2 куска сыра");
	Doc_PrintLine(ndocid,0,"  - 2 грозди винограда");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
	if(SLD_753_BALORO_SC_BESORGT_DEN_KRAM == LOG_RUNNING)
	{
		b_logentry(BALOROS_WAFFE,"Балоро не пережил нападение на Свободную шахту. Теперь я не узнаю, какое оружие он обещал мне.");
		Log_SetTopicStatus(BALOROS_WAFFE,LOG_FAILED);
		SLD_753_BALORO_SC_BESORGT_DEN_KRAM = LOG_FAILED;
	};
};

instance QUENTINNOTE(C_ITEM)
{
	name = "Записка";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "ITAR_SCROLL_01_EG.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Записка Квентина";
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
	Doc_PrintLines(ndocid,0,"Парни, займите позицию около Нового лагеря. Ваша главная цель - амулет Братства, который могут носить некоторые послушники из лагеря сектантов. Обращайте внимание на всех проходящих мимо, при необходимости - обыскивайте! Для маскировки возьмите одежду воров в нашем тайнике.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"  - Квентин");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
	if(QUENTIN_GANG_QUEST_STARTED != LOG_RUNNING && QUENTIN_GANG_QUEST_STARTED != LOG_SUCCESS && QUENTIN_GANG_QUEST_STARTED != LOG_FAILED && !Npc_IsDead(org_858_quentin))
	{
		QUENTIN_GANG_QUEST_STARTED = LOG_RUNNING;
		Log_CreateTopic(QUENTIN_GANG,LOG_MISSION);
		Log_SetTopicStatus(QUENTIN_GANG,LOG_RUNNING);
		b_logentry(QUENTIN_GANG,"Похоже, что разбойники около Нового лагеря - не те, за кого себя выдают. На самом деле они не воры Ларса, а работают на некого Квентина... Мне следует поискать их убежище и разузнать, что замышляет эта шайка.");
	};
};

instance CALASHNOTE(C_ITEM)
{
	name = "Письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	description = "Письмо для Калеша";
	text[1] = "Лучше его не читать.";
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
	Doc_PrintLines(ndocid,0,"Калеш! Перед тобой стоит болван, который нашел наш лагерь в горах. Отмудохай его как следует и забери его руду, пусть держится от нас подальше!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"  - Квентин");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
	CreateInvItem(hero,calashnote2);
	if(Npc_KnowsInfo(hero,info_calash_dia1))
	{
		b_logentry(QUENTIN_GANG,"Теперь понятно, почему Калеш оказался таким буйным. Квентин обманул меня и в письме приказал своему подручному избить меня! Я возмущен!");
	}
	else
	{
		b_logentry(QUENTIN_GANG,"Квентин обманул меня! Если бы я пошел в лагерь рудокопов, то мне бы досталось от его подручного. Я возмущен!");
	};
};

instance CALASHNOTE2(C_ITEM)
{
	name = "Записка";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "ITAR_SCROLL_01_EG.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Письмо для Калеша";
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
	Doc_PrintLines(ndocid,0,"Калеш! Перед тобой стоит болван, который нашел наш лагерь в горах. Отмудохай его как следует и забери его руду, пусть держится от нас подальше!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"  - Квентин");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};

instance ALCH200(C_ITEM)
{
	name = "Основы алхимии";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 200;
	visual = "ITWR_BOOK_ALCHEMY.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Основы алхимии";
	text[1] = "Позволяет изучить искусство зельеварения.";
	text[2] = "(требуется 10 очков обучения)";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usealchemybook;
};

instance ALCHEMYBOOK(C_ITEM)
{
	name = "Основы алхимии";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 600;
	visual = "ITWR_BOOK_ALCHEMY.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Основы алхимии";
	text[1] = "Позволяет изучить искусство зельеварения.";
	text[2] = "(требуется 10 очков обучения)";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usealchemybook;
};

func void usealchemybook()
{
	if(hero.lp < 10 && ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("Недостаточно очков обучения!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
		Doc_PrintLine(ndocid,0,"Основы алхимии");
		Doc_SetFont(ndocid,-1,"font_10_book.TGA");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Начать следует с подготовки рабочего места. Алхимик должен иметь под рукой небольшой котел, набор пробирок для смешивания и перегонный куб со змеевиком. Стол необходимо всегда держать в чистоте, чтобы избежать примесей в полученных веществах.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Для хранения готовых веществ требуется чистая емкость из стекла: для этого идеально подходит обычный алхимический флакон стандартного размера. Обязательно используйте отдельную");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLines(ndocid,1,"емкость для каждого нового процесса, смешивание или повторное применение не допускаются!");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Для простых зелий достаточно одного растения, которое можно найти в ближайшем лесу или поле. А вот зелья с долговременным эффектом уже требуют несколько компонентов: два или даже три. Алхимик должен обладать солидным терпением и часто совершать прогулки в поисках редких растений.");
		Doc_Show(ndocid);
		if(ALCHEMYACTIVE == FALSE)
		{
			Log_CreateTopic("Алхимия",LOG_NOTE);
			b_logentry("Алхимия","В одной книге я прочитал о базовых требованиях для приготовления зелий. Теперь нужно искать рецепты.");
			PrintScreen("Изучен навык алхимии!",-1,11,"FONT_OLD_20_WHITE.TGA",4);
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
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "HP1RECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Рецепт эссенции исцеления";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_ESSENZ;
	on_state[0] = usehp1recipe;
};

func void usehp1recipe()
{
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("Необходимо изучение навыка алхимии!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		var int ndocid;
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"letters.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"Целебная трава - самое простое лечебное растение, которое можно найти где угодно. Ее листья еще слишком молоды, чтобы обладать каким-либо серьезным эффектом, но они могут быстро снять боль от небольших порезов. Если быстро истолочь траву, то из полученной кашицы можно сварить эссенцию исцеления.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(HP1RECIPE == FALSE)
		{
			PrintScreen("Изучен новый рецепт!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("Алхимия","Изучен рецепт эссенции исцеления (жизненная сила +50). Требуется: целебная трава (1).");
			HP1RECIPE = TRUE;
		};
	};
};

instance ALCHEMY_HP2(C_ITEM)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "HP2RECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Рецепт экстракта исцеления";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_EXTRAKT;
	on_state[0] = usehp2recipe;
};

func void usehp2recipe()
{
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("Необходимо изучение навыка алхимии!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		var int ndocid;
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"letters.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"Целебное растение быстро вырастает из травы при должном уходе или в хорошей почве в диких условиях. Из оранжевых листьев можно получить экстракт исцеления: для этого требуется их сок.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(HP2RECIPE == FALSE)
		{
			PrintScreen("Изучен новый рецепт!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("Алхимия","Изучен рецепт экстракта исцеления (жизненная сила +70). Требуется: целебное растение (1).");
			HP2RECIPE = TRUE;
		};
	};
};

instance ALCHEMY_HP3(C_ITEM)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "HP3RECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Рецепт зелья исцеления";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_ELIXIER;
	on_state[0] = usehp3recipe;
};

func void usehp3recipe()
{
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("Необходимо изучение навыка алхимии!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		var int ndocid;
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"letters.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"Зрелый целебный корень вырастает примерно за месяц, после этого его можно аккуратно отделить и приготовить зелье исцеления - самое действенное средство против серьезных ран или увечий. Поместите корень вместе с оранжевыми листьями в емкость и кипятите до получения отвара.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(HP3RECIPE == FALSE)
		{
			PrintScreen("Изучен новый рецепт!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("Алхимия","Изучен рецепт зелья исцеления (жизненная сила +100). Требуется: целебный корень (1).");
			HP3RECIPE = TRUE;
		};
	};
};

instance ALCHEMY_MP1(C_ITEM)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "MP1RECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Рецепт эссенции магической энергии";
	text[1] = NAME_BONUS_MANA;
	count[1] = MANA_ESSENZ;
	on_state[0] = usemp1recipe;
};

func void usemp1recipe()
{
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("Необходимо изучение навыка алхимии!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		var int ndocid;
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"letters.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"Далеко не все знают, что серафис обладает магическими свойствами. Сам по себе он никак не поможет для укрепления духа, но при должной обработке из него можно получить эссенцию магической энергии: отделите ягоду от листьев, измельчите в кашицу и отварите.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(MP1RECIPE == FALSE)
		{
			PrintScreen("Изучен новый рецепт!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("Алхимия","Изучен рецепт эссенции магической энергии (магическая сила +30). Требуется: серафис (1).");
			MP1RECIPE = TRUE;
		};
	};
};

instance ALCHEMY_MP2(C_ITEM)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "MP2RECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Рецепт экстракта магической энергии";
	text[1] = NAME_BONUS_MANA;
	count[1] = MANA_EXTRAKT;
	on_state[0] = usemp2recipe;
};

func void usemp2recipe()
{
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("Необходимо изучение навыка алхимии!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		var int ndocid;
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"letters.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"Обычно воронья трава растет в темных местах: в пещерах, в тени скал. Удалите сухие части растения и отварите целиком, вместе с корнями: так можно получить экстракт магической энергии.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(MP2RECIPE == FALSE)
		{
			PrintScreen("Изучен новый рецепт!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("Алхимия","Изучен рецепт экстракта магической энергии (магическая сила +50). Требуется: воронья трава (1).");
			MP2RECIPE = TRUE;
		};
	};
};

instance ALCHEMY_MP3(C_ITEM)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "MP3RECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Рецепт зелья магической энергии";
	text[1] = NAME_BONUS_MANA;
	count[1] = MANA_ELIXIER;
	on_state[0] = usemp3recipe;
};

func void usemp3recipe()
{
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("Необходимо изучение навыка алхимии!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		var int ndocid;
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"letters.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"Одним из самых сильных магических растений считается каменный корень. Наружу из земли торчит только малая часть растения, насыщая крепкие корни, которые и являются главным компонентом зелья восстановления магической энергии. Некоторые начинающие алхимики ошибочно считают, что в приготовлении используется также стебель и листья. На самом деле, для отвара необходим только корень.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(MP3RECIPE == FALSE)
		{
			PrintScreen("Изучен новый рецепт!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("Алхимия","Изучен рецепт зелья магической энергии (магическая сила +70). Требуется: каменный корень (1).");
			MP3RECIPE = TRUE;
		};
	};
};

instance ALCHEMY_MPMAX(C_ITEM)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "MPMAXRECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Рецепт эссенции силы духа";
	text[1] = NAME_BONUS_MANAMAX;
	count[1] = MANAMAX_ESSENZ;
	on_state[0] = usempmaxrecipe;
};

func void usempmaxrecipe()
{
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("Необходимо изучение навыка алхимии!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		var int ndocid;
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"letters.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"Данное зелье будет полезно практикующим магам и рекомендуется им для регулярного употребления. Чтобы приготовить его, нужно два ингредиента: горный мох и лунная тень. Измельченные растения помещаются в теплую воду и настаиваются около трех часов в темном месте. Варка не требуется, поскольку самое активное вещество лунной тени может почти полностью испариться.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(MPMAXRECIPE == FALSE)
		{
			PrintScreen("Изучен новый рецепт!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("Алхимия","Изучен рецепт эссенции силы духа (максимальная магическая сила +5). Требуется: горный мох (1) и лунная тень (1).");
			MPMAXRECIPE = TRUE;
		};
	};
};

instance ALCHEMY_HPMAX(C_ITEM)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "HPMAXRECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Рецепт эссенции жизни";
	text[1] = NAME_BONUS_HPMAX;
	count[1] = HPMAX_ESSENZ;
	on_state[0] = usehpmaxrecipe;
};

func void usehpmaxrecipe()
{
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("Необходимо изучение навыка алхимии!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		var int ndocid;
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"letters.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"Для эссенции, укрепляющей жизненную силу, нужен крупный дубовый лист. Чтобы значительно продлить оздоровительный эффект, используется горный мох. Чистые ингредиенты помещаются без измельчения в сосуд с водой и отвариваются около получаса. Не допускайте перегрева и следите за выделением пара: белый пар свидетельствует о слишком малом объеме воды в отваре.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(HPMAXRECIPE == FALSE)
		{
			PrintScreen("Изучен новый рецепт!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("Алхимия","Изучен рецепт эссенции жизни (максимальная жизненная сила +5). Требуется: горный мох (1) и дубовый лист (1).");
			HPMAXRECIPE = TRUE;
		};
	};
};

instance ALCHEMY_DEX(C_ITEM)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "DEXRECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Рецепт эссенции ловкости";
	text[1] = NAME_BONUS_DEX;
	count[1] = DEX_ESSENZ;
	on_state[0] = usedexrecipe;
};

func void usedexrecipe()
{
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("Необходимо изучение навыка алхимии!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		var int ndocid;
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"letters.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"Для эссенции ловкости обязателен высушенный могильный мох. Также необходима одна свежая вишня троллей и один сухой темный лист. После смешивания всех ингредиентов, полученную смесь необходимо обработать кипящей водой и затем варить. Только в таком сочетании можно нейтрализовать ядовитые свойства вишни троллей. Будьте осторожны и не употребляйте ее в пищу!");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(DEXRECIPE == FALSE)
		{
			PrintScreen("Изучен новый рецепт!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			if(DIFF_HARD == TRUE)
			{
				b_logentry("Алхимия","Изучен рецепт эссенции ловкости (ловкость +1). Требуется: могильный мох (1), вишня троллей (1) и темный лист (1).");
			}
			else
			{
				b_logentry("Алхимия","Изучен рецепт эссенции ловкости (ловкость +3). Требуется: могильный мох (1), вишня троллей (1) и темный лист (1).");
			};
			DEXRECIPE = TRUE;
		};
	};
};

instance ALCHEMY_STR(C_ITEM)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "STRRECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Рецепт эссенции силы";
	text[1] = NAME_BONUS_STR;
	count[1] = STR_ESSENZ;
	on_state[0] = usestrrecipe;
};

func void usestrrecipe()
{
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("Необходимо изучение навыка алхимии!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		var int ndocid;
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"letters.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"Как и для других зелий с долговременным действием, здесь понадобится высушенный могильный мох. К нему добавляется целый драконий корень и одна огненная ягода. Полученная смесь варится, пока не приобретет насыщенный желтый цвет. Это означает, что драконий корень полностью отдал свои соки в отвар.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(STRRECIPE == FALSE)
		{
			PrintScreen("Изучен новый рецепт!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			if(DIFF_HARD == TRUE)
			{
				b_logentry("Алхимия","Изучен рецепт эссенции силы (сила +1). Требуется: могильный мох (1), драконий корень (1) и огненная ягода (1).");
			}
			else
			{
				b_logentry("Алхимия","Изучен рецепт эссенции силы (сила +3). Требуется: могильный мох (1), драконий корень (1) и огненная ягода (1).");
			};
			STRRECIPE = TRUE;
		};
	};
};

instance ALCHEMY_EGG(C_ITEM)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "EGGRECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Рецепт зелья из яиц Королевы ползунов";
	text[1] = NAME_BONUS_MANAMAX;
	count[1] = MANAMAX_ELIXIEREGG;
	on_state[0] = useeggrecipe;
};

func void useeggrecipe()
{
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("Необходимо изучение навыка алхимии!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		var int ndocid;
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"letters.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"Послушник! Тебе предстоит важная миссия! Долгое время мы пытаемся создать зелье, достаточно мощное для призыва Спящего, но вещество из челюстей ползунов оказывается слишком слабым... В час отчаяния мне было видение, сам Спящий обратился ко мне. Он сказал, что самое сильное вещество для зелья может содержаться в яйцах ползунов, и что он выбрал ТЕБЯ для этого испытания. Отправляйся в заброшенную шахту у места обмена и принеси мне столько яиц, сколько сможешь найти. ");
		Doc_PrintLines(ndocid,0,"По моим расчетам, для одного зелья нужно три яйца и шесть растений болотника: скорлупа моется, извлекается зародыш ползуна, листья и стебли вымачиваются в содержимом, а затем варятся. После тщательного изучения вещества я смогу придумать наиболее эффективный рецепт.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Да пребудет с тобой Спящий!");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"- Галом");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(EGGRECIPE == FALSE)
		{
			PrintScreen("Изучен новый рецепт!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("Алхимия","Изучен рецепт зелья из яиц Королевы ползунов (максимальная магическая сила +10). Требуется: яйца ползунов (3) и болотник (6).");
			EGGRECIPE = TRUE;
		};
	};
};

instance ALCHEMY_FORTUNO(C_ITEM)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "YBRECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Рецепт лечебного зелья Фортуно";
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
		PrintScreen("Необходимо изучение навыка алхимии!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		var int ndocid;
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"letters2.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"Выдави из каждого листа сок, стебель сдави в кашу. Затем перелей все в бутылочку с основой и хорошо взболтай.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Основу зелья я приготовил из чистого спирта, в который добавил высушенные и измельченные семена бука.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"- Фортуно");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(FORTUNORECIPE == FALSE)
		{
			PrintScreen("Изучен новый рецепт!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("Алхимия","Изучен рецепт лечебного зелья Фортуно (максимальная магическая и жизненная сила +10). Требуется: мертвый лист (1), чистый спирт (1) и семена бука (1).");
			FORTUNORECIPE = TRUE;
		};
	};
};

instance ALCHEMY_MASTER(C_ITEM)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1200;
	visual = "MASTERRECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Рецепт зелья мощи";
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
		PrintScreen("Необходимо изучение навыка алхимии!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		var int ndocid;
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"letters2.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"Эффект от эссенции силы и ловкости можно немного увеличить, смешав их в одном сосуде. Предварительно необходимо довести до кипения эссенцию силы, а эссенцию ловкости взболтать круговыми движениями. Впрочем, такой способ не подойдет для более сильных зелий из-за их концентрации.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(MASTERRECIPE == FALSE)
		{
			PrintScreen("Изучен новый рецепт!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("Алхимия","Изучен рецепт зелья мощи (ловкость и сила +4). Требуется: эссенция ловкости (1) и эссенция силы (1).");
			MASTERRECIPE = TRUE;
		};
	};
};
	
////////////рецепты торговцев/////////////////////

instance ALCHEMY_HP1_PRICED(C_ITEM)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "HP1RECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Рецепт эссенции исцеления";
	text[1] = NAME_BONUS_HP;
	count[1] = 50;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usehp1recipe_priced;
};

instance ALCHEMY_HP2_PRICED(C_ITEM)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 200;
	visual = "HP2RECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Рецепт экстракта исцеления";
	text[1] = NAME_BONUS_HP;
	count[1] = 70;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usehp2recipe_priced;
};

instance ALCHEMY_HP3_PRICED(C_ITEM)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 300;
	visual = "HP3RECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Рецепт зелья исцеления";
	text[1] = NAME_BONUS_HP;
	count[1] = 100;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usehp3recipe_priced;
};

instance ALCHEMY_MP1_PRICED(C_ITEM)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "MP1RECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Рецепт эссенции магической энергии";
	text[1] = NAME_BONUS_MANA;
	count[1] = 30;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usemp1recipe_priced;
};

instance ALCHEMY_MP2_PRICED(C_ITEM)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 200;
	visual = "MP2RECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Рецепт экстракта магической энергии";
	text[1] = NAME_BONUS_MANA;
	count[1] = 50;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usemp2recipe_priced;
};

instance ALCHEMY_MP3_PRICED(C_ITEM)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 300;
	visual = "MP3RECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Рецепт зелья магической энергии";
	text[1] = NAME_BONUS_MANA;
	count[1] = 70;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usemp3recipe_priced;
};

instance ALCHEMY_MPMAX_PRICED(C_ITEM)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 600;
	visual = "MPMAXRECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Рецепт эссенции силы духа";
	text[1] = NAME_BONUS_MANAMAX;
	count[1] = 5;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usempmaxrecipe_priced;
};

instance ALCHEMY_JOINT2(C_ITEM)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 40;
	visual = "JOINTRECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Рецепт 'Северного темного'";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usejoint2recipe;
};

instance ALCHEMY_JOINT3(C_ITEM)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 80;
	visual = "JOINTRECIPE.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Рецепт 'Зова мечты'";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usejoint3recipe;
};

//////////////////////////////////////////

func void usehp1recipe_priced()
{
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("Необходимо изучение навыка алхимии!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		var int ndocid;
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"letters2.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"Выписка из 'Большой книги ядов, зелий и растений' Логара, 562 г.");
		Doc_PrintLines(ndocid,0,"-------------------");
		Doc_PrintLines(ndocid,0,"...понадобятся листья целебной травы. От их свежести зависит эффективность извлекаемой эссенции. Напоминаю, что листья, цветки и ягоды хранятся гораздо дольше, если не отделены от стебля.");
		Doc_PrintLines(ndocid,0," ");
		Doc_PrintLines(ndocid,0,"...достаточно четырех или пяти листьев. С помощью пестика в ступке растолките листья до появления характерного горьковатого запаха. Переложите кашицу в жаропрочную посуду, добавьте немного воды и доведите до кипения на горелке. Перелейте выделившуюся жидкость в чистую склянку подходящего объема и выжмите листья. Разбавьте водой в пропорции один к десяти. Встряхивайте пузырек, пока содержимое не обретет однородный красноватый цвет. Эссенция исцеления готова к употреблению.");
		Doc_PrintLines(ndocid,0," ");
		Doc_PrintLines(ndocid,0,"Примечание. Разведение водой необходимо для того, чтобы облегчить усваивание телом горькой эссенции. Более высокие концентрации наряду с исцеляющим эффектом способны вызывать рвоту и диарею.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(HP1RECIPE == FALSE)
		{
			PrintScreen("Изучен новый рецепт!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("Алхимия","Изучен рецепт эссенции исцеления (жизненная сила +50). Требуется: целебная трава (1).");
			HP1RECIPE = TRUE;
		};
	};
};

func void usehp2recipe_priced()
{
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("Необходимо изучение навыка алхимии!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		var int ndocid;
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"letters2.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"Выписка из 'Большой книги ядов, зелий и растений' Логара, 562 г.");
		Doc_PrintLines(ndocid,0,"-------------------");
		Doc_PrintLines(ndocid,0,"...потребуется так называемое целебное растение. Напоминаю, автор использует просторечные названия намеренно, ибо книга нацелена на алхимиков средней руки.");
		Doc_PrintLines(ndocid,0," ");
		Doc_PrintLines(ndocid,0,"...измельченный побег растения засыпьте в колбу с высоким горлышком, налейте воды до половины и подключите змеевик. Колбу поместите на горелку, а выходной конец змеевика опустите в склянку с плоским дном так, чтобы он его не касался. Выпаривайте на очень медленном огне до тех пор, пока не закончится вода в колбе. К полученному объему экстракта долейте в пять раз больше частей воды...");
		Doc_PrintLines(ndocid,0," ");
		Doc_PrintLines(ndocid,0,"Примечание. Старайтесь не допускать нагревания стеблей в отсутствие воды. Полученные таким образом пары хорошо растворяются в воде и способны вызывать обильнейшее слюноотделение.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(HP2RECIPE == FALSE)
		{
			PrintScreen("Изучен новый рецепт!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("Алхимия","Изучен рецепт экстракта исцеления (жизненная сила +70). Требуется: целебное растение (1).");
			HP2RECIPE = TRUE;
		};
	};
};

func void usehp3recipe_priced()
{
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("Необходимо изучение навыка алхимии!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		var int ndocid;
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"letters2.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"Выписка из 'Большой книги ядов, зелий и растений' Логара, 562 г.");
		Doc_PrintLines(ndocid,0,"-------------------");
		Doc_PrintLines(ndocid,0,"...необходим довольно редкий целебный корень. Отметим, что его листья вполне можно употреблять в пищу за неимением альтернатив. Для алхимии они ценности не представляют.");
		Doc_PrintLines(ndocid,0," ");
		Doc_PrintLines(ndocid,0,"Избавьте растение от листьев и нарежьте его тонкими кусками. Растолките в ступке до выделения молочного цвета пузырящейся жидкости и отставьте в сторону. Тем временем в подготовленную заранее колбу с высоким горлышком залейте воду примерно до половины и доведите до кипения, а затем отправьте туда содержимое ступки и моментально подключите змеевик, конец которого должен быть заблаговременно помещен в колбу с узким горлышком. Выпаренную жидкость разбавьте водой в пропорции два к пяти...");
		Doc_PrintLines(ndocid,0," ");
		Doc_PrintLines(ndocid,0,"Примечание. Возможно, эффект зелья усилится, если разбавленный состав повторно довести до кипения и достаточно быстро остудить.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(HP3RECIPE == FALSE)
		{
			PrintScreen("Изучен новый рецепт!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("Алхимия","Изучен рецепт зелья исцеления (жизненная сила +100). Требуется: целебный корень (1).");
			HP3RECIPE = TRUE;
		};
	};
};

func void usemp1recipe_priced()
{
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("Необходимо изучение навыка алхимии!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		var int ndocid;
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"letters2.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"Выписка из 'Большой книги ядов, зелий и растений' Логара, 562 г.");
		Doc_PrintLines(ndocid,0,"-------------------");
		Doc_PrintLines(ndocid,0,"...вполне можно использовать и обычный серафис. Нам понадобятся только ягоды этого растения...");
		Doc_PrintLines(ndocid,0," ");
		Doc_PrintLines(ndocid,0,"Засыпьте дно жаропрочной посуды давленными ягодами и щедро залейте их водой. Поместите сосуд на горелку, доведите смесь до кипения и убавьте огонь. Не забывайте помешивать отвар. Постепенно жидкость начнет окрашиваться в лунный цвет. Снимите колбу с огня, как только почувствуете сладковатый аромат. Дайте отвару остыть и через сито перелейте его в склянку для хранения.");
		Doc_PrintLines(ndocid,0," ");
		Doc_PrintLines(ndocid,0,"Примечание. Избегайте попадания листьев серафиса в отвар. Такого рода оплошность может привести к временной потере слуха и обоняния, однако отдельно от ягод листья могут быть использованы для приготовления целебных настоек.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(MP1RECIPE == FALSE)
		{
			PrintScreen("Изучен новый рецепт!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("Алхимия","Изучен рецепт эссенции магической энергии (магическая сила +30). Требуется: серафис (1).");
			MP1RECIPE = TRUE;
		};
	};
};

func void usemp2recipe_priced()
{
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("Необходимо изучение навыка алхимии!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		var int ndocid;
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"letters2.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"Выписка из 'Большой книги ядов, зелий и растений' Логара, 562 г.");
		Doc_PrintLines(ndocid,0,"-------------------");
		Doc_PrintLines(ndocid,0,"...далеко не всем мастерам известно, что для стимуляции духа можно использовать и воронью траву...");
		Doc_PrintLines(ndocid,0," ");
		Doc_PrintLines(ndocid,0,"Тщательно измельчите крупные листья вороньей травы, добавьте к ним немного спирта и сожгите в каменной чаше. Маленькие желтые листочки из середины растения раздавите в ступке и соедините с пеплом в колбе. Заполните колбу водой на треть, подключите змеевик и поставьте на горелку. Свободный конец змеевика поместите в склянку с плоским дном. По мере выпаривания воды, в ней должна начать конденсироваться небесного цвета жидкость... в полученный экстракт добавьте большое количество воды и тщательно перемешайте.");
		Doc_PrintLines(ndocid,0," ");
		Doc_PrintLines(ndocid,0,"Примечание. Присутствие в пепле недогоревших листьев может привести к нежелательным эффектам, в частности временной слепоте.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(MP2RECIPE == FALSE)
		{
			PrintScreen("Изучен новый рецепт!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("Алхимия","Изучен рецепт экстракта магической энергии (магическая сила +50). Требуется: воронья трава (1).");
			MP2RECIPE = TRUE;
		};
	};
};

func void usemp3recipe_priced()
{
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("Необходимо изучение навыка алхимии!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		var int ndocid;
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"letters2.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"Выписка из 'Большой книги ядов, зелий и растений' Логара, 562 г.");
		Doc_PrintLines(ndocid,0,"-------------------");
		Doc_PrintLines(ndocid,0,"...для создания сильного зелья магической энергии сгодится и каменный корень. Его стимулирующее воздействие можно усилить в разы следующим нехитрым способом.");
		Doc_PrintLines(ndocid,0," ");
		Doc_PrintLines(ndocid,0,"Раздавите стебель и сломайте его в нескольких местах таким образом, чтобы растение поместилось в реторту. Залейте растение водой с небольшим добавлением спирта и тщательно перемешайте. Зажгите огонь и доведите жидкость до кипения. Убавьте огонь под ретортой и включите горелку под соединенной с ней колбой для выпаривания. Синеватого цвета продукт растворите в большом количестве воды.");
		Doc_PrintLines(ndocid,0," ");
		Doc_PrintLines(ndocid,0,"Примечание. Неосторожное вдыхание паров каменного корня может привести к потере сознания.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(MP3RECIPE == FALSE)
		{
			PrintScreen("Изучен новый рецепт!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("Алхимия","Изучен рецепт зелья магической энергии (магическая сила +70). Требуется: каменный корень (1).");
			MP3RECIPE = TRUE;
		};
	};
};

func void usempmaxrecipe_priced()
{
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("Необходимо изучение навыка алхимии!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		var int ndocid;
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"letters2.TGA",0);
		Doc_SetFont(ndocid,-1,"font_10_book.tga");
		Doc_SetMargins(ndocid,-1,50,50,50,50,1);
		Doc_PrintLines(ndocid,0,"Выписка из 'Большой книги ядов, зелий и растений' Логара, 562 г.");
		Doc_PrintLines(ndocid,0,"-------------------");
		Doc_PrintLines(ndocid,0,"...в случае отсутствия оного для усиления магических способностей может быть использована комбинация горного мха и лунной тени.");
		Doc_PrintLines(ndocid,0," ");
		Doc_PrintLines(ndocid,0,"...мох залейте небольшим количеством воды и отставьте в сторону. Тем временем острым ножом нарежьте листья лунной тени тонкими полосками вдоль волокон. Переместите мох в колбу для выпаривания. Дайте ему немного подсохнуть, а затем залейте в колбу воду. Пока закипает вода, мелко нарежьте полоски лунной тени поперек и засыпьте их в колбу. Убавьте огонь и подключите перегонный куб... К полученной жидкости добавьте равное количество воды...");
		Doc_PrintLines(ndocid,0," ");
		Doc_PrintLines(ndocid,0,"Примечание. Лишний раз убедитесь, что вы используете горный, а не похожий на него, мох. Неправильный ингредиент может привести к нежелательным эффектам, которые автор предсказать не берется даже приблизительно.");
		Doc_SetMargins(ndocid,-1,200,50,50,50,1);
		Doc_Show(ndocid);
		if(MPMAXRECIPE == FALSE)
		{
			PrintScreen("Изучен новый рецепт!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			b_logentry("Алхимия","Изучен рецепт эссенции силы духа (максимальная магическая сила +5). Требуется: горный мох (1) и лунная тень (1).");
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
	Doc_PrintLines(ndocid,0,"Мой любимый сорт! Для приготовления нужна обычная лесная ягода: ее сок в равной пропорции смешивается в ступе со свежим болотником и измельчается. Полученная субстанция высушивается на солнце.");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"     - Фортуно");
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
	Doc_PrintLines(ndocid,0,"Мощная вещь. Для приготовления нужна сушеная шляпка адского гриба. Ее нужно истолочь и смешать с сушеным и измельченным болотником.");
	Doc_PrintLines(ndocid,0,"Чтобы у косяка не было горького привкуса, до сушки шляпку нужно хорошо промыть от спор.");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"     - Фортуно");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
	JOINT3RECIPE = TRUE;
};

