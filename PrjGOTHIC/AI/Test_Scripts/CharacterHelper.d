
instance CH(NPC_DEFAULT)
{
	name[0] = "Помощник по персонажу";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 10;
	voice = 15;
	id = 0;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,ebr_armor_m);
	start_aistate = zs_ch_hangaround;
};


func void zs_ch_hangaround()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_CH_Hangaround");
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_assesssc);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
};

func void zs_ch_hangaround_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_CH_Hangaround_Loop");
};

func void zs_ch_hangaround_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_CH_Hangaround_End");
};

func void b_setheroexp()
{
	var string attributes;
	hero.exp = 250 * (hero.level + 1) * hero.level;
	hero.exp_next = 250 * (hero.level + 2) * (hero.level + 1);
	hero.lp = hero.level * LP_PER_LEVEL;
	attributes = "Новый уровень: Очки обучения:";
	attributes = ConcatStrings(attributes,IntToString(hero.lp));
	attributes = ConcatStrings(attributes,"Жизн.сила:");
	attributes = ConcatStrings(attributes,IntToString(hero.attribute[ATR_HITPOINTS_MAX]));
	PrintScreen(attributes,-1,-1,"font_old_20_white.tga",3);
	Snd_Play("LEVELUP");
};

func void b_setheroequipment()
{
	printdebugnpc(PD_ZS_CHECK,"B_SetHeroEquipment");
	CreateInvItems(hero,itamarrow,100);
	CreateInvItems(hero,itambolt,100);
	CreateInvItems(hero,itlstorch,30);
	CreateInvItems(hero,itminugget,1000);
	CreateInvItems(hero,itfo_potion_health_03,10);
	CreateInvItems(hero,itfo_potion_mana_03,10);
	CreateInvItems(hero,itfo_potion_haste_03,10);
	CreateInvItems(hero,itkelockpick,30);
	CreateInvItems(hero,itwrworldmap,1);
};

func void b_setheroattributes(var int selection,var int increase,var int lp_cost)
{
	var string attributes;
	if(hero.lp >= lp_cost)
	{
		hero.lp = hero.lp - lp_cost;
		Npc_ChangeAttribute(hero,selection,increase);
		attributes = "Очки обучения:";
		attributes = ConcatStrings(attributes,IntToString(hero.lp));
		attributes = ConcatStrings(attributes,"Сила:");
		attributes = ConcatStrings(attributes,IntToString(hero.attribute[ATR_STRENGTH]));
		attributes = ConcatStrings(attributes,"Ловкость:");
		attributes = ConcatStrings(attributes,IntToString(hero.attribute[ATR_DEXTERITY]));
		attributes = ConcatStrings(attributes,"Маг. сила:");
		attributes = ConcatStrings(attributes,IntToString(hero.attribute[ATR_MANA_MAX]));
		PrintScreen(attributes,-1,-1,"font_old_20_white.tga",3);
	}
	else
	{
		PrintScreen("Недостаточно очков опыта!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		b_say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void b_setheroweapon()
{
	if(hero.level <= 5)
	{
		CreateInvItem(hero,itmw_1h_mace_02);
		CreateInvItem(hero,itrw_bow_small_04);
	}
	else if(hero.level <= 10)
	{
		CreateInvItem(hero,itmw_1h_sword_long_01);
		CreateInvItem(hero,itrw_bow_long_02);
	}
	else if(hero.level <= 15)
	{
		CreateInvItem(hero,itmw_1h_sword_broad_01);
		CreateInvItem(hero,itrw_bow_long_05);
	}
	else if(hero.level <= 20)
	{
		CreateInvItem(hero,itmw_2h_sword_light_01);
		CreateInvItem(hero,itmw_1h_sword_broad_04);
		CreateInvItem(hero,itrw_bow_long_08);
	}
	else if(hero.level <= 25)
	{
		CreateInvItem(hero,itmw_2h_sword_03);
		CreateInvItem(hero,itmw_1h_sword_broad_04);
		CreateInvItem(hero,itrw_bow_war_02);
	}
	else if(hero.level <= 30)
	{
		CreateInvItem(hero,itmw_2h_axe_heavy_04);
		CreateInvItem(hero,itmw_1h_sword_broad_04);
		CreateInvItem(hero,itrw_bow_war_05);
	};
	AI_EquipBestMeleeWeapon(hero);
	AI_EquipBestRangedWeapon(hero);
	b_setheroequipment();
};


instance CH_EXIT(C_INFO)
{
	npc = ch;
	nr = 999;
	condition = ch_exit_condition;
	information = ch_exit_info;
	important = 0;
	permanent = 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};


func int ch_exit_condition()
{
	return 1;
};

func void ch_exit_info()
{
	AI_StopProcessInfos(self);
};

func void ch_level_back()
{
	Info_ClearChoices(ch_level);
};


instance CH_LEVEL(C_INFO)
{
	npc = ch;
	condition = ch_level_condition;
	information = ch_level_info;
	important = 0;
	permanent = 1;
	description = "Назначь уровень!";
};


func int ch_level_condition()
{
	if(hero.level == 0)
	{
		return TRUE;
	};
};

func void ch_level_info()
{
	Info_ClearChoices(ch_level);
	Info_AddChoice(ch_level,"НАЗАД",ch_level_back);
	Info_AddChoice(ch_level,"Уровень 1 - 5",ch_level1);
	Info_AddChoice(ch_level,"Уровень 6 - 10",ch_level6);
	Info_AddChoice(ch_level,"Уровень 11 - 15",ch_level11);
	Info_AddChoice(ch_level,"Уровень 16 - 20",ch_level16);
	Info_AddChoice(ch_level,"Уровень 21 - 25",ch_level21);
	Info_AddChoice(ch_level,"Уровень 26 - 30",ch_level26);
};

func void ch_level26()
{
	Info_ClearChoices(ch_level);
	Info_AddChoice(ch_level,"НАЗАД",ch_level_back);
	Info_AddChoice(ch_level,"Уровень 26",ch_level_26);
	Info_AddChoice(ch_level,"Уровень 27",ch_level_27);
	Info_AddChoice(ch_level,"Уровень 28",ch_level_28);
	Info_AddChoice(ch_level,"Уровень 29",ch_level_29);
	Info_AddChoice(ch_level,"Уровень 30",ch_level_30);
};

func void ch_level21()
{
	Info_ClearChoices(ch_level);
	Info_AddChoice(ch_level,"НАЗАД",ch_level_back);
	Info_AddChoice(ch_level,"Уровень 21",ch_level_21);
	Info_AddChoice(ch_level,"Уровень 22",ch_level_22);
	Info_AddChoice(ch_level,"Уровень 23",ch_level_23);
	Info_AddChoice(ch_level,"Уровень 24",ch_level_24);
	Info_AddChoice(ch_level,"Уровень 25",ch_level_25);
};

func void ch_level16()
{
	Info_ClearChoices(ch_level);
	Info_AddChoice(ch_level,"НАЗАД",ch_level_back);
	Info_AddChoice(ch_level,"Уровень 16",ch_level_16);
	Info_AddChoice(ch_level,"Уровень 17",ch_level_17);
	Info_AddChoice(ch_level,"Уровень 18",ch_level_18);
	Info_AddChoice(ch_level,"Уровень 19",ch_level_19);
	Info_AddChoice(ch_level,"Уровень 20",ch_level_20);
};

func void ch_level11()
{
	Info_ClearChoices(ch_level);
	Info_AddChoice(ch_level,"НАЗАД",ch_level_back);
	Info_AddChoice(ch_level,"Уровень 11",ch_level_11);
	Info_AddChoice(ch_level,"Уровень 12",ch_level_12);
	Info_AddChoice(ch_level,"Уровень 13",ch_level_13);
	Info_AddChoice(ch_level,"Уровень 14",ch_level_14);
	Info_AddChoice(ch_level,"Уровень 15",ch_level_15);
};

func void ch_level6()
{
	Info_ClearChoices(ch_level);
	Info_AddChoice(ch_level,"НАЗАД",ch_level_back);
	Info_AddChoice(ch_level,"Уровень 6",ch_level_6);
	Info_AddChoice(ch_level,"Уровень 7",ch_level_7);
	Info_AddChoice(ch_level,"Уровень 8",ch_level_8);
	Info_AddChoice(ch_level,"Уровень 9",ch_level_9);
	Info_AddChoice(ch_level,"Уровень 10",ch_level_10);
};

func void ch_level1()
{
	Info_ClearChoices(ch_level);
	Info_AddChoice(ch_level,"НАЗАД",ch_level_back);
	Info_AddChoice(ch_level,"Уровень 1",ch_level_1);
	Info_AddChoice(ch_level,"Уровень 2",ch_level_2);
	Info_AddChoice(ch_level,"Уровень 3",ch_level_3);
	Info_AddChoice(ch_level,"Уровень 4",ch_level_4);
	Info_AddChoice(ch_level,"Уровень 5",ch_level_5);
};

func void ch_level_1()
{
	Info_ClearChoices(ch_level);
	hero.level = 1;
	hero.attribute[ATR_HITPOINTS_MAX] = 52;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_2()
{
	Info_ClearChoices(ch_level);
	hero.level = 2;
	hero.attribute[ATR_HITPOINTS_MAX] = 64;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_3()
{
	Info_ClearChoices(ch_level);
	hero.level = 3;
	hero.attribute[ATR_HITPOINTS_MAX] = 76;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_4()
{
	Info_ClearChoices(ch_level);
	hero.level = 4;
	hero.attribute[ATR_HITPOINTS_MAX] = 88;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_5()
{
	Info_ClearChoices(ch_level);
	hero.level = 5;
	hero.attribute[ATR_HITPOINTS_MAX] = 100;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_6()
{
	Info_ClearChoices(ch_level);
	hero.level = 6;
	hero.attribute[ATR_HITPOINTS_MAX] = 112;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_7()
{
	Info_ClearChoices(ch_level);
	hero.level = 7;
	hero.attribute[ATR_HITPOINTS_MAX] = 124;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_8()
{
	Info_ClearChoices(ch_level);
	hero.level = 8;
	hero.attribute[ATR_HITPOINTS_MAX] = 136;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_9()
{
	Info_ClearChoices(ch_level);
	hero.level = 9;
	hero.attribute[ATR_HITPOINTS_MAX] = 148;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_10()
{
	Info_ClearChoices(ch_level);
	hero.level = 10;
	hero.attribute[ATR_HITPOINTS_MAX] = 160;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_11()
{
	Info_ClearChoices(ch_level);
	hero.level = 11;
	hero.attribute[ATR_HITPOINTS_MAX] = 172;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_12()
{
	Info_ClearChoices(ch_level);
	hero.level = 12;
	hero.attribute[ATR_HITPOINTS_MAX] = 184;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_13()
{
	Info_ClearChoices(ch_level);
	hero.level = 13;
	hero.attribute[ATR_HITPOINTS_MAX] = 196;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_14()
{
	Info_ClearChoices(ch_level);
	hero.level = 14;
	hero.attribute[ATR_HITPOINTS_MAX] = 208;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_15()
{
	Info_ClearChoices(ch_level);
	hero.level = 15;
	hero.attribute[ATR_HITPOINTS_MAX] = 220;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_16()
{
	Info_ClearChoices(ch_level);
	hero.level = 16;
	hero.attribute[ATR_HITPOINTS_MAX] = 232;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_17()
{
	Info_ClearChoices(ch_level);
	hero.level = 17;
	hero.attribute[ATR_HITPOINTS_MAX] = 244;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_18()
{
	Info_ClearChoices(ch_level);
	hero.level = 18;
	hero.attribute[ATR_HITPOINTS_MAX] = 256;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_19()
{
	Info_ClearChoices(ch_level);
	hero.level = 19;
	hero.attribute[ATR_HITPOINTS_MAX] = 268;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_20()
{
	Info_ClearChoices(ch_level);
	hero.level = 20;
	hero.attribute[ATR_HITPOINTS_MAX] = 280;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_21()
{
	Info_ClearChoices(ch_level);
	hero.level = 21;
	hero.attribute[ATR_HITPOINTS_MAX] = 292;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_22()
{
	Info_ClearChoices(ch_level);
	hero.level = 22;
	hero.attribute[ATR_HITPOINTS_MAX] = 304;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_23()
{
	Info_ClearChoices(ch_level);
	hero.level = 23;
	hero.attribute[ATR_HITPOINTS_MAX] = 316;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_24()
{
	Info_ClearChoices(ch_level);
	hero.level = 24;
	hero.attribute[ATR_HITPOINTS_MAX] = 328;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_25()
{
	Info_ClearChoices(ch_level);
	hero.level = 25;
	hero.attribute[ATR_HITPOINTS_MAX] = 340;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_26()
{
	Info_ClearChoices(ch_level);
	hero.level = 26;
	hero.attribute[ATR_HITPOINTS_MAX] = 352;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_27()
{
	Info_ClearChoices(ch_level);
	hero.level = 27;
	hero.attribute[ATR_HITPOINTS_MAX] = 364;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_28()
{
	Info_ClearChoices(ch_level);
	hero.level = 28;
	hero.attribute[ATR_HITPOINTS_MAX] = 376;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_29()
{
	Info_ClearChoices(ch_level);
	hero.level = 29;
	hero.attribute[ATR_HITPOINTS_MAX] = 388;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_level_30()
{
	Info_ClearChoices(ch_level);
	hero.level = 30;
	hero.attribute[ATR_HITPOINTS_MAX] = 400;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	b_setheroexp();
	b_setheroweapon();
};

func void ch_guild_back()
{
	Info_ClearChoices(ch_guild);
};

instance CH_DIFF(C_INFO)
{
	npc = ch;
	condition = ch_diff_condition;
	information = ch_diff_info;
	important = 0;
	permanent = 1;
	description = "Измени сложность!";
};


func int ch_diff_condition()
{
	return TRUE;
};

func void ch_diff_info()
{
	Info_ClearChoices(ch_diff);
	Info_AddChoice(ch_diff,"НАЗАД",ch_diff_back);
	Info_AddChoice(ch_diff,"Очень высокая (опыт / 3)",ch_diff_veryhard);
	Info_AddChoice(ch_diff,"Высокая (опыт / 2)",ch_diff_hard);
	Info_AddChoice(ch_diff,"Стандартая",ch_diff_standart);
};

func void ch_diff_back()
{
	Info_ClearChoices(ch_diff);
};

func void ch_diff_veryhard()
{
	Info_ClearChoices(ch_diff);
	DIFF_HARD = 0;
	DIFF_VERYHARD = 1;
	PrintScreen("Сложность: очень высокая",-1,-1,"font_old_20_white.tga",5);
};

func void ch_diff_hard()
{
	Info_ClearChoices(ch_diff);
	DIFF_HARD = 1;
	DIFF_VERYHARD = 0;
	PrintScreen("Сложность: высокая",-1,-1,"font_old_20_white.tga",5);
};

func void ch_diff_standart()
{
	Info_ClearChoices(ch_diff);
	DIFF_HARD = 0;
	DIFF_VERYHARD = 0;
	PrintScreen("Сложность: стандартная",-1,-1,"font_old_20_white.tga",5);
};

instance CH_GUILD(C_INFO)
{
	npc = ch;
	condition = ch_guild_condition;
	information = ch_guild_info;
	important = 0;
	permanent = 1;
	description = "Назначь гильдию!";
};


func int ch_guild_condition()
{
	if((hero.level > 5) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return TRUE;
	};
};

func void ch_guild_info()
{
	Info_ClearChoices(ch_guild);
	Info_AddChoice(ch_guild,"НАЗАД",ch_guild_back);
	Info_AddChoice(ch_guild,"Призрак",ch_shadow);
	Info_AddChoice(ch_guild,"Стражник",ch_guard);
	Info_AddChoice(ch_guild,"Маг Огня",ch_firemage);
	Info_AddChoice(ch_guild,"Вор",ch_bandit);
	Info_AddChoice(ch_guild,"Наемник",ch_mercenary);
	Info_AddChoice(ch_guild,"Маг Воды",ch_watermage);
	Info_AddChoice(ch_guild,"Послушник",ch_novice);
	Info_AddChoice(ch_guild,"Страж",ch_templar);
	Info_AddChoice(ch_guild,"Барон",ch_ebr);
	Info_AddChoice(ch_guild,"Некромант",ch_dmb);
	Info_AddChoice(ch_guild,"Гуру",ch_gur);
};

func void ch_ebr()
{
	Info_ClearChoices(ch_guild);
	hero.guild = GIL_EBR;
	Npc_SetTrueGuild(hero,GIL_EBR);
	if(hero.level <= 15)
	{
		CreateInvItem(hero,ebr_armor_m);
		AI_EquipArmor(hero,ebr_armor_m);
	}
	else
	{
		CreateInvItem(hero,ebr_armor_h2);
		AI_EquipArmor(hero,ebr_armor_h2);
	};
};

func void ch_gur()
{
	Info_ClearChoices(ch_guild);
	hero.guild = GIL_GUR;
	Npc_SetTrueGuild(hero,GIL_GUR);
	if(hero.level <= 15)
	{
		CreateInvItem(hero,gur_armor_m);
		AI_EquipArmor(hero,gur_armor_m);
	}
	else
	{
		CreateInvItem(hero,gur_armor_h);
		AI_EquipArmor(hero,gur_armor_h);
	};
};

func void ch_dmb()
{
	Info_ClearChoices(ch_guild);
	hero.guild = GIL_DMB;
	Npc_SetTrueGuild(hero,GIL_DMB);
	CreateInvItem(hero,dmb_armor_m);
	AI_EquipArmor(hero,dmb_armor_m);
};

func void ch_templar()
{
	Info_ClearChoices(ch_guild);
	hero.guild = GIL_TPL;
	Npc_SetTrueGuild(hero,GIL_TPL);
	if(hero.level <= 15)
	{
		CreateInvItem(hero,tpl_armor_m);
		AI_EquipArmor(hero,tpl_armor_m);
	}
	else
	{
		CreateInvItem(hero,tpl_armor_h);
		AI_EquipArmor(hero,tpl_armor_h);
	};
};

func void ch_novice()
{
	Info_ClearChoices(ch_guild);
	hero.guild = GIL_NOV;
	Npc_SetTrueGuild(hero,GIL_NOV);
	if(hero.level <= 5)
	{
		CreateInvItem(hero,nov_armor_l);
		AI_EquipArmor(hero,nov_armor_l);
	}
	else
	{
		CreateInvItem(hero,nov_armor_h);
		AI_EquipArmor(hero,nov_armor_h);
	};
};

func void ch_watermage()
{
	Info_ClearChoices(ch_guild);
	hero.guild = GIL_KDW;
	Npc_SetTrueGuild(hero,GIL_KDW);
	if(hero.level <= 20)
	{
		CreateInvItem(hero,kdw_armor_l);
		AI_EquipArmor(hero,kdw_armor_l);
	}
	else
	{
		CreateInvItem(hero,kdw_armor_h);
		AI_EquipArmor(hero,kdw_armor_h);
	};
};

func void ch_mercenary()
{
	Info_ClearChoices(ch_guild);
	hero.guild = GIL_SLD;
	Npc_SetTrueGuild(hero,GIL_SLD);
	if(hero.level <= 15)
	{
		CreateInvItem(hero,sld_armor_m);
		AI_EquipArmor(hero,sld_armor_m);
	}
	else
	{
		CreateInvItem(hero,sld_armor_h);
		AI_EquipArmor(hero,sld_armor_h);
	};
};

func void ch_bandit()
{
	Info_ClearChoices(ch_guild);
	hero.guild = GIL_ORG;
	Npc_SetTrueGuild(hero,GIL_ORG);
	CreateInvItem(hero,org_armor_h);
	AI_EquipArmor(hero,org_armor_h);
};

func void ch_firemage()
{
	Info_ClearChoices(ch_guild);
	hero.guild = GIL_KDF;
	Npc_SetTrueGuild(hero,GIL_KDF);
	CreateInvItem(hero,kdf_armor_h);
	AI_EquipArmor(hero,kdf_armor_h);
};

func void ch_guard()
{
	Info_ClearChoices(ch_guild);
	hero.guild = GIL_GRD;
	Npc_SetTrueGuild(hero,GIL_GRD);
	if(hero.level <= 15)
	{
		CreateInvItem(hero,grd_armor_m);
		AI_EquipArmor(hero,grd_armor_m);
	}
	else
	{
		CreateInvItem(hero,grd_armor_h);
		AI_EquipArmor(hero,grd_armor_h);
	};
};

func void ch_shadow()
{
	Info_ClearChoices(ch_guild);
	hero.guild = GIL_STT;
	Npc_SetTrueGuild(hero,GIL_STT);
	CreateInvItem(hero,stt_armor_h);
	AI_EquipArmor(hero,stt_armor_h);
};


instance CH_TRAINING_STR(C_INFO)
{
	npc = ch;
	condition = ch_training_str_condition;
	information = ch_training_str_info;
	important = 0;
	permanent = 1;
	description = "Атрибут: сила";
};


func int ch_training_str_condition()
{
	if(hero.lp > 0)
	{
		return TRUE;
	};
};

func void ch_training_str_info()
{
	Info_ClearChoices(ch_training_str);
	Info_AddChoice(ch_training_str,"НАЗАД",ch_training_str_back);
	Info_AddChoice(ch_training_str,"Сила (на все оставшиеся очки обучения)",ch_strength_all);
	Info_AddChoice(ch_training_str,"Сила (для лучшего оружия ближнего боя)",ch_strength_weapon);
	if(hero.lp >= (20 * LPCOST_ATTRIBUTE_STRENGTH))
	{
		Info_AddChoice(ch_training_str,b_buildlearnstring(NAME_LEARNSTRENGTH_20,20 * LPCOST_ATTRIBUTE_STRENGTH,0),ch_strength20);
	};
	if(hero.lp >= (10 * LPCOST_ATTRIBUTE_STRENGTH))
	{
		Info_AddChoice(ch_training_str,b_buildlearnstring(NAME_LEARNSTRENGTH_10,10 * LPCOST_ATTRIBUTE_STRENGTH,0),ch_strength10);
	};
	if(hero.lp >= (5 * LPCOST_ATTRIBUTE_STRENGTH))
	{
		Info_AddChoice(ch_training_str,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),ch_strength5);
	};
	if(hero.lp >= LPCOST_ATTRIBUTE_STRENGTH)
	{
		Info_AddChoice(ch_training_str,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),ch_strength1);
	};
};

func void ch_strength1()
{
	b_setheroattributes(ATR_STRENGTH,1,LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(ch_training_str);
};

func void ch_strength5()
{
	b_setheroattributes(ATR_STRENGTH,5,5 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(ch_training_str);
};

func void ch_strength10()
{
	b_setheroattributes(ATR_STRENGTH,10,10 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(ch_training_str);
};

func void ch_strength20()
{
	b_setheroattributes(ATR_STRENGTH,20,20 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(ch_training_str);
};

func void ch_strength_weapon()
{
	var int value;
	var int increase;
	Info_ClearChoices(ch_training_str);
	if(hero.level <= 5)
	{
		value = 11;
	}
	else if(hero.level <= 9)
	{
		value = 17;
	}
	else if(hero.level <= 15)
	{
		value = 26;
	}
	else if(hero.level <= 20)
	{
		value = 52;
	}
	else if(hero.level <= 25)
	{
		value = 62;
	}
	else if(hero.level <= 30)
	{
		value = 78;
	};
	if(hero.attribute[ATR_STRENGTH] < value)
	{
		increase = value - hero.attribute[ATR_STRENGTH];
		b_setheroattributes(ATR_STRENGTH,increase,increase * LPCOST_ATTRIBUTE_STRENGTH);
		AI_EquipBestMeleeWeapon(hero);
	}
	else
	{
		PrintScreen("Вашей силы достаточно",-1,-1,"font_old_20_white.tga",10);
	};
};

func void ch_strength_all()
{
	b_setheroattributes(ATR_STRENGTH,hero.lp,hero.lp * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(ch_training_str);
};

func void ch_training_str_back()
{
	Info_ClearChoices(ch_training_str);
};


instance CH_TRAINING_DEX(C_INFO)
{
	npc = ch;
	condition = ch_training_dex_condition;
	information = ch_training_dex_info;
	important = 0;
	permanent = 1;
	description = "Атрибут: ловкость";
};


func int ch_training_dex_condition()
{
	if(hero.lp > 0)
	{
		return TRUE;
	};
};

func void ch_training_dex_info()
{
	Info_ClearChoices(ch_training_dex);
	Info_AddChoice(ch_training_dex,"НАЗАД",ch_training_dex_back);
	Info_AddChoice(ch_training_dex,"Ловкость (на все оставшиеся очки обучения)",ch_dexterity_all);
	Info_AddChoice(ch_training_dex,"Ловкость (для лучшего дистанционного оружия)",ch_dexterity_weapon);
	if(hero.lp >= 20)
	{
		Info_AddChoice(ch_training_dex,b_buildlearnstring(NAME_LEARNDEXTERITY_20,20 * LPCOST_ATTRIBUTE_DEXTERITY,0),ch_dexterity20);
	};
	if(hero.lp >= 10)
	{
		Info_AddChoice(ch_training_dex,b_buildlearnstring(NAME_LEARNDEXTERITY_10,10 * LPCOST_ATTRIBUTE_DEXTERITY,0),ch_dexterity10);
	};
	if(hero.lp >= 5)
	{
		Info_AddChoice(ch_training_dex,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),ch_dexterity5);
	};
	if(hero.lp >= 1)
	{
		Info_AddChoice(ch_training_dex,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ch_dexterity1);
	};
};

func void ch_dexterity1()
{
	b_setheroattributes(ATR_DEXTERITY,1,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(ch_training_dex);
};

func void ch_dexterity5()
{
	b_setheroattributes(ATR_DEXTERITY,5,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(ch_training_dex);
};

func void ch_dexterity10()
{
	b_setheroattributes(ATR_DEXTERITY,10,10 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(ch_training_dex);
};

func void ch_dexterity20()
{
	b_setheroattributes(ATR_DEXTERITY,20,20 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(ch_training_dex);
};

func void ch_dexterity_weapon()
{
	var int value;
	var int increase;
	Info_ClearChoices(ch_training_dex);
	if(hero.level <= 5)
	{
		value = 16;
	}
	else if(hero.level <= 9)
	{
		value = 22;
	}
	else if(hero.level <= 15)
	{
		value = 28;
	}
	else if(hero.level <= 20)
	{
		value = 34;
	}
	else if(hero.level <= 25)
	{
		value = 40;
	}
	else if(hero.level <= 30)
	{
		value = 50;
	};
	if(hero.attribute[ATR_DEXTERITY] < value)
	{
		increase = value - hero.attribute[ATR_DEXTERITY];
		b_setheroattributes(ATR_DEXTERITY,increase,increase * LPCOST_ATTRIBUTE_DEXTERITY);
		AI_EquipBestRangedWeapon(hero);
	}
	else
	{
		PrintScreen("Вашей ловкости достаточно.",-1,-1,"font_old_20_white.tga",10);
	};
};

func void ch_dexterity_all()
{
	b_setheroattributes(ATR_DEXTERITY,hero.lp,hero.lp * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(ch_training_dex);
};

func void ch_training_dex_back()
{
	Info_ClearChoices(ch_training_dex);
};


instance CH_TRAINING_MANA(C_INFO)
{
	npc = ch;
	condition = ch_training_mana_condition;
	information = ch_training_mana_info;
	important = 0;
	permanent = 1;
	description = "Атрибут: мана";
};


func int ch_training_mana_condition()
{
	if(hero.lp > 0)
	{
		return TRUE;
	};
};

func void ch_training_mana_info()
{
	Info_ClearChoices(ch_training_mana);
	Info_AddChoice(ch_training_mana,"НАЗАД",ch_training_mana_back);
	Info_AddChoice(ch_training_mana,"Магическая сила (на оставшиеся очки обучения)",ch_mana_all);
	if(hero.lp >= 20)
	{
		Info_AddChoice(ch_training_mana,b_buildlearnstring(NAME_LEARNMANA_20,20 * LPCOST_ATTRIBUTE_MANA,0),ch_mana20);
	};
	if(hero.lp >= 10)
	{
		Info_AddChoice(ch_training_mana,b_buildlearnstring(NAME_LEARNMANA_10,10 * LPCOST_ATTRIBUTE_MANA,0),ch_mana10);
	};
	if(hero.lp >= 5)
	{
		Info_AddChoice(ch_training_mana,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,0),ch_mana5);
	};
	if(hero.lp >= 1)
	{
		Info_AddChoice(ch_training_mana,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,0),ch_mana1);
	};
};

func void ch_mana1()
{
	b_setheroattributes(ATR_MANA_MAX,1,LPCOST_ATTRIBUTE_MANA);
	b_setheroattributes(ATR_MANA,1,0);
	Info_ClearChoices(ch_training_mana);
};

func void ch_mana5()
{
	b_setheroattributes(ATR_MANA_MAX,5,5 * LPCOST_ATTRIBUTE_MANA);
	b_setheroattributes(ATR_MANA,5,0);
	Info_ClearChoices(ch_training_mana);
};

func void ch_mana10()
{
	b_setheroattributes(ATR_MANA_MAX,10,10 * LPCOST_ATTRIBUTE_MANA);
	b_setheroattributes(ATR_MANA,10,0);
	Info_ClearChoices(ch_training_mana);
};

func void ch_mana20()
{
	b_setheroattributes(ATR_MANA_MAX,20,20 * LPCOST_ATTRIBUTE_MANA);
	b_setheroattributes(ATR_MANA,20,0);
	Info_ClearChoices(ch_training_mana);
};

func void ch_mana_all()
{
	var int lp;
	lp = hero.lp;
	b_setheroattributes(ATR_MANA_MAX,hero.lp,hero.lp * LPCOST_ATTRIBUTE_MANA);
	b_setheroattributes(ATR_MANA,lp,0);
	Info_ClearChoices(ch_training_mana);
};

func void ch_training_mana_back()
{
	Info_ClearChoices(ch_training_mana);
};


instance CH_TRAINING_COMBAT(C_INFO)
{
	npc = ch;
	condition = ch_training_combat_condition;
	information = ch_training_combat_info;
	important = 0;
	permanent = 1;
	description = "Навык: военное искусство";
};


func int ch_training_combat_condition()
{
	if(hero.lp > 0)
	{
		return TRUE;
	};
};

func void ch_training_combat_info()
{
	Info_ClearChoices(ch_training_combat);
	Info_AddChoice(ch_training_combat,"НАЗАД",ch_training_combat_back);
	if((hero.lp >= LPCOST_TALENT_CROSSBOW_2) && (Npc_GetTalentSkill(hero,NPC_TALENT_CROSSBOW) == 1))
	{
		Info_AddChoice(ch_training_combat,b_buildlearnstring(NAME_LEARNCROSSBOW_2,LPCOST_TALENT_CROSSBOW_2,0),ch_crossbowl2);
	};
	if((hero.lp >= LPCOST_TALENT_CROSSBOW_1) && (Npc_GetTalentSkill(hero,NPC_TALENT_BOW) == 2) && (Npc_GetTalentSkill(hero,NPC_TALENT_CROSSBOW) == 0))
	{
		Info_AddChoice(ch_training_combat,b_buildlearnstring(NAME_LEARNCROSSBOW_1,LPCOST_TALENT_CROSSBOW_1,0),ch_crossbowl1);
	};
	if((hero.lp >= LPCOST_TALENT_BOW_2) && (Npc_GetTalentSkill(hero,NPC_TALENT_BOW) == 1))
	{
		Info_AddChoice(ch_training_combat,b_buildlearnstring(NAME_LEARNBOW_2,LPCOST_TALENT_BOW_2,0),ch_bowl2);
	};
	if((hero.lp >= LPCOST_TALENT_BOW_1) && (Npc_GetTalentSkill(hero,NPC_TALENT_BOW) == 0))
	{
		Info_AddChoice(ch_training_combat,b_buildlearnstring(NAME_LEARNBOW_1,LPCOST_TALENT_BOW_1,0),ch_bowl1);
	};
	if((hero.lp >= LPCOST_TALENT_2H_2) && (Npc_GetTalentSkill(hero,NPC_TALENT_2H) == 1))
	{
		Info_AddChoice(ch_training_combat,b_buildlearnstring(NAME_LEARN2H_2,LPCOST_TALENT_2H_2,0),ch_2hl2);
	};
	if((hero.lp >= LPCOST_TALENT_2H_1) && (Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 2) && (Npc_GetTalentSkill(hero,NPC_TALENT_2H) == 0))
	{
		Info_AddChoice(ch_training_combat,b_buildlearnstring(NAME_LEARN2H_1,LPCOST_TALENT_2H_1,0),ch_2hl1);
	};
	if((hero.lp >= LPCOST_TALENT_1H_2) && (Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 1))
	{
		Info_AddChoice(ch_training_combat,b_buildlearnstring(NAME_LEARN1H_2,LPCOST_TALENT_1H_2,0),ch_1hl2);
	};
	if((hero.lp >= LPCOST_TALENT_1H_1) && (Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 0))
	{
		Info_AddChoice(ch_training_combat,b_buildlearnstring(NAME_LEARN1H_1,LPCOST_TALENT_1H_1,0),ch_1hl1);
	};
};

func void ch_1hl1()
{
	Info_ClearChoices(ch_training_combat);
	b_giveskill(hero,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1);
};

func void ch_1hl2()
{
	Info_ClearChoices(ch_training_combat);
	b_giveskill(hero,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2);
};

func void ch_2hl1()
{
	Info_ClearChoices(ch_training_combat);
	b_giveskill(hero,NPC_TALENT_2H,1,LPCOST_TALENT_2H_1);
};

func void ch_2hl2()
{
	Info_ClearChoices(ch_training_combat);
	b_giveskill(hero,NPC_TALENT_2H,2,LPCOST_TALENT_2H_2);
};

func void ch_bowl1()
{
	Info_ClearChoices(ch_training_combat);
	b_giveskill(hero,NPC_TALENT_BOW,1,LPCOST_TALENT_BOW_1);
};

func void ch_bowl2()
{
	Info_ClearChoices(ch_training_combat);
	b_giveskill(hero,NPC_TALENT_BOW,2,LPCOST_TALENT_BOW_2);
};

func void ch_crossbowl1()
{
	Info_ClearChoices(ch_training_combat);
	b_giveskill(hero,NPC_TALENT_CROSSBOW,1,LPCOST_TALENT_CROSSBOW_1);
};

func void ch_crossbowl2()
{
	Info_ClearChoices(ch_training_combat);
	b_giveskill(hero,NPC_TALENT_CROSSBOW,2,LPCOST_TALENT_CROSSBOW_2);
};

func void ch_training_combat_back()
{
	Info_ClearChoices(ch_training_combat);
};


instance CH_TRAINING_MAGIC(C_INFO)
{
	npc = ch;
	condition = ch_training_magic_condition;
	information = ch_training_magic_info;
	important = 0;
	permanent = 1;
	description = "Навык: магия";
};


func int ch_training_magic_condition()
{
	if(hero.lp > 0)
	{
		return TRUE;
	};
};

func void ch_training_magic_info()
{
	Info_ClearChoices(ch_training_magic);
	Info_AddChoice(ch_training_magic,"НАЗАД",ch_training_magic_back);
	if((hero.level >= 24) && (hero.lp >= LPCOST_TALENT_MAGE_6) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5))
	{
		Info_AddChoice(ch_training_magic,b_buildlearnstring(NAME_LEARNMAGE_6,LPCOST_TALENT_MAGE_6,0),ch_magic6);
	};
	if((hero.lp >= LPCOST_TALENT_MAGE_5) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4))
	{
		Info_AddChoice(ch_training_magic,b_buildlearnstring(NAME_LEARNMAGE_5,LPCOST_TALENT_MAGE_5,0),ch_magic5);
	};
	if((hero.lp >= LPCOST_TALENT_MAGE_4) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3))
	{
		Info_AddChoice(ch_training_magic,b_buildlearnstring(NAME_LEARNMAGE_4,LPCOST_TALENT_MAGE_4,0),ch_magic4);
	};
	if((hero.lp >= LPCOST_TALENT_MAGE_3) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2))
	{
		Info_AddChoice(ch_training_magic,b_buildlearnstring(NAME_LEARNMAGE_3,LPCOST_TALENT_MAGE_3,0),ch_magic3);
	};
	if((hero.lp >= LPCOST_TALENT_MAGE_2) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1))
	{
		Info_AddChoice(ch_training_magic,b_buildlearnstring(NAME_LEARNMAGE_2,LPCOST_TALENT_MAGE_2,0),ch_magic2);
	};
	if((hero.lp >= LPCOST_TALENT_MAGE_1) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 0))
	{
		Info_AddChoice(ch_training_magic,b_buildlearnstring(NAME_LEARNMAGE_1,LPCOST_TALENT_MAGE_1,0),ch_magic1);
	};
};

func void ch_magic1()
{
	Info_ClearChoices(ch_training_magic);
	b_giveskill(hero,NPC_TALENT_MAGE,1,LPCOST_TALENT_MAGE_1);
	CreateInvItem(hero,itarrunelight);
	CreateInvItem(hero,itarrunefirebolt);
	CreateInvItem(hero,itarrunethunderbolt);
	CreateInvItems(hero,itarscrolltrfscavenger,10);
	CreateInvItems(hero,itarscrolltrfmolerat,10);
	CreateInvItems(hero,itarscrolltrfwaran,10);
};

func void ch_magic2()
{
	Info_ClearChoices(ch_training_magic);
	b_giveskill(hero,NPC_TALENT_MAGE,2,LPCOST_TALENT_MAGE_2);
	CreateInvItem(hero,itarruneheal);
	CreateInvItem(hero,itarrunesleep);
	CreateInvItem(hero,itarrunewindfist);
	CreateInvItems(hero,itarscrolltrfwolf,10);
	CreateInvItems(hero,itarscrolltrfbloodfly,10);
	CreateInvItems(hero,itarscrolltrflurker,10);
};

func void ch_magic3()
{
	Info_ClearChoices(ch_training_magic);
	b_giveskill(hero,NPC_TALENT_MAGE,3,LPCOST_TALENT_MAGE_3);
	CreateInvItem(hero,itarrunetelekinesis);
	CreateInvItem(hero,itarrunepyrokinesis);
	CreateInvItem(hero,itarruneicecube);
	CreateInvItem(hero,itarrunecharm);
	CreateInvItem(hero,itarrunefireball);
	CreateInvItem(hero,itarrunethunderball);
	CreateInvItems(hero,itarscrolltrfmeatbug,10);
	CreateInvItems(hero,itarscrolltrfcrawler,10);
	CreateInvItems(hero,itarscrolltrfsnapper,10);
	CreateInvItems(hero,itarscrollsummonskeletons,10);
};

func void ch_magic4()
{
	Info_ClearChoices(ch_training_magic);
	b_giveskill(hero,NPC_TALENT_MAGE,4,LPCOST_TALENT_MAGE_4);
	CreateInvItem(hero,itarrunecontrol);
	CreateInvItem(hero,itarrunechainlightning);
	CreateInvItem(hero,itarrunestormfist);
	CreateInvItem(hero,itarrunedestroyundead);
	CreateInvItem(hero,itarrunefirestorm);
	CreateInvItems(hero,itarscrolltrforcdog,10);
	CreateInvItems(hero,itarscrolltrfshadowbeast,10);
	CreateInvItems(hero,itarscrollsummongolem,10);
	CreateInvItems(hero,itarscrollfear,10);
	CreateInvItems(hero,itarscrollberzerk,10);
	CreateInvItems(hero,itarscrollshrink,10);
};

func void ch_magic5()
{
	Info_ClearChoices(ch_training_magic);
	b_giveskill(hero,NPC_TALENT_MAGE,5,LPCOST_TALENT_MAGE_5);
	CreateInvItem(hero,itarruneicewave);
	CreateInvItem(hero,itarrunefirerain);
	CreateInvItems(hero,itarscrollsummondemon,10);
};

func void ch_magic6()
{
	Info_ClearChoices(ch_training_magic);
	b_giveskill(hero,NPC_TALENT_MAGE,6,LPCOST_TALENT_MAGE_6);
	CreateInvItem(hero,itarrunebreathofdeath);
	CreateInvItems(hero,itarscrollarmyofdarkness,10);
};

func void ch_training_magic_back()
{
	Info_ClearChoices(ch_training_magic);
};


instance CH_TRAINING_THIEVERY(C_INFO)
{
	npc = ch;
	condition = ch_training_thievery_condition;
	information = ch_training_thievery_info;
	important = 0;
	permanent = 1;
	description = "Навык: воровство";
};


func int ch_training_thievery_condition()
{
	if(hero.lp > 0)
	{
		return TRUE;
	};
};

func void ch_training_thievery_info()
{
	Info_ClearChoices(ch_training_thievery);
	Info_AddChoice(ch_training_thievery,"НАЗАД",ch_training_thievery_back);
	if((hero.lp >= LPCOST_TALENT_ACROBAT) && (Npc_GetTalentSkill(hero,NPC_TALENT_ACROBAT) == 0))
	{
		Info_AddChoice(ch_training_thievery,b_buildlearnstring(NAME_LEARNACROBAT,LPCOST_TALENT_ACROBAT,0),ch_acrobat);
	};
	if((hero.lp >= LPCOST_TALENT_SNEAK) && (Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 0))
	{
		Info_AddChoice(ch_training_thievery,b_buildlearnstring(NAME_LEARNSNEAK,LPCOST_TALENT_SNEAK,0),ch_sneak);
	};
	if((hero.lp >= LPCOST_TALENT_PICKPOCKET_2) && (Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 1))
	{
		Info_AddChoice(ch_training_thievery,b_buildlearnstring(NAME_LEARNPICKPOCKET_2,LPCOST_TALENT_PICKPOCKET_2,0),ch_pickpocket2);
	};
	if((hero.lp >= LPCOST_TALENT_PICKPOCKET_1) && (Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 0))
	{
		Info_AddChoice(ch_training_thievery,b_buildlearnstring(NAME_LEARNPICKPOCKET_1,LPCOST_TALENT_PICKPOCKET_1,0),ch_pickpocket1);
	};
	if((hero.lp >= LPCOST_TALENT_PICKLOCK_2) && (Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 1))
	{
		Info_AddChoice(ch_training_thievery,b_buildlearnstring(NAME_LEARNPICKLOCK_2,LPCOST_TALENT_PICKLOCK_2,0),ch_picklock2);
	};
	if((hero.lp >= LPCOST_TALENT_PICKLOCK_1) && (Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 0))
	{
		Info_AddChoice(ch_training_thievery,b_buildlearnstring(NAME_LEARNPICKLOCK_1,LPCOST_TALENT_PICKLOCK_1,0),ch_picklock1);
	};
};

func void ch_picklock1()
{
	Info_ClearChoices(ch_training_thievery);
	b_giveskill(hero,NPC_TALENT_PICKLOCK,1,LPCOST_TALENT_PICKLOCK_1);
};

func void ch_picklock2()
{
	Info_ClearChoices(ch_training_thievery);
	b_giveskill(hero,NPC_TALENT_PICKLOCK,2,LPCOST_TALENT_PICKLOCK_2);
};

func void ch_pickpocket1()
{
	Info_ClearChoices(ch_training_thievery);
	b_giveskill(hero,NPC_TALENT_PICKPOCKET,1,LPCOST_TALENT_PICKPOCKET_1);
};

func void ch_pickpocket2()
{
	Info_ClearChoices(ch_training_thievery);
	b_giveskill(hero,NPC_TALENT_PICKPOCKET,2,LPCOST_TALENT_PICKPOCKET_2);
};

func void ch_sneak()
{
	Info_ClearChoices(ch_training_thievery);
	b_giveskill(hero,NPC_TALENT_SNEAK,1,LPCOST_TALENT_SNEAK);
};

func void ch_acrobat()
{
	Info_ClearChoices(ch_training_thievery);
	b_giveskill(hero,NPC_TALENT_ACROBAT,1,LPCOST_TALENT_ACROBAT);
};

func void ch_training_thievery_back()
{
	Info_ClearChoices(ch_training_thievery);
};

