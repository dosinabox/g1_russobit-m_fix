
instance SLD_738_SOELDNER(NPC_DEFAULT)
{
	name[0] = NAME_SOELDNER;
	npctype = NPCTYPE_GUARD;
	guild = GIL_SLD;
	level = 16;
	voice = 8;
	id = 728;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 55;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 232;
	attribute[ATR_HITPOINTS] = 232;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",53,1,sld_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,itmw_1h_mace_war_03);
	CreateInvItem(self,itforice);
	CreateInvItem(self,itfobooze);
	CreateInvItem(self,itmi_stuff_barbknife_01);
	CreateInvItems(self,itminugget,15);
	daily_routine = rtn_start_738;
};


func void rtn_start_738()
{
	ta_guardwheelopen(7,55,19,55,"NC_MAINGATE_VWHEEL");
	ta_guardwheelopen(19,55,7,55,"NC_MAINGATE_VWHEEL");
};

