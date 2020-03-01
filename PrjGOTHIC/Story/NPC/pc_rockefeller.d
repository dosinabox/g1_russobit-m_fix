
instance PC_ROCKEFELLER(NPC_DEFAULT)
{
	name[0] = "���������";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 30;
	voice = 15;
	id = 0;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,ebr_armor_h2);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKPOCKET,2);
	Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,10);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,2);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,2);
	Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,10);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,2);
	CreateInvItem(self,ore_armor_h);
	CreateInvItem(self,ore_armor_m);
	CreateInvItem(self,crw_armor_h);
	CreateInvItem(self,dmb_armor_m);
	CreateInvItem(self,law_armor);
	CreateInvItem(self,ebr_armor_m);
	CreateInvItem(self,ebr_armor_h);
	CreateInvItem(self,ebr_armor_h2);
	CreateInvItem(self,grd_armor_i);
	CreateInvItem(self,grd_armor_l);
	CreateInvItem(self,grd_armor_m);
	CreateInvItem(self,grd_armor_h);
	CreateInvItem(self,gur_armor_h);
	CreateInvItem(self,gur_armor_m);
	CreateInvItem(self,kdf_armor_l);
	CreateInvItem(self,kdf_armor_h);
	CreateInvItem(self,org2n);
	CreateInvItem(self,org2l);
	CreateInvItem(self,org2m);
	CreateInvItem(self,kdw_armor_l);
	CreateInvItem(self,kdw_armor_h);
	CreateInvItem(self,nov_armor_l);
	CreateInvItem(self,nov_armor_m);
	CreateInvItem(self,nov_armor_h);
	CreateInvItem(self,org_armor_l);
	CreateInvItem(self,org_armor_m);
	CreateInvItem(self,org_armor_h);
	CreateInvItem(self,sfb_armor_l);
	CreateInvItem(self,sld_armor_l);
	CreateInvItem(self,sld_armor_m);
	CreateInvItem(self,sld_armor_h);
	CreateInvItem(self,stt_armor_m);
	CreateInvItem(self,stt_armor_h);
	CreateInvItem(self,tpl_armor_l);
	CreateInvItem(self,tpl_armor_m);
	CreateInvItem(self,tpl_armor_h);
	CreateInvItem(self,vlk_armor_m);
	CreateInvItem(self,vlk_armor_l);
	CreateInvItem(self,itarrune_1_1_light);
	CreateInvItem(self,itarrune_2_1_firebolt);
	CreateInvItem(self,itarrune_2_2_fireball);
	CreateInvItem(self,itarrune_2_3_firestorm);
	CreateInvItem(self,itarrune_2_4_firerain);
	CreateInvItem(self,itarrune_1_3_teleport1);
	CreateInvItem(self,itarrune_1_4_teleport2);
	CreateInvItem(self,itarrune_1_6_teleport3);
	CreateInvItems(self,itarscrollteleport4,20);
	CreateInvItem(self,itarrune_1_5_teleport5);
	CreateInvItem(self,itarrune_1_2_heal);
	CreateInvItem(self,itarrune_3_5_chainlightning);
	CreateInvItem(self,itarrune_3_1_thunderbolt);
	CreateInvItem(self,itarrune_3_2_thunderball);
	CreateInvItem(self,itarrune_3_3_icecube);
	CreateInvItem(self,itarrune_3_4_icewave);
	CreateInvItems(self,itarscrolltrfbloodfly,10);
	CreateInvItems(self,itarscrolltrfcrawler,10);
	CreateInvItems(self,itarscrolltrflurker,10);
	CreateInvItems(self,itarscrolltrfmeatbug,10);
	CreateInvItems(self,itarscrolltrfmolerat,10);
	CreateInvItems(self,itarscrolltrforcdog,10);
	CreateInvItems(self,itarscrolltrfscavenger,10);
	CreateInvItems(self,itarscrolltrfshadowbeast,10);
	CreateInvItems(self,itarscrolltrfsnapper,10);
	CreateInvItems(self,itarscrolltrfwaran,10);
	CreateInvItems(self,itarscrolltrfwolf,10);
	CreateInvItems(self,itarscrollsummondemon,10);
	CreateInvItems(self,itarscrollsummonskeletons,10);
	CreateInvItems(self,itarscrollsummongolem,10);
	CreateInvItems(self,itarscrollarmyofdarkness,10);
	CreateInvItem(self,itarrune_5_5_windfist);
	CreateInvItem(self,itarrune_5_6_stormfist);
	CreateInvItem(self,itarrune_5_0_telekinesis);
	CreateInvItem(self,itarrune_5_1_charm);
	CreateInvItem(self,itarrune_5_2_sleep);
	CreateInvItem(self,itarrune_5_7_pyrokinesis);
	CreateInvItem(self,itarrune_5_3_control);
	CreateInvItem(self,itarrune_6_1_destroyundead);
	CreateInvItem(self,itarrune_6_2_armyofdarkness);
	CreateInvItem(self,itarrune_6_3_breathofdeath);
	CreateInvItem(self,itarrune_6_6_urizielrune);
	CreateInvItems(self,itarscrollfear,10);
	CreateInvItems(self,itarscrollberzerk,10);
	CreateInvItems(self,itarscrollshrink,10);
	CreateInvItems(self,itfo_mutton_01,20);
	CreateInvItems(self,itfoapple,5);
	CreateInvItems(self,itfoloaf,5);
	CreateInvItems(self,itfomutton,10);
	CreateInvItems(self,itfomuttonraw,20);
	CreateInvItems(self,itfocheese,5);
	CreateInvItems(self,itforice,5);
	CreateInvItems(self,itfosoup,5);
	CreateInvItems(self,itfomeatbugragout,5);
	CreateInvItems(self,itfocrawlersoup,5);
	CreateInvItems(self,itfobooze,10);
	CreateInvItems(self,itfowine,5);
	CreateInvItems(self,itfo_wineberrys_01,5);
	CreateInvItems(self,itfobeer,5);
	CreateInvItems(self,itfo_plants_trollberrys_01,5);
	CreateInvItems(self,itfo_plants_flameberry_01,5);
	CreateInvItems(self,itfo_plants_nightshadow_01,5);
	CreateInvItems(self,itfo_plants_nightshadow_02,5);
	CreateInvItems(self,itfo_plants_orcherb_01,5);
	CreateInvItems(self,itfo_plants_orcherb_02,5);
	CreateInvItems(self,itfo_plants_mushroom_01,5);
	CreateInvItems(self,itfo_plants_mushroom_02,5);
	CreateInvItems(self,itfo_plants_stoneroot_01,5);
	CreateInvItems(self,itfo_plants_stoneroot_02,5);
	CreateInvItems(self,itfo_plants_ravenherb_01,5);
	CreateInvItems(self,itfo_plants_ravenherb_02,5);
	CreateInvItems(self,itfo_plants_mountainmoos_01,5);
	CreateInvItems(self,itfo_plants_mountainmoos_02,5);
	CreateInvItems(self,itfo_plants_berrys_01,5);
	CreateInvItems(self,itfo_plants_bloodwood_01,5);
	CreateInvItems(self,itfo_plants_towerwood_01,5);
	CreateInvItems(self,itfo_plants_seraphis_01,5);
	CreateInvItems(self,itfo_plants_velayis_01,5);
	CreateInvItems(self,itfo_plants_herb_03,5);
	CreateInvItems(self,itfo_plants_herb_02,5);
	CreateInvItems(self,itfo_plants_herb_01,5);
	CreateInvItems(self,itfo_plants_deadleaf,5);
	CreateInvItems(self,itmi_plants_swampherb_01,5);
	CreateInvItem(self,itkekey1);
	CreateInvItem(self,itkekey2);
	CreateInvItem(self,itkekey3);
	CreateInvItem(self,itkekey4);
	CreateInvItems(self,itkelockpick,100);
	CreateInvItems(self,itlstorch,50);
	CreateInvItems(self,itmihammer,5);
	CreateInvItems(self,itmiscoop,5);
	CreateInvItems(self,itminugget,1000);
	CreateInvItem(self,itmialarmhorn);
	CreateInvItems(self,itmiswordraw,5);
	CreateInvItem(self,itmilute);
	CreateInvItems(self,itmistomper,5);
	CreateInvItems(self,itmiflask,25);
	CreateInvItem(self,itmi_stuff_pipe_01);
	CreateInvItem(self,itmi_stuff_barbknife_01);
	CreateInvItem(self,itmi_stuff_oldcoin_01);
	CreateInvItem(self,itmi_stuff_plate_01);
	CreateInvItem(self,itmi_stuff_candel_01);
	CreateInvItem(self,itmi_stuff_cup_01);
	CreateInvItem(self,itmi_stuff_cup_02);
	CreateInvItem(self,itmi_stuff_silverware_01);
	CreateInvItem(self,itmi_stuff_pan_01);
	CreateInvItem(self,itmi_stuff_mug_01);
	CreateInvItem(self,itmi_stuff_amphore_01);
	CreateInvItem(self,itmi_stuff_idol_sleeper_01);
	CreateInvItem(self,itmi_stuff_idol_ogront_01);
	CreateInvItem(self,itmi_stuff_gearwheel_01);
	CreateInvItem(self,weedpack);
	CreateInvItem(self,alexstuff);
	CreateInvItem(self,itmiwedel);
	CreateInvItem(self,focus_1);
	CreateInvItem(self,focus_2);
	CreateInvItem(self,focus_3);
	CreateInvItem(self,focus_4);
	CreateInvItem(self,focus_5);
	CreateInvItem(self,specialjoint);
	CreateInvItems(self,itmijoint_1,5);
	CreateInvItems(self,itmijoint_2,5);
	CreateInvItems(self,itmijoint_3,5);
	CreateInvItems(self,itmi_alchemy_sulphur_01,5);
	CreateInvItems(self,itmi_alchemy_quicksilver_01,5);
	CreateInvItems(self,itmi_alchemy_salt_01,5);
	CreateInvItems(self,itmi_alchemy_syrianoil_01,5);
	CreateInvItems(self,itmi_alchemy_moleratlubric_01,5);
	CreateInvItems(self,itmi_alchemy_alcohol_01,5);
	CreateInvItem(self,alchemybook);
	CreateInvItem(self,alchemy_hp1);
	CreateInvItem(self,alchemy_hp2);
	CreateInvItem(self,alchemy_hp3);
	CreateInvItem(self,alchemy_hpmax);
	CreateInvItem(self,alchemy_mp1);
	CreateInvItem(self,alchemy_mp2);
	CreateInvItem(self,alchemy_mp3);
	CreateInvItem(self,alchemy_mpmax);
	CreateInvItem(self,alchemy_dex);
	CreateInvItem(self,alchemy_str);
	CreateInvItem(self,alchemy_egg);
	CreateInvItem(self,alchemy_fortuno);
	CreateInvItem(self,alchemy_joint2);
	CreateInvItem(self,alchemy_joint3);
	CreateInvItem(self,itrw_bow_small_01);
	CreateInvItem(self,itrw_bow_small_02);
	CreateInvItem(self,itrw_bow_small_03);
	CreateInvItem(self,itrw_bow_small_04);
	CreateInvItem(self,itrw_bow_small_05);
	CreateInvItem(self,itrw_bow_long_01);
	CreateInvItem(self,itrw_bow_long_02);
	CreateInvItem(self,itrw_bow_long_03);
	CreateInvItem(self,itrw_bow_long_04);
	CreateInvItem(self,itrw_bow_long_05);
	CreateInvItem(self,itrw_bow_long_06);
	CreateInvItem(self,itrw_bow_long_07);
	CreateInvItem(self,itrw_bow_long_08);
	CreateInvItem(self,itrw_bow_long_09);
	CreateInvItem(self,itrw_bow_war_01);
	CreateInvItem(self,itrw_bow_war_02);
	CreateInvItem(self,itrw_bow_war_03);
	CreateInvItem(self,itrw_bow_war_04);
	CreateInvItem(self,itrw_bow_war_05);
	CreateInvItem(self,itrw_crossbow_01);
	CreateInvItem(self,itrw_crossbow_02);
	CreateInvItem(self,itrw_crossbow_03);
	CreateInvItem(self,itrw_crossbow_04);
	CreateInvItems(self,itamarrow,100);
	CreateInvItems(self,itambolt,100);
	CreateInvItem(self,itwrworldmap);
	CreateInvItem(self,itwrworldmap_orc);
	CreateInvItem(self,itwrommap);
	CreateInvItem(self,itwrfocusmappsi);
	CreateInvItem(self,itwrfocimap);
	CreateInvItem(self,itwrocmap);
	CreateInvItem(self,itwrncmap);
	CreateInvItem(self,itwrpsimap);
	CreateInvItem(self,itwrtemplemap);
	CreateInvItem(self,scroll4milten);
	CreateInvItem(self,itmi_orctalisman);
	CreateInvItem(self,goettergabe);
	CreateInvItem(self,geheimnisse_der_zauberei);
	CreateInvItem(self,machtvolle_kunst);
	CreateInvItem(self,elementare_arcanei);
	CreateInvItem(self,wahre_macht);
	CreateInvItem(self,das_magische_erz);
	CreateInvItem(self,schlacht_um_varant1);
	CreateInvItem(self,schlacht_um_varant2);
	CreateInvItem(self,myrtanas_lyrik);
	CreateInvItem(self,lehren_der_goetter1);
	CreateInvItem(self,lehren_der_goetter2);
	CreateInvItem(self,lehren_der_goetter3);
	CreateInvItem(self,jagd_und_beute);
	CreateInvItem(self,kampfkunst);
	CreateInvItem(self,astronomie);
	CreateInvItem(self,rezepturen);
	CreateInvItem(self,rezepturen2);
	CreateInvItem(self,itwr_book_circle_01);
	CreateInvItem(self,itwr_book_circle_02);
	CreateInvItem(self,itwr_book_circle_03);
	CreateInvItem(self,itwr_book_circle_04);
	CreateInvItem(self,itwr_book_circle_05);
	CreateInvItem(self,itwr_book_circle_06);
	CreateInvItem(self,itwrpinup);
	CreateInvItem(self,itwr_golembook1);
	CreateInvItem(self,itwr_golembook2);
	CreateInvItem(self,itwrfokusbuch);
	CreateInvItem(self,thelist);
	CreateInvItem(self,thelistnc);
	CreateInvItem(self,orkparchmentone);
	CreateInvItem(self,orkparchmenttwo);
	CreateInvItem(self,itwr_troll_01);
	CreateInvItem(self,itwr_urkunde_01);
	CreateInvItem(self,itmw_1h_club_01);
	CreateInvItem(self,itmw_1h_poker_01);
	CreateInvItem(self,itmw_1h_sickle_01);
	CreateInvItem(self,itmw_1h_mace_light_01);
	CreateInvItem(self,itmw_1h_sledgehammer_01);
	EquipItem(self,itmw_1h_warhammer_01);
	CreateInvItem(self,itmw_1h_warhammer_02);
	CreateInvItem(self,itmw_1h_warhammer_03);
	CreateInvItem(self,itmw_1h_hatchet_01);
	CreateInvItem(self,itmw_1h_sword_old_01);
	CreateInvItem(self,itmw_1h_nailmace_01);
	CreateInvItem(self,itmw_1h_sword_short_01);
	CreateInvItem(self,itmw_1h_sword_short_02);
	CreateInvItem(self,itmw_1h_sword_short_03);
	CreateInvItem(self,itmw_1h_sword_short_04);
	CreateInvItem(self,itmw_1h_sword_short_05);
	CreateInvItem(self,itmw_1h_axe_old_01);
	CreateInvItem(self,itmw_1h_scythe_01);
	CreateInvItem(self,itmw_2h_staff_01);
	CreateInvItem(self,itmw_2h_staff_02);
	CreateInvItem(self,itmw_2h_staff_03);
	CreateInvItem(self,itmw_1h_mace_01);
	CreateInvItem(self,itmw_1h_mace_02);
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
	CreateInvItem(self,itmw_1h_sword_long_02);
	CreateInvItem(self,itmw_1h_sword_long_03);
	CreateInvItem(self,itmw_1h_sword_long_04);
	CreateInvItem(self,itmw_1h_sword_long_05);
	CreateInvItem(self,itmw_1h_axe_01);
	CreateInvItem(self,itmw_1h_axe_02);
	CreateInvItem(self,itmw_1h_axe_03);
	CreateInvItem(self,itmw_1h_sword_broad_01);
	CreateInvItem(self,itmw_1h_sword_broad_02);
	CreateInvItem(self,itmw_1h_sword_broad_03);
	CreateInvItem(self,itmw_1h_sword_broad_04);
	CreateInvItem(self,itmw_2h_sword_old_01);
	CreateInvItem(self,itmw_1h_sword_bastard_01);
	CreateInvItem(self,itmw_1h_sword_bastard_02);
	CreateInvItem(self,itmw_1h_sword_bastard_03);
	CreateInvItem(self,itmw_1h_sword_bastard_04);
	CreateInvItem(self,itmw_1h_lightguardssword_03);
	CreateInvItem(self,itmw_2h_axe_old_01);
	CreateInvItem(self,itmw_2h_axe_old_02);
	CreateInvItem(self,itmw_2h_axe_old_03);
	CreateInvItem(self,itmw_2h_sword_light_01);
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
	CreateInvItem(self,itmw_2h_sword_heavy_01);
	CreateInvItem(self,itmw_2h_sword_heavy_02);
	CreateInvItem(self,itmw_2h_sword_heavy_03);
	CreateInvItem(self,itmw_2h_sword_heavy_04);
	CreateInvItem(self,itmw_2h_axe_heavy_01);
	CreateInvItem(self,itmw_2h_axe_heavy_02);
	CreateInvItem(self,itmw_2h_axe_heavy_03);
	CreateInvItem(self,itmw_2h_axe_heavy_04);
	CreateInvItem(self,itmw2horcsword01);
	CreateInvItem(self,itmw2horcaxe01);
	CreateInvItem(self,itmw2horcaxe02);
	CreateInvItem(self,itmw2horcaxe03);
	CreateInvItem(self,itmw2horcaxe04);
	CreateInvItem(self,itmw2horcmace01);
	CreateInvItem(self,itmw_skeleton_sword);
	CreateInvItem(self,itmw_skeleton_axe);
	CreateInvItem(self,itmw_skeleton_scythe);
	CreateInvItem(self,itmw_trainsword);
	CreateInvItem(self,whistlers_schwert);
	CreateInvItem(self,torlofs_axt);
	CreateInvItem(self,tr_m_sharky);
	CreateInvItem(self,altesschwert);
	CreateInvItem(self,ulumulu);
	CreateInvItem(self,weltenspalter);
	CreateInvItem(self,lichtbringer);
	CreateInvItem(self,zeitenklinge);
	CreateInvItem(self,daemonenstreich);
	CreateInvItem(self,bannklinge);
	CreateInvItem(self,mythrilklinge);
	CreateInvItem(self,mythrilklinge01);
	CreateInvItem(self,mythrilklinge02);
	CreateInvItem(self,mythrilklinge03);
	CreateInvItem(self,itmi_amulet_psi_01);
	CreateInvItem(self,schutzamulett_waffen);
	CreateInvItem(self,schutzamulett_feuer);
	CreateInvItem(self,schutzamulett_geschosse);
	CreateInvItem(self,schutzamulett_magie);
	CreateInvItem(self,schutzamulett_magie_feuer);
	CreateInvItem(self,schutzamulett_waffen_geschosse);
	CreateInvItem(self,schutzamulett_total);
	CreateInvItem(self,kdw_amulett);
	CreateInvItem(self,gewandtheitsamulett);
	CreateInvItem(self,gewandtheitsamulett2);
	CreateInvItem(self,staerkeamulett);
	CreateInvItem(self,staerkeamulett2);
	CreateInvItem(self,lebensamulett);
	CreateInvItem(self,stone_amulet);
	CreateInvItem(self,amulett_der_magie);
	CreateInvItem(self,amulett_der_macht);
	CreateInvItem(self,amulett_der_erleuchtung);
	CreateInvItem(self,schutzring_feuer1);
	CreateInvItem(self,schutzring_feuer2);
	CreateInvItem(self,schutzring_geschosse1);
	CreateInvItem(self,schutzring_geschosse2);
	CreateInvItem(self,schutzring_waffen1);
	CreateInvItem(self,schutzring_waffen2);
	CreateInvItem(self,schutzring_magie1);
	CreateInvItem(self,schutzring_magie2);
	CreateInvItem(self,schutzring_magie1_fire1);
	CreateInvItem(self,schutzring_magie2_fire2);
	CreateInvItem(self,schutzring_geschosse1_waffen1);
	CreateInvItem(self,schutzring_geschosse1_waffen1);
	CreateInvItem(self,schutzring_geschosse2_waffen2);
	CreateInvItem(self,schutzring_total1);
	CreateInvItem(self,schutzring_total2);
	CreateInvItem(self,ring_des_geschicks);
	CreateInvItem(self,ring_des_geschicks2);
	CreateInvItem(self,ring_des_lebens);
	CreateInvItem(self,ring_des_lebens2);
	CreateInvItem(self,stone_defring);
	CreateInvItem(self,stone_hpring);
	CreateInvItem(self,staerkering);
	CreateInvItem(self,staerkering2);
	CreateInvItem(self,ring_der_magie);
	CreateInvItem(self,ring_der_erleuchtung);
	CreateInvItem(self,machtring);
	CreateInvItem(self,itfo_potion_mana_01);
	CreateInvItem(self,itfo_potion_mana_02);
	CreateInvItem(self,itfo_potion_mana_03);
	CreateInvItem(self,itfo_potion_health_01);
	CreateInvItem(self,itfo_potion_health_02);
	CreateInvItem(self,itfo_potion_health_03);
	CreateInvItem(self,itfo_potion_elixier);
	CreateInvItem(self,itfo_potion_elixier_egg);
	CreateInvItem(self,itfo_potion_strength_01);
	CreateInvItem(self,itfo_potion_strength_02);
	CreateInvItem(self,itfo_potion_strength_03);
	CreateInvItem(self,itfo_potion_dex_01);
	CreateInvItem(self,itfo_potion_dex_02);
	CreateInvItem(self,itfo_potion_dex_03);
	CreateInvItem(self,itfo_potion_health_perma_01);
	CreateInvItem(self,itfo_potion_health_perma_02);
	CreateInvItem(self,itfo_potion_health_perma_03);
	CreateInvItem(self,itfo_potion_mana_perma_01);
	CreateInvItem(self,itfo_potion_mana_perma_02);
	CreateInvItem(self,itfo_potion_mana_perma_03);
	CreateInvItem(self,itfo_potion_master_01);
	CreateInvItem(self,itfo_potion_master_02);
	CreateInvItem(self,itfo_potion_water_01);
	CreateInvItem(self,itfo_potion_haste_01);
	CreateInvItem(self,itfo_potion_haste_02);
	CreateInvItem(self,itfo_potion_haste_03);
	CreateInvItem(self,healthwater);
	CreateInvItem(self,specialwater);
	CreateInvItem(self,orcmedicine);
	CreateInvItems(self,itat_teeth_01,5);
	CreateInvItems(self,itat_wolf_01,5);
	CreateInvItems(self,itat_wolf_02,5);
	CreateInvItems(self,itat_waran_01,5);
	CreateInvItems(self,itat_claws_01,5);
	CreateInvItems(self,itat_crawler_02,5);
	CreateInvItems(self,itat_crawler_01,5);
	CreateInvItems(self,itat_shadow_01,5);
	CreateInvItems(self,itat_shadow_02,5);
	CreateInvItems(self,itat_lurker_01,5);
	CreateInvItems(self,itat_lurker_02,5);
	CreateInvItems(self,itat_troll_02,5);
	CreateInvItems(self,itat_troll_01,5);
	CreateInvItems(self,itat_swampshark_02,5);
	CreateInvItems(self,itat_swampshark_01,5);
	CreateInvItems(self,itat_bloodfly_02,5);
	CreateInvItems(self,itat_bloodfly_01,5);
	CreateInvItems(self,itat_meatbug_01,5);
	CreateInvItem(self,itat_stonegolem_01);
	CreateInvItem(self,itat_firegolem_01);
	CreateInvItem(self,itat_icegolem_01);
	CreateInvItem(self,itat_icegolem_02);
};

