
instance INFO_NEFARIUS_EXIT(C_INFO)
{
	npc = kdw_603_nefarius;
	nr = 999;
	condition = info_nefarius_exit_condition;
	information = info_nefarius_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_nefarius_exit_condition()
{
	return 1;
};

func void info_nefarius_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_NEFARIUS_HALLO(C_INFO)
{
	npc = kdw_603_nefarius;
	nr = 1;
	condition = info_nefarius_hallo_condition;
	information = info_nefarius_hallo_info;
	permanent = 0;
	description = "Кто ты?";
};


func int info_nefarius_hallo_condition()
{
	return 1;
};

func void info_nefarius_hallo_info()
{
	AI_Output(other,self,"Info_Nefarius_Hallo_15_00");	//Кто ты?
	AI_Output(self,other,"Info_Nefarius_Hallo_04_01");	//Я Нефариус, маг Круга Воды.
};


instance INFO_NEFARIUS_WOSATURAS(C_INFO)
{
	npc = kdw_603_nefarius;
	nr = 2;
	condition = info_nefarius_wosaturas_condition;
	information = info_nefarius_wosaturas_info;
	permanent = 0;
	description = "Где найти Сатураса?";
};


func int info_nefarius_wosaturas_condition()
{
	return 1;
};

func void info_nefarius_wosaturas_info()
{
	AI_Output(other,self,"Info_Nefarius_WoSaturas_15_00");	//Где найти Сатураса?
	AI_Output(self,other,"Info_Nefarius_WoSaturas_04_01");	//Пройди за большие круглые ворота. Там ты сможешь его найти.
};


instance INFO_NEFARIUS_WANNAMAGE(C_INFO)
{
	npc = kdw_603_nefarius;
	nr = 1;
	condition = info_nefarius_wannamage_condition;
	information = info_nefarius_wannamage_info;
	permanent = 0;
	description = "Я хочу стать магом Круга Воды!";
};


func int info_nefarius_wannamage_condition()
{
	if(Npc_KnowsInfo(hero,info_nefarius_hallo))
	{
		return 1;
	};
};

func void info_nefarius_wannamage_info()
{
	AI_Output(other,self,"Info_Nefarius_WannaMage_15_00");	//Я хочу стать магом Круга Воды!
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_01");	//Не спеши, это не делается так быстро!
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_02");	//Прежде чем взять в свой круг нового человека, мы должны убедиться, что он этого достоин.
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_03");	//Он должен послужить нам какое-то время.
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_04");	//Если твое намерение серьезно, то сходи к нашим наемникам и постарайся стать одним из них. Это и будет твоя служба.
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_05");	//И, может быть, однажды у тебя появится шанс проявить себя.
};


instance INFO_NEFARIUS_NOWREADY(C_INFO)
{
	npc = kdw_603_nefarius;
	nr = 1;
	condition = info_nefarius_nowready_condition;
	information = info_nefarius_nowready_info;
	permanent = 1;
	description = "Я могу стать одним из магов Круга Воды?";
};


func int info_nefarius_nowready_condition()
{
	if(!FMTAKEN && Npc_KnowsInfo(hero,info_nefarius_wannamage) && (Npc_GetTrueGuild(hero) != GIL_KDW))
	{
		return 1;
	};
};

func void info_nefarius_nowready_info()
{
	AI_Output(other,self,"Info_Nefarius_NowReady_15_00");	//Я могу стать одним из магов Круга Воды?
	if(Npc_GetTrueGuild(hero) != GIL_SLD)
	{
		AI_Output(self,other,"Info_Nefarius_NowReady_04_01");	//Сначала стань одним их наших наемников, а там посмотрим...
	}
	else
	{
		AI_Output(self,other,"Info_Nefarius_NowReady_04_02");	//Вижу, тебя приняли в наемники. Хорошо, очень хорошо...
		AI_Output(self,other,"Info_Nefarius_NowReady_04_03");	//Все остальное решится со временем...
	};
};


instance INFO_NEFARIUS_OCNEWS(C_INFO)
{
	npc = kdw_603_nefarius;
	nr = 1;
	condition = info_nefarius_ocnews_condition;
	information = info_nefarius_ocnews_info;
	permanent = 0;
	important = 1;
};


func int info_nefarius_ocnews_condition()
{
	if(FMTAKEN && !FINDXARDAS)
	{
		return TRUE;
	};
};

func void info_nefarius_ocnews_info()
{
	AI_Output(self,other,"Info_Nefarius_OCNews_04_00");	//Ты можешь рассказать что-нибудь о наших друзьях из Старого лагеря?
	AI_Output(other,self,"Info_Nefarius_OCNews_15_01");	//Гомез уничтожил всех магов Огня!
	AI_Output(self,other,"Info_Nefarius_OCNews_04_02");	//Нет! Как он посмел?! Я же предупреждал Корристо, что ему нельзя доверять! Ты должен рассказать об этом Сатурасу!
	if(Npc_GetTrueGuild(hero) == GIL_SLD)
	{
		AI_Output(self,other,"Info_Nefarius_OCNews_04_03");	//Постой!
		AI_Output(self,other,"Info_Nefarius_OCNews_04_04");	//Ты подвергал себя большой опасности, чтобы помочь нам.
		AI_Output(self,other,"Info_Nefarius_OCNews_04_05");	//Думаю, теперь ты достоин носить одеяние магов Воды.
		AI_Output(self,other,"Info_Nefarius_OCNews_04_06");	//Но теперь иди и поговори с Сатурасом! Быстрее!
	};
	AI_StopProcessInfos(self);
};

