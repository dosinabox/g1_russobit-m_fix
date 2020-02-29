
instance NON_1500_GILBERT(NPC_DEFAULT)
{
	name[0] = "Гилберт";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 4;
	voice = 4;
	id = 1500;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 148;
	attribute[ATR_HITPOINTS] = 148;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,0,"Hum_Head_Thief",16,1,vlk_armor_l);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_1h_axe_old_01);
	CreateInvItems(self,itkelockpick,5);
	CreateInvItems(self,itmiscoop,1);
	CreateInvItems(self,itmihammer,1);
	CreateInvItems(self,itmistomper,1);
	CreateInvItems(self,itmiswordraw,3);
	CreateInvItems(self,itmilute,1);
	CreateInvItems(self,itlstorch,4);
	CreateInvItems(self,itmi_stuff_barbknife_01,1);
	CreateInvItems(self,itmi_stuff_oldcoin_02,17);
	CreateInvItems(self,itmi_stuff_cup_01,1);
	CreateInvItems(self,itmi_stuff_pan_01,1);
	CreateInvItems(self,itmi_stuff_mug_01,1);
	CreateInvItems(self,itfobeer,3);
	CreateInvItems(self,itfocheese,5);
	CreateInvItems(self,itfomutton,4);
	CreateInvItems(self,itfoloaf,2);
	daily_routine = rtn_start_1500;
};


func void rtn_start_1500()
{
	ta_sitaround(22,0,5,0,"LOCATION_01_07");
	ta_sitaround(5,0,22,0,"LOCATION_01_07");
};

