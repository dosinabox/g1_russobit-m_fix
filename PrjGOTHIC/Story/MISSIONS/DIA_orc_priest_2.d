
instance INFO_HIGHPRIEST2(C_INFO)
{
	npc = orc_priest_2;
	nr = 1;
	condition = info_highpriest2_condition;
	information = info_highpriest2_info;
	permanent = 0;
	important = 1;
};


func int info_highpriest2_condition()
{
	return TRUE;
};

func void info_highpriest2_info()
{
	b_selectweapon(self,other);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,other);
	AI_Output(self,other,"Info_HighPriest2_17_01");	//НЕВЕРНЫЙ В НАШЕМ ХРАМЕ!
	AI_Output(self,other,"Info_HighPriest2_17_02");	//БУДЬ ТЫ ПРОКЛЯТ!
	AI_Output(other,self,"Info_HighPriest2_15_03");	//Сам будь проклят, гниль!
	b_logentry(CH4_ENTERTEMPLE,"Варраг-Казорг, один из пяти орков-шаманов, скоро закончит свое жалкое существование!");
	AI_StopProcessInfos(self);
	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
};

