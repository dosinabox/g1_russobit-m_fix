
const int VALUE_HPESSENZ = 25;
const int HP_ESSENZ = 50;
const int VALUE_HPEXTRAKT = 35;
const int HP_EXTRAKT = 70;
const int VALUE_HPELIXIER = 50;
const int HP_ELIXIER = 100;
const int VALUE_MANAESSENZ = 25;
const int MANA_ESSENZ = 30;
const int VALUE_MANAEXTRAKT = 45;
const int MANA_EXTRAKT = 50;
const int VALUE_MANAELIXIER = 65;
const int MANA_ELIXIER = 70;
const int VALUE_ELIXIER1 = 95;
const int MANA_ELIXIER1 = 100;
const int VALUE_ELIXIEREGG = 1;
const int MANAMAX_ELIXIEREGG = 10;
const int VALUE_STRESSENZ = 300;
const int STR_ESSENZ = 3;
const int VALUE_STREXTRAKT = 500;
const int STR_EXTRAKT = 5;
const int VALUE_STRELIXIER = 800;
const int STR_ELIXIER = 8;
const int VALUE_DEXESSENZ = 300;
const int DEX_ESSENZ = 3;
const int VALUE_DEXEXTRAKT = 500;
const int DEX_EXTRAKT = 5;
const int VALUE_DEXELIXIER = 800;
const int DEX_ELIXIER = 8;
const int VALUE_STRDEX_MACHT = 800;
const int STRDEX_MACHT = 4;
const int VALUE_STRDEX_HERRSCHAFT = 1200;
const int STRDEX_HERRSCHAFT = 6;
const int VALUE_HPMAXESSENZ = 500;
const int HPMAX_ESSENZ = 5;
const int VALUE_HPMAXEXTRAKT = 1000;
const int HPMAX_EXTRAKT = 10;
const int VALUE_HPMAXELIXIER = 1500;
const int HPMAX_ELIXIER = 15;
const int VALUE_MANAMAXESSENZ = 500;
const int MANAMAX_ESSENZ = 5;
const int VALUE_MANAMAXEXTRAKT = 1000;
const int MANAMAX_EXTRAKT = 10;
const int VALUE_MANAMAXELIXIER = 1500;
const int MANAMAX_ELIXIER = 15;
const int VALUE_HASTE1 = 100;
const int TIME_HASTE1 = 60000;
const int VALUE_HASTE2 = 150;
const int TIME_HASTE2 = 120000;
const int VALUE_HASTE3 = 200;
const int TIME_HASTE3 = 300000;

instance ITFO_POTION_MANA_01(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_MANAESSENZ;
	visual = "ItFo_Potion_Mana_01.3ds";
	material = MAT_GLAS;
	on_state[0] = usemanapotion;
	scemename = "POTIONFAST";
	description = "Ёссенци€ магической энергии";
	text[1] = NAME_BONUS_MANA;
	count[1] = MANA_ESSENZ;
	text[5] = NAME_VALUE;
	count[5] = VALUE_MANAESSENZ;
};


func void usemanapotion()
{
	printdebugnpc(PD_ITEM_MOBSI,"UseManaPotion");
	Npc_ChangeAttribute(self,ATR_MANA,MANA_ESSENZ);
};


instance ITFO_POTION_MANA_02(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_MANAEXTRAKT;
	visual = "ItFo_Potion_Mana_02.3ds";
	material = MAT_GLAS;
	on_state[0] = usemana2potion;
	scemename = "POTIONFAST";
	description = "Ёкстракт магической энергии";
	text[1] = NAME_BONUS_MANA;
	count[1] = MANA_EXTRAKT;
	text[5] = NAME_VALUE;
	count[5] = VALUE_MANAEXTRAKT;
};


func void usemana2potion()
{
	printdebugnpc(PD_ITEM_MOBSI,"UseMana2Potion");
	Npc_ChangeAttribute(self,ATR_MANA,MANA_EXTRAKT);
};


instance ITFO_POTION_MANA_03(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_MANAELIXIER;
	visual = "ItFo_Potion_Mana_03.3ds";
	material = MAT_GLAS;
	on_state[0] = usemana3potion;
	scemename = "POTIONFAST";
	description = "«елье магической энергии";
	text[1] = NAME_BONUS_MANA;
	count[1] = MANA_ELIXIER;
	text[5] = NAME_VALUE;
	count[5] = VALUE_MANAELIXIER;
};


func void usemana3potion()
{
	printdebugnpc(PD_ITEM_MOBSI,"UseMana3Potion");
	Npc_ChangeAttribute(self,ATR_MANA,MANA_ELIXIER);
};


instance ITFO_POTION_ELIXIER(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_ELIXIER1;
	visual = "ItFo_Potion_Elixier.3ds";
	material = MAT_GLAS;
	on_state[0] = useelixier;
	scemename = "POTIONFAST";
	description = "«елье";
	text[1] = NAME_BONUS_MANA;
	count[1] = MANA_ELIXIER1;
	text[5] = NAME_VALUE;
	count[5] = VALUE_ELIXIER1;
};


func void useelixier()
{
	printdebugnpc(PD_ITEM_MOBSI,"UseElixier");
	Npc_ChangeAttribute(self,ATR_MANA,MANA_ELIXIER1);
};


instance ITFO_POTION_HEALTH_01(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_HPESSENZ;
	visual = "ItFo_Potion_Health_01.3ds";
	material = MAT_GLAS;
	on_state[0] = usehealthpotion;
	scemename = "POTIONFAST";
	description = "Ёссенци€ исцелени€";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_ESSENZ;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPESSENZ;
};


func void usehealthpotion()
{
	printdebugnpc(PD_ITEM_MOBSI,"UseHealthPotion");
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_ESSENZ);
};


instance ITFO_POTION_HEALTH_02(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_HPEXTRAKT;
	visual = "ItFo_Potion_Health_02.3ds";
	material = MAT_GLAS;
	on_state[0] = usehealth2potion;
	scemename = "POTIONFAST";
	description = "Ёкстракт исцел€ющей силы";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_EXTRAKT;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPEXTRAKT;
};


func void usehealth2potion()
{
	printdebugnpc(PD_ITEM_MOBSI,"UseHealthPotion");
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_EXTRAKT);
};


instance ITFO_POTION_HEALTH_03(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_HPELIXIER;
	visual = "ItFo_Potion_Health_01.3ds";
	material = MAT_GLAS;
	on_state[0] = usehealth3potion;
	scemename = "POTIONFAST";
	description = "«елье исцел€ющей силы";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_ELIXIER;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPELIXIER;
};


func void usehealth3potion()
{
	printdebugnpc(PD_ITEM_MOBSI,"UseHealthPotion");
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_ELIXIER);
};


instance ITFO_POTION_ELIXIER_EGG(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_ELIXIEREGG;
	visual = "ItFo_Potion_Elixier_Egg.3ds";
	material = MAT_GLAS;
	on_state[0] = useeggelixier;
	scemename = "POTIONFAST";
	description = "«елье из слюны ползунов";
	text[0] = "Ќастраивает на св€зь со —п€щим.";
	text[1] = NAME_BONUS_MANAMAX;
	count[1] = MANAMAX_ELIXIEREGG;
	text[5] = NAME_VALUE;
	count[5] = VALUE_ELIXIEREGG;
};


func void useeggelixier()
{
	b_raiseattribute(ATR_MANA_MAX,MANAMAX_ELIXIEREGG);
};


instance ITFO_POTION_STRENGTH_01(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_STRESSENZ;
	visual = "ItFo_Potion_Strength_01.3ds";
	material = MAT_GLAS;
	on_state[0] = usestrengthpotion;
	scemename = "POTIONFAST";
	description = "Ёссенци€ силы";
	text[1] = NAME_BONUS_STR;
	count[1] = STR_ESSENZ;
	text[5] = NAME_VALUE;
	count[5] = VALUE_STRESSENZ;
};


func void usestrengthpotion()
{
	b_raiseattribute(ATR_STRENGTH,STR_ESSENZ);
};


instance ITFO_POTION_STRENGTH_02(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_STREXTRAKT;
	visual = "ItFo_Potion_Strength_02.3ds";
	material = MAT_GLAS;
	on_state[0] = usestrength2potion;
	scemename = "POTIONFAST";
	description = "Ёкстракт силы";
	text[1] = NAME_BONUS_STR;
	count[1] = STR_EXTRAKT;
	text[5] = NAME_VALUE;
	count[5] = VALUE_STREXTRAKT;
};


func void usestrength2potion()
{
	b_raiseattribute(ATR_STRENGTH,STR_EXTRAKT);
};


instance ITFO_POTION_STRENGTH_03(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_STRELIXIER;
	visual = "ItFo_Potion_Strength_03.3ds";
	material = MAT_GLAS;
	on_state[0] = usestrength3potion;
	scemename = "POTIONFAST";
	description = "«елье силы";
	text[1] = NAME_BONUS_STR;
	count[1] = STR_ELIXIER;
	text[5] = NAME_VALUE;
	count[5] = VALUE_STRELIXIER;
};


func void usestrength3potion()
{
	b_raiseattribute(ATR_STRENGTH,STR_ELIXIER);
};


instance ITFO_POTION_DEX_01(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_DEXESSENZ;
	visual = "ItFo_Potion_Dex_01.3ds";
	material = MAT_GLAS;
	on_state[0] = usedexpotion;
	scemename = "POTIONFAST";
	description = "Ёссенци€ ловкости";
	text[1] = NAME_BONUS_DEX;
	count[1] = DEX_ESSENZ;
	text[5] = NAME_VALUE;
	count[5] = VALUE_DEXESSENZ;
};


func void usedexpotion()
{
	b_raiseattribute(ATR_DEXTERITY,DEX_ESSENZ);
};


instance ITFO_POTION_DEX_02(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_DEXEXTRAKT;
	visual = "ItFo_Potion_Dex_02.3ds";
	material = MAT_GLAS;
	on_state[0] = usedex2potion;
	scemename = "POTIONFAST";
	description = "Ёкстракт ловкости";
	text[1] = NAME_BONUS_DEX;
	count[1] = DEX_EXTRAKT;
	text[5] = NAME_VALUE;
	count[5] = VALUE_DEXEXTRAKT;
};


func void usedex2potion()
{
	b_raiseattribute(ATR_DEXTERITY,DEX_EXTRAKT);
};


instance ITFO_POTION_DEX_03(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_DEXELIXIER;
	visual = "ItFo_Potion_Dex_03.3ds";
	material = MAT_GLAS;
	on_state[0] = usedex3potion;
	scemename = "POTIONFAST";
	description = "«елье ловкости";
	text[1] = NAME_BONUS_DEX;
	count[1] = DEX_ELIXIER;
	text[5] = NAME_VALUE;
	count[5] = VALUE_DEXELIXIER;
};


func void usedex3potion()
{
	b_raiseattribute(ATR_DEXTERITY,DEX_ELIXIER);
};


instance ITFO_POTION_MASTER_01(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_STRDEX_MACHT;
	visual = "ItFo_Potion_Master_01.3ds";
	material = MAT_GLAS;
	on_state[0] = usemasterpotion;
	scemename = "POTIONFAST";
	description = "«елье мощи";
	text[1] = NAME_BONUS_DEX;
	count[1] = STRDEX_MACHT;
	text[2] = NAME_BONUS_STR;
	count[2] = STRDEX_MACHT;
	text[5] = NAME_VALUE;
	count[5] = VALUE_STRDEX_MACHT;
};


func void usemasterpotion()
{
	var string msg;
	Npc_ChangeAttribute(self,ATR_STRENGTH,STRDEX_MACHT);
	Npc_ChangeAttribute(self,ATR_DEXTERITY,STRDEX_MACHT);
	msg = ConcatStrings(NAME_RAISESTRDEX,IntToString(STRDEX_MACHT));
	PrintScreen(msg,-1,-1,"FONT_OLD_20_WHITE.TGA",_TIME_MESSAGE_RAISEATTRIBUTE);
};


instance ITFO_POTION_MASTER_02(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_STRDEX_HERRSCHAFT;
	visual = "ItFo_Potion_Master_02.3ds";
	material = MAT_GLAS;
	on_state[0] = usemaster2potion;
	scemename = "POTIONFAST";
	description = "«елье власти";
	text[1] = NAME_BONUS_DEX;
	count[1] = STRDEX_HERRSCHAFT;
	text[2] = NAME_BONUS_STR;
	count[2] = STRDEX_HERRSCHAFT;
	text[5] = NAME_VALUE;
	count[5] = VALUE_STRDEX_HERRSCHAFT;
};


func void usemaster2potion()
{
	var string msg;
	Npc_ChangeAttribute(self,ATR_STRENGTH,STRDEX_HERRSCHAFT);
	Npc_ChangeAttribute(self,ATR_DEXTERITY,STRDEX_HERRSCHAFT);
	msg = ConcatStrings(NAME_RAISESTRDEX,IntToString(STRDEX_HERRSCHAFT));
	PrintScreen(msg,-1,-1,"FONT_OLD_20_WHITE.TGA",_TIME_MESSAGE_RAISEATTRIBUTE);
};


instance ITFO_POTION_HEALTH_PERMA_01(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_HPMAXESSENZ;
	visual = "ItFo_Potion_Health_Perma_01.3ds";
	material = MAT_GLAS;
	on_state[0] = uselifepotion;
	scemename = "POTIONFAST";
	description = "Ёссенци€ жизни";
	text[1] = NAME_BONUS_HPMAX;
	count[1] = HPMAX_ESSENZ;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPMAXESSENZ;
};


func void uselifepotion()
{
	b_raiseattribute(ATR_HITPOINTS_MAX,HPMAX_ESSENZ);
};


instance ITFO_POTION_HEALTH_PERMA_02(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_HPMAXEXTRAKT;
	visual = "ItFo_Potion_Health_Perma_02.3ds";
	material = MAT_GLAS;
	on_state[0] = uselife2potion;
	scemename = "POTIONFAST";
	description = "Ёкстракт жизни";
	text[1] = NAME_BONUS_HPMAX;
	count[1] = HPMAX_EXTRAKT;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPMAXEXTRAKT;
};


func void uselife2potion()
{
	b_raiseattribute(ATR_HITPOINTS_MAX,HPMAX_EXTRAKT);
};


instance ITFO_POTION_HEALTH_PERMA_03(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_HPMAXELIXIER;
	visual = "ItFo_Potion_Health_Perma_03.3ds";
	material = MAT_GLAS;
	on_state[0] = uselife3potion;
	scemename = "POTIONFAST";
	description = "«елье жизни";
	text[1] = NAME_BONUS_HPMAX;
	count[1] = HPMAX_ELIXIER;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPMAXELIXIER;
};


func void uselife3potion()
{
	b_raiseattribute(ATR_HITPOINTS_MAX,HPMAX_ELIXIER);
};


instance ITFO_POTION_MANA_PERMA_01(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_MANAMAXESSENZ;
	visual = "ItFo_Potion_Mana_Perma_01.3ds";
	material = MAT_GLAS;
	on_state[0] = usenectarpotion;
	scemename = "POTIONFAST";
	description = "Ёссенци€ силы духа";
	text[1] = NAME_BONUS_MANAMAX;
	count[1] = MANAMAX_ESSENZ;
	text[5] = NAME_VALUE;
	count[5] = VALUE_MANAMAXESSENZ;
};


func void usenectarpotion()
{
	b_raiseattribute(ATR_MANA_MAX,MANAMAX_ESSENZ);
	printdebugnpc(PD_ITEM_MOBSI,"я пью магическое зелье.");
};


instance ITFO_POTION_MANA_PERMA_02(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_MANAMAXEXTRAKT;
	visual = "ItFo_Potion_Mana_Perma_02.3ds";
	material = MAT_GLAS;
	on_state[0] = usenectar2potion;
	scemename = "POTIONFAST";
	description = "Ёкстракт силы духа";
	text[1] = NAME_BONUS_MANAMAX;
	count[1] = MANAMAX_EXTRAKT;
	text[5] = NAME_VALUE;
	count[5] = VALUE_MANAMAXEXTRAKT;
};


func void usenectar2potion()
{
	b_raiseattribute(ATR_MANA_MAX,MANAMAX_EXTRAKT);
	printdebugnpc(PD_ITEM_MOBSI,"я пью магическое зелье.");
};


instance ITFO_POTION_MANA_PERMA_03(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_MANAMAXELIXIER;
	visual = "ItFo_Potion_Mana_Perma_03.3ds";
	material = MAT_GLAS;
	on_state[0] = usenectar3potion;
	scemename = "POTIONFAST";
	description = "«елье силы духа";
	text[1] = NAME_BONUS_MANAMAX;
	count[1] = MANAMAX_ELIXIER;
	text[5] = NAME_VALUE;
	count[5] = VALUE_MANAMAXELIXIER;
};


func void usenectar3potion()
{
	b_raiseattribute(ATR_MANA_MAX,MANAMAX_ELIXIER);
	printdebugnpc(PD_ITEM_MOBSI,"я пью магическое зелье.");
};


instance ITFO_POTION_HASTE_01(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_HASTE1;
	visual = "ItFo_Potion_Haste_01.3ds";
	material = MAT_GLAS;
	on_state[0] = usehastepotion;
	scemename = "POTIONFAST";
	description = "«елье скорости";
	text[1] = "”величивает скорость движени€.";
	text[3] = NAME_DURATION;
	count[3] = TIME_HASTE1 / 60000;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void usehastepotion()
{
	Mdl_ApplyOverlayMdsTimed(self,"HUMANS_SPRINT.MDS",TIME_HASTE1);
	printdebugnpc(PD_ITEM_MOBSI,"я стал быстрее.");
};


instance ITFO_POTION_HASTE_02(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_HASTE1;
	visual = "ItFo_Potion_Haste_01.3ds";
	material = MAT_GLAS;
	on_state[0] = usehastepotion2;
	scemename = "POTIONFAST";
	description = "«елье быстроты";
	text[1] = "”величивает скорость движени€.";
	text[3] = NAME_DURATION;
	count[3] = TIME_HASTE2 / 60000;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void usehastepotion2()
{
	Mdl_ApplyOverlayMdsTimed(self,"HUMANS_SPRINT.MDS",TIME_HASTE2);
	printdebugnpc(PD_ITEM_MOBSI,"я стал быстрее.");
};


instance ITFO_POTION_HASTE_03(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_HASTE1;
	visual = "ItFo_Potion_Haste_01.3ds";
	material = MAT_GLAS;
	on_state[0] = usehastepotion3;
	scemename = "POTIONFAST";
	description = "«елье спешки";
	text[1] = "”величивает скорость движени€.";
	text[3] = NAME_DURATION;
	count[3] = TIME_HASTE3 / 60000;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void usehastepotion3()
{
	Mdl_ApplyOverlayMdsTimed(self,"HUMANS_SPRINT.MDS",TIME_HASTE3);
	printdebugnpc(PD_ITEM_MOBSI,"я стал быстрее.");
};

