func void B_KommMit ()
{
	AI_Output (other, self,"DIA_AkilsSchaf_KommMit_15_00");	//Komm mit!
};
func void B_BIFF_VERARSCHEN ()
{
	AI_Output			(self, other, "DIA_Biff_ARBEITEN_lebenlassen_07_01"); //Verarschen kann ich mich alleine.
};

func void B_BiffsAnteil_Berechnung() //Joly: Wieviel Kohle muß der SC Biff nun geben:
{	
	var int momentanKohle;
	var int UeberschussKohle;
	momentanKohle = Npc_HasItems(hero,ItMi_Gold);
	UeberschussKohle = (momentanKohle - DJG_Biff_SCGold);
	BiffsAnteil = ((UeberschussKohle)/2);
};

func void B_BiffsAnteil_PrintScreen ()
{
	var string BiffsAnteilText_Teil;
	var string BiffsAnteilText;
	var string Anteil;
	Anteil = IntToString (BiffsAnteil);
	BiffsAnteilText_Teil = ConcatStrings(PRINT_BiffsAnteil, Anteil);		
	BiffsAnteilText	= ConcatStrings(BiffsAnteilText_Teil, PRINT_BiffGold);	
	AI_PrintScreen	(BiffsAnteilText, -1, 45, FONT_ScreenSmall, 4);
};
func void B_Biff_SetRefuseTalk ()	//Joly: Biffs Geld eintreiberei kommt beim HalbeHalbe Deal nicht so häufig.
{
	if (DJG_Biff_HalbeHalbe == TRUE)
	{
		Npc_SetRefuseTalk (Biff,1000);//Joly:Biff stehet hier wegen INIT und setrefusetalk. SAVEGAMEFIX
	}
	else
	{
		Npc_SetRefuseTalk (Biff,600);//Joly:Biff stehet hier wegen INIT und setrefusetalk. SAVEGAMEFIX
	};
};
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Biff_EXIT   (C_INFO)
{
	npc         = DJG_713_Biff;
	nr          = 999;
	condition   = DIA_Biff_EXIT_Condition;
	information = DIA_Biff_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Biff_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Biff_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_HALLO		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 	5;
	condition	 = 	DIA_Biff_HALLO_Condition;
	information	 = 	DIA_Biff_HALLO_Info;

	description	 = 	"Was machst du hier?";
};

func int DIA_Biff_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Biff_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_15_00"); //Was machst du hier?
	AI_Output			(self, other, "DIA_Biff_HALLO_07_01"); //Das ist wirklich die dämlichste Frage, die ich seit langem gehört habe. Wonach sieht's denn aus?

	Info_AddChoice	(DIA_Biff_HALLO, "Ich kann deinen bescheuerten Gesichtsausdruck nicht einordnen.", DIA_Biff_HALLO_spott );
	Info_AddChoice	(DIA_Biff_HALLO, "Ich habe keine Ahnung.", DIA_Biff_HALLO_keineAhnung );
	Info_AddChoice	(DIA_Biff_HALLO, "Schon gut!", DIA_Biff_HALLO_doof );
};

func void DIA_Biff_HALLO_doof ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_doof_15_00"); //Schon gut.
	Info_ClearChoices	(DIA_Biff_HALLO);
};

func void DIA_Biff_HALLO_spott ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_spott_15_00"); //Ich kann deinen bescheuerten Gesichtsausdruck nicht einordnen. Deshalb frage ich nach.
	AI_Output			(self, other, "DIA_Biff_HALLO_spott_07_01"); //Du hast 'ne zu große Schnauze für meinen Geschmack. Wird Zeit, dass sie dir jemand stopft.

	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore +1);
};

func void DIA_Biff_HALLO_keineAhnung ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_keineAhnung_15_00"); //Ich habe keine Ahnung.
	AI_Output			(self, other, "DIA_Biff_HALLO_keineAhnung_07_01"); //Ich warte, dass hier endlich mal was passiert.

	Info_AddChoice	(DIA_Biff_HALLO, "Was soll denn passieren?", DIA_Biff_HALLO_keineAhnung_was );
};
func void DIA_Biff_HALLO_keineAhnung_was ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_keineAhnung_was_15_00"); //Was soll denn passieren?
	AI_Output			(self, other, "DIA_Biff_HALLO_keineAhnung_was_07_01"); //Oh Mann, du bist wirklich nicht von der hellsten Sorte. Wenn ich es wüsste, müsste ich ja auch nicht warten.

	Info_AddChoice	(DIA_Biff_HALLO, "Was könnte denn passieren? ", DIA_Biff_HALLO_keineAhnung_was_was2 );

};
func void DIA_Biff_HALLO_keineAhnung_was_was2 ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_keineAhnung_was_was2_15_00"); //Was könnte denn passieren?
	AI_Output			(self, other, "DIA_Biff_HALLO_keineAhnung_was_was2_07_01"); //Du nervst. Pass auf, es ist mir egal, was passiert. Hauptsache, es passiert irgendwas.

	Info_AddChoice	(DIA_Biff_HALLO, "Wieso machst du dann nicht irgendwas?", DIA_Biff_HALLO_keineAhnung_was_was2_was3 );

};
func void DIA_Biff_HALLO_keineAhnung_was_was2_was3 ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_keineAhnung_was_was2_was3_15_00"); //Wieso machst du dann nicht irgendwas?
	AI_Output			(self, other, "DIA_Biff_HALLO_keineAhnung_was_was2_was3_07_01"); //Wenn du nicht gleich aufhörst, dumme Fragen zu stellen, werde ich dir dein dreckiges Maul stopfen.


	Info_AddChoice	(DIA_Biff_HALLO, "Wenn du nur wartest, wird hier nie etwas passieren!", DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4 );

};
func void DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4 ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4_15_00"); //Wenn du nur wartest, wird hier nie etwas passieren!
	AI_Output			(self, other, "DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4_07_01"); //Jetzt reicht's!

	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);	
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore +1);
};


///////////////////////////////////////////////////////////////////////
//	Info washierimTal
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_WASHIERIMTAL		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 	7;
	condition	 = 	DIA_Biff_WASHIERIMTAL_Condition;
	information	 = 	DIA_Biff_WASHIERIMTAL_Info;

	description	 = 	"Was glaubst du, hier im Minental zu finden?";
};

func int DIA_Biff_WASHIERIMTAL_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Biff_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Biff_WASHIERIMTAL_Info ()
{
	AI_Output			(other, self, "DIA_Biff_WASHIERIMTAL_15_00"); //Was glaubst du, hier im Minental zu finden?
	AI_Output			(self, other, "DIA_Biff_WASHIERIMTAL_07_01"); //Gold und Ehre. Was sonst? Wenn ich mit den Drachen fertig bin, werde ich im Gold schwimmen.
	AI_Output			(self, other, "DIA_Biff_WASHIERIMTAL_07_02"); //Genug, um den Rest meines Lebens jede Kneipe und jeden Puff dieses Landes unsicher zu machen.

	Info_AddChoice	(DIA_Biff_WASHIERIMTAL, "Na dann, viel Glück.", DIA_Biff_WASHIERIMTAL_vielglueck );
	Info_AddChoice	(DIA_Biff_WASHIERIMTAL, "Oder du wirst tot sein!", DIA_Biff_WASHIERIMTAL_ihrtot );

};
func void DIA_Biff_WASHIERIMTAL_ihrtot ()
{
	AI_Output			(other, self, "DIA_Biff_WASHIERIMTAL_ihrtot_15_00"); //Oder du wirst tot sein!
	AI_Output			(self, other, "DIA_Biff_WASHIERIMTAL_ihrtot_07_01"); //Und wenn schon. Das gehört dazu. Wenn du reich werden willst, musst du schon etwas riskieren.

	Info_ClearChoices	(DIA_Biff_WASHIERIMTAL);
};

func void DIA_Biff_WASHIERIMTAL_vielglueck ()
{
	AI_Output			(other, self, "DIA_Biff_WASHIERIMTAL_vielglueck_15_00"); //Na dann, viel Glück.
	AI_Output			(self, other, "DIA_Biff_WASHIERIMTAL_vielglueck_07_01"); //Ich brauche kein Glück. Nur meine Axt.

	Info_ClearChoices	(DIA_Biff_WASHIERIMTAL);
};

///////////////////////////////////////////////////////////////////////
//	Info arbeiten
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_ARBEITEN		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 	8;
	condition	 = 	DIA_Biff_ARBEITEN_Condition;
	information	 = 	DIA_Biff_ARBEITEN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Wie wär's, wenn du ab jetzt für mich arbeitest?";
};

func int DIA_Biff_ARBEITEN_Condition ()
{
	if 	(DJG_BiffParty == FALSE)
		&& (Npc_KnowsInfo(other, DIA_Biff_HALLO))
		&& (DJG_Biff_Stay == FALSE)	
			{
					return TRUE;
			};
};
func void DIA_Biff_ARBEITEN_Info ()
{
	AI_Output			(other, self, "DIA_Biff_ARBEITEN_15_00"); //Wie wär's, wenn du ab jetzt für mich arbeitest?
	
	B_LogEntry (TOPIC_Dragonhunter,"Der Drachenjäger Biff ist ein Söldner wie er im Buche steht. Wenn ich ihn bezahle, wird er auch für mich kämpfen."); 

	if (DJG_BiffParty_nomore >= 6) //Joly: Biff hat bei 3 die Schnauze voll vom SC
	{
		AI_Output			(self, other, "DIA_Biff_ARBEITEN_07_01"); //Das hatten wir doch schon mal. Hat nicht besonders gut funktioniert. Danke, kein Interesse.
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output			(self, other, "DIA_Biff_ARBEITEN_07_02"); //Mmh. Warum nicht? Was zahlst du?
	};
	Info_ClearChoices	(DIA_Biff_ARBEITEN);
	
	Info_AddChoice	(DIA_Biff_ARBEITEN, "Du kannst froh sein, wenn ich dich leben lasse.", DIA_Biff_ARBEITEN_lebenlassen );
	Info_AddChoice	(DIA_Biff_ARBEITEN, "Du kriegst die Hälfte der Beute.", DIA_Biff_ARBEITEN_HalbeHalbe );
	Info_AddChoice	(DIA_Biff_ARBEITEN, "Ich zahl dir erst mal 100 Goldmünzen", DIA_Biff_ARBEITEN_100 );
};

func void DIA_Biff_ARBEITEN_100 ()
{
	AI_Output			(other, self, "DIA_Biff_ARBEITEN_100_15_00"); //Ich zahl dir erstmal 100 Goldmünzen

	if (B_GiveInvItems (other, self, ItMi_Gold,100))
		{	
			AI_Output			(self, other, "DIA_Biff_ARBEITEN_100_07_01"); //Na schön. Das ist immerhin ein Anfang. Geh vor. Ich folge dir.
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,"Follow");
			B_Biff_SetRefuseTalk ();
			self.aivar[AIV_PARTYMEMBER] = TRUE;
			DJG_BiffParty = TRUE;	
		}
		else
		{
			B_BIFF_VERARSCHEN ();
			AI_StopProcessInfos (self);
			DJG_BiffParty_nomore = (DJG_BiffParty_nomore +1);
		};

};

func void DIA_Biff_ARBEITEN_HalbeHalbe ()
{
	AI_Output			(other, self, "DIA_Biff_ARBEITEN_HalbeHalbe_15_00"); //Du bekommst die Hälfte der Beute.
	AI_Output			(self, other, "DIA_Biff_ARBEITEN_HalbeHalbe_07_01"); //Das hört sich gut an. Aber ich warne dich, verarsch mich nicht, sonst wirst du es bereuen.
	AI_Output			(self, other, "DIA_Biff_ARBEITEN_HalbeHalbe_07_02"); //Und noch was, ich will keine Waffe oder anderen Krempel, den du hier aufsammelst. Mich interessiert nur das Gold, kapiert?

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Follow");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	DJG_BiffParty = TRUE;
	DJG_Biff_HalbeHalbe  = TRUE;
	B_Biff_SetRefuseTalk ();

	if (DJG_Biff_HalbeHalbe_again == FALSE)
	{
		DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);	// Biff schaut, wieviel Geld der Spieler jetzt hat.
		DJG_Biff_HalbeHalbe_again = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Biff_ARBEITEN_HalbeHalbe_07_03"); //Aber, was sag ich. Das weißt du doch alles schon.
	};
};

func void DIA_Biff_ARBEITEN_lebenlassen ()
{
	AI_Output			(other, self, "DIA_Biff_ARBEITEN_lebenlassen_15_00"); //Du kannst froh sein, wenn ich dich leben lasse.
	B_BIFF_VERARSCHEN ();
	AI_StopProcessInfos (self);
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore +1);
};


///////////////////////////////////////////////////////////////////////
//	Info Geldeintreiben
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_GELDEINTREIBEN		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 9;
	condition	 = 	DIA_Biff_GELDEINTREIBEN_Condition;
	information	 = 	DIA_Biff_GELDEINTREIBEN_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
var int BIFF_LABERT_GELDEINTREIBEN;
func int DIA_Biff_GELDEINTREIBEN_Condition ()
{
	if (DJG_Biff_SCGold < Npc_HasItems(hero,ItMi_Gold)-1)
		&& ((Npc_GetBodyState(hero))!= BS_INVENTORY)				//Joly: wegen Truhen		 
		&& ((Npc_GetBodyState(hero))!= BS_MOBINTERACT_INTERRUPT)
		&& (((Npc_GetBodyState(hero))!= BS_STAND)||(BIFF_LABERT_GELDEINTREIBEN == TRUE))//Joly: wegen Plündern von NSC-Invs	
		&& (((Npc_GetBodyState(hero))!= BS_ITEMINTERACT)||(BIFF_LABERT_GELDEINTREIBEN == TRUE))//Joly: wegen Geldbeutel	
		&& (DJG_Biff_HalbeHalbe == TRUE)
		&& (DJG_BiffParty == TRUE)	
		&& (DJG_Biff_Stay == FALSE)	
		{
			BIFF_LABERT_GELDEINTREIBEN = TRUE;
			return TRUE; 
		};
};

func void DIA_Biff_GELDEINTREIBEN_Info ()
{
	AI_Output			(self, other, "DIA_Biff_GELDEINTREIBEN_07_00"); //Moment mal! Hast du nicht gesagt, die Hälfte deiner Beute gehört mir? Her damit!

	B_BiffsAnteil_Berechnung ();
	B_BiffsAnteil_PrintScreen ();

	Info_ClearChoices	(DIA_Biff_GELDEINTREIBEN);

	Info_AddChoice	(DIA_Biff_GELDEINTREIBEN, "Du bist mir zu teuer.", DIA_Biff_GELDEINTREIBEN_zuTeuer );
	Info_AddChoice	(DIA_Biff_GELDEINTREIBEN, "Hier ist dein Anteil.", DIA_Biff_GELDEINTREIBEN_geben );
};
func void DIA_Biff_GELDEINTREIBEN_geben ()
{
	AI_Output			(other, self, "DIA_Biff_GELDEINTREIBEN_geben_15_00"); //Hier ist dein Anteil.
	AI_Output			(self, other, "DIA_Biff_GELDEINTREIBEN_geben_07_01"); //Alles klar. Lass uns weiter gehen.
	AI_StopProcessInfos (self);
	B_GiveInvItems (other, self, ItMi_Gold, BiffsAnteil);
	B_Biff_SetRefuseTalk ();
	BIFF_LABERT_GELDEINTREIBEN = FALSE;
	DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);	// Biff schaut, wieviel Geld der Spieler jetzt hat.
};

func void DIA_Biff_GELDEINTREIBEN_zuTeuer ()
{
	AI_Output			(other, self, "DIA_Biff_GELDEINTREIBEN_zuTeuer_15_00"); //Du bist mir zu teuer.
	AI_Output			(self, other, "DIA_Biff_GELDEINTREIBEN_zuTeuer_07_01"); //Heul mir jetzt nicht die Ohren voll. Die Hälfte war abgemacht.

	Info_ClearChoices	(DIA_Biff_GELDEINTREIBEN);
	Info_AddChoice	(DIA_Biff_GELDEINTREIBEN, "Ich fürchte, ich muß mich von dir trennen.", DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen );
	Info_AddChoice	(DIA_Biff_GELDEINTREIBEN, "Hier ist dein Anteil.", DIA_Biff_GELDEINTREIBEN_geben );

};
func void DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen ()
{
	AI_Output			(other, self, "DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_15_00"); //Ich fürchte, ich muss mich von dir trennen.
	AI_Output			(self, other, "DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_07_01"); //Wie du willst. Dann muss ich mir eben meinen Anteil holen.

	BIFF_LABERT_GELDEINTREIBEN = FALSE;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
	B_Attack (self, other, AR_NONE, 1);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BiffParty = FALSE;
	DJG_Biff_HalbeHalbe = FALSE;
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore +1);	
};

///////////////////////////////////////////////////////////////////////
//	Info IchBleibhier
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_ICHBLEIBHIER		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 6;
	condition	 = 	DIA_Biff_ICHBLEIBHIER_Condition;
	information	 = 	DIA_Biff_ICHBLEIBHIER_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Biff_ICHBLEIBHIER_Condition ()
{
	if 		(
				((Npc_GetBodyState(hero))!= BS_INVENTORY)				//Joly: wegen Truhen
				&& ((Npc_GetBodyState(hero))!= BS_MOBINTERACT_INTERRUPT)
				&& (DJG_BiffParty == TRUE)
				&& (DJG_Biff_Stay == FALSE)	
				&& 	(
						(
							(
								//Joly: Biff stört nicht das Drachengespräch!
								((Npc_GetDistToWP(self,"OW_SWAMPDRAGON_01")<4000)	&& (Npc_IsDead(SwampDragon)== FALSE)&& (SwampDragon.flags != 0))
								||((Npc_GetDistToWP(self,"LOCATION_19_03_PATH_RUIN8")<2000)	&& (Npc_IsDead(RockDragon)== FALSE) && (RockDragon.flags != 0))
								||((Npc_GetDistToWP(self,"CASTLE_36")<4000)			&& (Npc_IsDead(FireDragon)== FALSE) && (FireDragon.flags != 0))
								||((Npc_GetDistToWP(self,"OW_ICEDRAGON_01")<4000)	&& (Npc_IsDead(IceDragon)== FALSE) 	&& (IceDragon.flags != 0))
							) 	
							&& (Npc_HasItems (hero,ItMi_InnosEye_Mis)>=1)
						)
						||(Npc_GetDistToWP(self,"OC_CENTER_GUARD_02")<4500)//Joly: Biff kommt nicht in die Burg
					)
			)
				{
					return TRUE;
				};
};

func void DIA_Biff_ICHBLEIBHIER_Info ()
{
	AI_Output			(self, other, "DIA_Biff_ICHBLEIBHIER_07_00"); //Ziemlich brenzlige Gegend hier. Geh du vor. Ich halte mich im Hintergrund.

	AI_StopProcessInfos (self);
	Npc_SetRefuseTalk (self,300);

	if (Npc_GetDistToWP(self,"OW_SWAMPDRAGON_01")<10000)
	{
		Npc_ExchangeRoutine	(self,"Stay_Swamp");
	};

	if (Npc_GetDistToWP(self,"LOCATION_19_03_PATH_RUIN8")<10000)
	{
		Npc_ExchangeRoutine	(self,"Stay_Rock");
	};

	if (Npc_GetDistToWP(self,"CASTLE_36")<10000)
	{
		Npc_ExchangeRoutine	(self,"Stay_Fire");
	};

	if (Npc_GetDistToWP(self,"OW_ICEDRAGON_01")<10000)
	{
		Npc_ExchangeRoutine	(self,"Stay_Ice");
	};

	if (Npc_GetDistToWP(self,"OC_CENTER_GUARD_02")<10000)
	{
		Npc_ExchangeRoutine	(self,"Stay_AwayFromOC");
	};
	DJG_Biff_Stay = TRUE;
	DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);	// Biff merkt sich wieder, wieviel Geld der Spieler jetzt hat.
};

///////////////////////////////////////////////////////////////////////
//	Info Stay_AwayFromOC
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_Stay_AwayFromOC		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	condition	 = 	DIA_Biff_Stay_AwayFromOC_Condition;
	information	 = 	DIA_Biff_Stay_AwayFromOC_Info;
	nr		 	 = 3;
	permanent	 = 	TRUE;

	description	 = 	"(Biff wieder mitnehmen)";

};

func int DIA_Biff_Stay_AwayFromOC_Condition ()
{
		if 	(
				(Npc_GetDistToWP(self,"OW_PATH_298")<500)
				||(Npc_GetDistToWP(self,"LOCATION_19_01")<500)
			)
			&& (DJG_BiffParty == TRUE)	
			&& (DJG_Biff_Stay == TRUE)	
				{
					return TRUE;
				};
};

func void DIA_Biff_Stay_AwayFromOC_Info ()
{
	B_KommMit ();
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Follow");
	DJG_Biff_Stay = FALSE;
	DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);	// Biff merkt sich wieder, wieviel Geld der Spieler jetzt hat.
};

///////////////////////////////////////////////////////////////////////
//	Info Kohleweggeben
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_KOHLEWEGGEBEN		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	condition	 = 	DIA_Biff_KOHLEWEGGEBEN_Condition;
	information	 = 	DIA_Biff_KOHLEWEGGEBEN_Info;
	nr		 	 = 10;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Biff_KOHLEWEGGEBEN_Condition ()
{
	if (DJG_Biff_SCGold > Npc_HasItems(hero,ItMi_Gold))
		&& (DJG_Biff_HalbeHalbe == TRUE)
		&& (DJG_BiffParty == TRUE)	
		&& (DJG_Biff_Stay == FALSE)	
		{
			//Joly:return TRUE;
		};
};

func void DIA_Biff_KOHLEWEGGEBEN_Info ()
{
	AI_Output			(self, other, "DIA_Biff_KOHLEWEGGEBEN_07_00"); //Verteil nicht dein ganzes Gold in der Weltgeschichte.
	AI_Output			(self, other, "DIA_Biff_KOHLEWEGGEBEN_07_01"); //Dann gib es lieber mir.

	AI_StopProcessInfos (self);
	DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);	// Biff merkt sich wieder, wieviel Geld der Spieler jetzt hat.
};


///////////////////////////////////////////////////////////////////////
//	Info BiffLosWerden
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_BIFFLOSWERDEN		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 11;
	condition	 = 	DIA_Biff_BIFFLOSWERDEN_Condition;
	information	 = 	DIA_Biff_BIFFLOSWERDEN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ich denke, ab hier beenden wir unsere Zusammenarbeit.";
};

func int DIA_Biff_BIFFLOSWERDEN_Condition ()
{
	if (DJG_BiffParty == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Biff_BIFFLOSWERDEN_Info ()
{
	AI_Output			(other, self, "DIA_Biff_BIFFLOSWERDEN_15_00"); //Ich denke, ab hier beenden wir unsere Zusammenarbeit.
	AI_Output			(self, other, "DIA_Biff_BIFFLOSWERDEN_07_01"); //Wie du meinst. Ich kann mir auch was besseres vorstellen. Mach's gut.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_Biff_HalbeHalbe = FALSE;
	DJG_BiffParty = FALSE;
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore + 1);
};

///////////////////////////////////////////////////////////////////////
//	Info MehrGeld
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_MEHRGELD		(C_INFO)
{
	npc		 	= 	DJG_713_Biff;
	nr			 = 12;
	condition	 = 	DIA_Biff_MEHRGELD_Condition;
	information	 = 	DIA_Biff_MEHRGELD_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Biff_MEHRGELD_Condition ()
{
	if 	(DJG_BiffParty == TRUE)
		&& (Npc_RefuseTalk(self) == FALSE)
		&& (DJG_Biff_Stay == FALSE)	
		{
				return TRUE;
		};
};
var int DIA_Biff_MEHRGELD_Info_OneTime;
func void DIA_Biff_MEHRGELD_Info ()
{
	AI_Output			(self, other, "DIA_Biff_MEHRGELD_07_00"); //So langsam bekomme ich das Gefühl, dass ich mehr Geld von dir bekommen sollte.

	if (DJG_Biff_HalbeHalbe == TRUE)
	{
		AI_Output			(self, other, "DIA_Biff_MEHRGELD_07_01"); //Also 100 Goldmünzen sollten es schon sein.
		if (DIA_Biff_MEHRGELD_Info_OneTime == FALSE)
		{
			AI_Output			(self, other, "DIA_Biff_MEHRGELD_07_02"); //Keine Sorge. Ich hab natürlich nicht vergessen, dass wir die Beute teilen.
			AI_Output			(self, other, "DIA_Biff_MEHRGELD_07_03"); //Deshalb werde ich dich auch nicht so häufig damit nerven, mir mehr Geld zu geben.
			DIA_Biff_MEHRGELD_Info_OneTime = TRUE;
		};
	}
	else
	{
		AI_Output			(self, other, "DIA_Biff_MEHRGELD_07_04"); //Ich will weitere 100 Goldmünzen.
	};
	
	Info_ClearChoices	(DIA_Biff_MEHRGELD);
	
	Info_AddChoice	(DIA_Biff_MEHRGELD, "Du bist mir zu teuer.", DIA_Biff_MEHRGELD_zuTeuer );
	Info_AddChoice	(DIA_Biff_MEHRGELD, "In Ordnung. Du bist es wert.", DIA_Biff_MEHRGELD_ok );

};

func void DIA_Biff_MEHRGELD_ok ()
{
	AI_Output			(other, self, "DIA_Biff_MEHRGELD_ok_15_00"); //In Ordnung. Du bist es wert.

	if (B_GiveInvItems (other, self, ItMi_Gold,100))
		{
			AI_Output			(self, other, "DIA_Biff_MEHRGELD_ok_07_01"); //Das will ich meinen. Dann also weiter.

			AI_StopProcessInfos (self);

			if (DJG_Biff_HalbeHalbe == TRUE)
			{
				DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);	// Biff schaut, wieviel Geld der Spieler jetzt hat.
			};
			B_Biff_SetRefuseTalk ();
		}
		else
		{
			AI_Output			(self, other, "DIA_Biff_MEHRGELD_ok_07_02"); //Du armer Schlucker kannst ja nicht mal einen Waffenknecht bezahlen.
			AI_Output			(self, other, "DIA_Biff_MEHRGELD_ok_07_03"); //Ich such mir lieber einen anderen Geschäftspartner.
			
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,"Start");
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			DJG_Biff_HalbeHalbe = FALSE;
			DJG_BiffParty = FALSE;
			DJG_BiffParty_nomore = (DJG_BiffParty_nomore + 2);
		};
};

func void DIA_Biff_MEHRGELD_zuTeuer ()
{
	AI_Output			(other, self, "DIA_Biff_MEHRGELD_zuTeuer_15_00"); //Du bist mir zu teuer.
	AI_Output			(self, other, "DIA_Biff_MEHRGELD_zuTeuer_07_01"); //Dann mach gefälligst deinen Dreck von jetzt an alleine.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BiffParty = FALSE;
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore + 2);
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_HEILUNG		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 	4;
	condition	 = 	DIA_Biff_HEILUNG_Condition;
	information	 = 	DIA_Biff_HEILUNG_Info;
	permanent	 = 	TRUE;

	description	 = 	"Brauchst du Heilung?";
};

func int DIA_Biff_HEILUNG_Condition ()
{
	if (DJG_BiffParty == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Biff_HEILUNG_Info ()
{
	AI_Output			(other, self, "DIA_Biff_HEILUNG_15_00"); //Brauchst du Heilung?
	AI_Output			(self, other, "DIA_Biff_HEILUNG_07_01"); //Klar. Schaden kann's nicht.

	Info_ClearChoices	(DIA_Biff_HEILUNG);
	Info_AddChoice	(DIA_Biff_HEILUNG, "Ich werde dir später etwas geben.", DIA_Biff_HEILUNG_spaeter );
	Info_AddChoice	(DIA_Biff_HEILUNG, "(den kleinsten Heiltrank.)", DIA_Biff_HEILUNG_heiltrankLow );
	Info_AddChoice	(DIA_Biff_HEILUNG, "(den besten Heiltrank.)", DIA_Biff_HEILUNG_heiltrank );

};
func void DIA_Biff_HEILUNG_heiltrank ()
{
	if (B_GiveInvItems (other, self, ItPo_Health_03,1))
	{
	B_UseItem (self, ItPo_Health_03);
	}
	else if (B_GiveInvItems (other, self, ItPo_Health_02,1))
	{
	B_UseItem (self, ItPo_Health_02);
	}
	else if (B_GiveInvItems (other, self, ItPo_Health_01,1))
	{
	B_UseItem (self, ItPo_Health_01);
	}
	else
	{
	AI_Output			(self, other, "DIA_Biff_HEILUNG_heiltrank_07_00"); //Ich schätze, ich muss warten, bis du einen übrig hast.
	};

	AI_StopProcessInfos (self);
};
func void DIA_Biff_HEILUNG_heiltrankLow ()
{
	if (B_GiveInvItems (other, self, ItPo_Health_01,1))
	{
	B_UseItem (self, ItPo_Health_01);
	}
	else if (B_GiveInvItems (other, self, ItPo_Health_02,1))
	{
	B_UseItem (self, ItPo_Health_02);
	}
	else if (B_GiveInvItems (other, self, ItPo_Health_03,1))
	{
	B_UseItem (self, ItPo_Health_03);
	}
	else
	{
	AI_Output			(self, other, "DIA_Biff_HEILUNG_heiltrankLow_07_00"); //Im Moment hast du leider keinen. Ich komm später noch mal darauf zurück.
	};

	AI_StopProcessInfos (self);
};
func void DIA_Biff_HEILUNG_spaeter ()
{
	AI_Output			(other, self, "DIA_Biff_HEILUNG_spaeter_15_00"); //Ich werde dir später etwas geben.
	AI_Output			(self ,other, "DIA_Biff_HEILUNG_spaeter_07_01"); //Vergiss es aber nicht.
	
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info drachentot
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_DRACHENTOT		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 	5;
	condition	 = 	DIA_Biff_DRACHENTOT_Condition;
	information	 = 	DIA_Biff_DRACHENTOT_Info;

	description	 = 	"Das wäre geschafft. Alle Drachen sind tot.";
};

func int DIA_Biff_DRACHENTOT_Condition ()
{
	if (DJG_BiffSurvivedLastDragon == TRUE) 
		{
				return TRUE;
		};
};

func void DIA_Biff_DRACHENTOT_Info ()
{
	AI_Output			(other, self, "DIA_Biff_DRACHENTOT_15_00"); //Das wäre geschafft. Alle Drachen sind tot.
	AI_Output			(self, other, "DIA_Biff_DRACHENTOT_07_01"); //Ja. Und ich stehe noch.
	AI_Output			(self, other, "DIA_Biff_DRACHENTOT_07_02"); //Bist du dir sicher, dass es der letzte war?
	AI_Output			(other, self, "DIA_Biff_DRACHENTOT_15_03"); //Ich denke schon.
	AI_Output			(self, other, "DIA_Biff_DRACHENTOT_07_04"); //Schade. Ich war gerade so schön in Fahrt.
	B_GivePlayerXP (XP_BiffSurvivedLastDragon);
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	DJG_713_Biff;
	nr			 = 	2;
	condition	 = 	DIA_Biff_KnowWhereEnemy_Condition;
	information	 = 	DIA_Biff_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Lust auf eine kleine Weltreise?";
};
func int DIA_Biff_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Biff_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Biff_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Biff_KnowWhereEnemy_15_00"); //Lust auf eine kleine Weltreise?
	AI_Output			(self, other, "DIA_Biff_KnowWhereEnemy_07_01"); //Was?
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Biff_KnowWhereEnemy_15_02"); //Schon gut. Mein Schiff ist ohnehin schon voll.
		AI_Output			(self, other, "DIA_Biff_KnowWhereEnemy_07_03"); //Hör auf mich zu verarschen, Mann.
	}
	else 
	{
		AI_Output			(other,self , "DIA_Biff_KnowWhereEnemy_15_04"); //Ich werde Khorinis verlassen und auf einer Insel nach neuen Gegnern suchen.

		Info_ClearChoices (DIA_Biff_KnowWhereEnemy);
		Info_AddChoice (DIA_Biff_KnowWhereEnemy,"Aber das nur so am Rande.",DIA_Biff_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Biff_KnowWhereEnemy,"Komm doch mit.",DIA_Biff_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Biff_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Biff_KnowWhereEnemy_Yes_15_00"); //Komm doch mit.
	AI_Output (self ,other,"DIA_Biff_KnowWhereEnemy_Yes_07_01"); //Mehr Gegner sind mir egal. Ich will ...
	AI_Output (other,self ,"DIA_Biff_KnowWhereEnemy_Yes_15_02"); //Dort, wo wir hingehen, wird es mehr Gold geben, als du tragen kannst.
	AI_Output (self ,other,"DIA_Biff_KnowWhereEnemy_Yes_07_03"); //Wenn das so ist, bin ich dabei. Wo geht's hin?
	AI_Output (other,self ,"DIA_Biff_KnowWhereEnemy_Yes_15_04"); //Wir müssen dich erst mal aus dem Minental heraus holen.
	AI_Output (self ,other,"DIA_Biff_KnowWhereEnemy_Yes_07_05"); //Kein Problem. Ich bin schon unterwegs. Treff mich am Pass.

	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	                       
    Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	                       
    B_LogEntry (TOPIC_Crew,"Die Aussicht auf reiche Beute hat Biff überzeugen können mich auf meiner Reise zu begleiten. So lange er genug Gold bekommt, kann ich auf ihn zählen."); 
    
    B_GivePlayerXP (XP_Crewmember_Success);   

	self.flags 		 = NPC_FLAG_IMMORTAL;
	Biff_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	Biff_FollowsThroughPass = LOG_RUNNING;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"RunsToPass"); 

	Info_ClearChoices (DIA_Biff_KnowWhereEnemy);
};

FUNC VOID DIA_Biff_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Biff_KnowWhereEnemy_No_15_00"); //Aber das nur so am Rande.
	AI_Output (self ,other,"DIA_Biff_KnowWhereEnemy_No_07_01"); //So so. Na dann, viel Spaß.

	Biff_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Biff_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	Gleich geht´s los
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_Pass		(C_INFO)
{
	npc			 = 	DJG_713_Biff;
	nr			 = 	55;
	condition	 = 	DIA_Biff_Pass_Condition;
	information	 = 	DIA_Biff_Pass_Info;
	PERMANENT 	 =  TRUE;

	description	 = 	"Schaffst du's über den Pass?";
};
func int DIA_Biff_Pass_Condition ()
{	
	if (Npc_GetDistToWP(self,"START")<1000)
	&& (Biff_IsOnBoard == LOG_SUCCESS) 
		{
				return TRUE;
		};
};
func void DIA_Biff_Pass_Info ()
{
	AI_Output			(other, self, "DIA_Biff_Pass_15_00"); //Schaffst du's über den Pass?
	AI_Output			(self, other, "DIA_Biff_Pass_07_01"); //Quatsch hier nicht rum. Geh weiter. Ich will endlich rüber.
	AI_StopProcessInfos (self);

};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Biff_PICKPOCKET (C_INFO)
{
	npc			= DJG_713_Biff;
	nr			= 900;
	condition	= DIA_Biff_PICKPOCKET_Condition;
	information	= DIA_Biff_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Biff_PICKPOCKET_Condition()
{
	C_Beklauen (92, 320);
};
 
FUNC VOID DIA_Biff_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Biff_PICKPOCKET);
	Info_AddChoice		(DIA_Biff_PICKPOCKET, DIALOG_BACK 		,DIA_Biff_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Biff_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Biff_PICKPOCKET_DoIt);
};

func void DIA_Biff_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Biff_PICKPOCKET);
};
	
func void DIA_Biff_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Biff_PICKPOCKET);
};

































