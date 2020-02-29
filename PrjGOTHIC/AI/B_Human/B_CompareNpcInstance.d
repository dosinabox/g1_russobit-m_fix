
func int b_comparenpcinstance(var C_NPC first,var C_NPC second)
{
	var int first_id;
	var int second_id;
	printdebugnpc(PD_ZS_FRAME,"B_CompareNpcInstance");
	first_id = Hlp_GetInstanceID(first);
	second_id = Hlp_GetInstanceID(second);
	if(first_id == second_id)
	{
		printdebugnpc(PD_ZS_CHECK,"B_CompareNpcInstance True");
		return 1;
	}
	else
	{
		printdebugnpc(PD_ZS_CHECK,"B_CompareNpcInstance False");
	};
	return 0;
};

