
func void db_say(var C_NPC slf,var C_NPC oth,var string text)
{
	b_smartturntonpc(slf,oth);
	if((slf.voice > 0) && (slf.voice < 15))
	{
		AI_OutputSVM_Overlay(slf,oth,ConcatStrings("$",text));
		Snd_Play3d(slf,ConcatStrings(ConcatStrings("SVM",IntToString(slf.voice)),text));
	};
};

