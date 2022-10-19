//****************************
// 	EVT_FINAL_DOOR_SAY_01 (sagt die magischen worte)
//****************************

func void EVT_FINAL_DOOR_SAY_01 ()
{
	B_Say (self, self, "$SCOPENSLASTDOOR");
	Snd_Play ("LASTDOOREVENT");
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",  hero, hero, 0, 0, 0, FALSE );
	Wld_PlayEffect("SFX_Circle",  hero, hero, 0, 0, 0, FALSE );
};
