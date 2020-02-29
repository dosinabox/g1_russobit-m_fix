
prototype MST_DEFAULT_ORCBITER(C_NPC)
{
	name[0] = "Жерх";
	guild = GIL_ORCDOG;
	aivar[AIV_IMPORTANT] = ID_ORCBITER;
	level = 12;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 80;
	attribute[ATR_HITPOINTS] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SCAVENGER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = HUNTER;
	aivar[AIV_PCISSTRONGER] = 1200;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[AIV_HIGHWAYMEN] = 700;
	aivar[AIV_HAS_ERPRESSED] = 5;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_HASBEENDEFEATEDINPORTALROOM] = ONLYROUTINE;
};

func void set_orcbiter_visuals()
{
	Mdl_SetVisual(self,"Scavenger.mds");
	Mdl_ApplyOverlayMds(self,"Orcbiter.mds");
	Mdl_SetVisualBody(self,"Sc2_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance ORCBITER(MST_DEFAULT_ORCBITER)
{
	set_orcbiter_visuals();
	Npc_SetToFistMode(self);
	CreateInvItems(self,itfomuttonraw,2);
};

