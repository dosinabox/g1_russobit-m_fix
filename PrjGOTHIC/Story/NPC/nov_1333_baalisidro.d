
instance NOV_1333_BAALISIDRO(NPC_DEFAULT)
{
	name[0] = "ָהמכ ָסטהנמ";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NOV;
	level = 9;
	voice = 3;
	id = 1333;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 148;
	attribute[ATR_HITPOINTS] = 148;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_FatBald",29,2,nov_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_axe_old_01);
	CreateInvItems(self,itmijoint_1,10);
	CreateInvItems(self,itmijoint_2,20);
	CreateInvItems(self,itmijoint_3,20);
	daily_routine = rtn_start_1333;
};


func void rtn_start_1333()
{
	ta_sitaround(8,0,20,0,"NC_TAVERN_SIT2");
	ta_sitaround(20,0,8,0,"NC_TAVERN_SIT2");
};

