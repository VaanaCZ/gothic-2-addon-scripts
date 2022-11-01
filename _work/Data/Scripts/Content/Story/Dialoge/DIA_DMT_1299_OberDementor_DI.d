///////////////////////////////////////////////////////////////////////
//	Info hello
///////////////////////////////////////////////////////////////////////
instance DIA_Schwarzmagier_HELLO		(C_INFO)
{
	npc		 = 	DMT_1299_OberDementor_DI;
	nr		 = 	5;
	condition	 = 	DIA_Schwarzmagier_HELLO_Condition;
	information	 = 	DIA_Schwarzmagier_HELLO_Info;
	important	 = 	TRUE;
};

func int DIA_Schwarzmagier_HELLO_Condition ()
{
	return TRUE;
};
var int SC_KnowsMadPsi;		
func void DIA_Schwarzmagier_HELLO_Info ()
{
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_00"); //No, oślizgły robaku, odważyłeś się w końcu zjawić u wrót siedziby mego Mistrza.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_15_01"); //To ty tu pociągasz za sznurki?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_02"); //Jestem Strażnikiem Dworu Irdorath. Największego na świecie źródła potęgi Beliara. Mój Mistrz i Pan napełnia mnie boską mocą.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_03"); //Jedno moje słowo wystarczy, by na zawsze skazać cię na wieczne szaleństwo.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_15_04"); //Rozumiem, znowu jakiś pachołek z przerostem ambicji.
	
	B_LogEntry (TOPIC_HallenVonIrdorath,"Jestem przy ostatniej bramie. Kluczem wydaje się być czarny mag."); 

	Info_ClearChoices	(DIA_Schwarzmagier_HELLO);
	
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Prowadź mnie do swego pana.", DIA_Schwarzmagier_HELLO_meister );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Ilu jeszcze tobie podobnych będę musiał zabić?", DIA_Schwarzmagier_HELLO_dmt );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Co kryje w sobie ten portal?", DIA_Schwarzmagier_HELLO_hinterTor );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Kto jest twoim Mistrzem?", DIA_Schwarzmagier_HELLO_wer );

	if (SC_KnowsMadPsi == TRUE)
	{
		Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Byłeś wyznawcą śniącego.", DIA_Schwarzmagier_HELLO_schlaefer );
	};
};
func void DIA_Schwarzmagier_HELLO_wer ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_wer_15_00"); //Kto jest twoim Mistrzem?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_01"); //Mój pan podróżuje między światami, a jego boska mądrość nas oświeca.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_02"); //Jest wybrańcem Beliara, który uwolni królestwo od cuchnących wyznawców Innosa.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_03"); //Tym, którzy wątpią w jego potęgę, przynosi cierpienie i śmierć.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_wer_15_04"); //Skąd ja to znam?

};

func void DIA_Schwarzmagier_HELLO_hinterTor ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_hinterTor_15_00"); //Co kryje w sobie ten portal?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_hinterTor_09_01"); //Komnaty mego pana pozostaną dla ciebie niedostępne. Nigdy nie zezwolę ci na otwarcie bramy!

};
func void DIA_Schwarzmagier_HELLO_schlaefer ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_schlaefer_15_00"); //Byłeś wyznawcą Śniącego.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_schlaefer_09_01"); //To odległa przeszłość. Pan otworzył mi oczy. Nikt nas już nie powstrzyma.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_schlaefer_09_02"); //Mój Mistrz ukazał mi jedyny sposób postępowania z wami, niewiernymi.

	TOPIC_END_DEMENTOREN = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Schwarzmagier_HELLO_dmt ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_dmt_15_00"); //Ilu jeszcze tobie podobnych będę musiał zabić?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_01"); //Jest nas wielu. Nie masz nawet pojęcia, jak wielu. Wszyscy czekamy na ostateczne wyzwolenie.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_02"); //Okrzyki i lament zaleją świat wszędzie tam, gdzie będziemy stąpać.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_03"); //Uwolnimy świat od barbarzyńców nazywających się Strażnikami Ognia. Nie zabawimy długo w tej świątyni.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_dmt_15_04"); //To prawda.
};

func void DIA_Schwarzmagier_HELLO_meister ()
{
	Wld_PlayEffect("DEMENTOR_FX",  hero, hero, 0, 0, 0, FALSE );
	Wld_PlayEffect("spellFX_INCOVATION_RED",  self, self, 0, 0, 0, FALSE );
	Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
	Wld_PlayEffect("SFX_Circle",  self, self, 0, 0, 0, FALSE );
	AI_PlayAni (self,"T_PRACTICEMAGIC5");	
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_meister_09_00"); //Dość tych bredni! Teraz nadejdzie twój koniec.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_meister_09_01"); //Twoje oczy zakryje ciemność, a twa dusza zniknie w zaświatach.

	if (Npc_HasItems (other,ItAm_Prot_BlackEye_Mis))
	{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_meister_15_02"); //Bez amuletu przyzwania dusz będzie mi trochę trudno.
	}
	else
	{
		hero.attribute[ATR_MANA] = 0;
		
		if (hero.attribute[ATR_HITPOINTS] > 50)
			{
				hero.attribute[ATR_HITPOINTS] = ((hero.attribute[ATR_HITPOINTS])/2);
			};
		
		SC_ObsessionCounter = 100;
		B_SCIsObsessed (hero);
	};

	Info_ClearChoices	(DIA_Schwarzmagier_HELLO);
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, DIALOG_ENDE, DIA_Schwarzmagier_HELLO_back );

};

func void DIA_Schwarzmagier_HELLO_back ()
{
	AI_StopProcessInfos (self);
	Wld_StopEffect("DEMENTOR_FX");
	self.flags = 0;
	Snd_Play 	("MFX_FEAR_CAST" );
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
};



