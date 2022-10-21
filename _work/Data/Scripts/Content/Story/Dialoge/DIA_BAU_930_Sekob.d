// ************************************************************
// 			  					EXIT 
// ************************************************************
INSTANCE DIA_Sekob_EXIT (C_INFO)
{
	npc         = BAU_930_Sekob;
	nr          = 999;
	condition   = DIA_Sekob_EXIT_Condition;
	information = DIA_Sekob_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Sekob_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Sekob_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
 
// ************************************************************
// 			  					Hallo 
// ************************************************************
instance DIA_Sekob_HALLO (C_INFO)
{
	npc		 	= BAU_930_Sekob;
	nr		 	= 3;
	condition	= DIA_Sekob_HALLO_Condition;
	information	= DIA_Sekob_HALLO_Info;
	permanent	= FALSE;
	important	= TRUE;
};

func int DIA_Sekob_HALLO_Condition ()
{
	if (Kapitel < 3)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Sekob_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Sekob_HALLO_01_00"); //Was willst du auf meinem Land? Hier gibt's nichts zu klauen. Scher dich weg.
	AI_Output (other, self, "DIA_Sekob_HALLO_15_01"); //Gibt es in diesem verfluchten Land eigentlich ein Fleckchen Erde, das nicht irgendjemand gehört?
	AI_Output (self, other, "DIA_Sekob_HALLO_01_02"); //Geh arbeiten, dann kannst du vielleicht auch irgendwann mal ein Stück Land dein Eigen nennen. Aber bis dahin lungerst du gefälligst woanders rum.
};

// ************************************************************
// 			  					PermVorMis 
// ************************************************************
instance DIA_Sekob_PermVorMis (C_INFO)
{
	npc		 	= BAU_930_Sekob;
	nr		 	= 3;
	condition	= DIA_Sekob_PermVorMis_Condition;
	information	= DIA_Sekob_PermVorMis_Info;
	permanent	= TRUE;
	description	= "Hör mal...";
};

func int DIA_Sekob_PermVorMis_Condition ()
{
	if (Kapitel < 3)
	&& (MIS_Torlof_HolPachtVonSekob == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Sekob_PermVorMis_Info ()
{
	AI_Output (other, self, "DIA_Sekob_PermVorMis_15_00"); //Hör mal...
	AI_Output (self, other, "DIA_Sekob_PermVorMis_01_01"); //Ich hab zurzeit keine Arbeit für dich! Jetzt geh!
};

// ************************************************************
// 			  				ZAHL PACHT 
// ************************************************************
instance DIA_Sekob_ZAHLPACHT		(C_INFO)
{
	npc		 	= BAU_930_Sekob;
	nr		 	= 5;
	condition	= DIA_Sekob_ZAHLPACHT_Condition;
	information	= DIA_Sekob_ZAHLPACHT_Info;
	permanent	= FALSE;
	description	= "Onar will, daß du endlich deine Pacht bezahlst.";
};

func int DIA_Sekob_ZAHLPACHT_Condition ()
{
	if (MIS_Torlof_HolPachtVonSekob == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Sekob_ZAHLPACHT_Info ()
{
	AI_Output (other, self, "DIA_Sekob_ZAHLPACHT_15_00"); //Das Land gehört dem Großbauern. Du bist hier nur der Pächter. Onar will, dass du endlich deine Pacht bezahlst. Du bist schon seit Wochen überfällig.
	AI_Output (self, other, "DIA_Sekob_ZAHLPACHT_01_01"); //Was? Und da schickt er einen Halunken wie dich? Das glaubst du doch selber nicht.
	AI_Output (self, other, "DIA_Sekob_ZAHLPACHT_01_02"); //Mach, dass du weg kommst, bevor ich mich vergesse.
	
	self.aivar[AIV_DefeatedByPlayer] = FALSE; //WICHTIG
};

// ************************************************************
// 			  				Kohle Raus (not defeated)
// ************************************************************
instance DIA_Sekob_KohleRaus		(C_INFO)
{
	npc		 	= BAU_930_Sekob;
	nr		 	= 5;
	condition	= DIA_Sekob_KohleRaus_Condition;
	information	= DIA_Sekob_KohleRaus_Info;
	permanent	= TRUE;
	description	= "Rück die Kohle raus oder ich schlag dir die Zähne ein!";
};

func int DIA_Sekob_KohleRaus_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Sekob_ZAHLPACHT))
	&& (self.aivar[AIV_DefeatedByPlayer] == FALSE) 
	{
		return TRUE;
	};
};

func void DIA_Sekob_KohleRaus_Info ()
{
	AI_Output (other, self, "DIA_Sekob_KohleRaus_15_00"); //Rück die Kohle raus oder ich schlag dir die Zähne ein!
	AI_Output (self, other, "DIA_Sekob_KohleRaus_01_01"); //Du Verbrecher gehst mir nicht an den Geldbeutel, DU NICHT!
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);	
};

// ************************************************************
// 			  				InformOnar
// ************************************************************
instance DIA_Sekob_InformOnar		(C_INFO)
{
	npc		 	= BAU_930_Sekob;
	nr		 	= 5;
	condition	= DIA_Sekob_InformOnar_Condition;
	information	= DIA_Sekob_InformOnar_Info;
	permanent	= FALSE;
	description	= "Ich werde dann wohl Onar darüber informieren müssen...";
};

func int DIA_Sekob_InformOnar_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Sekob_ZAHLPACHT))
	&& (self.aivar[AIV_DefeatedByPlayer] == FALSE) 
	{
		return TRUE;
	};
};

func void DIA_Sekob_InformOnar_Info ()
{
	AI_Output (other, self, "DIA_Sekob_InformOnar_15_00"); //Ich werde dann wohl Onar darüber informieren müssen...
	AI_Output (self, other, "DIA_Sekob_InformOnar_01_01"); //Von mir aus! Du kannst Onar sagen, ich habe nichts. Das ist die traurige Wahrheit.
	MIS_Sekob_RedeMitOnar = LOG_RUNNING;
	AI_StopProcessInfos (self);
};

	
// ************************************************************
// 			  				Defeated (Kohle Raus II)
// ************************************************************
instance DIA_Sekob_Defeated		(C_INFO)
{
	npc		 	= BAU_930_Sekob;
	nr		 	= 5;
	condition	= DIA_Sekob_Defeated_Condition;
	information	= DIA_Sekob_Defeated_Info;
	permanent	= FALSE;
	description	= "Wo hast du das Geld!?!";
};

func int DIA_Sekob_Defeated_Condition ()
{
	if (self.aivar[AIV_DefeatedByPlayer] == TRUE) 
	&& (Npc_KnowsInfo (other, DIA_Sekob_ZAHLPACHT))
	&& (Sekob_Pachtbezahlt == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Sekob_Defeated_Info ()
{
	AI_Output (other, self, "DIA_Sekob_Defeated_15_00"); //Wo hast du das Geld!?!
	AI_Output (self, other, "DIA_Sekob_Defeated_01_01"); //Nicht mehr schlagen, bitte. Ich will ja alles machen.
	AI_Output (other, self, "DIA_Sekob_Defeated_15_02"); //Dann zahl' deine Pacht.
	AI_Output (self, other, "DIA_Sekob_Defeated_01_03"); //(weinerlich) Aber Herr, ich hab doch nichts. Ich bin doch nur ein armes Schwein und halb verhungert.
	AI_Output (self, other, "DIA_Sekob_Defeated_01_04"); //Meine letzte Ernte ist völlig vertrocknet. Ich WILL meine Pacht bezahlen, aber ich HABE einfach nichts. Hab doch Mitleid.

	Info_ClearChoices	(DIA_Sekob_Defeated);
	Info_AddChoice	(DIA_Sekob_Defeated, "Bezahl´ jetzt deine Pacht oder ich bring´ dich um.", DIA_Sekob_Defeated_hart);
	Info_AddChoice	(DIA_Sekob_Defeated, "Gut, ich werde mit Onar reden.", DIA_Sekob_Defeated_weich);
};

func void DIA_Sekob_Defeated_Weich()
{
	AI_Output (other, self, "DIA_Sekob_Defeated_weich_15_00"); //Gut, ich werde mit Onar reden.
	AI_Output (self, other, "DIA_Sekob_Defeated_weich_01_01"); //Tausend Dank, Herr. Tausend Dank!
	MIS_Sekob_RedeMitOnar = LOG_RUNNING;
	
	AI_StopProcessInfos (self);
};

			func void B_Sekob_Kassieren()
			{
				AI_Output (other, self, "DIA_Sekob_Kassieren_15_00"); //Rede keinen Unsinn. Hier regnet's ständig und deine Vorratskammer ist voll. Bezahl' jetzt deine Pacht oder ich bring dich um.
				AI_Output (self, other, "DIA_Sekob_Kassieren_01_01"); //(unterwürfig) Nein, bitte, hier nimm das Gold. Ich leg sogar noch einen Bonus drauf, wenn du mich nur leben lässt.
				B_GiveInvItems (self, other, ItMi_Gold, 60);
				AI_Output (other, self, "DIA_Sekob_Kassieren_15_02"); //Es geht doch.
				AI_Output (self ,other, "DIA_Sekob_Kassieren_01_03"); //(verzweifelt) Das ist mein Ruin.
				Sekob_Pachtbezahlt = TRUE;
			
				AI_StopProcessInfos (self);	
			};

func void DIA_Sekob_Defeated_hart()
{
	B_Sekob_Kassieren();
};


// ************************************************************
// 			  				Again (und nach Onar)
// ************************************************************
instance DIA_Sekob_Again		(C_INFO)
{
	npc		 	= BAU_930_Sekob;
	nr		 	= 5;
	condition	= DIA_Sekob_Again_Condition;
	information	= DIA_Sekob_Again_Info;
	permanent	= TRUE;
	description	= "Wegen deiner Pacht...";
};

func int DIA_Sekob_Again_Condition ()
{
	if (MIS_Sekob_RedeMitOnar == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Sekob_Defeated))
	&& (Sekob_Pachtbezahlt == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Sekob_Again_Info ()
{
	AI_Output (other, self, "DIA_Sekob_Again_15_00"); //Wegen deiner Pacht...
	AI_Output (self, other, "DIA_Sekob_Again_01_01"); //Du redest mit Onar, ja?
	
	Info_ClearChoices	(DIA_Sekob_Again);
	Info_AddChoice	(DIA_Sekob_Again, "Ich hab's mir anders überlegt.", DIA_Sekob_Again_Nein);
	
	if (Onar_WegenSekob == TRUE)
	{
		Info_AddChoice	(DIA_Sekob_Again, "Das habe ich...", DIA_Sekob_Again_verarscht);
	}
	else
	{
		Info_AddChoice	(DIA_Sekob_Again, "Klar.", DIA_Sekob_Again_Ja);
	};
};

func void DIA_Sekob_Again_Nein()
{
	AI_Output (other, self, "DIA_Sekob_Again_Nein_15_00"); //Ich hab's mir anders überlegt.
	B_Sekob_Kassieren();
};

func void DIA_Sekob_Again_Ja()
{
	AI_Output (other, self, "DIA_Sekob_Again_Ja_15_00"); //Klar.
	AI_Output (self ,other, "DIA_Sekob_Again_Ja_01_01"); //Du wirst das schaffen.
	
	AI_StopProcessInfos (self);
};
	
func void DIA_Sekob_Again_verarscht()
{
	MIS_Sekob_RedeMitOnar = LOG_SUCCESS;
	AI_Output (other, self, "DIA_Sekob_Again_verarscht_15_00"); //Das habe ich ...
	AI_Output (self, other, "DIA_Sekob_Again_verarscht_01_01"); //Und? Was hat er gesagt?
	AI_Output (other, self, "DIA_Sekob_Again_verarscht_15_02"); //Tut mir leid, aber ich muss dir jetzt den Kopf abreißen.
	AI_Output (self, other, "DIA_Sekob_Again_verarscht_01_03"); //Aber warum? Was habe ich getan?
	AI_Output (other, self, "DIA_Sekob_Again_verarscht_15_04"); //Mich verarscht.
	AI_Output (self, other, "DIA_Sekob_Again_verarscht_01_05"); //Ich hab die Wahrheit gesagt - ehrlich!
	B_Sekob_Kassieren();
};

// ************************************************************
// 			  			Perm Kap 1
// ************************************************************
instance DIA_Sekob_PERMKAP1		(C_INFO)
{
	npc		 	 = 	BAU_930_Sekob;
	nr		     = 	6;
	condition	 = 	DIA_Sekob_PERMKAP1_Condition;
	information	 = 	DIA_Sekob_PERMKAP1_Info;
	permanent	 =  TRUE;
	description	 = 	"Das nächste Mal zahlst du pünktlich, klar?";
};

func int DIA_Sekob_PERMKAP1_Condition ()
{
	if (Sekob_Pachtbezahlt == TRUE)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Sekob_PERMKAP1_Info ()
{
	AI_Output (other, self, "DIA_Sekob_PERMKAP1_15_00"); //Das nächste Mal zahlst du pünktlich, klar?
	AI_Output (self, other, "DIA_Sekob_PERMKAP1_01_01"); //(zu sich selbst) Womit hab ich das nur verdient ...
	AI_StopProcessInfos (self);
};


//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Sekob_KAP3_EXIT(C_INFO)
{
	npc			= BAU_930_Sekob;
	nr			= 999;
	condition	= DIA_Sekob_KAP3_EXIT_Condition;
	information	= DIA_Sekob_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Sekob_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Sekob_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info DMt
///////////////////////////////////////////////////////////////////////
instance DIA_Sekob_DMT		(C_INFO)
{
	npc		 = 	BAU_930_Sekob;
	nr		 = 	30;
	condition	 = 	DIA_Sekob_DMT_Condition;
	information	 = 	DIA_Sekob_DMT_Info;

	description	 = 	"Ist was passiert?";
};

func int DIA_Sekob_DMT_Condition ()
{
	if (Kapitel >= 3)	
	{
		return TRUE;
	};
};

func void DIA_Sekob_DMT_Info ()
{
	AI_Output			(other, self, "DIA_Sekob_DMT_15_00"); //Ist was passiert?
	AI_Output			(self, other, "DIA_Sekob_DMT_01_01"); //Du musst mir helfen. Die schwarzen Männer sind in mein Haus eingedrungen.

		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output	(self, other, "DIA_Sekob_DMT_01_02"); //Ihr königlichen Gardeleute müsst euch doch um das Wohl aller kümmern, oder?
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output	(self, other, "DIA_Sekob_DMT_01_03"); //Ich weiß, ihr Söldner habt es nicht so mit der Nächstenliebe, aber ich würde es euch auch entlohnen.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Sekob_DMT_01_04"); //Du musst mir helfen, werter Herr Magier.
		};

	AI_Output			(self, other, "DIA_Sekob_DMT_01_05"); //Die Kerle sagten, sie würden etwas suchen. Aber doch nicht in meinem Haus.
	AI_Output			(self, other, "DIA_Sekob_DMT_01_06"); //Bitte, hilf mir. Mach, dass sie wieder verschwinden.

	Log_CreateTopic (TOPIC_SekobDMT, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SekobDMT, LOG_RUNNING);
	B_LogEntry (TOPIC_SekobDMT,"Die schwarzen Magier haben Sekob aus seinem Haus vertieben. Sekob Will, dass ich sie aus seinem Haus vertreibe."); 
};

///////////////////////////////////////////////////////////////////////
//	Info DMTWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Sekob_DMTWEG		(C_INFO)
{
	npc		 = 	BAU_930_Sekob;
	nr		 = 	31;
	condition	 = 	DIA_Sekob_DMTWEG_Condition;
	information	 = 	DIA_Sekob_DMTWEG_Info;

	description	 = 	"Dein Haus ist leer.";
};

func int DIA_Sekob_DMTWEG_Condition ()
{
	if (Kapitel >= 3)	
	&& (Npc_KnowsInfo(other, DIA_Sekob_DMT))
	&& (Npc_IsDead(DMT_DementorAmbientSekob1))	
	&& (Npc_IsDead(DMT_DementorAmbientSekob2))	
	&& (Npc_IsDead(DMT_DementorAmbientSekob3))	
	&& (Npc_IsDead(DMT_DementorAmbientSekob4))	
		{
			return TRUE;
		};
};

func void DIA_Sekob_DMTWEG_Info ()
{
	AI_Output			(other, self, "DIA_Sekob_DMTWEG_15_00"); //Dein Haus ist leer. Die schwarzen Männer sind weg.
	
		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output	(self, other, "DIA_Sekob_DMTWEG_01_01"); //Ich wusste doch, dass man sich auf die Garde verlassen kann.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output	(self, other, "DIA_Sekob_DMTWEG_01_02"); //Das hast du gut gemacht. Onar kann sich glücklich schätzen, solche Leute an seiner Seite zu haben.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Sekob_DMTWEG_01_03"); //Ich danke dir, werter Herr Magier. Was wären wir nur ohne die schützende Hand der Geistlichkeit.
		};
	TOPIC_END_SekobDMT = TRUE;
	B_GivePlayerXP (XP_SekobDMTWEG);

	if (Kapitel < 5)
	{
		Npc_ExchangeRoutine	(self,"Start");
	}
	else
	{
		Npc_ExchangeRoutine	(self,"Obsessed");
	};
	
	if (Rosi_FleeFromSekob_Kap5 == FALSE)
	{
		B_StartOtherRoutine (Rosi,"Start"); 
		B_StartOtherRoutine (Till,"Start"); 
	};
	B_StartOtherRoutine (Balthasar,"Start"); 
	B_StartOtherRoutine (BAU_933_Rega,"Start"); 
	B_StartOtherRoutine (BAU_934_Babera,"Start"); 
	B_StartOtherRoutine (BAU_937_BAUER,"Start"); 
	B_StartOtherRoutine (BAU_938_BAUER,"Start"); 

};

///////////////////////////////////////////////////////////////////////
//	Info Belohnung
///////////////////////////////////////////////////////////////////////
instance DIA_Sekob_BELOHNUNG		(C_INFO)
{
	npc		 = 	BAU_930_Sekob;
	nr		 = 	32;
	condition	 = 	DIA_Sekob_BELOHNUNG_Condition;
	information	 = 	DIA_Sekob_BELOHNUNG_Info;

	description	 = 	"Nicht so schnell, mein Freundchen.";
};

func int DIA_Sekob_BELOHNUNG_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Sekob_DMTWEG))
	&& (Kapitel >= 3)	
		{
				return TRUE;
		};
};

func void DIA_Sekob_BELOHNUNG_Info ()
{
	AI_Output			(other, self, "DIA_Sekob_BELOHNUNG_15_00"); //Nicht so schnell, mein Freundchen.

	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			if (Npc_KnowsInfo(other, DIA_Rosi_WASMACHSTDU))
				{
					AI_Output			(other, self, "DIA_Sekob_BELOHNUNG_15_01"); //Von jetzt an wirst du deine schmutzigen Geschäfte einstellen und im Sinne der Gemeinschaft handeln, sonst komme ich zurück.
				};		
			AI_Output			(self, other, "DIA_Sekob_BELOHNUNG_01_02"); //Ich verstehe nicht. Was willst du noch?
		};

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(other, self, "DIA_Sekob_BELOHNUNG_15_03"); //Du hast doch was von einer Belohnung gefaselt, oder soll ich mich da verhört haben?
		};

	if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Sekob_BELOHNUNG_15_04"); //Mich interessiert nur eins. Was wollten die schwarzen Männer in deinem Haus?
			AI_Output			(self, other, "DIA_Sekob_BELOHNUNG_01_05"); //Ich kann es mir nicht erklären, ehrenwerter Herr Magier. Vielleicht hat es ...
			AI_Output			(other, self, "DIA_Sekob_BELOHNUNG_15_06"); //Was?
			AI_Output			(self, other, "DIA_Sekob_BELOHNUNG_01_07"); //Tut mir Leid. Ich habe vor einigen Jahren geschworen, darüber zu schweigen, und ich habe auch nicht vor, meinen Schwur zu brechen.
		};

	AI_Output			(self, other, "DIA_Sekob_BELOHNUNG_01_08"); //Alles, was ich tun kann, ist, dir ein wenig Gold geben und dich bitten, mich zu verschonen.
	AI_Output			(other, self, "DIA_Sekob_BELOHNUNG_15_09"); //Gib schon her. Ich hab's eilig.
	AI_Output			(self, other, "DIA_Sekob_BELOHNUNG_01_10"); //Hier.
	CreateInvItems (self, ItMi_Gold, 250);									
	B_GiveInvItems (self, other, ItMi_Gold, 250);
	AI_StopProcessInfos (self);					

};

///////////////////////////////////////////////////////////////////////
//	Info perm
///////////////////////////////////////////////////////////////////////
instance DIA_Sekob_PERM		(C_INFO)
{
	npc		 = 	BAU_930_Sekob;
	nr		 = 	80;
	condition	 = 	DIA_Sekob_PERM_Condition;
	information	 = 	DIA_Sekob_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Irgendwas in der Zwischenzeit passiert?";
};

func int DIA_Sekob_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Sekob_BELOHNUNG))
	&& (Kapitel >= 3)	
	&& (NpcObsessedByDMT_Sekob == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Sekob_PERM_Info ()
{
	if (hero.guild == GIL_KDF)
	&& (Kapitel >= 5)
		{
			B_NpcObsessedByDMT (self);
		}
	else
		{
			AI_Output		(other, self, "DIA_Sekob_PERM_15_00"); //Irgendwas in der Zwischenzeit passiert?
			
			if (MIS_bringRosiBackToSekob == LOG_FAILED)
			{
				AI_Output		(self, other, "DIA_Sekob_PERM_01_01"); //Verschwinde.
			}
			else if (MIS_bringRosiBackToSekob == LOG_SUCCESS)
			{
				AI_Output		(self, other, "DIA_Sekob_PERM_01_02"); //Nein. Nichts Besonderes.
			}
			else if (Kapitel >= 5)
			&& (MIS_bringRosiBackToSekob != LOG_SUCCESS)
			{
				AI_Output		(self, other, "DIA_Sekob_PERM_01_03"); //Meine Frau ist verschwunden. Ich hab es erst gar nicht mitbekommen, und mit einem Mal war sie weg.
				AI_Output		(self, other, "DIA_Sekob_PERM_01_04"); //Ich vermute, sie ist vor den Feldräubern in die Wälder geflohen.
				AI_Output		(self, other, "DIA_Sekob_PERM_01_05"); //Tu mir einen Gefallen, wenn du sie findest, bring sie heil und gesund wieder zu mir zurück.
				MIS_bringRosiBackToSekob = LOG_RUNNING;
				Log_CreateTopic (TOPIC_bringRosiBackToSekob, LOG_MISSION);
				Log_SetTopicStatus(TOPIC_bringRosiBackToSekob, LOG_RUNNING);
				B_LogEntry (TOPIC_bringRosiBackToSekob,"Sekobs Frau Rosi ist verschwunden. Sekob will sie wieder haben."); 
			}
			else
			{
				AI_Output		(self, other, "DIA_Sekob_PERM_01_06"); //Seit die schwarzen Kerle in meinem Haus waren nicht.
			};
		};
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Sekob_KAP4_EXIT(C_INFO)
{
	npc			= BAU_930_Sekob;
	nr			= 999;
	condition	= DIA_Sekob_KAP4_EXIT_Condition;
	information	= DIA_Sekob_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Sekob_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Sekob_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Sekob_KAP5_EXIT(C_INFO)
{
	npc			= BAU_930_Sekob;
	nr			= 999;
	condition	= DIA_Sekob_KAP5_EXIT_Condition;
	information	= DIA_Sekob_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Sekob_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Sekob_KAP5_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_Sekob_Heilung		(C_INFO)
{
	npc		 = 	BAU_930_Sekob;
	nr		 = 	55;
	condition	 = 	DIA_Sekob_Heilung_Condition;
	information	 = 	DIA_Sekob_Heilung_Info;
	permanent	 = 	TRUE;

	description	 = 	"Du hast ein Problem.";
};

func int DIA_Sekob_Heilung_Condition ()
{
 	if (NpcObsessedByDMT_Sekob == TRUE) && (NpcObsessedByDMT == FALSE)
	&& (hero.guild == GIL_KDF)
	&& (Kapitel >= 5)
	 {
				return TRUE;
	 };
};

var int DIA_Sekob_Heilung_oneTime;
func void DIA_Sekob_Heilung_Info ()
{
	AI_Output			(other, self, "DIA_Sekob_Heilung_15_00"); //Du hast ein Problem.

	if (DIA_Sekob_Heilung_oneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Sekob_Heilung_01_01"); //Ja, genau. DU bist mein Problem, dreckiger Magier. Verschwinde endlich, sonst werde ich dir die Haut abziehen.
		AI_Output			(other, self, "DIA_Sekob_Heilung_15_02"); //(zu sich) Ein schwieriger Fall.
	
		B_NpcClearObsessionByDMT (self);
		DIA_Sekob_Heilung_oneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Sekob_Heilung_01_03"); //Du willst einfach nicht hören, was?
		AI_Output			(other, self, "DIA_Sekob_Heilung_15_04"); //(zu sich) Ein hoffnungsloser Fall.
		B_NpcClearObsessionByDMT (self);
		B_Attack (self, other, AR_NONE, 1);
	};

};


///////////////////////////////////////////////////////////////////////
//	Info rosibackatSekob
///////////////////////////////////////////////////////////////////////
instance DIA_Sekob_ROSIBACKATSEKOB		(C_INFO)
{
	npc		 = 	BAU_930_Sekob;
	nr		 = 	53;
	condition	 = 	DIA_Sekob_ROSIBACKATSEKOB_Condition;
	information	 = 	DIA_Sekob_ROSIBACKATSEKOB_Info;

	description	 = 	"Ich bringe dir deine Frau zurück.";
};

func int DIA_Sekob_ROSIBACKATSEKOB_Condition ()
{
	if (Kapitel >= 5)
	&& (hero.guild != GIL_KDF)
	&& (Npc_GetDistToWP(Rosi,"NW_FARM4_SEKOB")<3000)
	&& (MIS_bringRosiBackToSekob == LOG_RUNNING)
		{
				return TRUE;
		};
};

func void DIA_Sekob_ROSIBACKATSEKOB_Info ()
{
	AI_Output			(other, self, "DIA_Sekob_ROSIBACKATSEKOB_15_00"); //Ich bringe dir deine Frau zurück.
	AI_Output			(self, other, "DIA_Sekob_ROSIBACKATSEKOB_01_01"); //Das ist gut. Hier, nimm das für deine Mühen.
	MIS_bringRosiBackToSekob = LOG_SUCCESS;
	CreateInvItems (self, ItMi_Gold, 650);									
	B_GiveInvItems (self, other, ItMi_Gold, 650);					
	B_GivePlayerXP (XP_Ambient);
	B_NpcClearObsessionByDMT (self);
	B_StartOtherRoutine	(Rosi,"Start");
	B_StartOtherRoutine	(Till,"Start");

};

///////////////////////////////////////////////////////////////////////
//	Info rosineverback
///////////////////////////////////////////////////////////////////////
instance DIA_Sekob_ROSINEVERBACK		(C_INFO)
{
	npc		 = 	BAU_930_Sekob;
	nr		 = 	56;
	condition	 = 	DIA_Sekob_ROSINEVERBACK_Condition;
	information	 = 	DIA_Sekob_ROSINEVERBACK_Info;

	description	 = 	"Rosi wird nicht zu dir zurückkommen.";
};

func int DIA_Sekob_ROSINEVERBACK_Condition ()
{
	if (MIS_bringRosiBackToSekob == LOG_OBSOLETE)
	&& (hero.guild != GIL_KDF)
		{
				return TRUE;
		};
};

func void DIA_Sekob_ROSINEVERBACK_Info ()
{
	AI_Output			(other, self, "DIA_Sekob_ROSINEVERBACK_15_00"); //Rosi wird nicht zu dir zurückkommen. Ich habe sie in Sicherheit gebracht.
	AI_Output			(self, other, "DIA_Sekob_ROSINEVERBACK_01_01"); //In Sicherheit. Vor wem?
	AI_Output			(other, self, "DIA_Sekob_ROSINEVERBACK_15_02"); //Vor dir.
	AI_Output			(self, other, "DIA_Sekob_ROSINEVERBACK_01_03"); //Das wirst du bereuen, du Schwein.
	B_NpcClearObsessionByDMT (self);
	B_Attack (self, other, AR_NONE, 1);
	B_GivePlayerXP (XP_Ambient);
	MIS_bringRosiBackToSekob = LOG_FAILED;

};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Sekob_KAP6_EXIT(C_INFO)
{
	npc			= BAU_930_Sekob;
	nr			= 999;
	condition	= DIA_Sekob_KAP6_EXIT_Condition;
	information	= DIA_Sekob_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Sekob_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Sekob_KAP6_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Sekob_PICKPOCKET (C_INFO)
{
	npc			= BAU_930_Sekob;
	nr			= 900;
	condition	= DIA_Sekob_PICKPOCKET_Condition;
	information	= DIA_Sekob_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Sekob_PICKPOCKET_Condition()
{
	C_Beklauen (75, 230);
};
 
FUNC VOID DIA_Sekob_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Sekob_PICKPOCKET);
	Info_AddChoice		(DIA_Sekob_PICKPOCKET, DIALOG_BACK 		,DIA_Sekob_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sekob_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Sekob_PICKPOCKET_DoIt);
};

func void DIA_Sekob_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Sekob_PICKPOCKET);
};
	
func void DIA_Sekob_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Sekob_PICKPOCKET);
};















































