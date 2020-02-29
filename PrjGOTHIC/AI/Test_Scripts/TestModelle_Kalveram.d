
instance LUKOR_BUGFIXBOOK(C_ITEM)
{
	name = "Убедить Идола Люкора в режиме сопровождения.";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = uselukor_bugfixbook;
};


func void uselukor_bugfixbook()
{
	var int ndocid;
	var C_NPC bugfix_baallukor;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"Убедить Идола Люкора.");
	Doc_PrintLine(ndocid,0,"В режиме сопровождения.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"");
	Doc_Show(ndocid);
	bugfix_baallukor = Hlp_GetNpc(gur_1211_baallukor);
	Npc_ExchangeRoutine(bugfix_baallukor,"Follow");
	Npc_RemoveInvItem(hero,lukor_bugfixbook);
	Wld_RemoveItem(lukor_bugfixbook);
};


instance LESTER_BUGFIXBOOK(C_ITEM)
{
	name = "Отправить Лестера домой.";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = uselester_bugfixbook;
};


func void uselester_bugfixbook()
{
	var int ndocid;
	var C_NPC bugfix_lester;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
	Doc_SetFont(ndocid,-1,"font_10_book.tga");
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"Zwinge Baal Lukor");
	Doc_PrintLine(ndocid,0,"in den Followmode");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"");
	Doc_Show(ndocid);
	bugfix_lester = Hlp_GetNpc(pc_psionic);
	Npc_ExchangeRoutine(bugfix_lester,"start");
	Npc_RemoveInvItem(hero,lester_bugfixbook);
	Wld_RemoveItem(lester_bugfixbook);
};


instance STT_TEST_SCHATTEN(NPC_TESTDEFAULT)
{
	name[0] = "Testschatten";
	guild = GIL_STT;
	level = 13;
	voice = 12;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 196;
	attribute[ATR_HITPOINTS] = 196;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Pony",55,1,stt_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKPOCKET,1);
	Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,1);
	Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	CreateInvItem(self,itmw_1h_sword_01);
	CreateInvItem(self,itrw_bow_small_02);
	CreateInvItems(self,itamarrow,10);
	CreateInvItems(self,itfo_potion_water_01,4);
	CreateInvItems(self,itfoapple,5);
	CreateInvItems(self,itfobeer,3);
	CreateInvItems(self,itfo_potion_health_01,4);
	start_aistate = zs_testhangaround;
};

instance GRD_TEST_GARDIST(NPC_TESTDEFAULT)
{
	name[0] = NAME_GARDIST;
	npctype = NPCTYPE_GUARD;
	guild = GIL_GRD;
	level = 10;
	voice = 7;
	attribute[ATR_STRENGTH] = 35;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",19,1,grd_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItem(self,itmw_1h_sword_01);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	start_aistate = zs_testhangaround;
};

instance VLK_TEST_BUDDLER(NPC_TESTDEFAULT)
{
	name[0] = NAME_BUDDLER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_VLK;
	level = 2;
	voice = 1;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,0,"Hum_Head_FatBald",0,1,vlk_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItem(self,itmw_1h_nailmace_01);
	CreateInvItem(self,itmwpickaxe);
	CreateInvItem(self,itfoloaf);
	CreateInvItem(self,itfobeer);
	CreateInvItem(self,itlstorch);
	start_aistate = zs_testhangaround;
};

instance SLD_TEST_SOELDNER(NPC_TESTDEFAULT)
{
	name[0] = NAME_SOELDNER;
	npctype = NPCTYPE_GUARD;
	guild = GIL_SLD;
	level = 10;
	voice = 7;
	attribute[ATR_STRENGTH] = 35;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",19,1,sld_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItem(self,itmw_1h_sword_01);
	CreateInvItem(self,itfoapple);
	CreateInvItems(self,itminugget,10);
	start_aistate = zs_guard;
};

instance SFB_TEST_SCHUERFER(NPC_TESTDEFAULT)
{
	name[0] = NAME_SCHUERFER;
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_SFB;
	level = 2;
	voice = 1;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,0,"Hum_Head_FatBald",0,1,sfb_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItem(self,itmw_1h_nailmace_01);
	CreateInvItem(self,itmwpickaxe);
	CreateInvItem(self,itfoloaf);
	CreateInvItem(self,itfobeer);
	CreateInvItem(self,itlstorch);
	start_aistate = zs_pickore;
};

