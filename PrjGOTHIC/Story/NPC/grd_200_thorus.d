
instance GRD_200_THORUS(NPC_DEFAULT)
{
	name[0] = "Торус";
	npctype = NPCTYPE_FRIEND;
	guild = GIL_GRD;
	level = 50;
	voice = 9;
	id = 200;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 280;
	attribute[ATR_HITPOINTS] = 280;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_Fighter",12,0,grd_armor_h);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,thorus_schwert);
	EquipItem(self,itrw_crossbow_01);
	CreateInvItems(self,itambolt,30);
	CreateInvItems(self,itminugget,200);
	CreateInvItem(self,itfo_potion_health_02);
	CreateInvItem(self,itlstorch);
	daily_routine = rtn_start_200;
};


func void rtn_start_200()
{
	ta_boss(8,0,23,0,"OCR_THORUS");
	ta_sleep(23,0,8,0,"OCC_BARONS_UPPER_RIGHT_ROOM_BED1");
};

