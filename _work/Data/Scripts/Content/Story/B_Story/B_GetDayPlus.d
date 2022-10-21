// ******************************************************************
// B_GetDayPlus
// ------------
// liefert ab zwei Stunden vor Mitternacht
// den NÄCHSTEN Tag zurück. 
// Verhindert dadurch, daß ich z.B. um 23 59 h einen Auftrag bekomme, 
// der "am nächsten Tag" erfüllt werden soll und eine Minute später 
// bereits erfüllt ist.
// ******************************************************************

func int B_GetDayPlus()
{
	if (Wld_IsTime(22,00, 23, 59))
	{
		return (Wld_GetDay()+1);
	};
	
	return Wld_GetDay();
};
