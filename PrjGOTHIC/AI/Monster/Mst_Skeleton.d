
prototype MST_DEFAULT_SKELETON(C_NPC)
{
	name[0] = "Скелет";
	guild = GIL_SKELETON;
	level = 25;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 35;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 35;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 35;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SKELETON;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = PACKHUNTER;
	aivar[AIV_PCISSTRONGER] = 2000;
	aivar[AIV_BEENATTACKED] = 1500;
	aivar[AIV_HIGHWAYMEN] = 1500;
	aivar[AIV_HAS_ERPRESSED] = 0;
	aivar[AIV_BEGGAR] = 5;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	start_aistate = zs_mm_allscheduler;
};

func void set_skeleton_visuals()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Ske_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void set_skeletonwarrior_visuals()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Ske_Body3",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void set_skeletonscout_visuals()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Ske_Body2",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void set_skeletonmage_visuals()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton_fly.mds");
	Mdl_SetVisualBody(self,"Ske_Fly_Body",1,DEFAULT,"",1,DEFAULT,-1);
};


instance SKELETON(MST_DEFAULT_SKELETON)
{
	aivar[AIV_IMPORTANT] = id_skeleton;
	set_skeleton_visuals();
	Npc_SetToFightMode(self,itmw_skeleton_sword);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10;
};

instance SKELETONSH(MST_DEFAULT_SKELETON)
{
	aivar[AIV_IMPORTANT] = ID_SKELETON;
	set_skeleton_visuals();
	Npc_SetToFightMode(self,itmw_skeleton_axe);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10;
	protection[PROT_FIRE] = 40;
	senses_range = 1000;
	aivar[AIV_FINDABLE] = PACKHUNTER;
	aivar[AIV_PCISSTRONGER] = 1000;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[AIV_HIGHWAYMEN] = 1000;
	aivar[AIV_HAS_ERPRESSED] = 0;
	aivar[AIV_BEGGAR] = 5;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
};

instance SKELETONSCOUT(MST_DEFAULT_SKELETON)
{
	name[0] = "Скелет-разведчик";
	aivar[AIV_IMPORTANT] = id_skeletonscout;
	set_skeletonscout_visuals();
	Npc_SetToFightMode(self,itmw_skeleton_scythe);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10;
};

instance SKELETONWARRIOR(MST_DEFAULT_SKELETON)
{
	name[0] = "Скелет-воин";
	set_skeletonwarrior_visuals();
	level = 30;
	attribute[ATR_STRENGTH] = 120;
	aivar[AIV_IMPORTANT] = id_skeletonwarrior;
	Npc_SetToFightMode(self,itmw_skeleton_axe);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10;
};

instance SKELETONMAGE(MST_DEFAULT_SKELETON)
{
	aivar[AIV_IMPORTANT] = id_skeletonmage;
	set_skeletonmage_visuals();
	name[0] = "Скелет-маг";
	guild = GIL_DEMON;
	level = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 80;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 50;
	fight_tactic = FAI_HUMAN_MAGE;
	CreateInvItem(self,itarrune_3_1_thunderbolt);
	CreateInvItems(self,itarscrollsummonskeletons,5);
};

instance SKELETONMAGE_FOGTOWER(MST_DEFAULT_SKELETON)
{
	aivar[AIV_IMPORTANT] = ID_SKELETONMAGE;
	set_skeletonmage_visuals();
	name[0] = "Скелет-маг туманной башни";
	guild = GIL_DEMON;
	level = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 80;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 50;
	fight_tactic = FAI_HUMAN_MAGE;
	CreateInvItem(self,itarrune_3_1_thunderbolt);
	CreateInvItems(self,itarscrollsummonskeletons,5);
	CreateInvItem(self,theriddle1);
};

instance SUMMONEDBYPC_SKELETON(MST_DEFAULT_SKELETON)
{
	name[0] = "Призванный скелет";
	aivar[AIV_IMPORTANT] = ID_SKELETON;
	level = 0;
	set_skeleton_visuals();
	Npc_SetToFightMode(self,itmw_skeleton_sword);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10;
	senses = SENSE_HEAR | SENSE_SEE;
	start_aistate = zs_mm_summonedbypc;
	aivar[AIV_HASDEFEATEDSC] = 300;
	aivar[AIV_ISLOOKING] = 5;
	aivar[AIV_MOVINGMOB] = TRUE;
};

instance SUMMONEDBYNPC_SKELETON(MST_DEFAULT_SKELETON)
{
	aivar[AIV_IMPORTANT] = ID_SKELETON;
	set_skeleton_visuals();
	Npc_SetToFightMode(self,itmw_skeleton_sword);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10;
	start_aistate = zs_mm_summoned;
};

instance SUMMONEDBYPC_SKELETONWARRIOR(MST_DEFAULT_SKELETON)
{
	name[0] = "Призванный скелет-боец";
	level = 0;
	attribute[ATR_STRENGTH] = 120;
	senses = SENSE_HEAR | SENSE_SEE;
	aivar[AIV_IMPORTANT] = ID_SKELETONWARRIOR;
	set_skeletonwarrior_visuals();
	Npc_SetToFightMode(self,itmw_skeleton_axe);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10;
	start_aistate = zs_mm_summonedbypc;
	aivar[AIV_HASDEFEATEDSC] = 300;
	aivar[AIV_ISLOOKING] = 5;
	aivar[AIV_MOVINGMOB] = TRUE;
};

instance SUMMONEDBYNPC_SKELETONWARRIOR(MST_DEFAULT_SKELETON)
{
	name[0] = "Скелет-боец";
	level = 30;
	attribute[ATR_STRENGTH] = 120;
	aivar[AIV_IMPORTANT] = ID_SKELETONWARRIOR;
	set_skeletonwarrior_visuals();
	Npc_SetToFightMode(self,itmw_skeleton_axe);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10;
	start_aistate = zs_mm_summoned;
};

