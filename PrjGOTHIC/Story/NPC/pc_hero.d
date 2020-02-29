
instance PC_HERO(NPC_DEFAULT)
{
	name[0] = "Я";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 0;
	voice = 15;
	id = 0;
	exp = 0;
	exp_next = 500;
	lp = 0;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 5;
	attribute[ATR_MANA] = 5;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
	CreateInvItem(self,itwr_fire_letter_01);
};

instance PC_HERO_L2(NPC_DEFAULT)
{
	name[0] = "Я";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 2;
	voice = 15;
	id = 0;
	exp = 1500;
	exp_next = 3000;
	lp = 0;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 5;
	attribute[ATR_MANA] = 5;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,vlk_armor_l);
	EquipItem(self,herosword20);
	CreateInvItems(self,itamarrow,50);
	EquipItem(self,herosword13);
	EquipItem(self,herobow13);
};

instance PC_HERO_L5(NPC_DEFAULT)
{
	name[0] = "Я";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 5;
	voice = 15;
	id = 0;
	exp = 7500;
	exp_next = 10500;
	lp = 0;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 5;
	attribute[ATR_MANA] = 5;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
	EquipItem(self,herosword25);
	EquipItem(self,herobow13);
	CreateInvItems(self,itamarrow,50);
};

instance PC_HERO_L7(NPC_DEFAULT)
{
	name[0] = "Я";
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORG;
	level = 7;
	voice = 15;
	id = 0;
	exp = 14000;
	exp_next = 18000;
	lp = 0;
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 20;
	attribute[ATR_MANA] = 20;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,org_armor_h);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,1);
	Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_sword_05);
	EquipItem(self,itrw_bow_small_04);
	CreateInvItems(self,itamarrow,100);
	CreateInvItems(self,itminugget,50);
	CreateInvItem(self,itwrworldmap);
	CreateInvItems(self,itkelockpick,30);
	CreateInvItems(self,itlstorch,20);
	CreateInvItems(self,itfo_potion_health_03,20);
	CreateInvItems(self,itfo_potion_mana_03,20);
};

instance PC_HERO_L11(NPC_DEFAULT)
{
	name[0] = "Я";
	npctype = NPCTYPE_MAIN;
	guild = GIL_SLD;
	level = 11;
	voice = 15;
	id = 0;
	exp = 33000;
	exp_next = 39000;
	lp = 0;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 45;
	attribute[ATR_MANA_MAX] = 50;
	attribute[ATR_MANA] = 50;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,sld_armor_h);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,1);
	Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	EquipItem(self,itmw_1h_sword_long_05);
	EquipItem(self,itrw_bow_long_02);
	CreateInvItems(self,itamarrow,100);
	CreateInvItems(self,itminugget,400);
	CreateInvItems(self,itkelockpick,30);
	CreateInvItems(self,itlstorch,20);
};

instance PC_HERO_L13(NPC_DEFAULT)
{
	name[0] = "Я";
	npctype = NPCTYPE_MAIN;
	guild = GIL_SLD;
	level = 13;
	voice = 15;
	id = 0;
	exp = 45500;
	exp_next = 52500;
	lp = 0;
	attribute[ATR_STRENGTH] = 65;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 50;
	attribute[ATR_MANA] = 50;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,sld_armor_h);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKPOCKET,1);
	Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,1);
	Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	EquipItem(self,itmw_1h_sword_broad_01);
	EquipItem(self,itrw_bow_long_04);
	CreateInvItems(self,itamarrow,100);
	CreateInvItems(self,itminugget,400);
	CreateInvItems(self,itkelockpick,50);
	CreateInvItems(self,itlstorch,20);
};

instance HEROSWORD13(C_ITEM)
{
	name = "worn out sword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 27;
	damage[DAM_INDEX_BARRIER] = 13;
	damagetype = DAM_EDGE;
	range = 100;
	visual = "ItMw1hSwordold01.3DS";
};

instance HEROSWORD20(C_ITEM)
{
	name = "sword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 31;
	damage[DAM_INDEX_BARRIER] = 20;
	damagetype = DAM_EDGE;
	range = 100;
	visual = "ItMw1hSword01.3DS";
};

instance HEROSWORD25(C_ITEM)
{
	name = "sword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 31;
	damage[DAM_INDEX_BARRIER] = 25;
	damagetype = DAM_EDGE;
	range = 100;
	visual = "ItMw1hSword01.3DS";
};

instance HEROBOW13(C_ITEM)
{
	name = "Longbow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 35;
	damage[DAM_INDEX_BARRIER] = 13;
	damagetype = DAM_POINT;
	munition = itamarrow;
	visual = "ItRwLongbow.mms";
};

instance XP_MAP(C_ITEM)
{
	name = "XP Map";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 1000;
	visual = "ItWr_Map_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_xp_map;
};


func void use_xp_map()
{
	CreateInvItems(self,itminugget,1000);
	hero.lp = hero.lp + 20;
	PrintScreen("+1000 кусков руды",-1,40,"font_10_book.tga",10);
};

