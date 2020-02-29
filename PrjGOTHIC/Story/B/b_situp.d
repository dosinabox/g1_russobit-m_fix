
func void b_situp()
{
	if(self.attribute[ATR_HITPOINTS] < 20)
	{
		AI_PlayAniBS(self,"T_GUARDSLEEP_2_GUARDSIT",BS_SIT);
		AI_Wait(self,1);
	};
	AI_StartState(self,zs_talk,1,"");
};

func void b_awakesit()
{
	AI_PlayAniBS(self,"T_GUARDSIT_2_STAND",BS_STAND);
	AI_Wait(self,1);
	if(Npc_GetDistToNpc(other,self) < 120)
	{
		AI_Dodge(self);
	};
	AI_StartState(self,zs_talk,1,"");
};

func void zs_waitforrescue()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	//Npc_PercEnable(self,PERC_ASSESSTALK,b_situp);
	Npc_PercEnable(self,PERC_ASSESSTALK,zs_talk);
	printdebugnpc(PD_ZS_FRAME,"WaitForRescue");
	if(!c_bodystatecontains(self,BS_SIT))
	{
		printdebugnpc(PD_ZS_FRAME,"ZS_WaitForRescue: sitzt nicht....");
		Npc_ClearAIQueue(self);
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,self.wp);
		AI_AlignToWP(self);
		AI_PlayAniBS(self,"T_STAND_2_GUARDSIT",BS_SIT);
	};
	if(self.attribute[ATR_HITPOINTS] < 20)
	{
		AI_PlayAniBS(self,"T_GUARDSIT_2_GUARDSLEEP",BS_SIT);
	};
};

func void zs_waitforrescue_loop()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_WaitForRescue_Loop");
};

func void zs_waitforrescue_end()
{
	printdebugnpc(PD_ZS_FRAME,"ZS_WaitForRescue_End");
	Npc_ClearAIQueue(self);
	AI_PlayAniBS(self,"T_GUARDSIT_2_STAND",BS_STAND);
};


instance FREEMINEORC(C_NPC)
{
	name[0] = "Таррок";
	guild = GIL_NONE;
	level = 3;
	flags = NPC_FLAG_IMMORTAL;
	voice = 17;
	id = 2101;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 10;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 7;
	protection[PROT_MAGIC] = 0;
	Mdl_SetVisual(self,"orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodySlave",DEFAULT,DEFAULT,"Orc_HeadSlave",DEFAULT,DEFAULT,-1);
	fight_tactic = FAI_ORC;
	senses_range = 2000;
	daily_routine = rtn_fmstart_2101;
};


func void rtn_fmstart_2101()
{
	ta_waitforrescue(23,0,12,0,"FM_RESCUE");
	ta_waitforrescue(12,0,23,0,"FM_RESCUE");
};

