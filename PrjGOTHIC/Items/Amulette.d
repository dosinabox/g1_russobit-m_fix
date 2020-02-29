
instance ITMI_AMULET_PSI_01(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 5;
	visual = "ItMi_Amulet_Psi_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = "Амулет Братства";
	text[1] = "Знак отличия последователей";
	text[2] = "Спящего.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance SCHUTZAMULETT_FEUER(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 600;
	visual = "ItMi_Amulet_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_schutzamulett_feuer;
	on_unequip = unequip_schutzamulett_feuer;
	description = "Амулет пламени";
	text[2] = NAME_PROT_FIRE;
	count[2] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_schutzamulett_feuer()
{
	self.protection[PROT_FIRE] += 10;
};

func void unequip_schutzamulett_feuer()
{
	self.protection[PROT_FIRE] -= 10;
};


instance SCHUTZAMULETT_WAFFEN(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 600;
	visual = "ItMi_Amulet_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_schutzamulett_waffen;
	on_unequip = unequip_schutzamulett_waffen;
	description = "Амулет защиты";
	text[2] = NAME_PROT_EDGE;
	count[2] = 15;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_schutzamulett_waffen()
{
	self.protection[PROT_EDGE] += 15;
	self.protection[PROT_BLUNT] += 15;
};

func void unequip_schutzamulett_waffen()
{
	self.protection[PROT_EDGE] -= 15;
	self.protection[PROT_BLUNT] -= 15;
};


instance SCHUTZAMULETT_GESCHOSSE(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 600;
	visual = "ItMi_Amulet_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_schutzamulett_geschosse;
	on_unequip = unequip_schutzamulett_geschosse;
	description = "Амулет дубовой кожи";
	text[2] = NAME_PROT_POINT;
	count[2] = 15;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_schutzamulett_geschosse()
{
	self.protection[PROT_POINT] += 15;
};

func void unequip_schutzamulett_geschosse()
{
	self.protection[PROT_POINT] -= 15;
};


instance SCHUTZAMULETT_MAGIE(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 600;
	visual = "ItMi_Amulet_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_schutzamulett_magie;
	on_unequip = unequip_schutzamulett_magie;
	description = "Амулет силы духа";
	text[2] = NAME_PROT_MAGIC;
	count[2] = 8;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_schutzamulett_magie()
{
	self.protection[PROT_MAGIC] += 8;
};

func void unequip_schutzamulett_magie()
{
	self.protection[PROT_MAGIC] -= 8;
};


instance SCHUTZAMULETT_MAGIE_FEUER(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1000;
	visual = "ItMi_Amulet_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_schutzamulett_magie_feuer;
	on_unequip = unequip_schutzamulett_magie_feuer;
	description = "Амулет очищения";
	text[2] = NAME_PROT_FIRE;
	count[2] = 10;
	text[3] = NAME_PROT_MAGIC;
	count[3] = 8;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_schutzamulett_magie_feuer()
{
	self.protection[PROT_MAGIC] += 8;
	self.protection[PROT_FIRE] += 10;
};

func void unequip_schutzamulett_magie_feuer()
{
	self.protection[PROT_MAGIC] -= 8;
	self.protection[PROT_FIRE] -= 10;
};


instance SCHUTZAMULETT_WAFFEN_GESCHOSSE(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1000;
	visual = "ItMi_Amulet_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_schutzamulett_waffen_geschosse;
	on_unequip = unequip_schutzamulett_waffen_geschosse;
	description = "Амулет каменной кожи";
	text[2] = NAME_PROT_EDGE;
	count[2] = 15;
	text[3] = NAME_PROT_POINT;
	count[3] = 15;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_schutzamulett_waffen_geschosse()
{
	self.protection[PROT_EDGE] += 15;
	self.protection[PROT_BLUNT] += 15;
	self.protection[PROT_POINT] += 15;
};

func void unequip_schutzamulett_waffen_geschosse()
{
	self.protection[PROT_EDGE] -= 15;
	self.protection[PROT_BLUNT] -= 15;
	self.protection[PROT_POINT] -= 15;
};


instance SCHUTZAMULETT_TOTAL(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1600;
	visual = "ItMi_Amulet_03.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_schutzamulett_total;
	on_unequip = unequip_schutzamulett_total;
	description = "Амулет железной кожи";
	text[1] = NAME_PROT_FIRE;
	count[1] = 10;
	text[2] = NAME_PROT_MAGIC;
	count[2] = 8;
	text[3] = NAME_PROT_POINT;
	count[3] = 15;
	text[4] = NAME_PROT_EDGE;
	count[4] = 15;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_schutzamulett_total()
{
	self.protection[PROT_EDGE] += 15;
	self.protection[PROT_BLUNT] += 15;
	self.protection[PROT_POINT] += 15;
	self.protection[PROT_FIRE] += 10;
	self.protection[PROT_MAGIC] += 8;
};

func void unequip_schutzamulett_total()
{
	self.protection[PROT_EDGE] -= 15;
	self.protection[PROT_BLUNT] -= 15;
	self.protection[PROT_POINT] -= 15;
	self.protection[PROT_FIRE] -= 10;
	self.protection[PROT_MAGIC] -= 8;
};


instance GEWANDTHEITSAMULETT(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 320;
	visual = "ItMi_Amulet_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_gewandtheitsamulett;
	on_unequip = unequip_gewandtheitsamulett;
	description = "Амулет подвижности";
	text[2] = NAME_BONUS_DEX;
	count[2] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_gewandtheitsamulett()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,10);
};

func void unequip_gewandtheitsamulett()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-10);
};


instance GEWANDTHEITSAMULETT2(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 480;
	visual = "ItMi_Amulet_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_gewandtheitsamulett2;
	on_unequip = unequip_gewandtheitsamulett2;
	description = "Амулет ловкости";
	text[2] = NAME_BONUS_DEX;
	count[2] = 20;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_gewandtheitsamulett2()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,20);
};

func void unequip_gewandtheitsamulett2()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-20);
};


instance STAERKEAMULETT(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 320;
	visual = "ItMi_Amulet_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_staerkeamulett;
	on_unequip = unequip_staerkeamulett;
	description = "Амулет мощи";
	text[2] = NAME_BONUS_STR;
	count[2] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_staerkeamulett()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,10);
};

func void unequip_staerkeamulett()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-10);
};


instance STAERKEAMULETT2(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 480;
	visual = "ItMi_Amulet_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_staerkeamulett2;
	on_unequip = unequip_staerkeamulett2;
	description = "Амулет силы";
	text[2] = NAME_BONUS_STR;
	count[2] = 20;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_staerkeamulett2()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,20);
};

func void unequip_staerkeamulett2()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-20);
};


instance LEBENSAMULETT(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 720;
	visual = "ItMi_Amulet_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_lebensamulett;
	on_unequip = unequip_lebensamulett;
	description = "Амулет жизненной силы";
	text[2] = NAME_BONUS_HPMAX;
	count[2] = 30;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_lebensamulett()
{
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 30;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 30;
};

func void unequip_lebensamulett()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 30;
	if(self.attribute[ATR_HITPOINTS] > 31)
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 30;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};


instance AMULETT_DER_MAGIE(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 400;
	visual = "ItMi_Amulet_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_amulett_der_magie;
	on_unequip = unequip_amulett_der_magie;
	description = "Амулет магии";
	text[2] = NAME_BONUS_MANAMAX;
	count[2] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_amulett_der_magie()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 10;
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 10;
};

func void unequip_amulett_der_magie()
{
	if(self.attribute[ATR_MANA] >= 10)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 10;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 10;
};


instance AMULETT_DER_MACHT(C_ITEM)
{
	name = "Амулет силы";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 600;
	visual = "ItMi_Amulet_03.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_amulett_der_macht;
	on_unequip = unequip_amulett_der_macht;
	description = "Амулет силы";
	text[2] = NAME_BONUS_DEX;
	count[2] = 7;
	text[3] = NAME_BONUS_STR;
	count[3] = 7;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_amulett_der_macht()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,7);
	Npc_ChangeAttribute(self,ATR_STRENGTH,7);
};

func void unequip_amulett_der_macht()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-7);
	Npc_ChangeAttribute(self,ATR_STRENGTH,-7);
};


instance AMULETT_DER_ERLEUCHTUNG(C_ITEM)
{
	name = "Амулет освещения";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1000;
	visual = "ItMi_Amulet_03.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_amulett_der_erleuchtung;
	on_unequip = unequip_amulett_der_erleuchtung;
	description = "Амулет освещения";
	text[2] = NAME_BONUS_HPMAX;
	count[2] = 25;
	text[3] = NAME_BONUS_MANAMAX;
	count[3] = 25;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_amulett_der_erleuchtung()
{
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 25;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 25;
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 25;
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 25;
};

func void unequip_amulett_der_erleuchtung()
{
	if(self.attribute[ATR_MANA] >= 25)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 25;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 25;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 25;
	if(self.attribute[ATR_HITPOINTS] > 26)
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 25;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};

