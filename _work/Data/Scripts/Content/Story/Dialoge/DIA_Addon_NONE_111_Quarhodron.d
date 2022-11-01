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
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_11_00"); //Proč rušíš můj odpočinek, strážče?
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_11_01"); //(rozzuâenę) Povęz, čeho ode mne žádáš?
		 
		Info_ClearChoices	(DIA_Addon_Quarhodron_Hello);
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "Co je v tom Adanovę chrámu?", DIA_Addon_Quarhodron_Hello_schwert );
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "Nękdo násilím vnikl do Adanova chrámu.", DIA_Addon_Quarhodron_Hello_raven );
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "Umožni mi pâístup do Adanova chrámu.", DIA_Addon_Quarhodron_Hello_tempel );
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "V zemi vypukla zemętâesení.", DIA_Addon_Quarhodron_Hello_erdbeben );
		DIA_Addon_Quarhodron_Hello_NoPerm = TRUE;
		Npc_RemoveInvItems 	(hero, ItWr_Addon_SUMMONANCIENTGHOST,1); //Joly: sonst gammelt das ding unnütz herum.
		SC_TalkedToGhost = TRUE;
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_11_02"); //Bengla anthani, Osiri?
		B_Say (other, self, "$CANTUNDERSTANDTHIS");	
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_11_03"); //(hlasitę) Bengla anthani?
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
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "Moudrost našich pâedků je skutečnę nesmírná.", DIA_Addon_Quarhodron_Hello_frech );
		B_Quarhodron_Hello_KommZumPunkt_OneTime = TRUE;
	};
};

func void DIA_Addon_Quarhodron_Hello_erdbeben ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_erdbeben_15_00"); //Zemi ničí zemętâesení. Musíme nęco udęlat, jinak se celý ostrov potopí do moâe.
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_erdbeben_11_01"); //Není ničeho, co by mohlo býti vykonáno.
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_erdbeben_11_02"); //Hnęv Adanův padl na Jharkendar, by ztrestal nevęâící.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt ();
};
func void DIA_Addon_Quarhodron_Hello_raven ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_raven_15_00"); //Kdosi vnikl do Adanova chrámu.
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_raven_11_01"); //Hloupost. Já sám dveâe zapečetil. Nelze se tam dostati.
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_raven_15_02"); //Opravdu?
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt ();
};
func void DIA_Addon_Quarhodron_Hello_tempel ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_tempel_15_00"); //Pusă mę do Adanova chrámu.
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_tempel_11_01"); //Chrám zůstane navęky uzavâen. Tak rozhodla rada.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt ();
};
func void DIA_Addon_Quarhodron_Hello_schwert ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_schwert_15_00"); //Co v tom Adanovę chrámu vlastnę je?
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_schwert_11_01"); //Můj nejhlubší žal, mé nejvętší zklamání.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt ();
};
func void DIA_Addon_Quarhodron_Hello_frech ()
{
	AI_Output	(other, self, "DIA_Addon_Quarhodron_Hello_frech_15_00"); //Moudrost našich pâedků je skutečnę ohromná.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_01"); //Muž tvého postavení se mnou ale nemůže hovoâiti.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_02"); //Mám neodbytný dojem, že nejsi tím, kým se zdáš.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_03"); //Potâebuješ-li mou pomoc, musíš nejprve dokázat, že jsi jí hoden.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_04"); //Odpovęz na mé otázky, abych męl jistotu, že nejsi cizincem.
	
	Log_CreateTopic (TOPIC_Addon_Quarhodron, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Quarhodron,"Quarhodron mi pomůže, pouze když mu prokážu svou cenu. Položil mi nękolik obtížných otázek - dokud na nę neodpovím, nemohu s jeho pomocí počítat."); 

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

	description	 = 	"Tak se ptej.";
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
		AI_Output			(self, other, "DIA_Addon_Quarhodron_TestFailed_11_00"); //Špatné odpovędi odhalily, že nemáš dobré úmysly.
		AI_Output			(self, other, "DIA_Addon_Quarhodron_TestFailed_11_01"); //Nepomohu ti.
		AI_StopProcessInfos (self);	
};

func void B_Quarhodron_Fragen_Choices ()
{
	Log_AddEntry  (TOPIC_Addon_Quarhodron," --- QUARHODRONOVY OTÁZKY ---"); 

	if (Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	{
		B_Quarhodron_TestFailed ();
	}
	else
	{
		if (Quarhodrons_NextQuestion == 1)
		&& (Quarhodrons_RichtigeAntworten == 0)
		{
			AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_00"); //Nevęâím ti.
			AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_01"); //Vraă se, teprve až se rozhodneš âíci mi pravdu.
			AI_StopProcessInfos (self);
		}
		else 
		{
			if (Quarhodrons_NextQuestion == 1)
			{
				if (B_Quarhodron_Fragen_ChoicesOneTime == FALSE)
				{
					AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_02"); //(pâemýšlí) Máš schopnosti strážců smrti, jinak bys mę neprobudil. To je zjevné.
					AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_03"); //Jsi-li vskutku tím, kým tvrdíš, męl bys znát odpovędi na všechny mé otázky.
					AI_Output (self, other, "DIA_Addon_Quarhodron_Add_11_00"); //Až na jednu.
					
					B_Quarhodron_Fragen_ChoicesOneTime = TRUE;
				};
				Quarhodrons_NextQuestion = 2;
			};
			
			if (Quarhodrons_NextQuestion == 7)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_04"); //Kdo uzavâel portál, aby svęt ochránil pâed zlem?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- Kdo uzavâel portál, aby zem zachránil pâed zlem? ---"); 
				Quarhodrons_NextQuestion = Quarhodron_AlleFragenGestellt;
			}
			else if (Quarhodrons_NextQuestion == 6)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_05"); //Kdo zmírŕuje utrpení a stará se o nemocné?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- Kdo tiší bolest a stará se o jharkendarské nemocné? ---"); 
				Quarhodrons_NextQuestion = 7;
			}
			else if (Quarhodrons_NextQuestion == 5)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_06"); //Kdo má poslední slovo v Radę pęti?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- Kdo męl poslední slovo v Radę pęti? ---"); 
				Quarhodrons_NextQuestion = 6;
			}	
			else if (Quarhodrons_NextQuestion == 4)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_07"); //Kdo na nás pâivolal zlo?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- Kdo má na svędomí zlo, jež zachvátilo lid Jharkendaru? ---"); 
				Quarhodrons_NextQuestion = 5;
			}
			else if (Quarhodrons_NextQuestion == 3)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_08"); //Kdo mi může udęliti pâímý pâíkaz?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- Kdo může Quarhodronovi pâímo rozkazovat? ---"); 
				Quarhodrons_NextQuestion = 4;
			}	
			else if (Quarhodrons_NextQuestion == 2)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_09"); //Kdo kdysi chránil jharkendarský lid pâed útoky nepâátel?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- Kdo kdysi chránil lid Jharkendaru pâed nepâátelskými útoky? ---"); 
				Quarhodrons_NextQuestion = 3;
			};
			
			Info_ClearChoices	(DIA_Addon_Quarhodron_Fragen);
			
			if (Quarhodrons_NextQuestion >= Quarhodron_AlleFragenGestellt)
			{
				Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "Tohle nemůžu vędęt.", DIA_Addon_Quarhodron_Fragen_NoPlan );
			}
			else
			{
				Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "Nevím.", DIA_Addon_Quarhodron_Fragen_NoPlan );
			};
			
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "Učenci.", DIA_Addon_Quarhodron_Fragen_gele );
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "Strážci smrti.", DIA_Addon_Quarhodron_Fragen_totenw );
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "Knęží.", DIA_Addon_Quarhodron_Fragen_prie );
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "Válečnická kasta.", DIA_Addon_Quarhodron_Fragen_warr );
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "Léčitelé.", DIA_Addon_Quarhodron_Fragen_heiler );
		};
	};
};
var int DIA_Addon_Quarhodron_Fragen_Info_OneTime;

func void DIA_Addon_Quarhodron_Fragen_Info ()
{
	Quarhodrons_NextQuestion 		= 0;
	Quarhodrons_RichtigeAntworten 	= 0;
	AI_Output	(other, self, "DIA_Addon_Quarhodron_Fragen_15_00"); //Tak se ptej.
	
	if (DIA_Addon_Quarhodron_Fragen_Info_OneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_11_01"); //Jsem Quarhodron, starý jharkendarský válečník.
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_11_02"); //Probudil jsi mę.
		
		DIA_Addon_Quarhodron_Fragen_Info_OneTime = TRUE;
	};
	
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_11_03"); //Ke které jharkendarské kastę náležíš?

	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_warr ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_warr_15_00"); //Válečnická kasta.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	if (Quarhodrons_NextQuestion == 3)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	if (Quarhodrons_NextQuestion == 5)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_prie ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_prie_15_00"); //Knęží.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	if (Quarhodrons_NextQuestion == 4)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_gele ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_gele_15_00"); //Učenci.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	if (Quarhodrons_NextQuestion == 6)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_totenw ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_totenw_15_00"); //Strážci smrti.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_heiler ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_heiler_15_00"); //Léčitelé.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	if (Quarhodrons_NextQuestion == 7)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_NoPlan ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_NoPlan_15_00"); //Nevím.
	
	if (Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	&& (Quarhodrons_RichtigeAntworten >= 6) 
	{
		AI_Output			(self, other, "DIA_Addon_Quarhodron_Fragen_NoPlan_11_01"); //Dobâe. Vęâím ti a pomohu ti.
		QuarhodronIstZufrieden = TRUE;
		Info_ClearChoices	(DIA_Addon_Quarhodron_Fragen);
	}
	else if (Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	{
		B_Quarhodron_TestFailed ();
	}
	else
	{	
		AI_Output			(self, other, "DIA_Addon_Quarhodron_Fragen_NoPlan_11_02"); //Tak už mę nezdržuj.
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

	description	 = 	"(požádat o klíč ke chrámu)";
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
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_00"); //Tak poslouchej. Jeden fakt zlej chlápek vniknul do Adanova chrámu.
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_01"); //Pokud mę hned teë nepustíš do chrámu, nejspíš už bude pâíliš pozdę a všechno bude ztraceno.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_02"); //To není možné! Veleknęz KHARDIMON a já jsme v Jharkendaru jediní, kdo znají tajemství otevâení brány do Adanova chrámu.
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_03"); //No, pak to ten tvůj kámoš KHARDIMON nejspíš vyžvanil.
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_04"); //Povídám ti, že brána je otevâená – vidęl jsem to na vlastní oči.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_05"); //Z tvého hlasu cítím, že díš pravdu. Už o tvých slovech nebudu pochybovati.
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_06"); //To doufám.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_07"); //Pak si vezmi heslo. Jest vepsáno na této kamenné tabulce. Vyslov je u zavâené chrámové brány a otevâe se.
	CreateInvItems (self, ItMi_TempelTorKey, 1);									
	B_GiveInvItems (self, other, ItMi_TempelTorKey, 1);		
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_08"); //(už polomrtvý) Můj čas je u konce. Będa, už ti více nepomohu.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_09"); //(už polomrtvý) Však pamatuj: pozor na komnaty Adanovy. Jinak jsi synem smrti.
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_10"); //Počkej. Co je s tęmi komnatami?
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_11"); //(už polomrtvý) Síly mne opouštęjí. Sbohem. Sejdeme se v âíši mrtvých.
	AI_StopProcessInfos (self);
	
	B_LogEntry (TOPIC_Addon_Quarhodron,"Quarhodron mi dal kamennou tabulku, která mi otevâe vstup do Adanova chrámu."); 
	
	Log_CreateTopic (TOPIC_Addon_Kammern, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kammern, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Kammern,"Quarhodron se zmínil o 'komnatách Adanových', kterých bych se męl vyvarovat. Męl bych zjistit, co tím pâesnę myslel, jinak můžu v chrámu padnout do pękné pasti."); 

	Ghost_SCKnowsHow2GetInAdanosTempel = TRUE;
};


