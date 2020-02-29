
instance GUR_1212_MADCORKALOM(NPC_DEFAULT)
{
	name[0] = "Безумный Кор Галом";
	npctype = NPCTYPE_MAIN;
	guild = GIL_GUR;
	level = 1000;
	voice = 10;
	id = 1212;
	flags = 0;
	aivar[43] = TRUE;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_MANA_MAX] = 500;
	attribute[ATR_MANA] = 500;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	protection[PROT_BLUNT] = 500;
	protection[PROT_EDGE] = 500;
	protection[PROT_POINT] = 500;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 80;
	protection[PROT_MAGIC] = 60;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,0,"Hum_Head_Psionic",19,0,gur_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	EquipItem(self,kaloms_schwert);
	CreateInvItems(self,itarrunepyrokinesis,1);
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	senses_range = 2000;
	daily_routine = rtn_ot_1212;
	fight_tactic = FAI_HUMAN_MAGE;
};


func void rtn_start_1212()
{
	ta_stay(15,0,22,0,"TPL_408");
	ta_stay(22,0,15,0,"TPL_408");
};

func void rtn_ot_1212()
{
	ta_interceptmadcorkalom(15,0,22,0,"TPL_390");
	ta_interceptmadcorkalom(22,0,15,0,"TPL_390");
};

