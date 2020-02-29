
const int PERC_DIST_CLOSE = 100;
const int PERC_DIST_FLEE = 300;
const int PERC_DIST_DIALOG = 500;
const int PERC_DIST_WATCHFIGHT = 600;
const int PERC_DIST_INTERMEDIAT = 1000;
const int PERC_DIST_MAX = 2000;

func void b_setcutsceneperceptions()
{
	printdebugnpc(PD_ZS_CHECK,self.name);
	printdebugnpc(PD_ZS_CHECK,"CutscenePerceptions");
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,b_assesstheft);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
};

func void initperceptions()
{
	Perc_SetRange(PERC_ASSESSMURDER,HAI_DIST_RANGED);
	Perc_SetRange(PERC_ASSESSDEFEAT,HAI_DIST_RANGED);
	Perc_SetRange(PERC_ASSESSDAMAGE,PERC_DIST_FLEE);
	Perc_SetRange(PERC_ASSESSOTHERSDAMAGE,PERC_DIST_INTERMEDIAT);
	Perc_SetRange(PERC_ASSESSTHREAT,HAI_DIST_RANGED);
	Perc_SetRange(PERC_ASSESSREMOVEWEAPON,PERC_DIST_MAX);
	Perc_SetRange(PERC_OBSERVEINTRUDER,HAI_DIST_OBSERVEINTRUDER);
	Perc_SetRange(PERC_ASSESSFIGHTSOUND,HAI_DIST_HELPATTACKEDCHARGES);
	Perc_SetRange(PERC_ASSESSQUIETSOUND,PERC_DIST_INTERMEDIAT);
	Perc_SetRange(PERC_ASSESSWARN,3000);
	Perc_SetRange(PERC_CATCHTHIEF,HAI_DIST_CATCHTHIEF);
	Perc_SetRange(PERC_ASSESSTHEFT,HAI_DIST_ASSESSTHEFT);
	Perc_SetRange(PERC_ASSESSCALL,PERC_DIST_INTERMEDIAT);
	Perc_SetRange(PERC_ASSESSTALK,PERC_DIST_DIALOG);
	Perc_SetRange(PERC_ASSESSMAGIC,HAI_DIST_RANGED);
	Perc_SetRange(PERC_ASSESSSTOPMAGIC,HAI_DIST_RANGED);
	Perc_SetRange(PERC_MOVEMOB,PERC_DIST_DIALOG);
	Perc_SetRange(PERC_MOVENPC,PERC_DIST_DIALOG);
	Perc_SetRange(PERC_DRAWWEAPON,HAI_DIST_MELEE);
	Perc_SetRange(PERC_OBSERVESUSPECT,PERC_DIST_DIALOG);
	Perc_SetRange(PERC_NPCCOMMAND,PERC_DIST_DIALOG);
	Perc_SetRange(PERC_ASSESSCASTER,HAI_DIST_ASSESSCASTER);
	Perc_SetRange(PERC_ASSESSSURPRISE,PERC_DIST_DIALOG);
	Perc_SetRange(PERC_ASSESSENTERROOM,HAI_DIST_ACTIONRANGE);
	Perc_SetRange(PERC_ASSESSUSEMOB,HAI_DIST_DETECTUSEMOB);
};

func void guardperception()
{
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_assesssc);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_assesscaster);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_assessfighter);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSMURDER,zs_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,zs_assessdefeat);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,b_assessquietsound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,b_assesstheft);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,zs_assesssurprise);
	Npc_PercEnable(self,PERC_OBSERVESUSPECT,b_observesuspect);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,b_observeintruder);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	Npc_PercEnable(self,PERC_ASSESSCALL,zs_reacttocall);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,b_assessusemob);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,b_assessenterroom);
	Npc_PercEnable(self,PERC_MOVEMOB,b_movemob);
	Npc_PercEnable(self,PERC_MOVENPC,b_movenpc);
	Npc_SetPercTime(self,0.5);
};

func void observingperception()
{
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_assesssc);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_assesscaster);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSMURDER,zs_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,zs_assessdefeat);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,b_assessquietsound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,b_assesstheft);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,zs_assesssurprise);
	Npc_PercEnable(self,PERC_OBSERVESUSPECT,b_observesuspect);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,b_observeintruder);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	Npc_PercEnable(self,PERC_ASSESSCALL,zs_reacttocall);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,b_assessusemob);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,b_assessenterroom);
	Npc_PercEnable(self,PERC_MOVEMOB,b_movemob);
	Npc_PercEnable(self,PERC_MOVENPC,b_movenpc);
	Npc_SetPercTime(self,1);
};

func void occupiedperception()
{
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_assessfighter);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_assesscaster);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSMURDER,zs_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,zs_assessdefeat);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,b_assesstheft);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,zs_assesssurprise);
	Npc_PercEnable(self,PERC_OBSERVESUSPECT,b_observesuspect);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	Npc_PercEnable(self,PERC_ASSESSCALL,zs_reacttocall);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,b_assessusemob);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,b_assessenterroom);
	Npc_PercEnable(self,PERC_MOVEMOB,b_movemob);
	Npc_PercEnable(self,PERC_MOVENPC,b_movenpc);
};

func void deepsleepperception()
{
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,b_tossandturn);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_tossandturn);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_tossandturn);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_tossandturn);
	Npc_PercEnable(self,PERC_ASSESSCALL,b_tossandturn);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
};

func void lightsleepperception()
{
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_reacttodamage);
	Npc_PercEnable(self,PERC_ASSESSWARN,zs_wakeup);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,zs_wakeup);
	Npc_PercEnable(self,PERC_CATCHTHIEF,zs_catchthief);
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,b_sleepquietsound);
	Npc_PercEnable(self,PERC_ASSESSTALK,zs_wakeup);
	Npc_PercEnable(self,PERC_ASSESSCALL,zs_wakeup);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
};

func void b_setperception(var C_NPC self)
{
	observingperception();
};

