
func void zs_miltensescape()
{
	AI_SetWalkMode(self,NPC_RUN);
	AI_GotoWP(self,"NC_PATH40");
	CreateInvItem(self,itarscrollteleport5);
	AI_TurnToNPC(self,hero);
	AI_ReadySpell(self,SPL_TELEPORT5,0);
	AI_Wait(self,0.5);
	Npc_ExchangeRoutine(self,"Reunion");
};

func void zs_miltensescape_loop()
{
	Snd_Play("MFX_TELEPORT_INVEST");
	AI_PlayAni(self,"T_STAND_2_TELEPORT");
	AI_Wait(self,2);
	AI_PlayAni(self,"T_TELEPORT_RANDOM");
	AI_Teleport(self,"LOCATION_02_04");
	sld_726_soeldner.aivar[AIV_WASDEFEATEDBYSC] = TRUE;
	Npc_ExchangeRoutine(sld_726_soeldner,"START");
	AI_StartState(sld_726_soeldner,zs_unconscious,0,"");
	b_setpermattitude(sld_726_soeldner,ATT_HOSTILE);
	b_clearimmortal(sld_726_soeldner);
	AI_TurnToNPC(sld_723_soeldner,sld_726_soeldner);
	AI_TurnToNPC(sld_732_soeldner,sld_726_soeldner);
	AI_TurnToNPC(kdw_603_nefarius,sld_726_soeldner);
};

func void zs_miltensescape_end()
{
};

