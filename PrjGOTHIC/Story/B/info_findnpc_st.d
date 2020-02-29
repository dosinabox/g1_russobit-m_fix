
instance INFO_FINDNPC_ST(C_INFO)
{
	nr = 900;
	condition = info_findnpc_st_condition;
	information = info_findnpc_st_info;
	permanent = 1;
	description = "Где находится...";
};


func int info_findnpc_st_condition()
{
	return 1;
};

func void info_findnpc_st_info()
{
	var C_NPC corangar;
	var C_NPC corkalom;
	var C_NPC yberion;
	Info_ClearChoices(info_findnpc_st);
	Info_AddChoice(info_findnpc_st,DIALOG_BACK,info_findnpc_st_back);
	corangar = Hlp_GetNpc(gur_1202_corangar);
	if(corangar.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(info_findnpc_st,"...Кор Ангар?",info_findnpc_st_corangar);
	};
	corkalom = Hlp_GetNpc(gur_1201_corkalom);
	if((corkalom.aivar[AIV_FINDABLE] == TRUE) && (CORANGAR_GOTOOGY != TRUE))
	{
		Info_AddChoice(info_findnpc_st,"...Кор Галом?",info_findnpc_st_corkalom);
	};
	yberion = Hlp_GetNpc(gur_1200_yberion);
	if((yberion.aivar[AIV_FINDABLE] == TRUE) && (KAPITEL < 3))
	{
		Info_AddChoice(info_findnpc_st,"...Юберион?",info_findnpc_st_yberion);
	};
};

func void info_findnpc_st_back()
{
	Info_ClearChoices(info_findnpc_st);
};

func void info_findnpc_st_corangar()
{
	var C_NPC corangar;
	AI_Output(other,self,"Info_FindNPC_ST_CorAngar_15_00");	//Где я могу найти Кор Ангара?
	corangar = Hlp_GetNpc(gur_1202_corangar);
	if(Npc_GetDistToNpc(self,corangar) < PERC_DIST_INTERMEDIAT)
	{
		b_pointatnpc(self,other,corangar);
	}
	else if(self.guild == GIL_NOV)
	{
		if(self.voice == 2)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorAngar_02_01");	//Тренировочная площадка для стражей находится на втором уровне. Обычно он проводит там весь день.
		}
		else if(self.voice == 3)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorAngar_03_01");	//На втором уровне находится тренировочная площадка для стражей. Там он тренирует наших воинов.
		}
		else if(self.voice == 5)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorAngar_05_01");	//На втором уровне находится большая тренировочная площадка. Там ты и сможешь его найти.
		};
	}
	else if(self.guild == GIL_TPL)
	{
		if(self.voice == 8)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorAngar_08_01");	//На втором уровне находится большая тренировочная площадка. Там ты и сможешь его найти.
		}
		else if(self.voice == 13)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorAngar_13_01");	//На втором уровне находится большая тренировочная площадка. Там ты и сможешь его найти.
		};
	};
	Info_ClearChoices(info_findnpc_st);
};

func void info_findnpc_st_corkalom()
{
	var C_NPC corkalom;
	AI_Output(other,self,"Info_FindNPC_ST_CorKalom_15_00");	//Где я могу найти Кор Галома?
	corkalom = Hlp_GetNpc(gur_1201_corkalom);
	if(Npc_GetDistToNpc(self,corkalom) < PERC_DIST_INTERMEDIAT)
	{
		b_pointatnpc(self,other,corkalom);
	}
	else if(self.guild == GIL_NOV)
	{
		if(self.voice == 2)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorKalom_02_01");	//Лаборатория находится на втором уровне рядом с холмом, на котором стоит храм. Он работает там днем и ночью.
		}
		else if(self.voice == 3)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorKalom_03_01");	//Недалеко от Храма на втором уровне стоит его лаборатория. Он целыми днями работает там.
		}
		else if(self.voice == 5)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorKalom_05_01");	//На втором уровне расположена лаборатория. Он работает там днем и ночью.
		};
	}
	else if(self.guild == GIL_TPL)
	{
		if(self.voice == 8)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorKalom_08_01");	//На втором уровне расположена лаборатория. Он работает там днем и ночью.
		}
		else if(self.voice == 13)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorKalom_13_01");	//На втором уровне расположена лаборатория. Он работает там днем и ночью.
		};
	};
	Info_ClearChoices(info_findnpc_st);
};

func void info_findnpc_st_yberion()
{
	var C_NPC yberion;
	AI_Output(other,self,"Info_FindNPC_ST_YBerion_15_00");	//Где я могу найти Юбериона?
	yberion = Hlp_GetNpc(gur_1200_yberion);
	if(Npc_GetDistToNpc(self,yberion) < PERC_DIST_INTERMEDIAT)
	{
		b_pointatnpc(self,other,yberion);
	}
	else if(self.guild == GIL_NOV)
	{
		if(self.voice == 2)
		{
			AI_Output(self,other,"Info_FindNPC_ST_YBerion_02_01");	//Просвещенный живет в уединении у подножия холма. Он выходит к людям лишь по особым случаям.
		}
		else if(self.voice == 3)
		{
			AI_Output(self,other,"Info_FindNPC_ST_YBerion_03_01");	//Наш Учитель живет уединенно под сенью нашего Храма. Он выходит к нам только в особых случаях.
		}
		else if(self.voice == 5)
		{
			AI_Output(self,other,"Info_FindNPC_ST_YBerion_05_01");	//Наш Учитель живет в уединении недалеко от Храма. Он выходит к нам только в особых случаях.
		};
	}
	else if(self.guild == GIL_TPL)
	{
		if(self.voice == 8)
		{
			AI_Output(self,other,"Info_FindNPC_ST_YBerion_08_01");	//Наш Учитель живет в уединении недалеко от Храма. Он выходит к нам только в особых случаях.
		}
		else if(self.voice == 13)
		{
			AI_Output(self,other,"Info_FindNPC_ST_YBerion_13_01");	//Наш Учитель живет в уединении недалеко от Храма. Он выходит к нам только в особых случаях.
		};
	};
	Info_ClearChoices(info_findnpc_st);
};

func void b_assignfindnpc_st(var C_NPC slf)
{
	info_findnpc_st.npc = Hlp_GetInstanceID(slf);
};

