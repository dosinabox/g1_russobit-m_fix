
instance DIA_GRD_245_HELLO(C_INFO)
{
	npc = grd_245_gardist;
	nr = 1;
	condition = dia_grd_245_hello_condition;
	information = dia_grd_245_hello_info;
	permanent = 1;
	description = "��� ��� �� ���?";
};


func int dia_grd_245_hello_condition()
{
	return 1;
};

func void dia_grd_245_hello_info()
{
	AI_Output(other,self,"DIA_GRD_245_Hello_15_00");	//��� ��� �� ���?
	AI_Output(self,other,"DIA_GRD_245_Hello_13_01");	//��� ��� �������. ���� ��������, ���� �����-������ �������� ����.
};

