
prototype MST_DEFAULT_DEMON(C_NPC)
{
	name[0] = "Пламенный демон";
	guild = GIL_DEMON;
	aivar[AIV_IMPORTANT] = ID_DEMON;
	level = 50;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 500;
	protection[PROT_FLY] = 1000;
	protection[PROT_MAGIC] = 35;
	damagetype = DAM_FIRE;
	fight_tactic = FAI_DEMON;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 2800;
	aivar[AIV_BEENATTACKED] = 2500;
	aivar[AIV_HIGHWAYMEN] = 2000;
	aivar[AIV_HAS_ERPRESSED] = 3;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = TRUE;
	start_aistate = zs_mm_allscheduler;
};

func void set_demon_visuals()
{
	Mdl_SetVisual(self,"Demon.mds");
	Mdl_SetVisualBody(self,"Dem_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance DEMON(MST_DEFAULT_DEMON)
{
	set_demon_visuals();
	Npc_SetToFistMode(self);
};

instance SUMMONEDBYPC_DEMON(MST_DEFAULT_DEMON)
{
	name[0] = "Призванный демон";
	set_demon_visuals();
	level = 0;
	Npc_SetToFistMode(self);
	senses = SENSE_HEAR | SENSE_SEE;
	start_aistate = zs_mm_summonedbypc;
	aivar[AIV_HASDEFEATEDSC] = 400;
	aivar[AIV_ISLOOKING] = 1;
	aivar[AIV_MOVINGMOB] = TRUE;
};

instance SUMMONEDBYNPC_DEMON(MST_DEFAULT_DEMON)
{
	set_demon_visuals();
	Npc_SetToFistMode(self);
	start_aistate = zs_mm_summoned;
};

instance XARDASDEMON(MST_DEFAULT_DEMON)
{
	name[0] = " ";
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_FRIEND;
	guild = GIL_DEMON;
	aivar[AIV_IMPORTANT] = ID_DEMON;
	Mdl_SetVisual(self,"Demon.mds");
	//set_demon_visuals();
	Npc_SetToFistMode(self);
	start_aistate = zs_xardasdemon;
};

instance OTDEMON(MST_DEFAULT_DEMON)
{
	name[0] = "Низший демон";
	guild = GIL_DEMON;
	level = 0;
	attribute[ATR_STRENGTH] = 130;
	attribute[ATR_DEXTERITY] = 130;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 35;
	protection[PROT_FLY] = 70;
	protection[PROT_MAGIC] = 35;
	damagetype = DAM_EDGE;
	set_demon_visuals();
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	Npc_SetToFistMode(self);
};

