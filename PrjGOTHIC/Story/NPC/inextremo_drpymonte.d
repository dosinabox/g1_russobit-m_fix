
instance INEXTREMO_DRPYMONTE(NPC_DEFAULT)
{
	name[0] = "Др.Пимонт";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 4;
	voice = 11;
	id = 390;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"HUM_IE_PYMONTE_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_PYMONTE",DEFAULT,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	daily_routine = rtn_concert_390;
};


func void rtn_concert_390()
{
	ta_iepymonte(8,0,20,0,"OCR_IE_PYMONTE");
	ta_iepymonte(20,0,8,0,"OCR_IE_PYMONTE");
};

func void rtn_off_390()
{
	ta_stay(8,0,20,0,"NOWHERE");
	ta_stay(20,0,8,0,"NOWHERE");
};


instance INEXTREMO_THEFLAIL(NPC_DEFAULT)
{
	name[0] = "Кубок";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 4;
	flags = 0;
	voice = 11;
	id = 391;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"HUM_IE_FLAIL_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_FLAIL",DEFAULT,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	daily_routine = rtn_concert_391;
};


func void rtn_concert_391()
{
	ta_ieflail(8,0,20,0,"OCR_IE_FLAIL");
	ta_ieflail(20,0,8,0,"OCR_IE_FLAIL");
};

func void rtn_off_391()
{
	ta_stay(8,0,20,0,"NOWHERE");
	ta_stay(20,0,8,0,"NOWHERE");
};


instance INEXTREMO_THOMASTHEFORGER(NPC_DEFAULT)
{
	name[0] = "Томас";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 4;
	flags = 0;
	voice = 11;
	id = 392;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"HUM_IE_THOMAS_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_THOMAS",DEFAULT,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	daily_routine = rtn_concert_392;
};


func void rtn_concert_392()
{
	ta_iethomas(8,0,20,0,"OCR_IE_THOMAS");
	ta_iethomas(20,0,8,0,"OCR_IE_THOMAS");
};

func void rtn_off_392()
{
	ta_stay(8,0,20,0,"NOWHERE");
	ta_stay(20,0,8,0,"NOWHERE");
};


instance INEXTREMO_UNICORN(NPC_DEFAULT)
{
	name[0] = "Юникорн";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 4;
	flags = 0;
	voice = 11;
	id = 393;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"HUM_IE_UNICORN_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_UNICORN",DEFAULT,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	daily_routine = rtn_concert_393;
};


func void rtn_concert_393()
{
	ta_ieunicorn(8,0,20,0,"OCR_IE_UNICORN");
	ta_ieunicorn(20,0,8,0,"OCR_IE_UNICORN");
};

func void rtn_off_393()
{
	ta_stay(8,0,20,0,"NOWHERE");
	ta_stay(20,0,8,0,"NOWHERE");
};


instance INEXTREMO_YELLOWPFEIFFER(NPC_DEFAULT)
{
	name[0] = "Желтый курильщик";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 4;
	flags = 0;
	voice = 11;
	id = 394;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"Hum_IE_Pfeiffer_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_Pfeiffer",DEFAULT,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	daily_routine = rtn_concert_394;
};


func void rtn_concert_394()
{
	ta_iepfeiffer(8,0,20,0,"OCR_IE_PFEIFFER");
	ta_iepfeiffer(20,0,8,0,"OCR_IE_PFEIFFER");
};

func void rtn_off_394()
{
	ta_stay(8,0,20,0,"NOWHERE");
	ta_stay(20,0,8,0,"NOWHERE");
};


instance INEXTREMO_LUTTER(NPC_DEFAULT)
{
	name[0] = "Латтер";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 4;
	voice = 11;
	id = 395;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"Hum_IE_Lutter_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_Lutter",DEFAULT,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	daily_routine = rtn_concert_395;
};


func void rtn_concert_395()
{
	ta_ielutter(8,0,20,0,"OCR_IE_LUTTER");
	ta_ielutter(20,0,8,0,"OCR_IE_LUTTER");
};

func void rtn_off_395()
{
	ta_stay(8,0,20,0,"NOWHERE");
	ta_stay(20,0,8,0,"NOWHERE");
};


instance INEXTREMO_FLEX(NPC_DEFAULT)
{
	name[0] = "Флекс";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 4;
	flags = 0;
	voice = 11;
	id = 396;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"Hum_IE_Flex_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_Flex",DEFAULT,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	daily_routine = rtn_concert_396;
};


func void rtn_concert_396()
{
	ta_ieflex(8,0,20,0,"OCR_IE_FLEX");
	ta_ieflex(20,0,8,0,"OCR_IE_FLEX");
};

func void rtn_off_396()
{
	ta_stay(8,0,20,0,"NOWHERE");
	ta_stay(20,0,8,0,"NOWHERE");
};


instance IE_397_ANNOUNCER(NPC_DEFAULT)
{
	name[0] = "Стив";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 4;
	voice = 11;
	id = 397;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"Hum_Body_Naked0",4,3,"Hum_Head_Fatbald",113,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	daily_routine = rtn_announce_397;
};


func void rtn_announce_397()
{
	ta_stay(8,0,20,0,"OCR_AUDIENCE_02");
	ta_stay(20,0,8,0,"OCR_AUDIENCE_02");
};

func void rtn_concert_397()
{
	ta_firespit(8,0,20,0,"OCR_AUDIENCE_02");
	ta_firespit(20,0,8,0,"OCR_AUDIENCE_02");
};

func void rtn_off_397()
{
	ta_stay(8,0,20,0,"NOWHERE");
	ta_stay(20,0,8,0,"NOWHERE");
};


instance CHARLOTTE(NPC_DEFAULT)
{
	name[0] = "Шарлотта";
	npctype = NPCTYPE_MAIN;
	guild = GIL_BAB;
	level = 1;
	voice = 16;
	id = 398;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 5;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	Mdl_SetVisual(self,"BABE.MDS");
	Mdl_SetVisualBody(self,"Bab_body_Naked0",0,2,"Bab_Head_Hair1",0,DEFAULT,-1);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = rtn_announce_398;
};


func void rtn_announce_398()
{
	ta_stay(8,0,20,0,"OCR_AUDIENCE_03");
	ta_stay(20,0,8,0,"OCR_AUDIENCE_03");
};

func void rtn_concert_398()
{
	ta_charlotte_dance(8,0,20,0,"OCR_AUDIENCE_03");
	ta_charlotte_dance(20,0,8,0,"OCR_AUDIENCE_03");
};

func void rtn_off_398()
{
	ta_stay(8,0,20,0,"NOWHERE");
	ta_stay(20,0,8,0,"NOWHERE");
};


instance IEFAN1(NPC_DEFAULT)
{
	name[0] = NAME_BUDDLER;
	npctype = NPCTYPE_MAIN;
	guild = GIL_VLK;
	level = 5;
	voice = 2;
	id = 399;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_FatBald",74,DEFAULT,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nailmace_01);
	CreateInvItem(self,itfoloaf);
	CreateInvItem(self,itfobeer);
	daily_routine = rtn_concert_399;
};


func void rtn_concert_399()
{
	ta_watchinextremo(8,0,20,0,"OCR_CROWD_01");
	ta_watchinextremo(20,0,8,0,"OCR_CROWD_01");
};

func void rtn_off_399()
{
	ta_stay(8,0,20,0,"NOWHERE");
	ta_stay(20,0,8,0,"NOWHERE");
};


instance IEFAN2(NPC_DEFAULT)
{
	name[0] = NAME_BUDDLER;
	npctype = NPCTYPE_MAIN;
	guild = GIL_VLK;
	level = 5;
	voice = 2;
	id = 400;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_FatBald",73,DEFAULT,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItem(self,itfoloaf);
	CreateInvItem(self,itfobeer);
	daily_routine = rtn_concert_400;
};


func void rtn_concert_400()
{
	ta_watchinextremo(8,0,20,0,"OCR_CROWD_02");
	ta_watchinextremo(20,0,8,0,"OCR_CROWD_02");
};

func void rtn_off_400()
{
	ta_stay(8,0,20,0,"NOWHERE");
	ta_stay(20,0,8,0,"NOWHERE");
};


instance IEFAN3(NPC_DEFAULT)
{
	name[0] = NAME_BUDDLER;
	npctype = NPCTYPE_MAIN;
	guild = GIL_VLK;
	level = 5;
	voice = 2;
	id = 401;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,0,"Hum_Head_FatBald",10,DEFAULT,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nailmace_01);
	CreateInvItem(self,itfoloaf);
	CreateInvItem(self,itfobeer);
	daily_routine = rtn_concert_401;
};


func void rtn_concert_401()
{
	ta_watchinextremo(8,0,20,0,"OCR_CROWD_03");
	ta_watchinextremo(20,0,8,0,"OCR_CROWD_03");
};

func void rtn_off_401()
{
	ta_stay(8,0,20,0,"NOWHERE");
	ta_stay(20,0,8,0,"NOWHERE");
};


instance IEFAN4(NPC_DEFAULT)
{
	name[0] = NAME_BUDDLER;
	npctype = NPCTYPE_MAIN;
	guild = GIL_VLK;
	level = 5;
	voice = 2;
	id = 402;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_FatBald",4,DEFAULT,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItem(self,itfoloaf);
	CreateInvItem(self,itfobeer);
	daily_routine = rtn_concert_402;
};


func void rtn_concert_402()
{
	ta_watchinextremo(8,0,20,0,"OCR_CROWD_04");
	ta_watchinextremo(20,0,8,0,"OCR_CROWD_04");
};

func void rtn_off_402()
{
	ta_stay(8,0,20,0,"NOWHERE");
	ta_stay(20,0,8,0,"NOWHERE");
};

