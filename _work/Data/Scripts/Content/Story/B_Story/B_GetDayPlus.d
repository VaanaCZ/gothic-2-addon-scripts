// ******************************************************************
// B_GetDayPlus
// ------------
// liefert ab zwei Stunden vor Mitternacht
// den NДCHSTEN Tag zurьck. 
// Verhindert dadurch, daЯ ich z.B. um 23 59 h einen Auftrag bekomme, 
// der "am nдchsten Tag" erfьllt werden soll und eine Minute spдter 
// bereits erfьllt ist.
// ******************************************************************

func int B_GetDayPlus()
{
	if (Wld_IsTime(22,00, 23, 59))
	{
		return (Wld_GetDay()+1);
	};
	
	return Wld_GetDay();
};
