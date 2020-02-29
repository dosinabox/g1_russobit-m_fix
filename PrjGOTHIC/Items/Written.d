
instance ITWR_BOOK_CIRCLE_01(C_ITEM)
{
	name = "Посох Мастера";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 50;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "1-й Круг магии";
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
	Doc_PrintLine(ndocid,0,"1-й Круг магии");
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
};


instance ITWR_BOOK_CIRCLE_02(C_ITEM)
{
	name = "2-й Круг магии";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "2-й Круг магии";
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
	Doc_PrintLine(ndocid,0,"2-й Круг магии");
	Doc_PrintLine(ndocid,0,"---------------");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Все заклинания высвобождают магическую энергию силой того, кто их использует. Такого человека называют магом.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Каждое применение заклинания отбирает у мага часть энергии, которая называется магической силой.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Исцеление");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"Аданос увидел, что люди не бессмертны, что они умирают по воле Белиара. И он решил, что не будет подчиняться Белиару, а даст людям возможность исцелять свои тела.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Это заклинание освобождает силу, исцеляющую мага.");
	Doc_PrintLine(ndocid,1,"Инвестир. заклинание");
	Doc_PrintLine(ndocid,1,text_1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_Show(ndocid);
};


instance ITWR_BOOK_CIRCLE_03(C_ITEM)
{
	name = "3-й Круг магии";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 150;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "3-й Круг магии";
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
	Doc_PrintLine(ndocid,0,"3-й Круг магии");
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
	Doc_PrintLine(ndocid,1,"Зарядное заклинание");
	Doc_PrintLine(ndocid,1,text);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Ледяная глыба");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"Жертва превращается в ледяную глыбу. Это заклинание Круга Воды.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,text_1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Шаровая молния");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"Шар, созданный из магической энергии.");
	Doc_PrintLine(ndocid,1,text_2);
	Doc_Show(ndocid);
};


instance ITWR_BOOK_CIRCLE_04(C_ITEM)
{
	name = "4-й Круг магии";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 200;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "4-й Круг магии";
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
	Doc_PrintLine(ndocid,0,"4-й Круг магии");
	Doc_PrintLine(ndocid,0,"---------------");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Магия");
	Doc_PrintLine(ndocid,0,"телепортации");
	Doc_PrintLine(ndocid,0,"---------------");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Главная особенность: несмотря на то, что заклинание заключено в руну, оно может быть прочитано каждым, кто обладает магической силой. При этом энергия заклинания сразу освобождается. Для него не существует ограничений.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"Огненный шторм");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"Это заклинание действует как огненный шар на одного противника, а потом переносится на других, стоящих возле него.");
	Doc_PrintLine(ndocid,1,"Зарядное заклинание");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,text);
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
};


instance ITWR_BOOK_CIRCLE_05(C_ITEM)
{
	name = "5-й Круг магии";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 250;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "5-й Круг магии";
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
	Doc_PrintLine(ndocid,0,"5-й Круг магии");
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
};


instance ITWR_BOOK_CIRCLE_06(C_ITEM)
{
	name = "6-й Круг магии";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 300;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "6-й Круг магии";
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
	Doc_PrintLine(ndocid,0,"6-й Круг магии");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Дыхание смерти");
	Doc_PrintLine(ndocid,0,"---------------");
	Doc_PrintLines(ndocid,0,"Дыхание Белиара. Облако забирающего жизнь Ничто, способное мгновенно убить жертву.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,text);
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Волна Смерти");
	Doc_PrintLine(ndocid,1,"---------------");
	Doc_PrintLines(ndocid,1,"Немногое известно о руне, содержащей энергию УРИЗЕЛЯ.");
	Doc_PrintLines(ndocid,1,"Сохранилась память лишь о том, что она скрывает силы Белиара.");
	Doc_PrintLine(ndocid,1,"");
	Doc_Show(ndocid);
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
	Doc_PrintLine(ndocid,0,"Магия");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0," ");
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
	Doc_PrintLine(ndocid,0,"Могущественное искусство");
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
	Doc_PrintLines(ndocid,1,"Нет такого щита или доспеха, который смог бы устоять перед ним. Короли и герои древних времен носили оружие из лучшей стали Хориниса, и во всей Мертане оно ценилось очень высоко. Но магическая руда стоит очень дорого. Очень много сил уходит на ее добычу. Кажется, будто руда сама не желает покидать недра земли.");
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
	visual = "ItWr_Book_02_05.3ds";
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
	Doc_PrintLines(ndocid,1,"Но теперь его войско попало в засаду. Вражеские солдаты готовились к наступлению. Ли, один из лучших генералов Мертаны, загнал его в ловушку. Тяжелая конница Варанта не могла сражаться на заболоченной местности. Вся долина была окружена солдатами генерала Ли, которые нападали на врагов и убивали их одного за другим. Отчаянные попытки выбраться из ловушки не имели успеха. Он был побежден.");
	Doc_Show(ndocid);
};


instance MYRTANAS_LYRIK(C_ITEM)
{
	name = "Лирика Мертаны";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Лирика Мертаны";
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
	visual = "ItWr_Book_02_02.3ds";
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
	visual = "ItWr_Book_02_03.3ds";
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
	description = "Искусство войны";
	text[5] = NAME_VALUE;
	count[5] = value;
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
	Doc_PrintLines(ndocid,1,"Время обращения планет, или время, за которое они совершают полный оборот по отношению к Мордрагу, не всегда постоянно, из чего мы можем сделать вывод, что наш мир движется так же, как и другие планеты.");
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
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,-1,"font_10_book.TGA");
	Doc_PrintLine(ndocid,0,"О шершнях.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Но там, где земля затоплена водой, а воздух тяжел, обитают огромные шершни, привлекаемые запахом живого тела. Они убивают свою жертву ядом и выпивают ее кровь.");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Вынуть жало из тела шершня довольно сложно, но у хорошего охотника это должно получиться. Нужно сделать глубокий надрез, чтобы ножом отделить его от окружающих тканей, и осторожно вынуть. Применять его можно после того, как стечет кровь.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_Show(ndocid);
	if(KNOWS_GETBFSTING == FALSE)
	{
		KNOWS_GETBFSTING = TRUE;
		Log_CreateTopic(GE_ANIMALTROPHIES,LOG_NOTE);
		b_logentry(GE_ANIMALTROPHIES,"Навык добычи жала шершня");
		PrintScreen("Навык: добыча жала",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

