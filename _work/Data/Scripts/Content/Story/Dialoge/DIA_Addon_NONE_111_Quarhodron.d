///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Quarhodron_EXIT   (C_INFO)
{
	npc         = NONE_ADDON_111_Quarhodron;
	nr          = 999;
	condition   = DIA_Addon_Quarhodron_EXIT_Condition;
	information = DIA_Addon_Quarhodron_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Quarhodron_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Quarhodron_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Quarhodron_Hello		(C_INFO)
{
	npc		 = 	NONE_ADDON_111_Quarhodron;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Quarhodron_Hello_Condition;
	information	 = 	DIA_Addon_Quarhodron_Hello_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
var int DIA_Addon_Quarhodron_Hello_NoPerm;
func int DIA_Addon_Quarhodron_Hello_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (DIA_Addon_Quarhodron_Hello_NoPerm == FALSE)
		{
			return TRUE;
		};	
};

func void DIA_Addon_Quarhodron_Hello_Info ()
{
	IF (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	|| (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	|| (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_11_00"); //Warum störst du meine Ruhe, Wächter?
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_11_01"); //(verärgert) Sag mir, was ist dein Begehren?
		 
		Info_ClearChoices	(DIA_Addon_Quarhodron_Hello);
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "Was befindet sich im Tempel Adanos?", DIA_Addon_Quarhodron_Hello_schwert );
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "Jemand ist in den Tempel Adanos eingedrungen.", DIA_Addon_Quarhodron_Hello_raven );
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "Gewähre mir Zugang zum Tempel Adanos.", DIA_Addon_Quarhodron_Hello_tempel );
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "Das Land wird von Erdbeben heimgesucht.", DIA_Addon_Quarhodron_Hello_erdbeben );
		DIA_Addon_Quarhodron_Hello_NoPerm = TRUE;
		Npc_RemoveInvItems 	(hero, ItWr_Addon_SUMMONANCIENTGHOST,1); //Joly: sonst gammelt das ding unnütz herum.
		SC_TalkedToGhost = TRUE;
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_11_02"); //Bengla anthani, Osiri?
		B_Say (other, self, "$CANTUNDERSTANDTHIS");	
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_11_03"); //(laut) Bengla anthani?
		AI_StopProcessInfos (self);
	};
};
var int DIA_Addon_Quarhodron_Hello_ChoiceCounter;
var int B_Quarhodron_Hello_KommZumPunkt_OneTime;
func void B_Quarhodron_Hello_KommZumPunkt ()
{
	if (DIA_Addon_Quarhodron_Hello_ChoiceCounter >= 3)
	&& (B_Quarhodron_Hello_KommZumPunkt_OneTime == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "Die gepriesene Weisheit der Ahnen ist geradezu überwältigend.", DIA_Addon_Quarhodron_Hello_frech );
		B_Quarhodron_Hello_KommZumPunkt_OneTime = TRUE;
	};
};

func void DIA_Addon_Quarhodron_Hello_erdbeben ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_erdbeben_15_00"); //Das Land wird von Erdbeben heimgesucht. Wir müssen etwas unternehmen, sonst wird die ganze Insel im Meer versinken.
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_erdbeben_11_01"); //Es gibt nichts, was wir noch tun könnten.
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_erdbeben_11_02"); //Adanos' Zorn ist über Jharkendar gekommen, um die Ungläubigen zu vernichten.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt ();
};
func void DIA_Addon_Quarhodron_Hello_raven ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_raven_15_00"); //Jemand ist in den Tempel Adanos' eingedrungen.
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_raven_11_01"); //Unsinn. Ich selbst habe das Tor verriegelt. Es ist unmöglich zu passieren.
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_raven_15_02"); //Tatsächlich?
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt ();
};
func void DIA_Addon_Quarhodron_Hello_tempel ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_tempel_15_00"); //Gewähre mir Zugang zum Tempel Adanos'.
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_tempel_11_01"); //Der Tempel bleibt verschlossen bis in alle Ewigkeit. So wie der Rat es entschieden hat.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt ();
};
func void DIA_Addon_Quarhodron_Hello_schwert ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_schwert_15_00"); //Was befindet sich im Tempel Adanos'?
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_schwert_11_01"); //Mein größtes Leid, meine größte Enttäuschung.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt ();
};
func void DIA_Addon_Quarhodron_Hello_frech ()
{
	AI_Output	(other, self, "DIA_Addon_Quarhodron_Hello_frech_15_00"); //Die gepriesene Weisheit der Ahnen ist geradezu überwältigend.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_01"); //Ein Mann deines Standes spricht nicht so mit mir.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_02"); //Ich kann mich des Eindrucks nicht erwehren, dass du nicht der bist, der du vorgibst zu sein.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_03"); //Wenn du meiner Hilfe bedarfst, hast du mir erst Zeugnis über dich selbst abzulegen.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_04"); //Beantworte meine Fragen, damit ich Gewissheit habe, mich keinem Fremden zu offenbaren.
	
	Log_CreateTopic (TOPIC_Addon_Quarhodron, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Quarhodron,"Der Quarhodron will mir erst helfen, wenn ich Zeugnis über mich selbst ablege. Er hat mir einige schwierige Fragen gestellt. Die muss ich ihm erst noch beantworten, bevor er mir hilft."); 

	Info_ClearChoices	(DIA_Addon_Quarhodron_Hello);
};

///////////////////////////////////////////////////////////////////////
//	Info Fragen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Quarhodron_Fragen		(C_INFO)
{
	npc		 = 	NONE_ADDON_111_Quarhodron;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Quarhodron_Fragen_Condition;
	information	 = 	DIA_Addon_Quarhodron_Fragen_Info;
	permanent	 = 	TRUE;

	description	 = 	"Stell deine Fragen.";
};

func int DIA_Addon_Quarhodron_Fragen_Condition ()
{
	if (QuarhodronIstZufrieden == FALSE)
		{
			return TRUE;
		};
};

var int Quarhodrons_NextQuestion;
var int QuarhodronIstZufrieden;
var int Quarhodrons_RichtigeAntworten;
const int Quarhodron_AlleFragenGestellt = 100;
var int B_Quarhodron_Fragen_ChoicesOneTime;

func void B_Quarhodron_TestFailed ()
{
		AI_Output			(self, other, "DIA_Addon_Quarhodron_TestFailed_11_00"); //Deine Antworten sind so falsch wie deine Absichten.
		AI_Output			(self, other, "DIA_Addon_Quarhodron_TestFailed_11_01"); //Ich werde dir nicht helfen.
		AI_StopProcessInfos (self);	
};

func void B_Quarhodron_Fragen_Choices ()
{
	Log_AddEntry  (TOPIC_Addon_Quarhodron," --- QUARHODRONS FRAGEN --- "); 

	if (Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	{
		B_Quarhodron_TestFailed ();
	}
	else
	{
		if (Quarhodrons_NextQuestion == 1)
		&& (Quarhodrons_RichtigeAntworten == 0)
		{
			AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_00"); //Das glaube ich dir nicht.
			AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_01"); //Ich denke, du kommst erst wieder, wenn du dich dazu entschließt, mir die Wahrheit zu sagen.
			AI_StopProcessInfos (self);
		}
		else 
		{
			if (Quarhodrons_NextQuestion == 1)
			{
				if (B_Quarhodron_Fragen_ChoicesOneTime == FALSE)
				{
					AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_02"); //(nachdenklich) Die Fähigkeiten eines Totenwächter hätten es dir ermöglicht, mich zu erwecken, das ist wahr.
					AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_03"); //Wenn du wirklich der bist, der du vorgibst zu sein, wirst du alle meine Fragen beantworten können.
					AI_Output (self, other, "DIA_Addon_Quarhodron_Add_11_00"); //Bis auf eine ...
					
					B_Quarhodron_Fragen_ChoicesOneTime = TRUE;
				};
				Quarhodrons_NextQuestion = 2;
			};
			
			if (Quarhodrons_NextQuestion == 7)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_04"); //Wer hat das Portal verschlossen, um die Welt vor dem Bösen zu schützen?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- Wer hat das Portal verschlossen um die Welt vor dem Bösen zu schützen? --- "); 
				Quarhodrons_NextQuestion = Quarhodron_AlleFragenGestellt;
			}
			else if (Quarhodrons_NextQuestion == 6)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_05"); //Wer lindert das Leid und versorgt die Kranken?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- Wer lindert das Leid und versorgt die Kranken in Jharkendar? --- "); 
				Quarhodrons_NextQuestion = 7;
			}
			else if (Quarhodrons_NextQuestion == 5)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_06"); //Wer hat das letzte Wort im Rat der Fünf?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- Wer hat das letzte Wort im Rat der Fünf? --- "); 
				Quarhodrons_NextQuestion = 6;
			}	
			else if (Quarhodrons_NextQuestion == 4)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_07"); //Wer ist Schuld am dem Übel, das über uns gekommen ist?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- Wer ist Schuld am dem Übel, dass über das Volk von Jharkendar gekommen ist? --- "); 
				Quarhodrons_NextQuestion = 5;
			}
			else if (Quarhodrons_NextQuestion == 3)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_08"); //Wer kann mir einen direkten Befehl erteilen?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- Wer kann Quarhodron einen direkten Befehl erteilen? --- "); 
				Quarhodrons_NextQuestion = 4;
			}	
			else if (Quarhodrons_NextQuestion == 2)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_09"); //Wer schützte einst das Volk von Jharkendar vor feindlichen Angriffen?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- Wer schützte einst das Volk von Jharkendar vor feindlichen Angriffen? --- "); 
				Quarhodrons_NextQuestion = 3;
			};
			
			Info_ClearChoices	(DIA_Addon_Quarhodron_Fragen);
			
			if (Quarhodrons_NextQuestion >= Quarhodron_AlleFragenGestellt)
			{
				Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "Das kann ich gar nicht wissen.", DIA_Addon_Quarhodron_Fragen_NoPlan );
			}
			else
			{
				Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "Ich weiß es nicht.", DIA_Addon_Quarhodron_Fragen_NoPlan );
			};
			
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "Die Gelehrten.", DIA_Addon_Quarhodron_Fragen_gele );
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "Die Totenwächter.", DIA_Addon_Quarhodron_Fragen_totenw );
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "Die Priester.", DIA_Addon_Quarhodron_Fragen_prie );
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "Die Kriegerkaste.", DIA_Addon_Quarhodron_Fragen_warr );
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "Die Heiler.", DIA_Addon_Quarhodron_Fragen_heiler );
		};
	};
};
var int DIA_Addon_Quarhodron_Fragen_Info_OneTime;

func void DIA_Addon_Quarhodron_Fragen_Info ()
{
	Quarhodrons_NextQuestion 		= 0;
	Quarhodrons_RichtigeAntworten 	= 0;
	AI_Output	(other, self, "DIA_Addon_Quarhodron_Fragen_15_00"); //Stell deine Fragen.
	
	if (DIA_Addon_Quarhodron_Fragen_Info_OneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_11_01"); //Ich bin Quarhodron, der alte Kriegsherr von Jharkendar.
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_11_02"); //Du hast mich erweckt.
		
		DIA_Addon_Quarhodron_Fragen_Info_OneTime = TRUE;
	};
	
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_11_03"); //Welche Kaste von Jharkendar ist es, der du angehörst?

	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_warr ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_warr_15_00"); //Die Kriegerkaste.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	if (Quarhodrons_NextQuestion == 3)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	if (Quarhodrons_NextQuestion == 5)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_prie ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_prie_15_00"); //Die Priester.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	if (Quarhodrons_NextQuestion == 4)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_gele ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_gele_15_00"); //Die Gelehrten.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	if (Quarhodrons_NextQuestion == 6)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_totenw ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_totenw_15_00"); //Die Totenwächter.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_heiler ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_heiler_15_00"); //Die Heiler.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	if (Quarhodrons_NextQuestion == 7)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_NoPlan ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_NoPlan_15_00"); //Ich weiß es nicht.
	
	if (Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	&& (Quarhodrons_RichtigeAntworten >= 6) 
	{
		AI_Output			(self, other, "DIA_Addon_Quarhodron_Fragen_NoPlan_11_01"); //Gut. Ich vertraue dir und werde dir meine Hilfe gewähren.
		QuarhodronIstZufrieden = TRUE;
		Info_ClearChoices	(DIA_Addon_Quarhodron_Fragen);
	}
	else if (Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	{
		B_Quarhodron_TestFailed ();
	}
	else
	{	
		AI_Output			(self, other, "DIA_Addon_Quarhodron_Fragen_NoPlan_11_02"); //Dann verschwende nicht meine Zeit.
		AI_StopProcessInfos (self);	
	};
};

///////////////////////////////////////////////////////////////////////
//	Info GibMirKey
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Quarhodron_GibMirKey		(C_INFO)
{
	npc		 = 	NONE_ADDON_111_Quarhodron;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Quarhodron_GibMirKey_Condition;
	information	 = 	DIA_Addon_Quarhodron_GibMirKey_Info;

	description	 = 	"(Schlüssel zum Tempel verlangen)";
};
func int DIA_Addon_Quarhodron_GibMirKey_Condition ()
{
	if (QuarhodronIstZufrieden == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Quarhodron_GibMirKey_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_00"); //Jetzt hör mal zu, Meister. Ein ganz übler Bursche hat sich Zugang zum Tempel Adanos' verschafft.
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_01"); //Wenn du mich nicht gleich in den Tempel lässt, ist es vielleicht schon zu spät und es geht hier alles den Bach runter.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_02"); //Das kann nicht sein! Der Hohepriester KHARDIMON und ich sind die einzigen in Jharkendar, die wissen, wie man das Eingangstor zum Tempel Adanos' öffnet.
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_03"); //Tja. Dann wird wohl dein Kumpel KHARDIMON geplaudert haben.
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_04"); //Ich sage dir, das Tor war offen. Ich habe es selbst gesehen.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_05"); //Nun. Es liegt Wahrheit in deiner Stimme. Ich werde nicht mehr an deinen Worten zweifeln.
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_06"); //Das will ich auch hoffen.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_07"); //So nimm denn das Losungwort. Es steht auf dieser Steintafel. Sage die Worte am verschlossenen Tor des Tempels und es wird sich öffnen.
	CreateInvItems (self, ItMi_TempelTorKey, 1);									
	B_GiveInvItems (self, other, ItMi_TempelTorKey, 1);		
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_08"); //(schon halb tot) Meine Zeit ist abgelaufen. Ich kann dir leider nicht mehr helfen.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_09"); //(schon halb tot) Doch bedenke. Hüte dich vor den Kammern Adanos'. Sonst ist es dein sicherer Tod.
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_10"); //Moment mal. Was IST mit den Kammern?
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_11"); //(schon halb tot) Meine Kräfte schwinden. Leb wohl. Wir sehen uns wieder im Reich der Toten ...
	AI_StopProcessInfos (self);
	
	B_LogEntry (TOPIC_Addon_Quarhodron,"Quarhodron gab mir eine Steintafel, mit der ich das Eingangtor zum Tempel Adanos' öffnen kann."); 
	
	Log_CreateTopic (TOPIC_Addon_Kammern, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kammern, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Kammern,"Quarhodron erwähnte die 'Kammern Adanos' und dass ich mich vor ihnen hüten soll. Ich muss unbedingt heraus finden, was es damit auf sich hat, wenn ich im Tempel Adanos' nicht ins offne Messer laufen will."); 

	Ghost_SCKnowsHow2GetInAdanosTempel = TRUE;
};


