
instance INFO_TPL_1455_GORBOBA(C_INFO)
{
	npc = tpl_1455_gorboba;
	condition = info_tpl_1455_gorboba_condition;
	information = info_tpl_1455_gorboba_info;
	important = 1;
	permanent = 0;
};


func int info_tpl_1455_gorboba_condition()
{
	return TRUE;
};

func void info_tpl_1455_gorboba_info()
{
	AI_Output(self,other,"Info_TPL_1455_GorBoba_08_01");	//Проваливай! Тебе здесь не место!
};


instance INFO_TPL_1455_GORBOBA1(C_INFO)
{
	npc = tpl_1455_gorboba;
	condition = info_tpl_1455_gorboba1_condition;
	information = info_tpl_1455_gorboba1_info;
	important = 0;
	permanent = 0;
	description = "А ты хочешь меня остановить?";
};


func int info_tpl_1455_gorboba1_condition()
{
	if(Npc_KnowsInfo(hero,info_tpl_1455_gorboba))
	{
		return 1;
	};
};

func void info_tpl_1455_gorboba1_info()
{
	AI_Output(other,self,"Info_TPL_1455_GorBoba1_15_01");	//А ты хочешь меня остановить?
	AI_Output(self,other,"Info_TPL_1455_GorBoba1_08_02");	//Да! Я остановлю тебя, чтобы ты не смог отвлечь моего Учителя Галома. Он готовится к пробуждению Спящего.
	AI_Output(self,other,"Info_TPL_1455_GorBoba1_08_03");	//Не пытайся нападать на меня. Верховный жрец передал Галому и нам часть своей силы. Мы стали бессмертными.
	AI_Output(other,self,"Info_TPL_1455_GorBoba1_15_04");	//Сейчас я тебе покажу, насколько ты бессмертен!
	AI_Output(self,other,"Info_TPL_1455_GorBoba1_08_05");	//Приготовься к встрече с Создателем!
	AI_StopProcessInfos(self);
	Log_CreateTopic("Храм орков",LOG_NOTE);
	b_logentry("Храм орков","Гор Боба сказал мне, что он охраняет территорию, и что дальше лучше не ходить. Кор Галом и его последователи получили силу от шаманов, и теперь их нельзя убить человеческим оружием.");
	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
};

