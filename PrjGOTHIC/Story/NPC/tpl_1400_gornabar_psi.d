
instance TPL_1400_GORNABAR_PSI(NPC_DEFAULT)
{
	name[0] = "Гор На Бар";
	npctype = NPCTYPE_MAIN;
	guild = GIL_TPL;
	level = 17;
	flags = 0;
	voice = 9;
	id = 14001;
	attribute[ATR_STRENGTH] = 85;
	attribute[ATR_DEXTERITY] = 65;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 244;
	attribute[ATR_HITPOINTS] = 244;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,2,"Hum_Head_FatBald",16,1,tpl_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	CreateInvItem(self,itmi_amulet_psi_01);
	EquipItem(self,itmw_2h_sword_light_03);
	CreateInvItem(self,itfosoup);
	CreateInvItem(self,itmijoint_3);
	CreateInvItem(self,itlstorch);
	daily_routine = rtn_start_14001;
};


func void rtn_start_14001()
{
	ta_smalltalk(8,0,23,0,"PSI_24_HUT_EX_SMALLTALK");
	ta_smalltalk(23,0,8,0,"PSI_24_HUT_EX_SMALLTALK");
};

func void rtn_namib_14001()
{
	ta_smalltalk(8,0,23,0,"PSI_GUARD_TREE_EX");
	ta_smalltalk(23,0,8,0,"PSI_GUARD_TREE_EX");
};

instance INFO_GORNABAR_EXIT(C_INFO)
{
	npc = tpl_1400_gornabar_psi;
	nr = 999;
	condition = info_raeubers_exit_condition;
	information = info_raeubers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

