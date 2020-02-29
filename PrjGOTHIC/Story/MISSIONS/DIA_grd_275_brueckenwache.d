
instance INFO_GRD_275_PREEXIT(C_INFO)
{
	npc = grd_275_brueckenwache;
	nr = 999;
	condition = info_grd_275_preexit_condition;
	information = info_grd_275_preexit_info;
	permanent = 0;
	description = DIALOG_ENDE;
};


func int info_grd_275_preexit_condition()
{
	if(KAPITEL <= 1)
	{
		return 1;
	};
};

func void info_grd_275_preexit_info()
{
	AI_Output(self,other,"Info_GRD_275_PreExit_06_01");	//Наведайся в Старый лагерь, думаю, они найдут для тебя хорошую кирку. 
	AI_StopProcessInfos(self);
};


instance INFO_GRD_275_EXIT(C_INFO)
{
	npc = grd_275_brueckenwache;
	nr = 999;
	condition = info_grd_275_exit_condition;
	information = info_grd_275_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_grd_275_exit_condition()
{
	if((KAPITEL > 1) || Npc_KnowsInfo(hero,info_grd_275_preexit))
	{
		return 1;
	};
};

func void info_grd_275_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_GRD_275_WASMACHTIHRHIER(C_INFO)
{
	npc = grd_275_brueckenwache;
	nr = 1;
	condition = info_grd_275_wasmachtihrhier_condition;
	information = info_grd_275_wasmachtihrhier_info;
	permanent = 1;
	description = "Что вы здесь делаете?";
};


func int info_grd_275_wasmachtihrhier_condition()
{
	return 1;
};

func void info_grd_275_wasmachtihrhier_info()
{
	AI_Output(other,self,"Info_GRD_275_WasMachtIhrHier_15_00");	//Что вы здесь делаете?
	AI_Output(self,other,"Info_GRD_275_WasMachtIhrHier_06_01");	//А ты как думаешь? Мост охраняем.
	AI_Output(self,other,"Info_GRD_275_WasMachtIhrHier_06_02");	//Следим, чтобы ни один мерзкий ползун не перебрался через реку.
};


instance INFO_GRD_275_TIPS(C_INFO)
{
	npc = grd_275_brueckenwache;
	nr = 1;
	condition = info_grd_275_tips_condition;
	information = info_grd_275_tips_info;
	permanent = 1;
	description = "У тебя есть для меня какой-нибудь совет?";
};


func int info_grd_275_tips_condition()
{
	return 1;
};

func void info_grd_275_tips_info()
{
	AI_Output(other,self,"Info_GRD_275_Tips_15_00");	//У тебя есть для меня какой-нибудь совет?
	AI_Output(self,other,"Info_GRD_275_Tips_06_01");	//Есть. Не броди сам по лесу...
	AI_Output(self,other,"Info_GRD_275_Tips_06_02");	//...ну, если, конечно, не намерен перебить всех тварей живущих там.
};

