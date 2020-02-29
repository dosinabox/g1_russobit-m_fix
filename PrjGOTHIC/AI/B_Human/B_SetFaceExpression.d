
func void b_setfaceexpression(var C_NPC slf,var C_NPC oth)
{
	var int attitude;
	printdebugnpc(PD_ZS_FRAME,"B_SetFaceExpression");
	attitude = npc_gettempattitude(slf,oth);
	if(Npc_IsInState(self,zs_flee) || self.aivar[AIV_WASDEFEATEDBYSC])
	{
		printdebugnpc(PD_ZS_CHECK,"...to frightened!");
		Mdl_StartFaceAni(self,"S_FRIGHTENED",1,-1);
	}
	else if(attitude == ATT_FRIENDLY)
	{
		printdebugnpc(PD_ZS_CHECK,"...to friendly!");
		Mdl_StartFaceAni(self,"S_NEUTRAL",1,-1);
	}
	else if(attitude == ATT_NEUTRAL)
	{
		printdebugnpc(PD_ZS_CHECK,"...to neutral!");
		Mdl_StartFaceAni(self,"S_NEUTRAL",1,-1);
	}
	else if(attitude == ATT_ANGRY)
	{
		printdebugnpc(PD_ZS_CHECK,"...to angry!");
		Mdl_StartFaceAni(self,"S_ANGRY",1,-1);
	}
	else if(attitude == ATT_HOSTILE)
	{
		printdebugnpc(PD_ZS_CHECK,"...to hostile!");
		Mdl_StartFaceAni(self,"S_HOSTILE",1,-1);
	};
};

func void b_resetfaceexpression(var C_NPC slf)
{
	printdebugnpc(PD_ZS_FRAME,"B_ResetFaceExpression");
	Mdl_StartFaceAni(self,"S_NEUTRAL",1,-1);
};

