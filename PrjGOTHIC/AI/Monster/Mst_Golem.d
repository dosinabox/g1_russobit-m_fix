
prototype MST_DEFAULT_GOLEM(C_NPC)
{
	name[0] = "Голем";
	guild = GIL_GOLEM;
	level = 100;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 9999;
	protection[PROT_EDGE] = 9999;
	protection[PROT_POINT] = 9999;
	protection[PROT_FIRE] = 9999;
	protection[PROT_FLY] = 9999;
	protection[PROT_MAGIC] = 9999;
	damagetype = DAM_FLY;
	fight_tactic = FAI_GOLEM;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 2000;
	aivar[AIV_FINDABLE] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 1500;
	aivar[AIV_BEENATTACKED] = 1500;
	aivar[AIV_HIGHWAYMEN] = 1500;
	aivar[AIV_HAS_ERPRESSED] = 0;
	aivar[AIV_BEGGAR] = 5;
	aivar[AIV_OBSERVEINTRUDER] = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_HASBEENDEFEATEDINPORTALROOM] = ONLYROUTINE;
};

func void set_stonegolem_visuals()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_SetVisualBody(self,"Gol_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void set_firegolem_visuals()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_ApplyOverlayMds(self,"Golem_Firegolem.mds");
	Mdl_SetVisualBody(self,"Gol_Fire_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void set_icegolem_visuals()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_ApplyOverlayMds(self,"Golem_Icegolem.mds");
	Mdl_SetVisualBody(self,"Gol_Ice_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance STONEGOLEM(MST_DEFAULT_GOLEM)
{
	name[0] = "Каменный голем";
	aivar[AIV_IMPORTANT] = id_stonegolem;
	protection[PROT_BLUNT] = 75;
	set_stonegolem_visuals();
	CreateInvItem(self,itat_stonegolem_01);
	Npc_SetToFistMode(self);
};

instance SUMMONEDBYPC_STONEGOLEM(MST_DEFAULT_GOLEM)
{
	name[0] = "Призванный голем";
	aivar[AIV_IMPORTANT] = ID_STONEGOLEM;
	level = 0;
	set_stonegolem_visuals();
	Npc_SetToFistMode(self);
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 75;
	senses = SENSE_HEAR | SENSE_SEE;
	start_aistate = zs_mm_summonedbypc;
	aivar[AIV_HASDEFEATEDSC] = 400;
	aivar[AIV_ISLOOKING] = 2;
	aivar[AIV_MOVINGMOB] = TRUE;
};

instance SUMMONEDBYNPC_STONEGOLEM(MST_DEFAULT_GOLEM)
{
	name[0] = "Каменный голем";
	aivar[AIV_IMPORTANT] = ID_STONEGOLEM;
	set_stonegolem_visuals();
	Npc_SetToFistMode(self);
	protection[PROT_BLUNT] = 75;
	start_aistate = zs_mm_summoned;
};

instance FIREGOLEM(MST_DEFAULT_GOLEM)
{
	name[0] = "Огненный голем";
	aivar[AIV_IMPORTANT] = id_firegolem;
	set_firegolem_visuals();
	Npc_SetToFistMode(self);
	attribute[ATR_STRENGTH] = 50;
	protection[PROT_MAGIC] = 0;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	damagetype = DAM_FIRE;
	CreateInvItem(self,itat_firegolem_01);
};

instance ICEGOLEM(MST_DEFAULT_GOLEM)
{
	name[0] = "Ледяной голем";
	aivar[AIV_IMPORTANT] = id_icegolem;
	set_icegolem_visuals();
	attribute[ATR_MANA_MAX] = 500;
	attribute[ATR_MANA] = 500;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	protection[PROT_FIRE] = 0;
	damagetype = DAM_BLUNT;
	CreateInvItem(self,itat_icegolem_01);
	CreateInvItem(self,itat_icegolem_02);
	fight_tactic = FAI_HUMAN_MAGE;
};

instance BRIDGEGOLEM(MST_DEFAULT_GOLEM)
{
	name[0] = "Каменный голем";
	aivar[AIV_IMPORTANT] = ID_STONEGOLEM;
	level = 50;
	set_stonegolem_visuals();
	Npc_SetToFistMode(self);
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	protection[PROT_BLUNT] = 50;
};

