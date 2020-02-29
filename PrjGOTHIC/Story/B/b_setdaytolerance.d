
func int b_setdaytolerance()
{
	if(Wld_IsTime(22,0,23,59))
	{
		return Wld_GetDay() + 1;
	};
	return Wld_GetDay();
};

