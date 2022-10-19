// **************
// Kapitelwechsel
// **************

FUNC VOID B_Kapitelwechsel (VAR INT neues_Kapitel, VAR INT aktuelles_Level_Zen)
{
	Kapitel = neues_Kapitel;
	
	//***************************************************************************
	//	KAPITEL 1
	//***************************************************************************
	if (neues_Kapitel == 1)
	{
		// ------ Tagebucheintrag ------

		// ------ Bild einblenden ------
		IntroduceChapter (KapWechsel_1,KapWechsel_1_Text,"chapter1.tga","chapter_01.wav", 6000);
	}
	
	//***************************************************************************
	//	KAPITEL 2
	//***************************************************************************
	else if	(neues_Kapitel == 2)
	{
		// ------ Immortals aufheben -----
		Sekob.flags = 0;
		Bengar.flags = 0;
		
		// ------ Tagebucheintrag ------
		
		
		// ------ Bild einblenden ------
		IntroduceChapter (KapWechsel_2,KapWechsel_2_Text,"chapter2.tga","chapter_01.wav", 6000);
	}
	
	//***************************************************************************
	//	KAPITEL 3
	//***************************************************************************
	else if (neues_Kapitel == 3)
	{	
		// ------ Tagebucheintrag ------
		
		// ------ Missionsvariablen ----
		
		
		// ------ MissionItems -----
		
		
		// ------ Bild einblenden ------
		//Joly:im B_ENTER_NEWWORLD
	}
	
	//***************************************************************************
	//	KAPITEL 4
	//***************************************************************************
	else if (neues_Kapitel == 4)
	{
		PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] 	= TRUE;	//Joly: zur Sicherheit.
		// ------ Tagebucheintrag ------
		
		// ------ Bild einblenden ------
		//Joly:im B_ENTER_OLDWORLD
	}
	
	//***************************************************************************
	//	KAPITEL 5
	//***************************************************************************
	else if (neues_Kapitel == 5)
	{
		PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] 	= TRUE;	//Joly: zur Sicherheit.
		// ------ Tagebucheintrag ------
		
		// ------ Bild einblenden ------
		//Joly:im B_ENTER_NEWWORLD
	}
	
	//***************************************************************************
	//	KAPITEL 6
	//***************************************************************************
	else if (neues_Kapitel == 6)
	{
		PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] 	= TRUE;	//Joly: zur Sicherheit.
	
		// ------ Tagebucheintrag ------
		
		// ------ Bild einblenden ------
		//Joly: IntroduceChapter JETZT IM TRIGGERFELD (KapWechsel_6,KapWechsel_6_Text,"chapter6.tga","chapter_01.wav", 6000);   
	};
	
	//***************************************************************************
	//	SONSTIGE
	//***************************************************************************
 
 	B_CheckLog ();
 
 	//	B_ENTER
	//-------------

	if (aktuelles_Level_Zen == OLDWORLD_ZEN)
	{
		B_ENTER_OLDWORLD ();
	};
	if (aktuelles_Level_Zen == NEWWORLD_ZEN)
	{
		B_ENTER_NEWWORLD ();
	};
	
 
 	//	AMBIENT XPs
	//-------------
 	if (Kapitel == 1){XP_Ambient=XP_AmbientKap1;};
 	if (Kapitel == 2){XP_Ambient=XP_AmbientKap2;};
 	if (Kapitel == 3){XP_Ambient=XP_AmbientKap3;};
 	if (Kapitel == 4){XP_Ambient=XP_AmbientKap4;};
 	if (Kapitel == 5){XP_Ambient=XP_AmbientKap5;};
 	if (Kapitel == 6){XP_Ambient=XP_AmbientKap6;};
};
