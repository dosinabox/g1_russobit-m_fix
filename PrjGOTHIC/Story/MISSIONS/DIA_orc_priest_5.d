
instance INFO_HIGHPRIEST5(C_INFO)
{
	npc = orc_priest_5;
	nr = 1;
	condition = info_highpriest5_condition;
	information = info_highpriest5_info;
	important = 1;
};


func int info_highpriest5_condition()
{
	return TRUE;
};

func void info_highpriest5_info()
{
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,other);
	if(Npc_HasItems(hero,mythrilklinge02) || Npc_HasItems(hero,urizielrune))
	{
		AI_Output(self,other,"Info_HighPriest5_17_04");	//У ТЕБЯ ЕСТЬ ОРУЖИЕ!
		AI_Output(self,other,"Info_HighPriest5_17_05");	//Я ОСТАНОВЛЮ ТЕБЯ!
		AI_StopProcessInfos(self);
		self.npctype = NPCTYPE_MAIN;
		Npc_SetAttitude(self,ATT_HOSTILE);
		Npc_SetTempAttitude(self,ATT_HOSTILE);
	}
	else
	{
		AI_Output(self,other,"Info_HighPriest5_17_01");	//УХОДИ ОТСЮДА!
		AI_Output(self,other,"Info_HighPriest5_17_02");	//НИКТО НЕ СМЕЕТ ТРЕВОЖИТЬ СОН МОЕГО ПОВЕЛИТЕЛЯ!
		AI_Output(other,self,"Info_HighPriest5_15_03");	//Ошибаешься, твой драгоценный Спящий скоро проснется!
		AI_StopProcessInfos(self);
		b_story_encounteredhighpriest();
	};
};


instance INFO_HIGHPRIEST5FAILED(C_INFO)
{
	npc = orc_priest_5;
	nr = 2;
	condition = info_highpriest5failed_condition;
	information = info_highpriest5failed_info;
	important = 1;
};


func int info_highpriest5failed_condition()
{
	if(Npc_KnowsInfo(hero,info_highpriest5) && (self.aivar[AIV_MISSION1] >= HIGHPRIEST_MAXHIT) && !Npc_HasItems(hero,mythrilklinge02) && !Npc_HasItems(hero,urizielrune))
	{
		return TRUE;
	};
};

func void info_highpriest5failed_info()
{
	AI_Output(other,self,"Info_HighPriest5FAILED_15_01");	//Ничего себе! На нем ни царапины! Нужно какое-то другое средство...
	AI_Output(self,other,"Info_HighPriest5FAILED_17_02");	//ТЕПЕРЬ ТЫ УМРЕШЬ!
	AI_Output(other,self,"Info_HighPriest5FAILED_15_03");	//Пора уходить отсюда!
	AI_RemoveWeapon(other);
	AI_TurnAway(other,self);
	self.npctype = NPCTYPE_MAIN;
	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	b_logentry(CH4_ENTERTEMPLE,"Вот и Граш-Варраг-Арушт, и судя по всему, он не нежить, как остальные. Он гораздо сильнее их, а мое оружие не причинит ему вреда. Мне нужно другое оружие!");
	b_givexp(XP_RETREATFROMLASTPRIEST);
	AI_StopProcessInfos(self);
};

