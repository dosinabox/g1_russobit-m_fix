
func void g_picklock(var int bsuccess,var int bbrokenopen)
{
	var string strsoundfx;
	var string strmessage;
	var int strypos;
	strsoundfx = _STR_INVALID;
	strmessage = _STR_INVALID;
	if(bsuccess)
	{
		if(bbrokenopen)
		{
			strsoundfx = _STR_SOUND_PICKLOCK_UNLOCK;
			strmessage = _STR_MESSAGE_PICKLOCK_UNLOCK;
			strypos = _YPOS_MESSAGE_PICKLOCK_UNLOCK;
		}
		else
		{
			strsoundfx = _STR_SOUND_PICKLOCK_SUCCESS;
			strmessage = _STR_MESSAGE_PICKLOCK_SUCCESS;
			strypos = _YPOS_MESSAGE_PICKLOCK_SUCCESS;
		};
	}
	else if(bbrokenopen)
	{
		strsoundfx = _STR_SOUND_PICKLOCK_BROKEN;
		strmessage = _STR_MESSAGE_PICKLOCK_BROKEN;
		strypos = _YPOS_MESSAGE_PICKLOCK_BROKEN;
	}
	else
	{
		strsoundfx = _STR_SOUND_PICKLOCK_FAILURE;
		strmessage = _STR_MESSAGE_PICKLOCK_FAILURE;
		strypos = _YPOS_MESSAGE_PICKLOCK_FAILURE;
	};
	Snd_Play3d(self,strsoundfx);
	PrintScreen(strmessage,-1,strypos,_STR_FONT_ONSCREEN,_TIME_MESSAGE_PICKLOCK);
};

