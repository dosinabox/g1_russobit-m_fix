
instance GUR_1210_BAALTYON(NPC_DEFAULT)
{
	name[0] = "���� ����";
	npctype = NPCTYPE_FRIEND;
	guild = GIL_GUR;
	level = 28;
	flags = NPC_FLAG_IMMORTAL;
	voice = 11;
	id = 1210;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 50;
	attribute[ATR_MANA] = 50;
	attribute[ATR_HITPOINTS_MAX] = 376;
	attribute[ATR_HITPOINTS] = 376;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",24,2,gur_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	CreateInvItem(self,itarrunewindfist);
	daily_routine = rtn_start_1210;
	fight_tactic = FAI_HUMAN_MAGE;
};


func void rtn_start_1210()
{
	ta_teaching(16,0,23,0,"PSI_TEMPLE_COURT_GURU");
	ta_teaching(23,0,16,0,"PSI_TEMPLE_COURT_GURU");
};

func void rtn_prepareritual_1210()
{
	ta_sitaround(16,0,23,0,"PSI_TEMPLE_IN_05");
	ta_sitaround(23,0,16,0,"PSI_TEMPLE_IN_05");
};

func void rtn_omfull_1210()
{
	ta_sitaround(16,0,23,0,"PSI_TEMPLE_IN_05");
	ta_sitaround(23,0,16,0,"PSI_TEMPLE_IN_05");
};

func void rtn_fmtaken_1210()
{
	ta_sitaround(16,0,23,0,"PSI_TEMPLE_IN_05");
	ta_sitaround(23,0,16,0,"PSI_TEMPLE_IN_05");
};

func void rtn_orcassault_1210()
{
	ta_sitaround(16,0,23,0,"PSI_TEMPLE_IN_05");
	ta_sitaround(23,0,16,0,"PSI_TEMPLE_IN_05");
};

