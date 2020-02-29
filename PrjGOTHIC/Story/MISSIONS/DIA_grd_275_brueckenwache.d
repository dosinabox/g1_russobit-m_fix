
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
	if(KAPITEL == 1)
	{
		return 1;
	};
};

func void info_grd_275_preexit_info()
{
	AI_Output(self,other,"Info_GRD_275_PreExit_06_01");	//Не забудь заглянуть в Старый лагерь, у них уже есть для тебя кирка, ха-ха-ха!
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
	AI_Output(self,other,"Info_GRD_275_WasMachtIhrHier_06_01");	//А как по-твоему? Охраняем мост, конечно.
	AI_Output(self,other,"Info_GRD_275_WasMachtIhrHier_06_02");	//Мы следим за тем, чтобы ни одна хищная тварь не перебралась на другую сторону реки.
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
	AI_Output(self,other,"Info_GRD_275_Tips_06_01");	//Ага. Никогда не ходи в лес в одиночку...
	AI_Output(self,other,"Info_GRD_275_Tips_06_02");	//...если, конечно, не собираешься перебить всех тварей, которые там обитают.
};

