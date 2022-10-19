/*
	Checkt welchen Bonus der Spieler durch Artefakt Sets bekommt
	(Nur Amulett, Amulett + ein Ring, zwei Ringe, Amulett + zwei Ringe) 
	
	C_HP_ArtefaktValue (Hitpoints)
	C_MA_ArtefaktValue (Mana)
	C_STR_ArtefaktValue (Stärke)
	
*/	
//------------------------------------------------------------------------------------------	
//Check für Artefakt Set der Heiler (Bonus Berechnung)
//------------------------------------------------------------------------------------------	
FUNC INT C_HP_ArtefaktValue()
{	                                                    	
	var int HP_Artefakt_Value;                             	
	HP_Artefakt_Value = 0;                                 	
	
	if (HP_Amulett_Equipped == TRUE)   		
	{                               		
		if (HP_Ring_1_Equipped == TRUE)			
		{
			if (HP_Ring_2_Equipped == TRUE)
			{
				if (HP_Artefakt_Effekt == FALSE)
				{
					Wld_PlayEffect("SPELLFX_LIGHTSTAR_WHITE",  self, self, 0, 0, 0, FALSE );
					Snd_Play ("MFX_LIGHT_CAST");
					HP_Artefakt_Effekt = TRUE;
				};
				HP_Artefakt_Value = HP_Amulett_Artefakt_Bonus;//250
			}
			else
			{
				HP_Artefakt_Value = HP_Amulett_EinRing_Bonus;//150
			};
		}
		else if (HP_Ring_2_Equipped == TRUE)
		{
			HP_Artefakt_Value = HP_Amulett_EinRing_Bonus;//150
		}
		else
		{
			HP_Artefakt_Value = HP_Amulett_Solo_Bonus ;//50
		};
	}
	else if (HP_Ring_1_Equipped == TRUE)
	{
		if (HP_Ring_2_Equipped == TRUE)
		{
			HP_Artefakt_Value = HP_Ring_Double_Bonus;//100
		}
		else
		{
			HP_Artefakt_Value = HP_Ring_Solo_Bonus;//30
		};
	}
	else if (HP_Ring_2_Equipped == TRUE)
	{
		HP_Artefakt_Value = HP_Ring_Solo_Bonus;//30
	};
	//für Diagnose Print(IntToString(HP_Artefakt_Value) );
	
	return HP_Artefakt_Value;
};
//------------------------------------------------------------------------------------------	
//Check für Artefakt Set der Priester (Bonus Berechnung)
//------------------------------------------------------------------------------------------	
FUNC INT C_MA_ArtefaktValue()
{	                                                    	
	var int MA_Artefakt_Value;                             	
	MA_Artefakt_Value = 0;                                 	
	
	if (MA_Amulett_Equipped == TRUE)   		
	{                               		
		if (MA_Ring_1_Equipped == TRUE)			
		{
			if (MA_Ring_2_Equipped == TRUE)
			{
				if (MA_Artefakt_Effekt == FALSE)
				{
					Wld_PlayEffect("SPELLFX_LIGHTSTAR_WHITE",  self, self, 0, 0, 0, FALSE );
					Snd_Play ("MFX_LIGHT_CAST");
					MA_Artefakt_Effekt = TRUE;
				};
				MA_Artefakt_Value = MA_Amulett_Artefakt_Bonus;//250
			}
			else
			{
				MA_Artefakt_Value = MA_Amulett_EinRing_Bonus;//150
			};
		}
		else if (MA_Ring_2_Equipped == TRUE)
		{
			MA_Artefakt_Value = MA_Amulett_EinRing_Bonus;//150
		}
		else
		{
			MA_Artefakt_Value = MA_Amulett_Solo_Bonus ;//50
		};
	}
	else if (MA_Ring_1_Equipped == TRUE)
	{
		if (MA_Ring_2_Equipped == TRUE)
		{
			MA_Artefakt_Value = MA_Ring_Double_Bonus;//100
		}
		else
		{
			MA_Artefakt_Value = MA_Ring_Solo_Bonus;//30
		};
	}
	else if (MA_Ring_2_Equipped == TRUE)
	{
		MA_Artefakt_Value = MA_Ring_Solo_Bonus;//30
	};
	//für Diagnose Print(IntToString(MA_Artefakt_Value) );
	
	return MA_Artefakt_Value;
};
//------------------------------------------------------------------------------------------	
//Check für Artefakt Set der Krieger (Bonus Berechnung)
//------------------------------------------------------------------------------------------	
FUNC INT C_STR_ArtefaktValue()
{	                                                    	
	var int STR_Artefakt_Value;                             	
	STR_Artefakt_Value = 0;                                 	
	
	
	if (STR_Amulett_Equipped == TRUE)   		
	{                               		
		if (STR_Ring_1_Equipped == TRUE)			
		{
			if (STR_Ring_2_Equipped == TRUE)
			{
				if (STR_Artefakt_Effekt == FALSE)
				{
					Wld_PlayEffect("SPELLFX_LIGHTSTAR_WHITE",  self, self, 0, 0, 0, FALSE );
					Snd_Play ("MFX_LIGHT_CAST");
					STR_Artefakt_Effekt = TRUE;
				};
				STR_Artefakt_Value = STR_Amulett_Artefakt_Bonus;//250
			}
			else
			{
				STR_Artefakt_Value = STR_Amulett_EinRing_Bonus;//150
			};
		}
		else if (STR_Ring_2_Equipped == TRUE)
		{
			STR_Artefakt_Value = STR_Amulett_EinRing_Bonus;//150
		}
		else
		{
			STR_Artefakt_Value = STR_Amulett_Solo_Bonus ;//50
		};
	}
	else if (STR_Ring_1_Equipped == TRUE)
	{
		if (STR_Ring_2_Equipped == TRUE)
		{
			STR_Artefakt_Value = STR_Ring_Double_Bonus;//100
		}
		else
		{
			STR_Artefakt_Value = STR_Ring_Solo_Bonus;//30
		};
	}
	else if (STR_Ring_2_Equipped == TRUE)
	{
		STR_Artefakt_Value = STR_Ring_Solo_Bonus;//30
	};
	//für Diagnose Print(IntToString(MA_Artefakt_Value) );
	
	return STR_Artefakt_Value;
};
