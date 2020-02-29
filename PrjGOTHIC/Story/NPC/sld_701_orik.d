
instance SLD_701_ORIK(NPC_DEFAULT)
{
	name[0] = "Орик";
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_SLD;
	level = 18;
	voice = 12;
	id = 701;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 70;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 256;
	attribute[ATR_HITPOINTS] = 256;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",8,0,sld_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,oriks_axt);
	EquipItem(self,itrw_bow_long_01);
	CreateInvItems(self,itamarrow,20);
	CreateInvItems(self,itminugget,19);
	CreateInvItems(self,itfo_potion_health_02,9);
	CreateInvItem(self,orik_key);
	daily_routine = rtn_start_701;
};


func void rtn_start_701()
{
	ta_smalltalk(7,0,19,0,"NC_SMALL_CAVE_CENTER");
	ta_boss(19,0,0,0,"NC_HUT05_OUT");
	ta_sleep(0,0,7,0,"NC_HUT05_IN");
};

