
instance ORC_PRIEST_1(NPC_DEFAULT)
{
	name[0] = "������-�����";
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORCSHAMAN;
	level = 400;
	voice = 17;
	id = 2995;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"UOS_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	Mdl_ApplyOverlayMds(self,"Orc_Shaman.mds");
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	attribute[ATR_STRENGTH] = 30;
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
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,8);
	EquipItem(self,itrwudorcstaff);
	EquipItem(self,weltenspalter);
	CreateInvItem(self,itarrune_5_7_pyrokinesis);
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
	name[0] = "������-������";
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORCSHAMAN;
	level = 400;
	voice = 17;
	id = 2996;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"UOS_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	Mdl_ApplyOverlayMds(self,"Orc_Shaman.mds");
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	attribute[ATR_STRENGTH] = 30;
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
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,8);
	EquipItem(self,itrwudorcstaff);
	EquipItem(self,lichtbringer);
	CreateInvItem(self,itarrune_3_2_thunderball);
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
	name[0] = "������-��������";
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORCSHAMAN;
	level = 400;
	voice = 17;
	id = 2997;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"UOS_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	Mdl_ApplyOverlayMds(self,"Orc_Shaman.mds");
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	attribute[ATR_STRENGTH] = 30;
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
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,8);
	EquipItem(self,itrwudorcstaff);
	EquipItem(self,zeitenklinge);
	CreateInvItem(self,itarrune_3_5_chainlightning);
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
	name[0] = "������-�����";
	npctype = NPCTYPE_MAIN;
	guild = GIL_ORCSHAMAN;
	level = 400;
	voice = 17;
	id = 2998;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"UOS_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	Mdl_ApplyOverlayMds(self,"Orc_Shaman.mds");
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	attribute[ATR_STRENGTH] = 30;
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
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,8);
	EquipItem(self,itrwudorcstaff);
	EquipItem(self,daemonenstreich);
	CreateInvItem(self,itarrune_2_3_firestorm);
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
	name[0] = "����-������-������";
	npctype = NPCTYPE_FRIEND;
	guild = GIL_ORCSHAMAN;
	level = 500;
	voice = 17;
	id = 2999;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"UOS_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	Mdl_ApplyOverlayMds(self,"Orc_Shaman.mds");
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	attribute[ATR_STRENGTH] = 30;
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
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,8);
	EquipItem(self,itrwudorcstaff);
	EquipItem(self,bannklinge);
	CreateInvItem(self,itarrune_6_3_breathofdeath);
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

