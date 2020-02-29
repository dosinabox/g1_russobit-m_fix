
instance NOV_1330_BAALPARVEZ(NPC_DEFAULT)
{
	name[0] = "ָהמכ ֿאנגוח";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NOV;
	level = 18;
	voice = 10;
	id = 1330;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 50;
	attribute[ATR_MANA] = 50;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",25,2,nov_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_mace_04);
	CreateInvItem(self,itmi_stuff_oldcoin_01);
	CreateInvItems(self,itminugget,50);
	CreateInvItems(self,itfo_potion_health_03,1);
	CreateInvItems(self,itforice,1);
	daily_routine = rtn_start_1330;
};


func void rtn_start_1330()
{
	ta_sleep(22,35,7,45,"OCR_HUT_59");
	ta_washself(7,45,8,0,"OCR_WASH_8");
	ta_standaround(8,0,22,35,"OCR_MARKETPLACE_HANGAROUND");
};

func void rtn_guide_1330()
{
	ta_guidepc(8,0,20,0,"PATH_OC_PSI_18");
	ta_guidepc(20,0,8,0,"PATH_OC_PSI_18");
};

func void rtn_dead_1330()
{
	ta_stay(8,0,20,0,"OCC_CELLAR_BAN_ROOM_1");
	ta_stay(20,0,8,0,"OCC_CELLAR_BAN_ROOM_1");
};

