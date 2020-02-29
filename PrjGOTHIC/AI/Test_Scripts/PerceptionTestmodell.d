
instance PERCEPTION_TESTMODELL(NPC_DEFAULT)
{
	name[0] = "Perception_Testmodell";
	guild = GIL_DMB;
	level = 1;
	voice = 11;
	id = 2221;
	attribute[ATR_STRENGTH] = 9;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 18;
	attribute[ATR_HITPOINTS] = 18;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",82,1,dmb_armor_m);
	b_scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_MAGE;
	start_aistate = zs_ptm_hangaround;
	fight_tactic = FAI_HUMAN_MAGE;
	npc_setpermattitude(self,ATT_NEUTRAL);
};


func void zs_ptm_hangaround()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_PTM_Hangaround");
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_ptm_assessplayer);
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_ptm_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,b_ptm_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSBODY,b_ptm_assessbody);
	Npc_PercEnable(self,PERC_ASSESSITEM,b_ptm_assessitem);
	Npc_PercEnable(self,PERC_ASSESSMURDER,b_ptm_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,b_ptm_assessdefeat);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_ptm_assessdamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,b_ptm_assessohtersdamage);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_ptm_assessthreat);
	Npc_PercEnable(self,PERC_ASSESSREMOVEWEAPON,b_ptm_assessremoveweapon);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,b_ptm_observeintruder);
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,b_ptm_assessquietsound);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_ptm_assesswarn);
	Npc_PercEnable(self,PERC_CATCHTHIEF,b_ptm_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,b_ptm_assesstheft);
	Npc_PercEnable(self,PERC_ASSESSCALL,b_ptm_assesscall);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_ptm_assesstalk);
	Npc_PercEnable(self,PERC_ASSESSGIVENITEM,b_ptm_assessgivenitem);
	Npc_PercEnable(self,PERC_ASSESSFAKEGUILD,b_ptm_assessfakeguild);
	Npc_PercEnable(self,PERC_MOVEMOB,b_ptm_movemob);
	Npc_PercEnable(self,PERC_MOVENPC,b_ptm_movenpc);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_ptm_drawweapon);
	Npc_PercEnable(self,PERC_OBSERVESUSPECT,b_ptm_observesuspect);
	Npc_PercEnable(self,PERC_NPCCOMMAND,b_ptm_npccommand);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_ptm_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSSTOPMAGIC,b_ptm_assessstopmagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_ptm_assesscaster);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,b_ptm_assesssurprise);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,b_ptm_assessenterroom);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,b_ptm_assessusemob);
};

func void zs_ptm_hangaround_loop()
{
	printdebugnpc(PD_ZS_LOOP,"ZS_PTM_Hangaround_Loop");
};

func void zs_ptm_hangaround_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_PTM_Hangaround_End");
};

func void b_ptm_assessplayer()
{
	printdebugnpc(PD_ZS_DETAIL,"B_PTM_AssessPlayer");
	printglobals(PD_ZS_DETAIL);
};

func void b_ptm_assessenemy()
{
	printdebugnpc(PD_ZS_DETAIL,"B_PTM_AssessEnemy");
	printglobals(PD_ZS_DETAIL);
};

func void b_ptm_assessfighter()
{
	printdebugnpc(PD_ZS_DETAIL,"B_PTM_AssessFighter");
	printglobals(PD_ZS_DETAIL);
};

func void b_ptm_assessbody()
{
	printdebugnpc(PD_ZS_DETAIL,"B_PTM_AssessBody");
	printglobals(PD_ZS_DETAIL);
};

func void b_ptm_assessitem()
{
	printdebugnpc(PD_ZS_DETAIL,"B_PTM_AssessItem");
	printglobals(PD_ZS_DETAIL);
};

func void b_ptm_assessmurder()
{
	printdebugnpc(PD_ZS_FRAME,"B_PTM_AssessMurder");
	printglobals(PD_ZS_FRAME);
};

func void b_ptm_assessdefeat()
{
	printdebugnpc(PD_ZS_FRAME,"B_PTM_AssessDefeat");
	printglobals(PD_ZS_FRAME);
};

func void b_ptm_assessdamage()
{
	printdebugnpc(PD_ZS_FRAME,"B_PTM_AssessDamage");
	printglobals(PD_ZS_FRAME);
};

func void b_ptm_assessohtersdamage()
{
	printdebugnpc(PD_ZS_FRAME,"B_PTM_AssessOhtersDamage");
	printglobals(PD_ZS_FRAME);
};

func void b_ptm_assessthreat()
{
	printdebugnpc(PD_ZS_FRAME,"B_PTM_AssessThreat");
	printglobals(PD_ZS_FRAME);
};

func void b_ptm_assessremoveweapon()
{
	printdebugnpc(PD_ZS_FRAME,"B_PTM_AssessRemoveWeapon");
	printglobals(PD_ZS_FRAME);
};

func void b_ptm_observeintruder()
{
	printdebugnpc(PD_ZS_FRAME,"B_PTM_ObserveIntruder");
	printglobals(PD_ZS_FRAME);
};

func void b_ptm_assessfightsound()
{
	printdebugnpc(PD_ZS_FRAME,"B_PTM_AssessFightSound");
	printglobals(PD_ZS_FRAME);
};

func void b_ptm_assessquietsound()
{
	printdebugnpc(PD_ZS_FRAME,"B_PTM_AssessQuietSound");
	printglobals(PD_ZS_FRAME);
};

func void b_ptm_assesswarn()
{
	printdebugnpc(PD_ZS_FRAME,"B_PTM_AssessWarn");
	printglobals(PD_ZS_FRAME);
};

func void b_ptm_catchthief()
{
	printdebugnpc(PD_ZS_FRAME,"B_PTM_CatchThief");
	printglobals(PD_ZS_FRAME);
};

func void b_ptm_assesstheft()
{
	printdebugnpc(PD_ZS_FRAME,"B_PTM_AssessTheft");
	printglobals(PD_ZS_FRAME);
};

func void b_ptm_assesscall()
{
	printdebugnpc(PD_ZS_FRAME,"B_PTM_AssessCall");
	printglobals(PD_ZS_FRAME);
};

func void b_ptm_assesstalk()
{
	printdebugnpc(PD_ZS_FRAME,"B_PTM_AssessTalk");
	printglobals(PD_ZS_FRAME);
};

func void b_ptm_assessgivenitem()
{
	printdebugnpc(PD_ZS_FRAME,"B_PTM_AssessGivenItem");
	printglobals(PD_ZS_FRAME);
};

func void b_ptm_assessfakeguild()
{
	printdebugnpc(PD_ZS_FRAME,"B_PTM_AssessFakeGuild");
	printglobals(PD_ZS_FRAME);
};

func void b_ptm_movemob()
{
	printdebugnpc(PD_ZS_FRAME,"B_PTM_MoveMob");
	printglobals(PD_ZS_FRAME);
	b_movemob();
};

func void b_ptm_movenpc()
{
	printdebugnpc(PD_ZS_FRAME,"B_PTM_MoveNpc");
	printglobals(PD_ZS_FRAME);
};

func void b_ptm_drawweapon()
{
	printdebugnpc(PD_ZS_FRAME,"B_PTM_DrawWeapon");
	printglobals(PD_ZS_FRAME);
};

func void b_ptm_observesuspect()
{
	printdebugnpc(PD_ZS_FRAME,"B_PTM_ObserveSuspect");
	printglobals(PD_ZS_FRAME);
};

func void b_ptm_npccommand()
{
	printdebugnpc(PD_ZS_FRAME,"B_PTM_NpcCommand");
	printglobals(PD_ZS_FRAME);
};

func void b_ptm_assessmagic()
{
	printdebugnpc(PD_ZS_FRAME,"B_PTM_AssessMagic");
	printglobals(PD_ZS_FRAME);
};

func void b_ptm_assessstopmagic()
{
	printdebugnpc(PD_ZS_FRAME,"B_PTM_AssessStopMagic");
	printglobals(PD_ZS_FRAME);
};

func void b_ptm_assesscaster()
{
	printdebugnpc(PD_ZS_FRAME,"B_PTM_AssessCaster");
	printglobals(PD_ZS_FRAME);
};

func void b_ptm_assesssurprise()
{
	printdebugnpc(PD_ZS_FRAME,"B_PTM_AssessSurprise");
	printglobals(PD_ZS_FRAME);
};

func void b_ptm_assessenterroom()
{
	printdebugnpc(PD_ZS_FRAME,"B_PTM_AssessEnterRoom");
	printglobals(PD_ZS_FRAME);
};

func void b_ptm_assessusemob()
{
	printdebugnpc(PD_ZS_FRAME,"B_PTM_AssessUseMob");
	printglobals(PD_ZS_FRAME);
};

