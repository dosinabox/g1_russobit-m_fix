
instance ORC_PRIEST_1(NPC_DEFAULT)
{
	name[0] = "Варраг-Хашор";
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORCSHAMAN;
	level = 800;
	voice = 17;
	id = 2995;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"UOS_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 25;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 0;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	CreateInvItem(self,itrworcstaff);
	CreateInvItem(self,weltenspalter);
	CreateInvItem(self,itarrunepyrokinesis);
	daily_routine = rtn_prestart_2995;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	fight_tactic = FAI_HUMAN_MAGE;
	aivar[AIV_TALKBEFOREATTACK] = TRUE;
};


func void rtn_prestart_2995()
{
	ta_intercept(7,0,12,0,"TPL_058");
	ta_intercept(12,0,7,0,"TPL_058");
};


instance ORC_PRIEST_2(NPC_DEFAULT)
{
	name[0] = "Варраг-Казорг";
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORCSHAMAN;
	level = 800;
	voice = 17;
	id = 2996;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"UOS_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 25;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 1000;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	CreateInvItem(self,itrwudorcstaff);
	CreateInvItem(self,lichtbringer);
	CreateInvItem(self,itarrunethunderball);
	daily_routine = rtn_prestart_2996;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	fight_tactic = FAI_HUMAN_MAGE;
	aivar[AIV_TALKBEFOREATTACK] = TRUE;
};


func void rtn_prestart_2996()
{
	ta_intercept(7,0,12,0,"TPL_096");
	ta_intercept(12,0,7,0,"TPL_096");
};


instance ORC_PRIEST_3(NPC_DEFAULT)
{
	name[0] = "Варраг-Унхилькт";
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORCSHAMAN;
	level = 800;
	voice = 17;
	id = 2997;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"UOS_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 25;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 1000;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	CreateInvItem(self,itrwudorcstaff);
	CreateInvItem(self,zeitenklinge);
	CreateInvItem(self,itarrunechainlightning);
	daily_routine = rtn_prestart_2997;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	fight_tactic = FAI_HUMAN_MAGE;
	aivar[AIV_TALKBEFOREATTACK] = TRUE;
};


func void rtn_prestart_2997()
{
	ta_intercept(7,0,12,0,"TPL_124");
	ta_intercept(12,0,7,0,"TPL_124");
};


instance ORC_PRIEST_4(NPC_DEFAULT)
{
	name[0] = "Варраг-Руушк";
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORCSHAMAN;
	level = 800;
	voice = 17;
	id = 2998;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"UOS_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 1000;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	CreateInvItem(self,itrwudorcstaff);
	CreateInvItem(self,daemonenstreich);
	CreateInvItem(self,itarrunefirestorm);
	daily_routine = rtn_prestart_2998;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	senses_range = 1000;
	fight_tactic = FAI_HUMAN_MAGE;
	aivar[AIV_TALKBEFOREATTACK] = TRUE;
};


func void rtn_prestart_2998()
{
	ta_intercept(7,0,12,0,"TPL_193");
	ta_intercept(12,0,7,0,"TPL_193");
};


instance ORC_PRIEST_5(NPC_DEFAULT)
{
	name[0] = "Граш-Варраг-Арушат";
	npctype = NPCTYPE_FRIEND;
	guild = GIL_ORCSHAMAN;
	level = 1000;
	voice = 17;
	id = 2999;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"UOS_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 500;
	attribute[ATR_MANA] = 500;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	protection[PROT_BLUNT] = 1000;
	protection[PROT_EDGE] = 1000;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 1000;
	protection[PROT_FLY] = 1000;
	protection[PROT_MAGIC] = 100;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	CreateInvItem(self,itrwudorcstaff);
	CreateInvItem(self,bannklinge);
	CreateInvItem(self,itarrunebreathofdeath);
	daily_routine = rtn_prestart_2999;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	fight_tactic = FAI_HUMAN_MAGE;
	aivar[AIV_SPECIALCOMBATDAMAGEREACTION] = TRUE;
	aivar[AIV_TALKBEFOREATTACK] = TRUE;
};


func void rtn_prestart_2999()
{
	ta_intercept(7,0,12,0,"TPL_300");
	ta_intercept(12,0,7,0,"TPL_300");
};

