
prototype MST_DEFAULT_TROLL(C_NPC)
{
	name[0] = "Тролль";
	guild = GIL_TROLL;
	aivar[AIV_IMPORTANT] = ID_TROLL;
	level = 200;
	attribute[ATR_STRENGTH] = 160;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 9999;
	protection[PROT_FIRE] = 110;
	protection[PROT_FLY] = 9999;
	protection[PROT_MAGIC] = 100;
	damagetype = DAM_FLY;
	fight_tactic = FAI_TROLL;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 1500;
	aivar[AIV_BEENATTACKED] = 1300;
	aivar[AIV_HIGHWAYMEN] = 700;
	aivar[AIV_HAS_ERPRESSED] = 5;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_HASBEENDEFEATEDINPORTALROOM] = ONLYROUTINE;
};

func void set_troll_visuals()
{
	Mdl_SetVisual(self,"Troll.mds");
	Mdl_SetVisualBody(self,"Tro_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance TROLL(MST_DEFAULT_TROLL)
{
	set_troll_visuals();
	Npc_SetToFistMode(self);
};

instance YOUNGTROLL(MST_DEFAULT_TROLL)
{
	name[0] = "Молодой тролль";
	guild = GIL_TROLL;
	aivar[AIV_IMPORTANT] = ID_TROLL;
	level = 100;
	id = mid_youngtroll;
	set_troll_visuals();
	Mdl_SetModelScale(self,0.7,0.7,0.7);
	attribute[ATR_STRENGTH] = 120;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 9999;
	protection[PROT_FIRE] = 9999;
	protection[PROT_FLY] = 9999;
	protection[PROT_MAGIC] = 9999;
	Npc_SetToFistMode(self);
	fight_tactic = FAI_TROLL;
	damagetype = DAM_FLY;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 4000;
	aivar[AIV_FINDABLE] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 3000;
	aivar[AIV_BEENATTACKED] = 2500;
	aivar[AIV_HIGHWAYMEN] = 2000;
	aivar[AIV_HAS_ERPRESSED] = 5;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_HASBEENDEFEATEDINPORTALROOM] = ONLYROUTINE;
};

