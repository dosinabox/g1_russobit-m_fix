
instance OVERLAYHUMAN(C_NPC)
{
	name[0] = "OverlayHuman";
	guild = GIL_BAU;
	level = 10;
	voice = 11;
	id = 3001;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 18;
	attribute[ATR_HITPOINTS] = 18;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald",DEFAULT,DEFAULT,-1);
	Mdl_ApplyOverlayMds(self,"Humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_1hST2.mds");
	Mdl_ApplyOverlayMds(self,"Humans_2hST1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"Humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_BowT2.mds");
	Mdl_ApplyOverlayMds(self,"Humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_CBowT2.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Acrobatic.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_ApplyOverlayMds(self,"Humans_drunken.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Swim.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Sprint.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Torch.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Flee.mds");
};

instance OVERLAYORC(C_NPC)
{
	name[0] = "���-���������";
	guild = GIL_ORCWARRIOR;
	level = 4;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 0;
	attribute[ATR_HITPOINTS_MAX] = 20;
	attribute[ATR_HITPOINTS] = 20;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	Mdl_SetVisual(self,"orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"Orc_Head",DEFAULT,DEFAULT,-1);
	Mdl_ApplyOverlayMds(self,"Orc_Drunken.mds");
	Mdl_ApplyOverlayMds(self,"Orc_Torch.mds");
};

instance BABE_ROCKEFELLER(NPC_DEFAULT)
{
	name[0] = "����-���������";
	guild = GIL_BAB;
	level = 1;
	voice = 16;
	id = 110;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 6;
	attribute[ATR_DEXTERITY] = 8;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	Mdl_SetVisual(self,"Babe.MDS");
	Mdl_SetVisualBody(self,"Bab_body_Naked0",0,1,"Bab_Head_Hair1",0,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItem(self,bab_armor_nude);
	CreateInvItem(self,bab_armor_bikini);
	CreateInvItem(self,itmibrush);
	CreateInvItem(self,itmiwedel);
	CreateInvItems(self,itfo_mutton_01,20);
	CreateInvItems(self,itfoapple,5);
	CreateInvItems(self,itfoloaf,5);
	CreateInvItems(self,itfomutton,20);
	CreateInvItems(self,itfocheese,5);
	CreateInvItems(self,itforice,5);
	CreateInvItems(self,itfosoup,5);
	CreateInvItems(self,itfomeatbugragout,5);
	CreateInvItems(self,itfocrawlersoup,5);
	CreateInvItems(self,itfobooze,10);
	CreateInvItems(self,itfowine,5);
	CreateInvItems(self,itfo_wineberrys_01,5);
	CreateInvItems(self,itfobeer,5);
	CreateInvItem(self,itmilute);
};

instance L5(NPC_DEFAULT)
{
	name[0] = "l5";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 5;
	voice = 15;
	id = 0;
	exp = 7500;
	exp_next = 10500;
	lp = 90;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 5;
	attribute[ATR_MANA] = 5;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,sfb_armor_l);
	start_aistate = zs_firespit;
	CreateInvItem(self,vlk_armor_l);
	CreateInvItem(self,vlk_armor_m);
	CreateInvItem(self,sfb_armor_l);
	CreateInvItem(self,nov_armor_l);
	EquipItem(self,itmw_1h_sword_short_05);
	EquipItem(self,itrw_bow_small_01);
	CreateInvItem(self,itmw_1h_club_01);
	CreateInvItem(self,itmw_1h_poker_01);
	CreateInvItem(self,itmw_1h_sickle_01);
	CreateInvItem(self,itmw_1h_mace_light_01);
	CreateInvItem(self,itmw_1h_hatchet_01);
	CreateInvItem(self,itmw_1h_sword_old_01);
	CreateInvItem(self,itmw_1h_nailmace_01);
	CreateInvItem(self,itmw_1h_sword_short_01);
	CreateInvItem(self,itmw_1h_sword_short_02);
	CreateInvItem(self,itmw_1h_sword_short_03);
	CreateInvItem(self,itmw_1h_sword_short_04);
	CreateInvItem(self,itmw_1h_axe_old_01);
	CreateInvItem(self,itmw_1h_scythe_01);
	CreateInvItem(self,itmw_2h_staff_01);
	CreateInvItem(self,itmw_2h_staff_02);
	CreateInvItem(self,itmw_2h_staff_03);
	CreateInvItem(self,itmw_1h_mace_01);
	CreateInvItem(self,itmw_1h_mace_02);
	CreateInvItem(self,itrw_bow_small_02);
	CreateInvItem(self,itrw_bow_small_03);
	CreateInvItem(self,itrw_bow_small_04);
	CreateInvItems(self,itamarrow,50);
	CreateInvItems(self,itminugget,200);
	CreateInvItems(self,itkelockpick,10);
	CreateInvItems(self,itlstorch,20);
};

instance L10(NPC_DEFAULT)
{
	name[0] = "L10";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 10;
	voice = 15;
	id = 0;
	exp = 27500;
	exp_next = 33000;
	lp = 165;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 5;
	attribute[ATR_MANA] = 5;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
	CreateInvItem(self,stt_armor_m);
	CreateInvItem(self,stt_armor_h);
	CreateInvItem(self,org_armor_l);
	CreateInvItem(self,org_armor_m);
	CreateInvItem(self,nov_armor_m);
	CreateInvItem(self,nov_armor_h);
	CreateInvItem(self,itmw_1h_mace_03);
	CreateInvItem(self,itmw_1h_mace_04);
	CreateInvItem(self,itmw_1h_sword_01);
	CreateInvItem(self,itmw_1h_sword_02);
	CreateInvItem(self,itmw_1h_sword_03);
	CreateInvItem(self,itmw_1h_sword_04);
	CreateInvItem(self,itmw_1h_sword_05);
	CreateInvItem(self,itmw_1h_mace_war_01);
	CreateInvItem(self,itmw_1h_mace_war_02);
	CreateInvItem(self,itmw_1h_mace_war_03);
	CreateInvItem(self,itmw_1h_mace_war_04);
	CreateInvItem(self,itmw_1h_sword_long_01);
	CreateInvItem(self,itrw_bow_small_05);
	CreateInvItem(self,itrw_bow_long_01);
	CreateInvItem(self,itrw_bow_long_02);
	CreateInvItems(self,itamarrow,100);
	CreateInvItems(self,itminugget,400);
	CreateInvItems(self,itkelockpick,20);
	CreateInvItems(self,itlstorch,20);
};

instance L15(NPC_DEFAULT)
{
	name[0] = "L15";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 15;
	voice = 15;
	id = 0;
	exp = 60000;
	exp_next = 68000;
	lp = 240;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 5;
	attribute[ATR_MANA] = 5;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
	CreateInvItem(self,grd_armor_l);
	CreateInvItem(self,grd_armor_m);
	CreateInvItem(self,org_armor_h);
	CreateInvItem(self,tpl_armor_l);
	CreateInvItem(self,tpl_armor_m);
	CreateInvItem(self,kdf_armor_l);
	CreateInvItem(self,kdf_armor_h);
	CreateInvItem(self,itmw_1h_sword_long_02);
	CreateInvItem(self,itmw_1h_sword_long_03);
	CreateInvItem(self,itmw_1h_sword_long_04);
	CreateInvItem(self,itmw_1h_sword_long_05);
	CreateInvItem(self,itmw_1h_warhammer_01);
	CreateInvItem(self,itmw_1h_warhammer_02);
	CreateInvItem(self,itmw_1h_warhammer_03);
	CreateInvItem(self,itmw_1h_axe_02);
	CreateInvItem(self,itmw_1h_axe_03);
	CreateInvItem(self,itmw_1h_sword_broad_01);
	CreateInvItem(self,itrw_bow_long_03);
	CreateInvItem(self,itrw_bow_long_04);
	CreateInvItem(self,itrw_bow_long_05);
	CreateInvItems(self,itamarrow,100);
	CreateInvItems(self,itminugget,400);
	CreateInvItems(self,itkelockpick,20);
	CreateInvItems(self,itlstorch,20);
};

instance L20(NPC_DEFAULT)
{
	name[0] = "L20";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 20;
	voice = 15;
	id = 0;
	exp = 105000;
	exp_next = 115500;
	lp = 315;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 5;
	attribute[ATR_MANA] = 5;
	attribute[ATR_HITPOINTS_MAX] = 280;
	attribute[ATR_HITPOINTS] = 280;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
	CreateInvItem(self,grd_armor_h);
	CreateInvItem(self,sld_armor_m);
	CreateInvItem(self,sld_armor_h);
	CreateInvItem(self,tpl_armor_h);
	CreateInvItem(self,kdw_armor_l);
	CreateInvItem(self,itmw_1h_sword_broad_02);
	CreateInvItem(self,itmw_1h_sword_broad_03);
	CreateInvItem(self,itmw_1h_sword_broad_04);
	CreateInvItem(self,itmw_2h_sword_old_01);
	CreateInvItem(self,itmw_1h_sword_bastard_01);
	CreateInvItem(self,itmw_1h_sword_bastard_02);
	CreateInvItem(self,itmw_1h_sword_bastard_03);
	CreateInvItem(self,itmw_1h_sword_bastard_04);
	CreateInvItem(self,itmw_2h_axe_old_01);
	CreateInvItem(self,itmw_2h_axe_old_02);
	CreateInvItem(self,itmw_2h_axe_old_03);
	CreateInvItem(self,itmw_2h_sword_light_01);
	CreateInvItem(self,itrw_bow_long_06);
	CreateInvItem(self,itrw_bow_long_07);
	CreateInvItem(self,itrw_bow_long_08);
	CreateInvItems(self,itamarrow,100);
	CreateInvItems(self,itminugget,400);
	CreateInvItems(self,itkelockpick,20);
	CreateInvItems(self,itlstorch,20);
};

instance L25(NPC_DEFAULT)
{
	name[0] = "L25";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 25;
	voice = 15;
	id = 0;
	exp = 162500;
	exp_next = 175500;
	lp = 390;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 5;
	attribute[ATR_MANA] = 5;
	attribute[ATR_HITPOINTS_MAX] = 340;
	attribute[ATR_HITPOINTS] = 340;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
	CreateInvItem(self,crw_armor_h);
	CreateInvItem(self,kdw_armor_h);
	CreateInvItem(self,dmb_armor_m);
	CreateInvItem(self,ore_armor_m);
	CreateInvItem(self,itmw_2h_sword_light_02);
	CreateInvItem(self,itmw_2h_sword_light_03);
	CreateInvItem(self,itmw_2h_sword_light_04);
	CreateInvItem(self,itmw_2h_sword_light_05);
	CreateInvItem(self,itmw_2h_axe_light_01);
	CreateInvItem(self,itmw_2h_axe_light_02);
	CreateInvItem(self,itmw_2h_axe_light_03);
	CreateInvItem(self,itmw_2h_sword_01);
	CreateInvItem(self,itmw_2h_sword_02);
	CreateInvItem(self,itmw_2h_sword_03);
	CreateInvItem(self,itrw_bow_long_09);
	CreateInvItem(self,itrw_bow_war_01);
	CreateInvItem(self,itrw_bow_war_02);
	CreateInvItems(self,itamarrow,100);
	CreateInvItems(self,itminugget,400);
	CreateInvItems(self,itkelockpick,20);
	CreateInvItems(self,itlstorch,20);
};

instance TESTRATTE(MST_DEFAULT_MOLERAT)
{
	name[0] = "������� ���������";
	attribute[ATR_STRENGTH] = 5;
	attribute[ATR_DEXTERITY] = 5;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	protection[PROT_BLUNT] = 8;
	protection[PROT_EDGE] = 8;
	fight_tactic = FAI_MONSTER_MASTER;
	set_molerat_visuals();
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	Npc_SetToFistMode(self);
	CreateInvItems(self,itfomuttonraw,1);
};

