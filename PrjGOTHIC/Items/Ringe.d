
instance SCHUTZRING_FEUER1(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 200;
	visual = "ItMi_Ring_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_schutzring_feuer1;
	on_unequip = unequip_schutzring_feuer1;
	description = "Кольцо защиты от огня";
	text[2] = NAME_PROT_FIRE;
	count[2] = 3;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_schutzring_feuer1()
{
	self.protection[PROT_FIRE] += 3;
};

func void unequip_schutzring_feuer1()
{
	self.protection[PROT_FIRE] -= 3;
};


instance SCHUTZRING_FEUER2(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 400;
	visual = "ItMi_Ring_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_schutzring_feuer2;
	on_unequip = unequip_schutzring_feuer2;
	description = "Защита от огня";
	text[2] = NAME_PROT_FIRE;
	count[2] = 5;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_schutzring_feuer2()
{
	self.protection[PROT_FIRE] += 5;
};

func void unequip_schutzring_feuer2()
{
	self.protection[PROT_FIRE] -= 5;
};


instance SCHUTZRING_GESCHOSSE1(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 200;
	visual = "ItMi_Ring_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_schutzring_geschosse1;
	on_unequip = unequip_schutzring_geschosse1;
	description = "Кольцо деревянной кожи";
	text[2] = NAME_PROT_POINT;
	count[2] = 5;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_schutzring_geschosse1()
{
	self.protection[PROT_POINT] += 5;
};

func void unequip_schutzring_geschosse1()
{
	self.protection[PROT_POINT] -= 5;
};


instance SCHUTZRING_GESCHOSSE2(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 400;
	visual = "ItMi_Ring_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_schutzring_geschosse2;
	on_unequip = unequip_schutzring_geschosse2;
	description = "Кольцо каменной кожи";
	text[2] = NAME_PROT_POINT;
	count[2] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_schutzring_geschosse2()
{
	self.protection[PROT_POINT] += 10;
};

func void unequip_schutzring_geschosse2()
{
	self.protection[PROT_POINT] -= 10;
};


instance SCHUTZRING_WAFFEN1(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 200;
	visual = "ItMi_Ring_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_schutzring_waffen1;
	on_unequip = unequip_schutzring_waffen1;
	description = "Кольцо железной кожи";
	text[2] = NAME_PROT_EDGE;
	count[2] = 5;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_schutzring_waffen1()
{
	self.protection[PROT_EDGE] += 5;
	self.protection[PROT_BLUNT] += 5;
};

func void unequip_schutzring_waffen1()
{
	self.protection[PROT_EDGE] -= 5;
	self.protection[PROT_BLUNT] -= 5;
};


instance SCHUTZRING_WAFFEN2(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 400;
	visual = "ItMi_Ring_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_schutzring_waffen2;
	on_unequip = unequip_schutzring_waffen2;
	description = "Кольцо бронированной кожи";
	text[2] = NAME_PROT_EDGE;
	count[2] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_schutzring_waffen2()
{
	self.protection[PROT_EDGE] += 10;
	self.protection[PROT_BLUNT] += 10;
};

func void unequip_schutzring_waffen2()
{
	self.protection[PROT_EDGE] -= 10;
	self.protection[PROT_BLUNT] -= 10;
};


instance SCHUTZRING_MAGIE1(C_ITEM)
{
	name = "Кольцо";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 200;
	visual = "ItMi_Ring_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_schutzring_magie1;
	on_unequip = unequip_schutzring_magie1;
	description = "Кольцо силы духа";
	text[2] = NAME_PROT_MAGIC;
	count[2] = 1;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_schutzring_magie1()
{
	self.protection[PROT_MAGIC] += 1;
};

func void unequip_schutzring_magie1()
{
	self.protection[PROT_MAGIC] -= 1;
};


instance SCHUTZRING_MAGIE2(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 400;
	visual = "ItMi_Ring_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_schutzring_magie2;
	on_unequip = unequip_schutzring_magie2;
	description = "Кольцо защиты";
	text[2] = NAME_PROT_EDGE;
	count[2] = 3;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_schutzring_magie2()
{
	self.protection[PROT_EDGE] += 3;
	self.protection[PROT_BLUNT] += 3;
};

func void unequip_schutzring_magie2()
{
	self.protection[PROT_EDGE] -= 3;
	self.protection[PROT_BLUNT] -= 3;
};


instance SCHUTZRING_MAGIE1_FIRE1(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 600;
	visual = "ItMi_Ring_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_schutzring_magie1_fire1;
	on_unequip = unequip_schutzring_magie1_fire1;
	description = "Кольцо очищения";
	text[2] = NAME_PROT_MAGIC;
	count[2] = 1;
	text[3] = NAME_PROT_FIRE;
	count[3] = 3;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_schutzring_magie1_fire1()
{
	self.protection[PROT_MAGIC] += 1;
	self.protection[PROT_FIRE] += 3;
};

func void unequip_schutzring_magie1_fire1()
{
	self.protection[PROT_MAGIC] -= 1;
	self.protection[PROT_FIRE] -= 3;
};


instance SCHUTZRING_MAGIE2_FIRE2(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 800;
	visual = "ItMi_Ring_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_schutzring_magie2_fire2;
	on_unequip = unequip_schutzring_magie2_fire2;
	description = "Кольцо неуязвимости";
	text[2] = NAME_PROT_MAGIC;
	count[2] = 3;
	text[3] = NAME_PROT_FIRE;
	count[3] = 5;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_schutzring_magie2_fire2()
{
	self.protection[PROT_MAGIC] += 3;
	self.protection[PROT_FIRE] += 5;
};

func void unequip_schutzring_magie2_fire2()
{
	self.protection[PROT_MAGIC] -= 3;
	self.protection[PROT_FIRE] -= 5;
};


instance SCHUTZRING_GESCHOSSE1_WAFFEN1(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 600;
	visual = "ItMi_Ring_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_schutzring_geschosse1_waffen1;
	on_unequip = unequip_schutzring_geschosse1_waffen1;
	description = "Кольцо стойкости";
	text[2] = NAME_PROT_EDGE;
	count[2] = 5;
	text[3] = NAME_PROT_POINT;
	count[3] = 5;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_schutzring_geschosse1_waffen1()
{
	self.protection[PROT_EDGE] += 5;
	self.protection[PROT_BLUNT] += 5;
	self.protection[PROT_POINT] += 5;
};

func void unequip_schutzring_geschosse1_waffen1()
{
	self.protection[PROT_EDGE] -= 5;
	self.protection[PROT_BLUNT] -= 5;
	self.protection[PROT_POINT] -= 5;
};


instance SCHUTZRING_GESCHOSSE2_WAFFEN2(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 800;
	visual = "ItMi_Ring_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_schutzring_geschosse2_waffen2;
	on_unequip = unequip_schutzring_geschosse2_waffen2;
	description = "Кольцо неприкосновенности";
	text[2] = NAME_PROT_EDGE;
	count[2] = 10;
	text[3] = NAME_PROT_POINT;
	count[3] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_schutzring_geschosse2_waffen2()
{
	self.protection[PROT_EDGE] += 10;
	self.protection[PROT_BLUNT] += 10;
	self.protection[PROT_POINT] += 10;
};

func void unequip_schutzring_geschosse2_waffen2()
{
	self.protection[PROT_EDGE] -= 10;
	self.protection[PROT_BLUNT] -= 10;
	self.protection[PROT_POINT] -= 10;
};


instance SCHUTZRING_TOTAL1(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 800;
	visual = "ItMi_Ring_03.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_schutzring_total1;
	on_unequip = unequip_schutzring_total1;
	description = "Кольцо неприкосновенности";
	text[1] = NAME_PROT_MAGIC;
	count[1] = 1;
	text[2] = NAME_PROT_FIRE;
	count[2] = 3;
	text[3] = NAME_PROT_POINT;
	count[3] = 5;
	text[4] = NAME_PROT_EDGE;
	count[4] = 5;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_schutzring_total1()
{
	self.protection[PROT_EDGE] += 5;
	self.protection[PROT_BLUNT] += 5;
	self.protection[PROT_POINT] += 5;
	self.protection[PROT_FIRE] += 3;
	self.protection[PROT_MAGIC] += 1;
};

func void unequip_schutzring_total1()
{
	self.protection[PROT_EDGE] -= 5;
	self.protection[PROT_BLUNT] -= 5;
	self.protection[PROT_POINT] -= 5;
	self.protection[PROT_FIRE] -= 3;
	self.protection[PROT_MAGIC] -= 1;
};


instance SCHUTZRING_TOTAL2(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 1000;
	visual = "ItMi_Ring_03.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_schutzring_total2;
	on_unequip = unequip_schutzring_total2;
	description = "Кольцо защиты";
	text[1] = NAME_PROT_MAGIC;
	count[1] = 3;
	text[2] = NAME_PROT_FIRE;
	count[2] = 5;
	text[3] = NAME_PROT_POINT;
	count[3] = 10;
	text[4] = NAME_PROT_EDGE;
	count[4] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_schutzring_total2()
{
	self.protection[PROT_EDGE] += 10;
	self.protection[PROT_BLUNT] += 10;
	self.protection[PROT_POINT] += 10;
	self.protection[PROT_FIRE] += 5;
	self.protection[PROT_MAGIC] += 3;
};

func void unequip_schutzring_total2()
{
	self.protection[PROT_EDGE] -= 10;
	self.protection[PROT_BLUNT] -= 10;
	self.protection[PROT_POINT] -= 10;
	self.protection[PROT_FIRE] -= 5;
	self.protection[PROT_MAGIC] -= 3;
};


instance RING_DES_GESCHICKS(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 160;
	visual = "ItMi_Ring_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ring_des_geschicks;
	on_unequip = unequip_ring_des_geschicks;
	description = "Кольцо ловкости";
	text[2] = NAME_BONUS_DEX;
	count[2] = 5;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_ring_des_geschicks()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,5);
};

func void unequip_ring_des_geschicks()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-5);
};


instance RING_DES_GESCHICKS2(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 240;
	visual = "ItMi_Ring_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ring_des_geschicks2;
	on_unequip = unequip_ring_des_geschicks2;
	description = "Кольцо ловкости";
	text[2] = NAME_BONUS_DEX;
	count[2] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_ring_des_geschicks2()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,10);
};

func void unequip_ring_des_geschicks2()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-10);
};


instance RING_DES_LEBENS(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 180;
	visual = "ItMi_Ring_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ring_des_lebens;
	on_unequip = unequip_ring_des_lebens;
	description = "Кольцо жизненной силы";
	text[2] = NAME_BONUS_HP;
	count[2] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_ring_des_lebens()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 10;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 10;
};

func void unequip_ring_des_lebens()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 10;
	if(self.attribute[ATR_HITPOINTS] > 11)
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 10;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};


instance RING_DES_LEBENS2(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 360;
	visual = "ItMi_Ring_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ring_des_lebens2;
	on_unequip = unequip_ring_des_lebens2;
	description = "Кольцо здоровья";
	text[2] = NAME_BONUS_HP;
	count[2] = 20;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_ring_des_lebens2()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 20;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 20;
};

func void unequip_ring_des_lebens2()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 20;
	if(self.attribute[ATR_HITPOINTS] > 21)
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 20;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};


instance STAERKERING(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 160;
	visual = "ItMi_Ring_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_staerkering;
	on_unequip = unequip_staerkering;
	description = "Кольцо силы";
	text[2] = NAME_BONUS_STR;
	count[2] = 5;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_staerkering()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,5);
};

func void unequip_staerkering()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-5);
};


instance STAERKERING2(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 240;
	visual = "ItMi_Ring_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_staerkering2;
	on_unequip = unequip_staerkering2;
	description = "Кольцо силы";
	text[2] = NAME_BONUS_STR;
	count[2] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_staerkering2()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,10);
};

func void unequip_staerkering2()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-10);
};


instance RING_DER_MAGIE(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 200;
	visual = "ItMi_Ring_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ring_der_magie;
	on_unequip = unequip_ring_der_magie;
	description = "Кольцо магической энергии";
	text[2] = NAME_BONUS_MANA;
	count[2] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_ring_der_magie()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 10;
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 10;
};

func void unequip_ring_der_magie()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 10;
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 10;
};


instance RING_DER_ERLEUCHTUNG(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 500;
	visual = "ItMi_Ring_03.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ring_der_erleuchtung;
	on_unequip = unequip_ring_der_erleuchtung;
	description = "Кольцо просвещения";
	text[2] = NAME_BONUS_MANA;
	count[2] = 15;
	text[3] = NAME_BONUS_HP;
	count[3] = 15;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_ring_der_erleuchtung()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 15;
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 15;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 15;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 15;
};

func void unequip_ring_der_erleuchtung()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 15;
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 15;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 15;
	if(self.attribute[ATR_HITPOINTS] > 16)
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 15;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};


instance MACHTRING(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 300;
	visual = "ItMi_Ring_03.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_machtring;
	on_unequip = unequip_machtring;
	description = "Кольцо силы";
	text[2] = NAME_BONUS_STR;
	count[2] = 4;
	text[3] = NAME_BONUS_DEX;
	count[3] = 4;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_machtring()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,4);
	Npc_ChangeAttribute(self,ATR_DEXTERITY,4);
};

func void unequip_machtring()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-4);
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-4);
};

