
instance GUR_1208_BAALCADAR(NPC_DEFAULT)
{
	name[0] = "Идол Кадар";
	npctype = NPCTYPE_MAIN;
	guild = GIL_GUR;
	level = 28;
	voice = 2;
	id = 1208;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 1;
	attribute[ATR_DEXTERITY] = 1;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 376;
	attribute[ATR_HITPOINTS] = 376;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",20,1,gur_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,4);
	EquipItem(self,itarrunewindfist);
	b_give_baalcadarchapter1runes();
	fight_tactic = FAI_HUMAN_MAGE;
	daily_routine = rtn_start_1208;
};


func void rtn_start_1208()
{
	ta_sleep(2,0,8,0,"PSI_23_HUT_IN");
	ta_teaching(8,0,2,0,"PSI_TEACH_CADAR");
};

func void rtn_ch3_1208()
{
	ta_sleep(23,30,8,0,"PSI_23_HUT_IN");
	ta_stay(8,0,12,0,"PSI_TEACH_CADAR");
	ta_smalltalk(12,0,23,30,"PSI_TEACH_CADAR");
};

