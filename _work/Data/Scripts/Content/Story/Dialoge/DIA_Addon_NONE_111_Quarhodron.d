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
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_11_00"); //Pro� ru�� m�j odpo�inek, str��e?
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_11_01"); //(rozzu�en�) Pov�z, �eho ode mne ��d�?
		 
		Info_ClearChoices	(DIA_Addon_Quarhodron_Hello);
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "Co je v tom Adanov� chr�mu?", DIA_Addon_Quarhodron_Hello_schwert );
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "N�kdo n�sil�m vnikl do Adanova chr�mu.", DIA_Addon_Quarhodron_Hello_raven );
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "Umo�ni mi p��stup do Adanova chr�mu.", DIA_Addon_Quarhodron_Hello_tempel );
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "V zemi vypukla zem�t�esen�.", DIA_Addon_Quarhodron_Hello_erdbeben );
		DIA_Addon_Quarhodron_Hello_NoPerm = TRUE;
		Npc_RemoveInvItems 	(hero, ItWr_Addon_SUMMONANCIENTGHOST,1); //Joly: sonst gammelt das ding unn�tz herum.
		SC_TalkedToGhost = TRUE;
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_11_02"); //Bengla anthani, Osiri?
		B_Say (other, self, "$CANTUNDERSTANDTHIS");	
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_11_03"); //(hlasit�) Bengla anthani?
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
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "Moudrost na�ich p�edk� je skute�n� nesm�rn�.", DIA_Addon_Quarhodron_Hello_frech );
		B_Quarhodron_Hello_KommZumPunkt_OneTime = TRUE;
	};
};

func void DIA_Addon_Quarhodron_Hello_erdbeben ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_erdbeben_15_00"); //Zemi ni�� zem�t�esen�. Mus�me n�co ud�lat, jinak se cel� ostrov potop� do mo�e.
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_erdbeben_11_01"); //Nen� ni�eho, co by mohlo b�ti vykon�no.
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_erdbeben_11_02"); //Hn�v Adan�v padl na Jharkendar, by ztrestal nev���c�.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt ();
};
func void DIA_Addon_Quarhodron_Hello_raven ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_raven_15_00"); //Kdosi vnikl do Adanova chr�mu.
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_raven_11_01"); //Hloupost. J� s�m dve�e zape�etil. Nelze se tam dostati.
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_raven_15_02"); //Opravdu?
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt ();
};
func void DIA_Addon_Quarhodron_Hello_tempel ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_tempel_15_00"); //Pus� m� do Adanova chr�mu.
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_tempel_11_01"); //Chr�m z�stane nav�ky uzav�en. Tak rozhodla rada.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt ();
};
func void DIA_Addon_Quarhodron_Hello_schwert ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_schwert_15_00"); //Co v tom Adanov� chr�mu vlastn� je?
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_schwert_11_01"); //M�j nejhlub�� �al, m� nejv�t�� zklam�n�.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt ();
};
func void DIA_Addon_Quarhodron_Hello_frech ()
{
	AI_Output	(other, self, "DIA_Addon_Quarhodron_Hello_frech_15_00"); //Moudrost na�ich p�edk� je skute�n� ohromn�.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_01"); //Mu� tv�ho postaven� se mnou ale nem��e hovo�iti.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_02"); //M�m neodbytn� dojem, �e nejsi t�m, k�m se zd�.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_03"); //Pot�ebuje�-li mou pomoc, mus� nejprve dok�zat, �e jsi j� hoden.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_04"); //Odpov�z na m� ot�zky, abych m�l jistotu, �e nejsi cizincem.
	
	Log_CreateTopic (TOPIC_Addon_Quarhodron, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Quarhodron,"Quarhodron mi pom��e, pouze kdy� mu prok�u svou cenu. Polo�il mi n�kolik obt�n�ch ot�zek - dokud na n� neodpov�m, nemohu s jeho pomoc� po��tat."); 

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
		AI_Output			(self, other, "DIA_Addon_Quarhodron_TestFailed_11_00"); //�patn� odpov�di odhalily, �e nem� dobr� �mysly.
		AI_Output			(self, other, "DIA_Addon_Quarhodron_TestFailed_11_01"); //Nepomohu ti.
		AI_StopProcessInfos (self);	
};

func void B_Quarhodron_Fragen_Choices ()
{
	Log_AddEntry  (TOPIC_Addon_Quarhodron," --- QUARHODRONOVY OT�ZKY ---"); 

	if (Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	{
		B_Quarhodron_TestFailed ();
	}
	else
	{
		if (Quarhodrons_NextQuestion == 1)
		&& (Quarhodrons_RichtigeAntworten == 0)
		{
			AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_00"); //Nev���m ti.
			AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_01"); //Vra� se, teprve a� se rozhodne� ��ci mi pravdu.
			AI_StopProcessInfos (self);
		}
		else 
		{
			if (Quarhodrons_NextQuestion == 1)
			{
				if (B_Quarhodron_Fragen_ChoicesOneTime == FALSE)
				{
					AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_02"); //(p�em��l�) M� schopnosti str�c� smrti, jinak bys m� neprobudil. To je zjevn�.
					AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_03"); //Jsi-li vskutku t�m, k�m tvrd�, m�l bys zn�t odpov�di na v�echny m� ot�zky.
					AI_Output (self, other, "DIA_Addon_Quarhodron_Add_11_00"); //A� na jednu.
					
					B_Quarhodron_Fragen_ChoicesOneTime = TRUE;
				};
				Quarhodrons_NextQuestion = 2;
			};
			
			if (Quarhodrons_NextQuestion == 7)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_04"); //Kdo uzav�el port�l, aby sv�t ochr�nil p�ed zlem?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- Kdo uzav�el port�l, aby zem zachr�nil p�ed zlem? ---"); 
				Quarhodrons_NextQuestion = Quarhodron_AlleFragenGestellt;
			}
			else if (Quarhodrons_NextQuestion == 6)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_05"); //Kdo zm�r�uje utrpen� a star� se o nemocn�?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- Kdo ti�� bolest a star� se o jharkendarsk� nemocn�? ---"); 
				Quarhodrons_NextQuestion = 7;
			}
			else if (Quarhodrons_NextQuestion == 5)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_06"); //Kdo m� posledn� slovo v Rad� p�ti?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- Kdo m�l posledn� slovo v Rad� p�ti? ---"); 
				Quarhodrons_NextQuestion = 6;
			}	
			else if (Quarhodrons_NextQuestion == 4)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_07"); //Kdo na n�s p�ivolal zlo?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- Kdo m� na sv�dom� zlo, je� zachv�tilo lid Jharkendaru? ---"); 
				Quarhodrons_NextQuestion = 5;
			}
			else if (Quarhodrons_NextQuestion == 3)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_08"); //Kdo mi m��e ud�liti p��m� p��kaz?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- Kdo m��e Quarhodronovi p��mo rozkazovat? ---"); 
				Quarhodrons_NextQuestion = 4;
			}	
			else if (Quarhodrons_NextQuestion == 2)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_09"); //Kdo kdysi chr�nil jharkendarsk� lid p�ed �toky nep��tel?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- Kdo kdysi chr�nil lid Jharkendaru p�ed nep��telsk�mi �toky? ---"); 
				Quarhodrons_NextQuestion = 3;
			};
			
			Info_ClearChoices	(DIA_Addon_Quarhodron_Fragen);
			
			if (Quarhodrons_NextQuestion >= Quarhodron_AlleFragenGestellt)
			{
				Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "Tohle nem��u v�d�t.", DIA_Addon_Quarhodron_Fragen_NoPlan );
			}
			else
			{
				Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "Nev�m.", DIA_Addon_Quarhodron_Fragen_NoPlan );
			};
			
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "U�enci.", DIA_Addon_Quarhodron_Fragen_gele );
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "Str�ci smrti.", DIA_Addon_Quarhodron_Fragen_totenw );
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "Kn��.", DIA_Addon_Quarhodron_Fragen_prie );
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "V�le�nick� kasta.", DIA_Addon_Quarhodron_Fragen_warr );
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "L��itel�.", DIA_Addon_Quarhodron_Fragen_heiler );
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
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_11_01"); //Jsem Quarhodron, star� jharkendarsk� v�le�n�k.
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_11_02"); //Probudil jsi m�.
		
		DIA_Addon_Quarhodron_Fragen_Info_OneTime = TRUE;
	};
	
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_11_03"); //Ke kter� jharkendarsk� kast� n�le��?

	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_warr ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_warr_15_00"); //V�le�nick� kasta.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	if (Quarhodrons_NextQuestion == 3)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	if (Quarhodrons_NextQuestion == 5)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_prie ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_prie_15_00"); //Kn��.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	if (Quarhodrons_NextQuestion == 4)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_gele ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_gele_15_00"); //U�enci.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	if (Quarhodrons_NextQuestion == 6)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_totenw ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_totenw_15_00"); //Str�ci smrti.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_heiler ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_heiler_15_00"); //L��itel�.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	if (Quarhodrons_NextQuestion == 7)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_NoPlan ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_NoPlan_15_00"); //Nev�m.
	
	if (Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	&& (Quarhodrons_RichtigeAntworten >= 6) 
	{
		AI_Output			(self, other, "DIA_Addon_Quarhodron_Fragen_NoPlan_11_01"); //Dob�e. V���m ti a pomohu ti.
		QuarhodronIstZufrieden = TRUE;
		Info_ClearChoices	(DIA_Addon_Quarhodron_Fragen);
	}
	else if (Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	{
		B_Quarhodron_TestFailed ();
	}
	else
	{	
		AI_Output			(self, other, "DIA_Addon_Quarhodron_Fragen_NoPlan_11_02"); //Tak u� m� nezdr�uj.
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

	description	 = 	"(po��dat o kl�� ke chr�mu)";
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
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_00"); //Tak poslouchej. Jeden fakt zlej chl�pek vniknul do Adanova chr�mu.
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_01"); //Pokud m� hned te� nepust� do chr�mu, nejsp� u� bude p��li� pozd� a v�echno bude ztraceno.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_02"); //To nen� mo�n�! Velekn�z KHARDIMON a j� jsme v Jharkendaru jedin�, kdo znaj� tajemstv� otev�en� br�ny do Adanova chr�mu.
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_03"); //No, pak to ten tv�j k�mo� KHARDIMON nejsp� vy�vanil.
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_04"); //Pov�d�m ti, �e br�na je otev�en� � vid�l jsem to na vlastn� o�i.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_05"); //Z tv�ho hlasu c�t�m, �e d� pravdu. U� o tv�ch slovech nebudu pochybovati.
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_06"); //To douf�m.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_07"); //Pak si vezmi heslo. Jest veps�no na t�to kamenn� tabulce. Vyslov je u zav�en� chr�mov� br�ny a otev�e se.
	CreateInvItems (self, ItMi_TempelTorKey, 1);									
	B_GiveInvItems (self, other, ItMi_TempelTorKey, 1);		
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_08"); //(u� polomrtv�) M�j �as je u konce. B�da, u� ti v�ce nepomohu.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_09"); //(u� polomrtv�) V�ak pamatuj: pozor na komnaty Adanovy. Jinak jsi synem smrti.
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_10"); //Po�kej. Co je s t�mi komnatami?
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_11"); //(u� polomrtv�) S�ly mne opou�t�j�. Sbohem. Sejdeme se v ��i mrtv�ch.
	AI_StopProcessInfos (self);
	
	B_LogEntry (TOPIC_Addon_Quarhodron,"Quarhodron mi dal kamennou tabulku, kter� mi otev�e vstup do Adanova chr�mu."); 
	
	Log_CreateTopic (TOPIC_Addon_Kammern, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kammern, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Kammern,"Quarhodron se zm�nil o 'komnat�ch Adanov�ch', kter�ch bych se m�l vyvarovat. M�l bych zjistit, co t�m p�esn� myslel, jinak m��u v chr�mu padnout do p�kn� pasti."); 

	Ghost_SCKnowsHow2GetInAdanosTempel = TRUE;
};


