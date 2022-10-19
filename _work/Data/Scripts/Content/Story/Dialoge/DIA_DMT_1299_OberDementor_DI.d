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
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_00"); //No, oœlizg³y robaku, odwa¿y³eœ siê w koñcu zjawiæ u wrót siedziby mego Mistrza.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_15_01"); //To ty tu poci¹gasz za sznurki?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_02"); //Jestem Stra¿nikiem Dworu Irdorath. Najwiêkszego na œwiecie Ÿród³a potêgi Beliara. Mój Mistrz i Pan nape³nia mnie bosk¹ moc¹.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_03"); //Jedno moje s³owo wystarczy, by na zawsze skazaæ ciê na wieczne szaleñstwo.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_15_04"); //Rozumiem, znowu jakiœ pacho³ek z przerostem ambicji.
	
	B_LogEntry (TOPIC_HallenVonIrdorath,"Jestem przy ostatniej bramie. Kluczem wydaje siê byæ czarny mag."); 

	Info_ClearChoices	(DIA_Schwarzmagier_HELLO);
	
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "ProwadŸ mnie do swego pana.", DIA_Schwarzmagier_HELLO_meister );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Ilu jeszcze tobie podobnych bêdê musia³ zabiæ?", DIA_Schwarzmagier_HELLO_dmt );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Co kryje w sobie ten portal?", DIA_Schwarzmagier_HELLO_hinterTor );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Kto jest twoim Mistrzem?", DIA_Schwarzmagier_HELLO_wer );

	if (SC_KnowsMadPsi == TRUE)
	{
		Info_AddChoice	(DIA_Schwarzmagier_HELLO, "By³eœ wyznawc¹ œni¹cego.", DIA_Schwarzmagier_HELLO_schlaefer );
	};
};
func void DIA_Schwarzmagier_HELLO_wer ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_wer_15_00"); //Kto jest twoim Mistrzem?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_01"); //Mój pan podró¿uje miêdzy œwiatami, a jego boska m¹droœæ nas oœwieca.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_02"); //Jest wybrañcem Beliara, który uwolni królestwo od cuchn¹cych wyznawców Innosa.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_03"); //Tym, którzy w¹tpi¹ w jego potêgê, przynosi cierpienie i œmieræ.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_wer_15_04"); //Sk¹d ja to znam?

};

func void DIA_Schwarzmagier_HELLO_hinterTor ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_hinterTor_15_00"); //Co kryje w sobie ten portal?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_hinterTor_09_01"); //Komnaty mego pana pozostan¹ dla ciebie niedostêpne. Nigdy nie zezwolê ci na otwarcie bramy!

};
func void DIA_Schwarzmagier_HELLO_schlaefer ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_schlaefer_15_00"); //By³eœ wyznawc¹ Œni¹cego.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_schlaefer_09_01"); //To odleg³a przesz³oœæ. Pan otworzy³ mi oczy. Nikt nas ju¿ nie powstrzyma.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_schlaefer_09_02"); //Mój Mistrz ukaza³ mi jedyny sposób postêpowania z wami, niewiernymi.

	TOPIC_END_DEMENTOREN = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Schwarzmagier_HELLO_dmt ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_dmt_15_00"); //Ilu jeszcze tobie podobnych bêdê musia³ zabiæ?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_01"); //Jest nas wielu. Nie masz nawet pojêcia, jak wielu. Wszyscy czekamy na ostateczne wyzwolenie.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_02"); //Okrzyki i lament zalej¹ œwiat wszêdzie tam, gdzie bêdziemy st¹paæ.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_03"); //Uwolnimy œwiat od barbarzyñców nazywaj¹cych siê Stra¿nikami Ognia. Nie zabawimy d³ugo w tej œwi¹tyni.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_dmt_15_04"); //To prawda.
};

func void DIA_Schwarzmagier_HELLO_meister ()
{
	Wld_PlayEffect("DEMENTOR_FX",  hero, hero, 0, 0, 0, FALSE );
	Wld_PlayEffect("spellFX_INCOVATION_RED",  self, self, 0, 0, 0, FALSE );
	Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
	Wld_PlayEffect("SFX_Circle",  self, self, 0, 0, 0, FALSE );
	AI_PlayAni (self,"T_PRACTICEMAGIC5");	
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_meister_09_00"); //Doœæ tych bredni! Teraz nadejdzie twój koniec.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_meister_09_01"); //Twoje oczy zakryje ciemnoœæ, a twa dusza zniknie w zaœwiatach.

	if (Npc_HasItems (other,ItAm_Prot_BlackEye_Mis))
	{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_meister_15_02"); //Bez amuletu przyzwania dusz bêdzie mi trochê trudno.
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



