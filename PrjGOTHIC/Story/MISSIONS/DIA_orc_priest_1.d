
instance INFO_HIGHPRIEST1(C_INFO)
{
	npc = orc_priest_1;
	nr = 1;
	condition = info_highpriest1_condition;
	information = info_highpriest1_info;
	permanent = 0;
	important = 1;
};


func int info_highpriest1_condition()
{
	return TRUE;
};

func void info_highpriest1_info()
{
	b_selectweapon(self,other);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,other);
	AI_Output(self,other,"Info_HighPriest1_17_01");	//—ћ≈≈≈≈≈≈≈–“Ќџџџ…!
	AI_Output(self,other,"Info_HighPriest1_17_02");	// ј  “џ ѕќ—ћ≈Ћ ѕќ“–≈¬ќ∆»“№ ћ≈Ќя!
	AI_Output(self,other,"Info_HighPriest1_17_03");	//√ќ“ќ¬№—я   —ћ≈–“»!
	AI_Output(other,self,"Info_HighPriest1_15_04");	//ћы еще посмотрим, кому следует готовитьс€ к смерти, ты, гнилой труп!
	b_logentry(CH4_ENTERTEMPLE,"¬арраг-’ашор, один из п€ти орков-шаманов, которые держали —п€щего в этом мире, стоит передо мной. я помогу ему навсегда уйти из мира живых.");
	AI_StopProcessInfos(self);
	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
};

