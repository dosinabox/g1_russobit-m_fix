
prototype MST_DEFAULT_LURKER(C_NPC)
{
	name[0] = "Ўныг";
	guild = GIL_LURKER;
	aivar[AIV_IMPORTANT] = ID_LURKER;
	level = 17;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 90;
	attribute[ATR_HITPOINTS] = 90;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_LURKER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = HUNTER;
	aivar[AIV_PCISSTRONGER] = 1400;
	aivar[AIV_BEENATTACKED] = 1300;
	aivar[AIV_HIGHWAYMEN] = 700;
	aivar[AIV_HAS_ERPRESSED] = 5;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_TRIGGER3] = ONLYROUTINE;
};

func void set_lurker_visuals()
{
	Mdl_SetVisual(self,"Lurker.mds");
	Mdl_SetVisualBody(self,"Lur_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance LURKER(MST_DEFAULT_LURKER)
{
	set_lurker_visuals();
	Npc_SetToFistMode(self);
};

instance DAMLURKER(MST_DEFAULT_LURKER)
{
	name[0] = "Ўныг с плотины";
	id = mid_damlurker;
	level = 20;
	set_lurker_visuals();
	Npc_SetToFistMode(self);
	CreateInvItem(self,itat_damlurker_01);
};

