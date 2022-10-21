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
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_00"); //No, o�lizg�y robaku, odwa�y�e� si� w ko�cu zjawi� u wr�t siedziby mego Mistrza.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_15_01"); //To ty tu poci�gasz za sznurki?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_02"); //Jestem Stra�nikiem Dworu Irdorath. Najwi�kszego na �wiecie �r�d�a pot�gi Beliara. M�j Mistrz i Pan nape�nia mnie bosk� moc�.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_03"); //Jedno moje s�owo wystarczy, by na zawsze skaza� ci� na wieczne szale�stwo.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_15_04"); //Rozumiem, znowu jaki� pacho�ek z przerostem ambicji.
	
	B_LogEntry (TOPIC_HallenVonIrdorath,"Jestem przy ostatniej bramie. Kluczem wydaje si� by� czarny mag."); 

	Info_ClearChoices	(DIA_Schwarzmagier_HELLO);
	
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Prowad� mnie do swego pana.", DIA_Schwarzmagier_HELLO_meister );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Ilu jeszcze tobie podobnych b�d� musia� zabi�?", DIA_Schwarzmagier_HELLO_dmt );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Co kryje w sobie ten portal?", DIA_Schwarzmagier_HELLO_hinterTor );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Kto jest twoim Mistrzem?", DIA_Schwarzmagier_HELLO_wer );

	if (SC_KnowsMadPsi == TRUE)
	{
		Info_AddChoice	(DIA_Schwarzmagier_HELLO, "By�e� wyznawc� �ni�cego.", DIA_Schwarzmagier_HELLO_schlaefer );
	};
};
func void DIA_Schwarzmagier_HELLO_wer ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_wer_15_00"); //Kto jest twoim Mistrzem?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_01"); //M�j pan podr�uje mi�dzy �wiatami, a jego boska m�dro�� nas o�wieca.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_02"); //Jest wybra�cem Beliara, kt�ry uwolni kr�lestwo od cuchn�cych wyznawc�w Innosa.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_03"); //Tym, kt�rzy w�tpi� w jego pot�g�, przynosi cierpienie i �mier�.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_wer_15_04"); //Sk�d ja to znam?

};

func void DIA_Schwarzmagier_HELLO_hinterTor ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_hinterTor_15_00"); //Co kryje w sobie ten portal?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_hinterTor_09_01"); //Komnaty mego pana pozostan� dla ciebie niedost�pne. Nigdy nie zezwol� ci na otwarcie bramy!

};
func void DIA_Schwarzmagier_HELLO_schlaefer ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_schlaefer_15_00"); //By�e� wyznawc� �ni�cego.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_schlaefer_09_01"); //To odleg�a przesz�o��. Pan otworzy� mi oczy. Nikt nas ju� nie powstrzyma.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_schlaefer_09_02"); //M�j Mistrz ukaza� mi jedyny spos�b post�powania z wami, niewiernymi.

	TOPIC_END_DEMENTOREN = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Schwarzmagier_HELLO_dmt ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_dmt_15_00"); //Ilu jeszcze tobie podobnych b�d� musia� zabi�?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_01"); //Jest nas wielu. Nie masz nawet poj�cia, jak wielu. Wszyscy czekamy na ostateczne wyzwolenie.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_02"); //Okrzyki i lament zalej� �wiat wsz�dzie tam, gdzie b�dziemy st�pa�.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_03"); //Uwolnimy �wiat od barbarzy�c�w nazywaj�cych si� Stra�nikami Ognia. Nie zabawimy d�ugo w tej �wi�tyni.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_dmt_15_04"); //To prawda.
};

func void DIA_Schwarzmagier_HELLO_meister ()
{
	Wld_PlayEffect("DEMENTOR_FX",  hero, hero, 0, 0, 0, FALSE );
	Wld_PlayEffect("spellFX_INCOVATION_RED",  self, self, 0, 0, 0, FALSE );
	Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
	Wld_PlayEffect("SFX_Circle",  self, self, 0, 0, 0, FALSE );
	AI_PlayAni (self,"T_PRACTICEMAGIC5");	
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_meister_09_00"); //Do�� tych bredni! Teraz nadejdzie tw�j koniec.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_meister_09_01"); //Twoje oczy zakryje ciemno��, a twa dusza zniknie w za�wiatach.

	if (Npc_HasItems (other,ItAm_Prot_BlackEye_Mis))
	{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_meister_15_02"); //Bez amuletu przyzwania dusz b�dzie mi troch� trudno.
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



