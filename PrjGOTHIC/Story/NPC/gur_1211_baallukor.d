
instance GUR_1211_BAALLUKOR(NPC_DEFAULT)
{
	name[0] = "ָהמכ ֻ‏ךמנ";
	npctype = NPCTYPE_FRIEND;
	flags = NPC_FLAG_IMMORTAL;
	guild = GIL_GUR;
	level = 50;
	voice = 13;
	id = 1211;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 388;
	attribute[ATR_HITPOINTS] = 388;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",20,1,gur_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,-1);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	EquipItem(self,itmw_1h_sword_02);
	daily_routine = rtn_start_1211;
	fight_tactic = FAI_HUMAN_STRONG;
};


func void rtn_start_1211()
{
	ta_guard(23,0,16,0,"GRYD_025");
	ta_guard(16,0,23,0,"GRYD_025");
};

func void rtn_follow_1211()
{
	ta_followpc(23,0,16,0,"GRYD_025");
	ta_followpc(16,0,23,0,"GRYD_025");
};

func void rtn_waitinsidetunnelone_1211()
{
	ta_stay(23,0,16,0,"GRYD_040");
	ta_stay(16,0,23,0,"GRYD_040");
};

func void rtn_waitinsidetunneltwo_1211()
{
	ta_stay(23,0,16,0,"GRYD_047");
	ta_stay(16,0,23,0,"GRYD_047");
};

func void rtn_door_1211()
{
	ta_stay(23,0,16,0,"GRYD_060");
	ta_stay(16,0,23,0,"GRYD_060");
};

func void rtn_teleport_1211()
{
	ta_followpc(23,0,16,0,"GRYD_060");
	ta_followpc(16,0,23,0,"GRYD_060");
};

func void rtn_meditate_1211()
{
	ta_meditate(23,0,16,0,"GRYD_082");
	ta_meditate(16,0,23,0,"GRYD_082");
};

