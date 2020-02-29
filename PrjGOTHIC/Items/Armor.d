
//const int ARMOR_VALUE_MULTIPLIER = 30;
const int ARMOR_VALUE_MULTIPLIER = 6;
const int ARMOR_VALUE_DECREASE = 5;
const int VALUE_TPL_ARMOR_L = 1350;
const int VALUE_TPL_ARMOR_M = 1650;
const int VALUE_TPL_ARMOR_H = 2100;
const int VALUE_STT_ARMOR_M = 750;
const int VALUE_STT_ARMOR_H = 1200;
const int VALUE_GRD_ARMOR_L = 1350;
const int VALUE_GRD_ARMOR_M = 1650;
const int VALUE_GRD_ARMOR_H = 3000;
const int VALUE_KDF_ARMOR_L = 1200;
const int VALUE_KDF_ARMOR_H = 1500;
const int VALUE_KDW_ARMOR_L = 1950;
const int VALUE_KDW_ARMOR_H = 2600;
const int VALUE_ORG_ARMOR_L = 750;
const int VALUE_ORG_ARMOR_M = 1050;
const int VALUE_ORG_ARMOR_H = 1200;
const int VALUE_SLD_ARMOR_L = 1350;
const int VALUE_SLD_ARMOR_M = 1650;
const int VALUE_SLD_ARMOR_H = 2600;
const int VALUE_NOV_ARMOR_L = 500;
const int VALUE_NOV_ARMOR_M = 750;
const int VALUE_NOV_ARMOR_H = 1200;
const int VALUE_VLK_ARMOR_L = 250;
const int VALUE_VLK_ARMOR_M = 500;
const int VALUE_SFB_ARMOR_L = 250;

func void initplayerbody(var int equipment)
{
	var C_ITEM armor;
	if(equipment == 0)
	{
		Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
	}
	else if(equipment == 1)
	{
		Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Pony",9,0,-1);
	}
	else if(equipment == 3)
	{
		if(RUSSOBITMFIXV11 == FALSE && Npc_KnowsInfo(hero,info_diego_gamestart)) 
		{
			PrintScreen("Загруженное сохранение не поддерживается!",-1,43,"font_old_10_white.tga",5);
			PrintScreen("Пожалуйста, начните новую игру.",-1,40,"font_old_10_white.tga",5);
			//Mdl_SetVisualBody(hero,"hum_body_Naked0",0,0,"Hum_Head_FatBald",100,0,-1);
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - hero.attribute[ATR_HITPOINTS] + 10;
		}
		else if(Npc_HasEquippedArmor(hero))
		{
			armor = Npc_GetEquippedArmor(hero);
			if((Hlp_GetInstanceID(armor) == Hlp_GetInstanceID(nov_armor_l)) || (Hlp_GetInstanceID(armor) == Hlp_GetInstanceID(nov_armor_m)) || (Hlp_GetInstanceID(armor) == Hlp_GetInstanceID(nov_armor_h)))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",0,1,"Hum_Head_Pony",9,0,-1);
			}
			else if((Hlp_GetInstanceID(armor) == Hlp_GetInstanceID(tpl_armor_l)) || (Hlp_GetInstanceID(armor) == Hlp_GetInstanceID(tpl_armor_m)) || (Hlp_GetInstanceID(armor) == Hlp_GetInstanceID(tpl_armor_h)))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",0,1,"Hum_Head_Pony",9,0,-1);
			}
			else if((Hlp_GetInstanceID(armor) == Hlp_GetInstanceID(stt_armor_m)) || (Hlp_GetInstanceID(armor) == Hlp_GetInstanceID(stt_armor_h)) || (Hlp_GetInstanceID(armor) == Hlp_GetInstanceID(grd_armor_l)))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",0,1,"Hum_Head_Pony",9,0,-1);
			}
			else if(Hlp_GetInstanceID(armor) == Hlp_GetInstanceID(sld_armor_l))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",0,5,"Hum_Head_Pony",11,0,-1);
			};
		};
	};
};

func void equip_psi_armor()
{
	if(self.id == 0)
	{
		AI_PlayAni(self,"T_PLUNDER");
		Snd_Play("BACKPACK_HANDLE");
		initplayerbody(1);
	};
};

func void equip_psi_armor2()
{
	if(self.id == 0)
	{
		AI_PlayAni(self,"T_PLUNDER");
		Snd_Play("BACKPACK_APPLY");
		initplayerbody(1);
	};
};

func void equip_sld_armor()
{
	if(self.id == 0)
	{
		AI_PlayAni(self,"T_PLUNDER");
		Snd_Play("BACKPACK_HANDLE");
		Mdl_SetVisualBody(self,"hum_body_Naked0",0,5,"Hum_Head_Pony",11,0,-1);
	};
};

func void unequip_psi_armor()
{
	if(self.id == 0)
	{
		initplayerbody(0);
	};
};

func void equip_simple_armor()
{
	if(self.id == 0)
	{
		AI_PlayAni(self,"T_PLUNDER");
		Snd_Play("BACKPACK_HANDLE");
	};
};

func void equip_metal_armor()
{
	if(self.id == 0)
	{
		AI_PlayAni(self,"T_PLUNDER");
		Snd_Play("BACKPACK_APPLY");
	};
};

instance VLK_ARMOR_L(C_ITEM)
{
	name = "Простые штаны рудокопа";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	value = value_vlk_armor_l / armor_value_decrease;
	wear = WEAR_TORSO;
	visual = "vlkl.3ds";
	visual_change = "Hum_VLKL_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance VLK_ARMOR_M(C_ITEM)
{
	name = "Штаны рудокопа";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	value = value_vlk_armor_m / armor_value_decrease;
	wear = WEAR_TORSO;
	visual = "vlkm.3ds";
	visual_change = "Hum_VLKM_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance STT_ARMOR_M(C_ITEM)
{
	name = "Одежда Призрака";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 0;
	value = value_stt_armor_m / armor_value_decrease;
	wear = WEAR_TORSO;
	visual = "sttm.3ds";
	visual_change = "Hum_STTM_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_psi_armor;
	on_unequip = unequip_psi_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance STT_ARMOR_H(C_ITEM)
{
	name = "Доспех Призрака";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 0;
	value = value_stt_armor_h / armor_value_decrease;
	wear = WEAR_TORSO;
	visual = "stth.3ds";
	visual_change = "Hum_STTS_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_psi_armor;
	on_unequip = unequip_psi_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance GRD_ARMOR_L(C_ITEM)
{
	name = "Легкий доспех стражника";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 45;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 0;
	value = value_grd_armor_l / armor_value_decrease;
	wear = WEAR_TORSO;
	visual = "grdl.3ds";
	visual_change = "Hum_GRDL_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_psi_armor;
	on_unequip = unequip_psi_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance GRD_ARMOR_M(C_ITEM)
{
	name = "Доспех стражника";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 0;
	value = value_grd_armor_m / armor_value_decrease;
	wear = WEAR_TORSO;
	visual = "grdm.3ds";
	visual_change = "Hum_GRDM_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance GRD_ARMOR_H(C_ITEM)
{
	name = "Тяжелый доспех стражника";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 35;
	protection[PROT_MAGIC] = 0;
	value = value_grd_armor_h / armor_value_decrease;
	wear = WEAR_TORSO;
	visual = "grdh.3ds";
	visual_change = "Hum_GRDS_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_metal_armor;
	material = MAT_METAL;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance EBR_ARMOR_M(C_ITEM)
{
	name = "Дорогая одежда";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 72;
	protection[PROT_BLUNT] = 72;
	protection[PROT_POINT] = 7;
	protection[PROT_FIRE] = 36;
	protection[PROT_MAGIC] = 3;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	wear = WEAR_TORSO;
	ownerguild = GIL_EBR;
	visual = "ebrm.3ds";
	visual_change = "Hum_EBRM_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance EBR_ARMOR_H(C_ITEM)
{
	name = "Доспех Гомеза";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 85;
	protection[PROT_BLUNT] = 85;
	protection[PROT_POINT] = 9;
	protection[PROT_FIRE] = 42;
	protection[PROT_MAGIC] = 3;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	wear = WEAR_TORSO;
	ownerguild = GIL_EBR;
	owner = ebr_100_gomez;
	visual = "ebrh.3ds";
	visual_change = "Hum_EBRS_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_metal_armor;
	material = MAT_METAL;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance EBR_ARMOR_H2(C_ITEM)
{
	name = "Тяжелый доспех Барона";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 62;
	protection[PROT_BLUNT] = 62;
	protection[PROT_POINT] = 6;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 0;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	wear = WEAR_TORSO;
	visual = "ebrh2.3ds";
	visual_change = "Hum_EBRS_ARMOR2.asc";
	visual_skin = 0;
	on_equip = equip_metal_armor;
	material = MAT_METAL;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance SFB_ARMOR_L(C_ITEM)
{
	name = "Одежда рудокопа";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	value = value_sfb_armor_l / armor_value_decrease;
	wear = WEAR_TORSO;
	visual = "sfbl.3ds";
	visual_change = "Hum_SFBL_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ORG_ARMOR_L(C_ITEM)
{
	name = "Легкий доспех вора";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 0;
	value = value_org_armor_l / armor_value_decrease;
	wear = WEAR_TORSO;
	visual = "orgl2.3ds";
	visual_change = "Hum_ORGL_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ORG_ARMOR_M(C_ITEM)
{
	name = "Средний доспех вора";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 35;
	protection[PROT_BLUNT] = 35;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 0;
	value = value_org_armor_m / armor_value_decrease;
	wear = WEAR_TORSO;
	visual = "orgm.3ds";
	visual_change = "Hum_ORGM_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ORG_ARMOR_H(C_ITEM)
{
	name = "Тяжелый доспех вора";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 0;
	value = value_org_armor_h / armor_value_decrease;
	wear = WEAR_TORSO;
	visual = "orgh.3ds";
	visual_change = "Hum_ORGS_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_metal_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance SLD_ARMOR_L(C_ITEM)
{
	name = "Легкий доспех наемника";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 45;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 0;
	value = value_sld_armor_l / armor_value_decrease;
	wear = WEAR_TORSO;
	visual = "sldl.3ds";
	visual_change = "Hum_SLDL_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_sld_armor;
	on_unequip = unequip_psi_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance SLD_ARMOR_M(C_ITEM)
{
	name = "Доспех наемника";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 0;
	value = value_sld_armor_m / armor_value_decrease;
	wear = WEAR_TORSO;
	visual = "sldm.3ds";
	visual_change = "Hum_SLDM_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance SLD_ARMOR_H(C_ITEM)
{
	name = "Тяжелый доспех наемника";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 35;
	protection[PROT_MAGIC] = 0;
	value = value_sld_armor_h / armor_value_decrease;
	wear = WEAR_TORSO;
	visual = "sldh.3ds";
	visual_change = "Hum_SLDS_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_metal_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance NOV_ARMOR_L(C_ITEM)
{
	name = "Одежда послушника";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 0;
	value = value_nov_armor_l / armor_value_decrease;
	wear = WEAR_TORSO;
	visual = "novl.3ds";
	visual_change = "Hum_NOVL_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_psi_armor;
	on_unequip = unequip_psi_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance NOV_ARMOR_M(C_ITEM)
{
	name = "Легкий доспех послушника";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 0;
	wear = WEAR_TORSO;
	value = value_nov_armor_m / armor_value_decrease;
	visual = "novm2.3ds";
	visual_change = "Hum_NOVM_ARMOR.asc";
	visual_skin = 1;
	on_equip = equip_psi_armor;
	on_unequip = unequip_psi_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance NOV_ARMOR_H(C_ITEM)
{
	name = "Доспех послушника";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 0;
	value = value_nov_armor_h / armor_value_decrease;
	wear = WEAR_TORSO;
	visual = "novh2.3ds";
	visual_change = "Hum_NOVS_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_psi_armor;
	on_unequip = unequip_psi_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance TPL_ARMOR_L(C_ITEM)
{
	name = "Легкий доспех Стража";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 45;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 0;
	value = value_tpl_armor_l / armor_value_decrease;
	wear = WEAR_TORSO;
	visual = "tpll.3ds";
	visual_change = "Hum_TPLL_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_psi_armor;
	on_unequip = unequip_psi_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance TPL_ARMOR_M(C_ITEM)
{
	name = "Доспех Стража";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 0;
	value = value_tpl_armor_m / armor_value_decrease;
	wear = WEAR_TORSO;
	visual = "tplm.3ds";
	visual_change = "Hum_TPLM_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_psi_armor;
	on_unequip = unequip_psi_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance TPL_ARMOR_H(C_ITEM)
{
	name = "Тяжелый доспех Стража";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 35;
	protection[PROT_MAGIC] = 0;
	value = value_tpl_armor_h / armor_value_decrease;
	wear = WEAR_TORSO;
	visual = "tplh.3ds";
	visual_change = "Hum_TPLS_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_psi_armor2;
	on_unequip = unequip_psi_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance GUR_ARMOR_M(C_ITEM)
{
	name = "Одеяние Гуру";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 71;
	protection[PROT_BLUNT] = 71;
	protection[PROT_POINT] = 7;
	protection[PROT_FIRE] = 35;
	protection[PROT_MAGIC] = 3;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	wear = WEAR_TORSO;
	ownerguild = GIL_GUR;
	visual = "gurm.3ds";
	visual_change = "Hum_GURM_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance GUR_ARMOR_H(C_ITEM)
{
	name = "Одеяние верховного Гуру";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 82;
	protection[PROT_BLUNT] = 82;
	protection[PROT_POINT] = 8;
	protection[PROT_FIRE] = 41;
	protection[PROT_MAGIC] = 4;
	wear = WEAR_TORSO;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	ownerguild = GIL_GUR;
	visual = "gurh.3ds";
	visual_change = "Hum_GURS_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance KDF_ARMOR_L(C_ITEM)
{
	name = "Мантия мага Огня";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 5;
	wear = WEAR_TORSO;
	value = value_kdf_armor_l / armor_value_decrease;
	visual = "kdfl.3ds";
	visual_change = "Hum_KDFL_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance KDF_ARMOR_H(C_ITEM)
{
	name = "Великая мантия мага Огня";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 10;
	wear = WEAR_TORSO;
	value = value_kdf_armor_h / armor_value_decrease;
	visual = "kdfh.3ds";
	visual_change = "Hum_KDFS_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance KDW_ARMOR_L(C_ITEM)
{
	name = "Мантия мага Воды";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 65;
	protection[PROT_BLUNT] = 65;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 15;
	value = value_kdw_armor_l / armor_value_decrease;
	wear = WEAR_TORSO;
	visual = "kdwl.3ds";
	visual_change = "Hum_KDWL_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance KDW_ARMOR_H(C_ITEM)
{
	name = "Великая мантия мага Воды";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 45;
	protection[PROT_MAGIC] = 20;
	wear = WEAR_TORSO;
	value = value_kdw_armor_h / armor_value_decrease;
	visual = "kdwh.3ds";
	visual_change = "Hum_KDWS_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance DMB_ARMOR_M(C_ITEM)
{
	name = "Мантия темного искусства";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 90;
	protection[PROT_BLUNT] = 90;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 60;
	protection[PROT_MAGIC] = 30;
	wear = WEAR_TORSO;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	ownerguild = GIL_DMB;
	visual = "dmbm.3ds";
	visual_change = "Hum_DMBM_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance CRW_ARMOR_H(C_ITEM)
{
	name = "Доспех из панцирных пластин";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 80;
	protection[PROT_BLUNT] = 80;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 5;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	wear = WEAR_TORSO;
	visual = "crws.3ds";
	visual_change = "Hum_CRAWLER_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_metal_armor;
	material = MAT_WOOD;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ORE_ARMOR_M(C_ITEM)
{
	name = "Древний железный доспех";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 95;
	protection[PROT_BLUNT] = 95;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 10;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER * 2;
	wear = WEAR_TORSO;
	visual = "magie.3ds";
	visual_change = "Hum_MAGIE_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_metal_armor;
	material = MAT_WOOD;
	description = name;
	text[0] = "Полностью выкован из магической руды.";
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ORE_ARMOR_H(C_ITEM)
{
	name = "Улучшенный железный доспех";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 45;
	protection[PROT_MAGIC] = 15;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER * 2;
	wear = WEAR_TORSO;
	visual = "magie.3ds";
	visual_change = "Hum_MAGIE_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_metal_armor;
	material = MAT_WOOD;
	description = name;
	text[0] = "Кузнец Стоун смог улучшить этот древний доспех!";
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance LAW_ARMOR(C_ITEM)
{
	name = "Одеяние судьи";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 2;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 0;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	wear = WEAR_TORSO;
	ownerguild = GIL_DMB;
	visual = "lawm.3ds";
	visual_change = "Hum_LAW_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance GRD_ARMOR_I(C_ITEM)
{
	name = "Доспех гвардейца";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 1;
	protection[PROT_FIRE] = 3;
	protection[PROT_MAGIC] = 0;
	value = 100;
	wear = WEAR_TORSO;
	visual = "grdi.3ds";
	visual_change = "Hum_GRDI_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[0] = "Очень старый и изношенный.";
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance BAB_ARMOR_NUDE(C_ITEM)
{
	name = "Обнаженная девица";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	value = 1;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	wear = WEAR_TORSO;
	visual = "vobbox.3ds";
	visual_change = "Bab_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
};

instance BAB_ARMOR_BIKINI(C_ITEM)
{
	name = "Девица в бикини";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	value = 1;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	wear = WEAR_TORSO;
	visual = "vobbox.3ds";
	visual_change = "Bab_ARMOR.asc";
	visual_skin = 1;
	material = MAT_LEATHER;
};

instance ZOM_ARMOR(C_ITEM)
{
	name = "Доспех зомби";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = 20;
	wear = WEAR_TORSO;
	visual = "ebrh.3ds";
	visual_change = "Hum_EBRS_ARMOR.asc";
	visual_skin = 2;
	material = MAT_LEATHER;
	description = name;
	text[1] = "Очень старый и изношенный доспех.";
	text[2] = "Когда-то его носил один из Баронов.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ORG2N(C_ITEM)
{
	name = "Легкий доспех грабителя";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 18;
	protection[PROT_BLUNT] = 18;
	protection[PROT_POINT] = 3;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 0;
	value = 100;
	wear = WEAR_TORSO;
	visual = "org2l.3ds";
	visual_change = "Hum_ORGL_ARMOR.asc";
	visual_skin = 1;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ORG2L(C_ITEM)
{
	name = "Доспех грабителя";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 32;
	protection[PROT_BLUNT] = 32;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 0;
	value = 150;
	wear = WEAR_TORSO;
	visual = "org2l.3ds";
	visual_change = "Hum_ORGL_ARMOR.asc";
	visual_skin = 1;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ORG2M(C_ITEM)
{
	name = "Доспех Квентина";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 0;
	value = value_org_armor_m;
	wear = WEAR_TORSO;
	visual = "orgm.3ds";
	visual_change = "Hum_ORGM_ARMOR.asc";
	visual_skin = 1;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

