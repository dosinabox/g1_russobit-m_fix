
instance SLD_737_TORLOF(NPC_DEFAULT)
{
	name[0] = "Торлоф";
	npctype = NPCTYPE_MAIN;
	guild = GIL_SLD;
	level = 19;
	voice = 4;
	id = 737;
	attribute[ATR_STRENGTH] = 95;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 268;
	attribute[ATR_HITPOINTS] = 268;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Pony",53,1,sld_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	EquipItem(self,torlofs_axt);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	CreateInvItems(self,itforice,8);
	CreateInvItems(self,itfoloaf,5);
	CreateInvItems(self,itfomutton,4);
	CreateInvItems(self,itminugget,15);
	CreateInvItems(self,itfobooze,5);
	CreateInvItems(self,itlstorch,5);
	CreateInvItems(self,itfo_potion_health_02,7);
	CreateInvItem(self,itmi_stuff_barbknife_01);
	CreateInvItem(self,itmi_stuff_mug_01);
	daily_routine = rtn_start_737;
};


func void rtn_start_737()
{
	ta_smalltalk(8,0,23,0,"NC_HUT04_OUT");
	ta_boss(23,0,1,15,"NC_HUT04_OUT");
	ta_sleep(1,15,8,0,"NC_HUT04_IN");
};

