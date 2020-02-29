
instance STT_325_OMID(NPC_DEFAULT)
{
	name[0] = "ќмид";
	npctype = NPCTYPE_AMBIENT;
	guild = GIL_VLK;
	level = 3;
	voice = 2;
	id = 325;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"Hum_Body_CookSmith",0,1,"Hum_Head_Psionic",16,1,-1);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItem(self,itfoapple);
	daily_routine = rtn_start_325;
};


func void rtn_start_325()
{
	ta_cook(8,5,18,5,"OCC_BARONS_RIGHT_ROOM_FRONT");
	ta_cook(18,5,8,5,"OCC_KITCHEN");
};

