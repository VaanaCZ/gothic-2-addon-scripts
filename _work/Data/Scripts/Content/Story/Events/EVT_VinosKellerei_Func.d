//****************************
// 	EVT_VINOSKELLEREI_FUNC (Funktion, die bei öffnen der Winde zu Vino Weinkellerei ausgef. wird))
//****************************
var int FoundVinosKellerei;
func void EVT_VINOSKELLEREI_FUNC_S1 ()
{
	if(FoundVinosKellerei == FALSE)
	{
		FoundVinosKellerei = TRUE;
		B_GivePlayerXP (XP_FoundVinosKellerei);
	};
};
