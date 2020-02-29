
prototype MST_DEFAULT_SHADOWBEAST(C_NPC)
{
	name[0] = "ћракорис";
	guild = GIL_SHADOWBEAST;
	aivar[AIV_IMPORTANT] = ID_SHADOWBEAST;
	level = 40;
	attribute[ATR_STRENGTH] = 110;
	attribute[ATR_DEXTERITY] = 110;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SHADOWBEAST;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = HUNTER;
	aivar[AIV_PCISSTRONGER] = 1500;
	aivar[AIV_BEENATTACKED] = 1300;
	aivar[AIV_HIGHWAYMEN] = 700;
	aivar[AIV_HAS_ERPRESSED] = 4;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_TRIGGER3] = ONLYROUTINE;
};

func void set_shadowbeast_visuals()
{
	Mdl_SetVisual(self,"Shadow.mds");
	Mdl_SetVisualBody(self,"Sha_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance SHADOWBEAST(MST_DEFAULT_SHADOWBEAST)
{
	set_shadowbeast_visuals();
	Npc_SetToFistMode(self);
	CreateInvItems(self,itfomuttonraw,4);
};

