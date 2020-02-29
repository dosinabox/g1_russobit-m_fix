
instance DIA_GORNARAN_EXIT(C_INFO)
{
	npc = tpl_1405_gornaran;
	nr = 999;
	condition = dia_gornaran_exit_condition;
	information = dia_gornaran_exit_info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};


func int dia_gornaran_exit_condition()
{
	return TRUE;
};

func void dia_gornaran_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORNARAN_WACHE(C_INFO)
{
	npc = tpl_1405_gornaran;
	nr = 1;
	condition = dia_gornaran_wache_condition;
	information = dia_gornaran_wache_info;
	permanent = 0;
	description = "Что ты здесь делаешь?";
};


func int dia_gornaran_wache_condition()
{
	if(KAPITEL < 6)
	{
		return TRUE;
	};
};

func void dia_gornaran_wache_info()
{
	AI_Output(other,self,"DIA_GorNaRan_Wache_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_GorNaRan_Wache_13_01");	//Я сторожу лагерь, убиваю болотожоров, которые пытаются напасть на нас.
	AI_Output(self,other,"DIA_GorNaRan_Wache_13_02");	//На твоем месте я бы и близко не подходит к этим зверюгам. Они с удовольствием позавтракают тобой.
	AI_Output(self,other,"DIA_GorNaRan_Wache_13_03");	//Но знаешь, не отвлекай меня, эта работа очень важна для лагеря.
	AI_StopProcessInfos(self);
};


instance INFO_TPL_1405_GORNARAN(C_INFO)
{
	npc = tpl_1490_gornaran;
	condition = info_tpl_1405_gornaran_condition;
	information = info_tpl_1405_gornaran_info;
	permanent = 0;
	important = 1;
};


func int info_tpl_1405_gornaran_condition()
{
	return TRUE;
};

func void info_tpl_1405_gornaran_info()
{
	AI_Output(self,other,"Info_TPL_1405_GorNaRan_Info_13_01");	//Куда ты собрался? Здесь проход запрещен.
	AI_Output(other,self,"Info_TPL_1405_GorNaRan_Info_15_02");	//Что здесь происходит?
	AI_Output(self,other,"Info_TPL_1405_GorNaRan_Info_13_03");	//И ты еще спрашиваешь? Встань на колени и моли Спящего о прощении, настал миг его пробуждения и час расплаты для всех неверных. Будут они стерты с лица земли.
	AI_Output(other,self,"Info_TPL_1405_GorNaRan_Info_15_04");	//Я же просто хотел посмотреть.
	AI_DrawWeapon(self);
	AI_Output(self,other,"Info_TPL_1405_GorNaRan_Info_13_05");	//Ты, жалкий червь! Ты не можешь осквернять это место, ибо момент пробуждения Спящего близок! Я должен буду избавить его от твоего присутствия.
	AI_Output(other,self,"Info_TPL_1405_GorNaRan_Info_15_06");	//Ты не сможешь остановить меня!
	AI_Output(self,other,"Info_TPL_1405_GorNaRan_Info_13_07");	//И это все, парень! За Спящего!
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,hero);
	AI_StartState(self,zs_attack,1,"");
	npc_setpermattitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	Npc_ExchangeRoutine(self,"HOSTILE");
};

