//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_EXIT   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 999;
	condition   = DIA_Addon_Snaf_EXIT_Condition;
	information = DIA_Addon_Snaf_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Snaf_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Snaf_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Snaf_PICKPOCKET (C_INFO)
{
	npc			= BDT_1098_Addon_Snaf;
	nr			= 900;
	condition	= DIA_Addon_Snaf_PICKPOCKET_Condition;
	information	= DIA_Addon_Snaf_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       
FUNC INT DIA_Addon_Snaf_PICKPOCKET_Condition()
{
	C_Beklauen (49, 56);
};
 
FUNC VOID DIA_Addon_Snaf_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Snaf_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Snaf_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Snaf_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Snaf_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Snaf_PICKPOCKET_DoIt);
};

func void DIA_Addon_Snaf_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Snaf_PICKPOCKET);
};
	
func void DIA_Addon_Snaf_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Snaf_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_Hi   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 1;
	condition   = DIA_Addon_Snaf_Hi_Condition;
	information = DIA_Addon_Snaf_Hi_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Snaf_Hi_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Snaf_Hi_01_00"); //Chcesz piÊ czy gadaÊ? Czego potrzebujesz?
};
//---------------------------------------------------------------------
//	Was gibt's denn leckeres?
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_Cook (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 2;
	condition   = DIA_Addon_Snaf_Cook_Condition;
	information = DIA_Addon_Snaf_Cook_Info;
	permanent   = FALSE;
	description = "Masz coú dobrego do jedzenia?";
};
FUNC INT DIA_Addon_Snaf_Cook_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Snaf_Cook_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_15_00"); //Masz coú dobrego do jedzenia?
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_01_01"); //ChcÍ sprawdziÊ nowy przepis ñ Ognisty gulasz w mocnym sosie.
	
	Info_ClearChoices (DIA_Addon_Snaf_Cook);
	Info_AddChoice 	  (DIA_Addon_Snaf_Cook,"Ognisty gulasz?",DIA_Addon_Snaf_Cook_FEUER);	
	Info_AddChoice 	  (DIA_Addon_Snaf_Cook,"Mocny sos?",DIA_Addon_Snaf_Cook_HAMMER);
};
//---------------------------------------------------------------------
FUNC VOID DIA_Addon_Snaf_Cook_FEUER()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_FEUER_15_00");//Ognisty gulasz?
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_FEUER_01_01");//Chrupiπce, delikatne, pieczone miÍso w otoczce z ognistej kapusty.
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_FEUER_01_02");//Spokojnie ñ mam juø przygotowane sk≥adniki.
};
FUNC VOID DIA_Addon_Snaf_Cook_HAMMER()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_HAMMER_15_00");//Mocny sos?
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_HAMMER_01_01");//Sos z bardzo mocnego bimbru. Dosta≥em ten przepis od niejakiego Lou.
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_HAMMER_01_02");//Zdobπdü sk≥adniki i przygotuj bimber w laboratorium, a ja zrobiÍ sos. Co ty na to?
	
	Info_AddChoice (DIA_Addon_Snaf_Cook,"Nie mam na to czasu.",DIA_Addon_Snaf_Cook_NO);
	Info_AddChoice (DIA_Addon_Snaf_Cook,"Dobrze, zrobiÍ to.",DIA_Addon_Snaf_Cook_YES);
	
};
FUNC VOID DIA_Addon_Snaf_Cook_NO ()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_HAMMER_NO_15_00");//Nie mam na to czasu.
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_HAMMER_NO_01_01");//Dobra, niewaøne.
	
	MIS_SnafHammer = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Addon_Snaf_Cook);
};
FUNC VOID DIA_Addon_Snaf_Cook_YES()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_HAMMER_YES_15_00");//Dobrze, zrobiÍ to.
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_HAMMER_YES_01_01");//Super. Oto przepis.
	
	B_GiveInvItems (self, other,ItWr_Addon_Lou_Rezept,1);
	MIS_SnafHammer = LOG_RUNNING;
	Info_ClearChoices (DIA_Addon_Snaf_Cook);
	
	Log_CreateTopic (Topic_Addon_Hammer,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Hammer,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Hammer,"Snaf potrzebuje trochÍ gorza≥ki do swojego sosu. Da≥ mi przepis na mocnπ nalewkÍ, ktÛrπ mam przyrzπdziÊ przy stole laboratoryjnym. ");
};
//---------------------------------------------------------------------
//	Info Booze
//---------------------------------------------------------------------
var int Snaf_Tip_Kosten;
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_Booze   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 3;
	condition   = DIA_Addon_Snaf_Booze_Condition;
	information = DIA_Addon_Snaf_Booze_Info;
	permanent   = FALSE;
	description = "Przygotowa≥em bimber.";
};
FUNC INT DIA_Addon_Snaf_Booze_Condition()
{	
	if (Npc_HasItems (other, ItFo_Addon_LousHammer) >= 1)
	&& (MIS_SnafHammer == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Booze_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Booze_15_00");//Przygotowa≥em bimber.

	//PATCH N.B.
	B_GiveInvItems (other, self, ItFo_Addon_LousHammer, 1);

	AI_Output (self, other, "DIA_Addon_Snaf_Booze_01_01");//Doskonale, zaraz to dokoÒczÍ.
	AI_Output (self, other, "DIA_Addon_Snaf_Booze_01_02");//Teraz moøesz trochÍ skosztowaÊ. To doda ci si≥.
	AI_Output (self, other, "DIA_Addon_Snaf_Booze_01_03");//Poczekaj, jeúli bÍdziesz potrzebowaÊ pomocy, wszystkie informacje masz u mnie za darmo.
	Snaf_Tip_Kosten = 0;
	B_GiveInvItems (self, other, ItFo_Addon_FireStew,1);
	MIS_SnafHammer = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Loushammer);
};

//---------------------------------------------------------------------
//	ATTENTAT
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_Attentat   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 4;
	condition   = DIA_Addon_Snaf_Attentat_Condition;
	information = DIA_Addon_Snaf_Attentat_Info;
	permanent   = FALSE;
	description = "Co wiesz na temat prÛby zabÛjstwa?";
};
FUNC INT DIA_Addon_Snaf_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Attentat_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Attentat_15_00"); //Co wiesz na temat prÛby zabÛjstwa?
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_01_01"); //Chodzi o ten zamach na Estebana?
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_01_02"); //Wiesz, skπd wieje wiatr. Oberøysta widzi wszystko, ale nie bierze niczyjej strony...
	
	Info_ClearChoices (DIA_Addon_Snaf_Attentat);
	Info_AddChoice 	  (DIA_Addon_Snaf_Attentat,"Powiedz mi chociaø, gdzie mogÍ zdobyÊ informacje.",DIA_Addon_Snaf_Attentat_GoWhere);
	Info_AddChoice 	  (DIA_Addon_Snaf_Attentat,"Co byú zrobi≥ na moim miejscu?",DIA_Addon_Snaf_Attentat_YouBeingMe);
	Info_AddChoice 	  (DIA_Addon_Snaf_Attentat,"A wiÍc coú wiesz?",DIA_Addon_Snaf_Attentat_Something);	
};
	
func void DIA_Addon_Snaf_Attentat_Something()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Attentat_Something_15_00"); //A wiÍc coú wiesz?
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_Something_01_01"); //TEGO nie powiedzia≥em.
};
func void DIA_Addon_Snaf_Attentat_GoWhere()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Attentat_GoWhere_15_00"); //Powiedz mi chociaø, gdzie mogÍ zdobyÊ informacje.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_GoWhere_01_01"); //Na boga! To przecieø jedno i to samo! Zapomnij o tym.
};
func void DIA_Addon_Snaf_Attentat_YouBeingMe()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Attentat_YouBeingMe_15_00"); //Co byú zrobi≥ na moim miejscu?
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_01"); //Zastanowi≥bym siÍ, co wiem na temat osoby, ktÛra zleci≥a zabÛjstwo.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_02"); //Po pierwsze ñ by≥ to najpewniej jeden z bandytÛw, czyli jest tutaj, w obozie.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_03"); //Po drugie ñ skoro jest w obozie, to znaczy, øe ciÍ obserwuje.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_04"); //Po trzecie ñ jeúli dojdzie do wniosku, øe stoisz po stronie Estebana, to nigdy siÍ nie ujawni.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_05"); //Pytanie brzmi ñ jakie masz szanse na znalezienie tego cz≥owieka?

	Info_ClearChoices (DIA_Addon_Snaf_Attentat);
};

//---------------------------------------------------------------------
//	Info Abrechnung
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_Abrechnung   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 5;
	condition   = DIA_Addon_Snaf_Abrechnung_Condition;
	information = DIA_Addon_Snaf_Abrechnung_Info;
	permanent   = TRUE;
	description = "No to jakie mam szanse na znalezienie tego cz≥owieka?";
};
FUNC INT DIA_Addon_Snaf_Abrechnung_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Snaf_Attentat)
	&& (MIS_JUDAS == LOG_RUNNING)
	&& (Huno_zuSnaf == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Abrechnung_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Abrechnung_15_00"); //No to jakie mam szanse na znalezienie tego cz≥owieka?
	AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_01"); //Hmmm...
	
	if (Senyan_Erpressung == LOG_RUNNING) 
	&& (!Npc_IsDead (Senyan))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_02"); //èle to widzÍ. NiektÛrzy zauwaøyli, øe krÍcisz siÍ ko≥o Senyana.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_03"); //Musisz zrezygnowaÊ ze swoich kontaktÛw. Inaczej nie znajdziesz osoby, ktÛra zleci≥a zabÛjstwo.
		
		if (Snaf_Tip_Senyan == FALSE)
		{
			B_LogEntry (Topic_Addon_Senyan,"Powinienem zakoÒczyÊ kontakty z Senyanem. Jednak lepiej bezpoúrednio go nie atakowaÊ. Wczeúniej powinienem z nim jeszcze raz porozmawiaÊ.");
			Snaf_Tip_Senyan = TRUE;
		};
	}
	else if (Npc_IsDead(Senyan))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_04"); //Musisz za≥atwiÊ jednego z ludzi Estebana. Cz≥owiek, ktÛrego szukasz, uwierzy, øe jesteú po jego stronie.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_05"); //Ale tak ≥atwo nie ujawni swojej toøsamoúci. Musisz wymyúliÊ coú wiÍcej.
	}
	else if (Finn_Petzt == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_06"); //Od czasu rozmowy z tobπ Finn wyglπda na bardzo podekscytowanego.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_07"); //A kaødy wie, øe trzyma siÍ blisko Estebana.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_08"); //To znaczy, øe powiedzia≥eú mu coú, czego nie chcia≥ us≥yszeÊ.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_09"); //Cz≥owiek, ktÛrego szukasz, bÍdzie bardzo zadowolony...
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_10"); //Ale istnieje ryzyko, øe pobiegnie do Estebana ñ ale sam o tym przecieø wiesz.
	}
	if (Finn_TellAll == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_11"); //Podobno powiedzia≥eú Finnowi, øe chÍtnie pracowa≥byú dla Estebana.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_12"); //Nie wiem, co planujesz, ale cz≥owiek, ktÛrego szukasz, bÍdzie teraz bardzo ostroøny.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_13"); //No wszystko siÍ moøe zdarzyÊ.
	};
	
	//------------------- Abschied ----------------------------------
	if (Snaf_Rechnung == FALSE)
	{
		if (Snaf_Einmal == FALSE)
		{
			AI_Output (other, self, "DIA_Addon_Snaf_Abschied_15_14"); //DziÍkujÍ.
			AI_Output (self, other, "DIA_Addon_Snaf_Abschied_01_15"); //Hej, nie powiedzia≥em ci nic, czego byú wczeúniej nie wiedzia≥, jasne?
			
			Snaf_Einmal = TRUE;
		}
		else
		{
			AI_Output (other, self, "DIA_Addon_Snaf_Abschied_15_16"); //No pewnie..
			AI_Output (self, other, "DIA_Addon_Snaf_Abschied_01_17"); //Dok≥adnie.
		};
	};
};

//---------------------------------------------------------------------
//	HOCH
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_HOCH (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 6;
	condition   = DIA_Addon_Snaf_HOCH_Condition;
	information = DIA_Addon_Snaf_HOCH_Info;
	permanent   = FALSE;
	description = "Huno mÛwi, øe mam kogoú tu spotkaÊ.";
};
FUNC INT DIA_Addon_Snaf_HOCH_Condition()
{	
	if (Huno_zuSnaf == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_HOCH_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_HOCH_15_00"); //Przysy≥a mnie Huno.
	AI_Output (self, other, "DIA_Addon_Snaf_HOCH_01_01"); //Wyglπda na to, øe znalaz≥eú swojego cz≥owieka.
	AI_Output (self, other, "DIA_Addon_Snaf_HOCH_01_02"); //Idü na gÛrÍ. Ktoú tam na ciebie czeka.
		
	AI_StopProcessInfos (self);
	AI_Teleport (Fisk,"BL_INN_UP_06");
	B_StartotherRoutine (Fisk,"MEETING");

	B_GivePlayerXP (XP_Addon_Auftraggeber);
};

//---------------------------------------------------------------------
//	People
//---------------------------------------------------------------------
var int Kosten_Einmal;
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_People (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 6;
	condition   = DIA_Addon_Snaf_People_Condition;
	information = DIA_Addon_Snaf_People_Info;
	permanent   = TRUE;
	description = "Co ludzie sπdzπ o Estebanie?";
};
FUNC INT DIA_Addon_Snaf_People_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Snaf_Attentat))
	&& (!Npc_IsDead (Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_People_Info()
{
	
	AI_Output (other, self, "DIA_Addon_Snaf_People_15_00"); //Co ludzie sπdzπ o Estebanie?
	AI_Output (self, other, "DIA_Addon_Snaf_People_01_01"); //O kogo ci dok≥adnie chodzi?
	if (Kosten_Einmal == FALSE)
	&& (MIS_SnafHammer != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_01_02"); //Kaøda informacja kosztuje.
		AI_Output (other, self, "DIA_Addon_Snaf_People_15_03"); //Ile?
		AI_Output (self, other, "DIA_Addon_Snaf_People_01_04"); //10 sztuk z≥ota.
		
		Snaf_Tip_Kosten = 10;
		Kosten_Einmal = TRUE;
	};
	
	Info_ClearChoices (DIA_Addon_Snaf_People);
	Info_AddChoice (DIA_Addon_Snaf_People, DIALOG_BACK, DIA_Addon_Snaf_People_BACK);
	Info_AddChoice (DIA_Addon_Snaf_People, "Paul.", DIA_Addon_Snaf_People_Paul);
	Info_AddChoice (DIA_Addon_Snaf_People, "Huno.", DIA_Addon_Snaf_People_Huno);
	Info_AddChoice (DIA_Addon_Snaf_People, "Fisk.", DIA_Addon_Snaf_People_Fisk);
	Info_AddChoice (DIA_Addon_Snaf_People, "Emilio.", DIA_Addon_Snaf_People_Emilio);
	if (!Npc_IsDead (Senyan))
	{
		Info_AddChoice (DIA_Addon_Snaf_People, "Senyan.", DIA_Addon_Snaf_People_Senyan);
	};
	Info_AddChoice (DIA_Addon_Snaf_People, "Lennar.", DIA_Addon_Snaf_People_Lennar);
	Info_AddChoice (DIA_Addon_Snaf_People, "Finn.", DIA_Addon_Snaf_People_Finn);
};
// --------------------------------------------
	func void B_Addon_Snaf_NotEnough()
	{
		AI_Output (self, other, "DIA_Addon_Snaf_NotEnough_01_00"); //Nie masz doúÊ pieniÍdzy, ma≥y!
	};

FUNC VOID DIA_Addon_Snaf_People_BACK()
{
	Info_ClearChoices (DIA_Addon_Snaf_People);
};
FUNC VOID DIA_Addon_Snaf_People_Paul()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Paul_15_00"); //Co wiesz na temat Paula?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Paul_01_01"); //Wydaje mi siÍ, øe nie przepada za Estebanem. Pracuje dla Huno, wiÍc nie schodzi juø do kopalni.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};
FUNC VOID DIA_Addon_Snaf_People_Huno()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Huno_15_00"); //Huno lubi Estebana?
	AI_Output (self, other, "DIA_Addon_Snaf_People_Huno_01_01"); //Ha. Huno. W≥aúciwie nic o nim nie wiem.
	AI_Output (self, other, "DIA_Addon_Snaf_People_Huno_01_02"); //Ta informacja jest za darmo.
};
FUNC VOID DIA_Addon_Snaf_People_Fisk()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Fisk_15_00"); //Co moøesz mi powiedzieÊ o Fisku?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Fisk_01_01"); //Fisk to Fisk. P≥aci haracz Estebanowi i oddaje mu czÍúÊ towarÛw, ktÛre dostaje od piratÛw.
		AI_Output (self, other, "DIA_Addon_Snaf_People_Fisk_01_02"); //Wydaje mi siÍ jednak, øe Esteban za bardzo go nie obchodzi.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};
FUNC VOID DIA_Addon_Snaf_People_Emilio()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Emilio_15_00"); //Co Emilio sπdzi o Estebanie?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Emilio_01_01"); //Wydaje mi siÍ, øe nie zapali≥by úwieczki na jego grobie. Rozumiesz, o czym mÛwiÍ?
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};
FUNC VOID DIA_Addon_Snaf_People_Senyan()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Senyan_15_00"); //Co powiesz o Senyanie?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Senyan_01_01"); //Senyan jest jednym z ludzi Estebana. Pracuje dla niego juø od pewnego czasu.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};
FUNC VOID DIA_Addon_Snaf_People_Lennar()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Lennar_15_00"); //Co Lennar myúli o Estebanie?
	AI_Output (self, other, "DIA_Addon_Snaf_People_Lennar_01_01"); //O ile dobrze wiem, Lennar NIE myúli.
};

func VOID DIA_Addon_Snaf_People_Finn()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Finn_15_00"); //Co mi powiesz o Finnie?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Finn_01_01"); //Dobry kopacz. Ma zmys≥ do szukania z≥ota.
		AI_Output (self, other, "DIA_Addon_Snaf_People_Finn_01_02"); //Z tego powodu Esteban go szanuje. Wydaje mi siÍ, øe siÍ nawzajem dobrze dogadujπ.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

//---------------------------------------------------------------------
//	Und du?
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_Himself (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 7;
	condition   = DIA_Addon_Snaf_Himself_Condition;
	information = DIA_Addon_Snaf_Himself_Info;
	permanent   = FALSE;
	description = "A jakie jest TWOJE zdanie o Estebanie?";
};
FUNC INT DIA_Addon_Snaf_Himself_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Snaf_Attentat))
	&& (!Npc_IsDead (Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Himself_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Himself_15_00"); //A jakie jest TWOJE zdanie o Estebanie?
	AI_Output (self, other, "DIA_Addon_Snaf_Himself_01_01"); //Kto o nim mÛwi, szybko koÒczy martwy...
	//AI_Output (other, self, "DIA_Addon_Snaf_Himself_15_02"); //Und?
	//AI_Output (self, other, "DIA_Addon_Snaf_Himself_01_03"); //Ende der Geschichte. //wav fehlt
};

//---------------------------------------------------------------------
//	PERM
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_PERM (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 8;
	condition   = DIA_Addon_Snaf_PERM_Condition;
	information = DIA_Addon_Snaf_PERM_Info;
	permanent   = TRUE;
	description = "Jak idπ interesy?";
};
FUNC INT DIA_Addon_Snaf_PERM_Condition()
{	
	if (Npc_IsDead (Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_PERM_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_PERM_15_00"); //Jak idπ interesy?
	AI_Output (self, other, "DIA_Addon_Snaf_PERM_01_01"); //CÛø. åmierÊ Estebana jest dla paru osÛb okazjπ do úwiÍtowania...
};


