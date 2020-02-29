
prototype MST_DEFAULT_UNDEADORCSHAMAN(C_NPC)
{
	name[0] = "Hohepriester";
	guild = GIL_UNDEADORC;
	aivar[AIV_IMPORTANT] = ID_UNDEADORCSHAMAN;
	level = 30;
	attribute[ATR_STRENGTH] = 190;
	attribute[ATR_DEXTERITY] = 190;
	attribute[ATR_HITPOINTS_MAX] = 350;
	attribute[ATR_HITPOINTS] = 350;
	attribute[ATR_MANA_MAX] = 75;
	attribute[ATR_MANA] = 75;
	protection[PROT_BLUNT] = 9999;
	protection[PROT_EDGE] = 9999;
	protection[PROT_POINT] = 9999;
	protection[PROT_FIRE] = 9999;
	protection[PROT_FLY] = 9999;
	protection[PROT_MAGIC] = 150;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_MAGE;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 1200;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[AIV_HIGHWAYMEN] = 700;
	aivar[AIV_HAS_ERPRESSED] = 5;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_HASBEENDEFEATEDINPORTALROOM] = ONLYROUTINE;
};

func void set_undeadorcshaman_visuals()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"UOS_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance UNDEADORCSHAMAN(MST_DEFAULT_UNDEADORCSHAMAN)
{
	set_undeadorcshaman_visuals();
	EquipItem(self,itrwudorcstaff);
	CreateInvItem(self,itarrune_6_3_breathofdeath);
	CreateInvItems(self,itarscrollsummongolem,20);
};

