
func void zs_xardasdemon()
{
	printdebugnpc(PD_TA_FRAME,"ZS_XardasDemon");
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_assesssc);
	Npc_PercEnable(self,PERC_ASSESSTALK,zs_talk);
	npc_setpermattitude(self,ATT_FRIENDLY);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	if (Npc_KnowsInfo(hero,info_xardasdemon_intro))
    {
        Mdl_SetVisualBody(self,"Dem_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
		self.name = "Пламенный демон";
    }
    else
    {
        Mdl_SetVisualBody(self,"",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
    };
};

func void zs_xardasdemon_loop()
{
	printdebugnpc(PD_TA_LOOP,"ZS_XardasDemon_Loop");
	AI_Wait(self,1);
};

func void zs_xardasdemon_end()
{
	printdebugnpc(PD_TA_FRAME,"ZS_XardasDemon_End");
};

