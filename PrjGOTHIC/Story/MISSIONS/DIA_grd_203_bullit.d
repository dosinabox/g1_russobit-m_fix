
instance DIA_BULLIT_EXIT(C_INFO)
{
	npc = grd_203_bullit;
	nr = 999;
	condition = dia_bullit_exit_condition;
	information = dia_bullit_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_bullit_exit_condition()
{
	return 1;
};

func void dia_bullit_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BULLIT_FIRST(C_INFO)
{
	npc = grd_203_bullit;
	nr = 1;
	condition = dia_bullit_first_condition;
	information = dia_bullit_first_info;
	permanent = 0;
	important = 1;
};


func int dia_bullit_first_condition()
{
	if((Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1000) && (!Npc_KnowsInfo(hero,info_xardas_loadsword02)))
	{
		return 1;
	};
};

func void dia_bullit_first_info()
{
	AI_Output(self,other,"DIA_Bullit_First_06_00");	//��, ��� � ��� �����? ��, ������, ��� ���� � �� ���� ��������? ���� ���-�� �����? ������ ���?
};


instance DIA_BULLIT_AUFSMAUL(C_INFO)
{
	npc = grd_203_bullit;
	nr = 1;
	condition = dia_bullit_aufsmaul_condition;
	information = dia_bullit_aufsmaul_info;
	permanent = 0;
	description = "� ������, ����� ��������� ���� ���������!";
};


func int dia_bullit_aufsmaul_condition()
{
	return 1;
};

func void dia_bullit_aufsmaul_info()
{
	AI_Output(other,self,"DIA_Bullit_AufsMAul_15_00");	//� ������, ����� ��������� ���� ���������!
	AI_Output(self,other,"DIA_Bullit_AufsMAul_06_01");	//�������! �� �����, �����, �������!
	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
};


instance DIA_GRD_203_BULLIT_WAIT4SC(C_INFO)
{
	npc = grd_203_bullit;
	condition = dia_grd_203_bullit_wait4sc_condition;
	information = dia_grd_203_bullit_wait4sc_info;
	important = 1;
	permanent = 0;
};


func int dia_grd_203_bullit_wait4sc_condition()
{
	if(Npc_KnowsInfo(hero,info_xardas_loadsword02))
	{
		return 1;
	};
};

func void dia_grd_203_bullit_wait4sc_info()
{
	AI_Output(self,other,"DIA_GRD_203_Bullit_Wait4SC_06_01");	//����� ��! ���� ���� ���� ��� ��� ������ ������� �������!
	AI_Output(other,self,"DIA_GRD_203_Bullit_Wait4SC_15_02");	//��, �� ������� ���� ����. ������ � ����� ��������� ����.
	AI_Output(self,other,"DIA_GRD_203_Bullit_Wait4SC_06_03");	//�������! �������, �� ���� �������, ��� � ������� ���.
	AI_StopProcessInfos(self);
	self.guild = GIL_GRD;
	Npc_SetTrueGuild(self,GIL_GRD);
	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
};

