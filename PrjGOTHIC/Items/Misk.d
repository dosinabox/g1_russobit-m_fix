
const int VALUE_MOBSIITEM = 3;
const int VALUE_SWORDBLADE = 80;
const int VALUE_SWORDBLADEHOT = 64;
const int VALUE_SWORDRAWHOT = 51;
const int VALUE_SWORDRAW = 40;
const int VALUE_DIETRICH = 10;
const int VALUE_SCHLьSSEL = 3;
const int VALUE_JOINT1 = 8;
const int VALUE_JOINT2 = 15;
const int VALUE_JOINT3 = 20;
const int VALUE_LAUTE = 10;
const int VALUE_ERZBROCKEN = 1;
const int VALUE_FACKEL = 2;
const int VALUE_SUMPFKRAUT = 8;
const int VALUE_PFEIFE = 10;
const int VALUE_RASIERMESSER = 5;
const int VALUE_MьNZE = 0;
const int VALUE_SCHьSSEL = 4;
const int VALUE_KERZENSTеNDER = 10;
const int VALUE_BECHER = 4;
const int VALUE_POKAL = 50;
const int VALUE_BESTECK = 15;
const int VALUE_PFANNE = 10;
const int VALUE_KRUG = 10;
const int VALUE_AMPHORE = 15;
const int VALUE_STATUE = 15;
const int VALUE_SCHWEFEL = 20;
const int VALUE_QUECKSILBER = 25;
const int VALUE_SALZ = 10;
const int VALUE_ЦL = 15;
const int VALUE_MOLERATFETT = 5;
const int VALUE_ALCOHOL = 18;

instance ITKELOCKPICK(C_ITEM)
{
	name = "Отмычка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_DIETRICH;
	visual = "ItKe_Lockpick_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_DIETRICH;
};

instance ITKEKEY1(C_ITEM)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = VALUE_SCHLьSSEL;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
};

instance ITKEKEY2(C_ITEM)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = VALUE_SCHLьSSEL;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
};

instance ITKEKEY3(C_ITEM)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = VALUE_SCHLьSSEL;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
};

instance ITKEKEY4(C_ITEM)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = VALUE_SCHLьSSEL;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
};

instance ITKECAVALORN01(C_ITEM)
{
	name = "Ключ Кавалорна";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
};

instance ITMISTOMPER(C_ITEM)
{
	name = "Пресс";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_MOBSIITEM;
	visual = "ItMi_Stomper_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_MOBSIITEM;
};

instance ITMIHAMMER(C_ITEM)
{
	name = "Молоток";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_MOBSIITEM;
	visual = "ItMi_Hammer_01.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_MOBSIITEM;
};

instance ITMISCOOP(C_ITEM)
{
	name = "Черпак";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_MOBSIITEM;
	visual = "ItMi_Scoop_01.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_MOBSIITEM;
};

instance ITMIFLASK(C_ITEM)
{
	name = "Флакон";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 5;
	visual = "ItMiFlask.3ds";
	material = MAT_GLAS;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMISWORDRAW(C_ITEM)
{
	name = "Сырая сталь";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SWORDRAW;
	visual = "ItMi_SmithSword_Raw_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMISWORDRAWHOT(C_ITEM)
{
	name = "Раскаленная сталь";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SWORDRAWHOT;
	visual = "ItMi_SmithSword_Rawhot_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMISWORDBLADEHOT(C_ITEM)
{
	name = "Раскаленный клинок";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SWORDBLADEHOT;
	visual = "ItMi_SmithSword_Bladehot_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMISWORDBLADE(C_ITEM)
{
	name = "Клинок";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SWORDBLADE;
	visual = "ItMi_SmithSword_Blade_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITLSTORCHFIRESPIT(C_ITEM)
{
	name = "Факел";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_BURN | ITEM_TORCH;
	value = VALUE_MOBSIITEM;
	visual = "ITLSTORCHBURNING.ZEN";
	material = MAT_WOOD;
	scemename = "FIRESPIT";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMILUTE(C_ITEM)
{
	name = "Лютня";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_LAUTE;
	visual = "ItMi_Lute_01.3DS";
	material = MAT_WOOD;
	scemename = "LUTE";
	on_state[0] = uselute;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void uselute()
{
	if((PLAY_LUTE == FALSE) && Npc_IsPlayer(self))
	{
		b_givexp(10);
		PLAY_LUTE = TRUE;
	};
};


instance ITMIWEDEL(C_ITEM)
{
	name = "Пальмовый веер";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_MOBSIITEM;
	visual = "ItMi_Wedel_01.3ds";
	material = MAT_LEATHER;
	scemename = "COOLAIR";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMIBRUSH(C_ITEM)
{
	name = "Щетка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_MOBSIITEM;
	visual = "ItMi_Brush_01.3ds";
	material = MAT_GLAS;
	scemename = "BRUSH";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMIJOINT_1(C_ITEM)
{
	name = "Новичок";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_JOINT1;
	visual = "ItMi_Joint_01.3ds";
	material = MAT_WOOD;
	scemename = "JOINT";
	on_state[0] = useitmijoint_1;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useitmijoint_1()
{
	if((FIRSTJOINT == FALSE) && Npc_IsPlayer(self))
	{
		b_givexp(5);
		FIRSTJOINT = TRUE;
	};
};


instance ITMIJOINT_2(C_ITEM)
{
	name = "Северный темный";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_JOINT2;
	visual = "ItMi_Joint_01.3ds";
	material = MAT_WOOD;
	scemename = "JOINT";
	on_state[0] = useitmijoint_2;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useitmijoint_2()
{
	if((SECONDJOINT == FALSE) && Npc_IsPlayer(self))
	{
		b_givexp(10);
		SECONDJOINT = TRUE;
	};
};


instance ITMIJOINT_3(C_ITEM)
{
	name = "Зов мечты";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_JOINT3;
	visual = "ItMi_Joint_01.3ds";
	material = MAT_WOOD;
	scemename = "JOINT";
	on_state[0] = useitmijoint_3;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useitmijoint_3()
{
	if((THIRDJOINT == FALSE) && Npc_IsPlayer(self))
	{
		b_raiseattribute(ATR_MANA_MAX,2);
		Npc_ChangeAttribute(self,ATR_MANA,2);
		THIRDJOINT = TRUE;
	};
};


instance ITMINUGGET(C_ITEM)
{
	name = "Кусок руды";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_ERZBROCKEN;
	visual = "ItMi_Nugget_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITLSTORCH(C_ITEM)
{
	name = "Факел";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_BURN | ITEM_TORCH | ITEM_MULTI;
	value = VALUE_FACKEL;
	visual = "ItLs_Torch_01.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITLSTORCHBURNING(C_ITEM)
{
	name = "Горящий факел";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_BURN | ITEM_TORCH;
	value = 0;
	visual = "ITLSTORCHBURNING.ZEN";
	material = MAT_WOOD;
	description = name;
};

instance ITLSTORCHBURNED(C_ITEM)
{
	name = "Сгоревший факел";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItLs_Torchburned_01.3ds";
	material = MAT_WOOD;
	description = name;
};

instance ITMI_PLANTS_SWAMPHERB_01(C_ITEM)
{
	name = "Болотник";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SUMPFKRAUT;
	visual = "ItMi_Plants_Swampherb_01.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_STUFF_PIPE_01(C_ITEM)
{
	name = "Трубка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_PFEIFE;
	visual = "ItMi_Stuff_Pipe_01.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_STUFF_BARBKNIFE_01(C_ITEM)
{
	name = "Бритвенный нож";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_RASIERMESSER;
	visual = "ItMi_Stuff_Barbknife_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_STUFF_OLDCOIN_01(C_ITEM)
{
	name = "Золотая монета";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_MьNZE;
	visual = "ItMi_Stuff_OldCoin_01.3DS";
	material = MAT_METAL;
	description = name;
};

instance ITMI_STUFF_PLATE_01(C_ITEM)
{
	name = "Тарелка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SCHьSSEL;
	visual = "ItMi_Stuff_Plate_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_STUFF_CANDEL_01(C_ITEM)
{
	name = "Свеча";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_KERZENSTеNDER;
	visual = "ItMi_Stuff_Candel_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_STUFF_CUP_01(C_ITEM)
{
	name = "Бокал";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_BECHER;
	visual = "ItMi_Stuff_Cup_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_STUFF_CUP_02(C_ITEM)
{
	name = "Кубок";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_POKAL;
	visual = "ItMi_Stuff_Cup_02.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_STUFF_SILVERWARE_01(C_ITEM)
{
	name = "Столовый набор";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_BESTECK;
	visual = "ItMi_Stuff_Silverware_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_STUFF_PAN_01(C_ITEM)
{
	name = "Сковорода";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_PFANNE;
	visual = "ItMi_Stuff_Pan_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_STUFF_MUG_01(C_ITEM)
{
	name = "Кружка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_KRUG;
	visual = "ItMi_Stuff_Mug_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_STUFF_AMPHORE_01(C_ITEM)
{
	name = "Амфора";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_AMPHORE;
	visual = "ItMi_Stuff_Amphore_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_STUFF_IDOL_OGRONT_01(C_ITEM)
{
	name = "Фигурка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_STATUE;
	visual = "ItMi_Stuff_Idol_Ogront_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_ALCHEMY_SULPHUR_01(C_ITEM)
{
	name = "Сера";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SCHWEFEL;
	visual = "ItMi_Alchemy_Sulphur_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_ALCHEMY_QUICKSILVER_01(C_ITEM)
{
	name = "Ртуть";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_QUECKSILBER;
	visual = "ItMi_Alchemy_Quicksilver_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_ALCHEMY_SALT_01(C_ITEM)
{
	name = "Соль";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SALZ;
	visual = "ItMi_Alchemy_Salt_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_ALCHEMY_SYRIANOIL_01(C_ITEM)
{
	name = "Масло";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_ЦL;
	visual = "ItMi_Alchemy_Syrianoil_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_ALCHEMY_MOLERATLUBRIC_01(C_ITEM)
{
	name = "Жир кротокрыса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_MOLERATFETT;
	visual = "ItMi_Alchemy_Moleratlubric_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_ALCHEMY_ALCOHOL_01(C_ITEM)
{
	name = "Чистый спирт";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_ALCOHOL;
	visual = "ItMi_Alchemy_Alcohol_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_QUENTIN(C_ITEM)
{
	name = "Ключ Квентина";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
};

instance ITKE_GILBERT(C_ITEM)
{
	name = "Дубликат ключа";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
};

instance ORIK_KEY(C_ITEM)
{
	name = "Ключ Орика";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
};

instance ITKE_TOWER_01(C_ITEM)
{
	name = "Ключ от башни";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
};

instance ITKE_YBERION(C_ITEM)
{
	name = "Ключ Юбериона";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
};

instance ALEXSTUFF(C_ITEM)
{
	name = "Маскировка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "grdl.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Вещи, нужные для побега Алекса:";
	text[2] = "одежда стражника и короткий меч.";
};

instance WEEDPACK(C_ITEM)
{
	name = "Пакет с травой";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 100;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Урожай сборщиков болотника.";
	text[2] = "Сайфер хорошо за него заплатит.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

