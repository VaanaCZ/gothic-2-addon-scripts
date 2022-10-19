// ******************************************************************
// B_GetDayPlus
// ------------
// liefert ab zwei Stunden vor Mitternacht
// den N�CHSTEN Tag zur�ck. 
// Verhindert dadurch, da� ich z.B. um 23 59 h einen Auftrag bekomme, 
// der "am n�chsten Tag" erf�llt werden soll und eine Minute sp�ter 
// bereits erf�llt ist.
// ******************************************************************

func int B_GetDayPlus()
{
	if (Wld_IsTime(22,00, 23, 59))
	{
		return (Wld_GetDay()+1);
	};
	
	return Wld_GetDay();
};
